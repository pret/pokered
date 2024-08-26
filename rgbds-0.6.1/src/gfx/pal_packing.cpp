/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#include "gfx/pal_packing.hpp"

#include <algorithm>
#include <assert.h>
#include <bitset>
#include <cinttypes>
#include <deque>
#include <numeric>
#include <optional>
#include <queue>
#include <tuple>
#include <type_traits>
#include <unordered_set>
#include <vector>

#include "defaultinitalloc.hpp"

#include "gfx/main.hpp"
#include "gfx/proto_palette.hpp"

using std::swap;

namespace packing {

// The solvers here are picked from the paper at http://arxiv.org/abs/1605.00558:
// "Algorithms for the Pagination Problem, a Bin Packing with Overlapping Items"
// Their formulation of the problem consists in packing "tiles" into "pages"; here is a
// correspondence table for our application of it:
// Paper | RGBGFX
// ------+-------
//  Tile | Proto-palette
//  Page | Palette

/*
 * A reference to a proto-palette, and attached attributes for sorting purposes
 */
struct ProtoPalAttrs {
	size_t const protoPalIndex;
	/*
	 * Pages from which we are banned (to prevent infinite loops)
	 * This is dynamic because we wish not to hard-cap the amount of palettes
	 */
	std::vector<bool> bannedPages;

	ProtoPalAttrs(size_t index) : protoPalIndex(index) {}
	bool isBannedFrom(size_t index) const {
		return index < bannedPages.size() && bannedPages[index];
	}
	void banFrom(size_t index) {
		if (bannedPages.size() <= index) {
			bannedPages.resize(index + 1);
		}
		bannedPages[index] = true;
	}
};

/*
 * A collection of proto-palettes assigned to a palette
 * Does not contain the actual color indices because we need to be able to remove elements
 */
class AssignedProtos {
	// We leave room for emptied slots to avoid copying the structs around on removal
	std::vector<std::optional<ProtoPalAttrs>> _assigned;
	// For resolving proto-palette indices
	std::vector<ProtoPalette> const *_protoPals;

public:
	template<typename... Ts>
	AssignedProtos(std::vector<ProtoPalette> const &protoPals, Ts &&...elems)
	    : _assigned{std::forward<Ts>(elems)...}, _protoPals{&protoPals} {}

private:
	template<typename Inner, template<typename> typename Constness>
	class Iter {
	public:
		friend class AssignedProtos;
		// For `iterator_traits`
		using difference_type = typename std::iterator_traits<Inner>::difference_type;
		using value_type = ProtoPalAttrs;
		using pointer = Constness<value_type> *;
		using reference = Constness<value_type> &;
		using iterator_category = std::forward_iterator_tag;

	private:
		Constness<decltype(_assigned)> *_array = nullptr;
		Inner _iter{};

		Iter(decltype(_array) array, decltype(_iter) &&iter) : _array(array), _iter(iter) {}
		Iter &skipEmpty() {
			while (_iter != _array->end() && !_iter->has_value()) {
				++_iter;
			}
			return *this;
		}

	public:
		Iter() = default;

		bool operator==(Iter const &other) const { return _iter == other._iter; }
		bool operator!=(Iter const &other) const { return !(*this == other); }
		Iter &operator++() {
			++_iter;
			skipEmpty();
			return *this;
		}
		Iter operator++(int) {
			Iter it = *this;
			++(*this);
			return it;
		}
		reference operator*() const {
			assert((*_iter).has_value());
			return **_iter;
		}
		pointer operator->() const {
			return &(**this); // Invokes the operator above, not quite a no-op!
		}

		friend void swap(Iter &lhs, Iter &rhs) {
			swap(lhs._array, rhs._array);
			swap(lhs._iter, rhs._iter);
		}
	};
public:
	using iterator = Iter<decltype(_assigned)::iterator, std::remove_const_t>;
	iterator begin() { return iterator{&_assigned, _assigned.begin()}.skipEmpty(); }
	iterator end() { return iterator{&_assigned, _assigned.end()}; }
	using const_iterator = Iter<decltype(_assigned)::const_iterator, std::add_const_t>;
	const_iterator begin() const {
		return const_iterator{&_assigned, _assigned.begin()}.skipEmpty();
	}
	const_iterator end() const { return const_iterator{&_assigned, _assigned.end()}; }

	/*
	 * Assigns a new ProtoPalAttrs in a free slot, assuming there is one
	 * Args are passed to the `ProtoPalAttrs`'s constructor
	 */
	template<typename... Ts>
	void assign(Ts &&...args) {
		auto freeSlot = std::find_if_not(
		    _assigned.begin(), _assigned.end(),
		    [](std::optional<ProtoPalAttrs> const &slot) { return slot.has_value(); });

		if (freeSlot == _assigned.end()) { // We are full, use a new slot
			_assigned.emplace_back(std::forward<Ts>(args)...);
		} else { // Reuse a free slot
			freeSlot->emplace(std::forward<Ts>(args)...);
		}
	}
	void remove(iterator const &iter) {
		iter._iter->reset(); // This time, we want to access the `optional` itself
	}
	void clear() { _assigned.clear(); }

	bool empty() const {
		return std::find_if(
		           _assigned.begin(), _assigned.end(),
		           [](std::optional<ProtoPalAttrs> const &slot) { return slot.has_value(); })
		       == _assigned.end();
	}
	size_t nbProtoPals() const { return std::distance(begin(), end()); }

private:
	template<typename Iter>
	static void addUniqueColors(std::unordered_set<uint16_t> &colors, Iter iter, Iter const &end,
	                            std::vector<ProtoPalette> const &protoPals) {
		for (; iter != end; ++iter) {
			ProtoPalette const &protoPal = protoPals[iter->protoPalIndex];
			colors.insert(protoPal.begin(), protoPal.end());
		}
	}
	// This function should stay private because it returns a reference to a unique object
	std::unordered_set<uint16_t> &uniqueColors() const {
		// We check for *distinct* colors by stuffing them into a `set`; this should be
		// faster than "back-checking" on every element (O(n²))
		//
		// TODO: calc84maniac suggested another approach; try implementing it, see if it
		// performs better:
		// > So basically you make a priority queue that takes iterators into each of your sets
		// > (paired with end iterators so you'll know where to stop), and the comparator tests the
		// > values pointed to by each iterator
		// > Then each iteration you pop from the queue,
		// > optionally add one to your count, increment the iterator and push it back into the
		// > queue if it didn't reach the end
		// > And you do this until the priority queue is empty
		static std::unordered_set<uint16_t> colors;

		colors.clear();
		addUniqueColors(colors, begin(), end(), *_protoPals);
		return colors;
	}
public:
	/*
	 * Returns the number of distinct colors
	 */
	size_t volume() const { return uniqueColors().size(); }
	bool canFit(ProtoPalette const &protoPal) const {
		auto &colors = uniqueColors();
		colors.insert(protoPal.begin(), protoPal.end());
		return colors.size() <= options.maxOpaqueColors();
	}

	/*
	 * Computes the "relative size" of a proto-palette on this palette
	 */
	double relSizeOf(ProtoPalette const &protoPal) const {
		// NOTE: this function must not call `uniqueColors`, or one of its callers will break!
		double relSize = 0.;
		for (uint16_t color : protoPal) {
			auto n = std::count_if(begin(), end(), [this, &color](ProtoPalAttrs const &attrs) {
				ProtoPalette const &pal = (*_protoPals)[attrs.protoPalIndex];
				return std::find(pal.begin(), pal.end(), color) != pal.end();
			});
			// NOTE: The paper and the associated code disagree on this: the code has
			// this `1 +`, whereas the paper does not; its lack causes a division by 0
			// if the symbol is not found anywhere, so I'm assuming the paper is wrong.
			relSize += 1. / (1 + n);
		}
		return relSize;
	}

	/*
	 * Computes the "relative size" of a set of proto-palettes on this palette
	 */
	template<typename Iter>
	auto combinedVolume(Iter &&begin, Iter const &end,
	                    std::vector<ProtoPalette> const &protoPals) const {
		auto &colors = uniqueColors();
		addUniqueColors(colors, std::forward<Iter>(begin), end, protoPals);
		return colors.size();
	}
	/*
	 * Computes the "relative size" of a set of colors on this palette
	 */
	template<typename Iter>
	auto combinedVolume(Iter &&begin, Iter &&end) const {
		auto &colors = uniqueColors();
		colors.insert(std::forward<Iter>(begin), std::forward<Iter>(end));
		return colors.size();
	}
};

static void decant(std::vector<AssignedProtos> &assignments,
                   std::vector<ProtoPalette> const &protoPalettes) {
	// "Decanting" is the process of moving all *things* that can fit in a lower index there
	auto decantOn = [&assignments](auto const &tryDecanting) {
		// No need to attempt decanting on palette #0, as there are no palettes to decant to
		for (size_t from = assignments.size(); --from;) {
			// Scan all palettes before this one
			for (size_t to = 0; to < from; ++to) {
				tryDecanting(assignments[to], assignments[from]);
			}

			// If the proto-palette is now empty, remove it
			// Doing this now reduces the number of iterations performed by later steps
			// NB: order is intentionally preserved so as not to alter the "decantation"'s
			// properties
			// NB: this does mean that the first step might get empty palettes as its input!
			// NB: this is safe to do because we go towards the beginning of the vector, thereby not
			// invalidating our iteration (thus, iterators should not be used to drivethe outer
			// loop)
			if (assignments[from].empty()) {
				assignments.erase(assignments.begin() + from);
			}
		}
	};

	options.verbosePrint(Options::VERB_DEBUG, "%zu palettes before decanting\n",
	                     assignments.size());

	// Decant on palettes
	decantOn([&protoPalettes](AssignedProtos &to, AssignedProtos &from) {
		// If the entire palettes can be merged, move all of `from`'s proto-palettes
		if (to.combinedVolume(from.begin(), from.end(), protoPalettes)
		    <= options.maxOpaqueColors()) {
			for (ProtoPalAttrs &attrs : from) {
				to.assign(attrs.protoPalIndex);
			}
			from.clear();
		}
	});
	options.verbosePrint(Options::VERB_DEBUG, "%zu palettes after decanting on palettes\n",
	                     assignments.size());

	// Decant on "components" (= proto-pals sharing colors)
	decantOn([&protoPalettes](AssignedProtos &to, AssignedProtos &from) {
		// We need to iterate on all the "components", which are groups of proto-palettes sharing at
		// least one color with another proto-palettes in the group.
		// We do this by adding the first available proto-palette, and then looking for palettes
		// with common colors. (As an optimization, we know we can skip palettes already scanned.)
		std::vector<bool> processed(from.nbProtoPals(), false);
		std::unordered_set<uint16_t> colors;
		std::vector<size_t> members;
		while (true) {
			auto iter = std::find(processed.begin(), processed.end(), true);
			if (iter == processed.end()) { // Processed everything!
				break;
			}
			auto attrs = from.begin();
			std::advance(attrs, (iter - processed.begin()));

			// Build up the "component"...
			colors.clear();
			members.clear();
			assert(members.empty()); // Compiler optimization hint
			do {
				ProtoPalette const &protoPal = protoPalettes[attrs->protoPalIndex];
				// If this is the first proto-pal, or if at least one color matches, add it
				if (members.empty()
				    || std::find_first_of(colors.begin(), colors.end(), protoPal.begin(),
				                          protoPal.end())
				           != colors.end()) {
					colors.insert(protoPal.begin(), protoPal.end());
					members.push_back(iter - processed.begin());
					*iter = true; // Mark that proto-pal as processed
				}
				++iter;
				++attrs;
			} while (iter != processed.end());

			if (to.combinedVolume(colors.begin(), colors.end()) <= options.maxOpaqueColors()) {
				// Iterate through the component's proto-palettes, and transfer them
				auto member = from.begin();
				size_t curIndex = 0;
				for (size_t index : members) {
					std::advance(member, index - curIndex);
					curIndex = index;
					to.assign(std::move(*member));
					from.remove(member); // Removing does not shift elements, so it's cheap
				}
			}
		}
	});
	options.verbosePrint(Options::VERB_DEBUG, "%zu palettes after decanting on \"components\"\n",
	                     assignments.size());

	// Decant on individual proto-palettes
	decantOn([&protoPalettes](AssignedProtos &to, AssignedProtos &from) {
		for (auto iter = from.begin(); iter != from.end(); ++iter) {
			if (to.canFit(protoPalettes[iter->protoPalIndex])) {
				to.assign(std::move(*iter));
				from.remove(iter);
			}
		}
	});
	options.verbosePrint(Options::VERB_DEBUG, "%zu palettes after decanting on proto-palettes\n",
	                     assignments.size());
}

std::tuple<DefaultInitVec<size_t>, size_t>
    overloadAndRemove(std::vector<ProtoPalette> const &protoPalettes) {
	options.verbosePrint(Options::VERB_LOG_ACT,
	                     "Paginating palettes using \"overload-and-remove\" strategy...\n");

	// Sort the proto-palettes by size, which improves the packing algorithm's efficiency
	DefaultInitVec<size_t> sortedProtoPalIDs(protoPalettes.size());
	sortedProtoPalIDs.clear();
	for (size_t i = 0; i < protoPalettes.size(); ++i) {
		sortedProtoPalIDs.insert(
		    std::lower_bound(sortedProtoPalIDs.begin(), sortedProtoPalIDs.end(), i), i);
	}
	// Begin with all proto-palettes queued up for insertion
	std::queue<ProtoPalAttrs> queue(
	    std::deque<ProtoPalAttrs>(sortedProtoPalIDs.begin(), sortedProtoPalIDs.end()));
	// Begin with no pages
	std::vector<AssignedProtos> assignments{};

	for (; !queue.empty(); queue.pop()) {
		ProtoPalAttrs const &attrs = queue.front(); // Valid until the `queue.pop()`
		options.verbosePrint(Options::VERB_DEBUG, "Handling proto-pal %zu\n", attrs.protoPalIndex);

		ProtoPalette const &protoPal = protoPalettes[attrs.protoPalIndex];
		size_t bestPalIndex = assignments.size();
		// We're looking for a palette where the proto-palette's relative size is less than
		// its actual size; so only overwrite the "not found" index on meeting that criterion
		double bestRelSize = protoPal.size();

		for (size_t i = 0; i < assignments.size(); ++i) {
			// Skip the page if this one is banned from it
			if (attrs.isBannedFrom(i)) {
				continue;
			}

			options.verbosePrint(Options::VERB_DEBUG, "%zu/%zu: Rel size: %f (size = %zu)\n", i + 1,
			                     assignments.size(), assignments[i].relSizeOf(protoPal),
			                     protoPal.size());
			if (assignments[i].relSizeOf(protoPal) < bestRelSize) {
				bestPalIndex = i;
			}
		}

		if (bestPalIndex == assignments.size()) {
			// Found nowhere to put it, create a new page containing just that one
			assignments.emplace_back(protoPalettes, std::move(attrs));
		} else {
			auto &bestPal = assignments[bestPalIndex];
			// Add the color to that palette
			bestPal.assign(std::move(attrs));

			// If this overloads the palette, get it back to normal (if possible)
			while (bestPal.volume() > options.maxOpaqueColors()) {
				options.verbosePrint(Options::VERB_DEBUG,
				                     "Palette %zu is overloaded! (%zu > %" PRIu8 ")\n",
				                     bestPalIndex, bestPal.volume(), options.maxOpaqueColors());

				// Look for a proto-pal minimizing "efficiency" (size / rel_size)
				auto efficiency = [&bestPal](ProtoPalette const &pal) {
					return pal.size() / bestPal.relSizeOf(pal);
				};
				auto [minEfficiencyIter, maxEfficiencyIter] =
				    std::minmax_element(bestPal.begin(), bestPal.end(),
				                        [&efficiency, &protoPalettes](ProtoPalAttrs const &lhs,
				                                                      ProtoPalAttrs const &rhs) {
					                        return efficiency(protoPalettes[lhs.protoPalIndex])
					                               < efficiency(protoPalettes[rhs.protoPalIndex]);
				                        });

				// All efficiencies are identical iff min equals max
				// TODO: maybe not ideal to re-compute these two?
				// TODO: yikes for float comparison! I *think* this threshold is OK?
				if (efficiency(protoPalettes[maxEfficiencyIter->protoPalIndex])
				        - efficiency(protoPalettes[minEfficiencyIter->protoPalIndex])
				    < .001) {
					break;
				}

				// Remove the proto-pal with minimal efficiency
				queue.emplace(std::move(*minEfficiencyIter));
				queue.back().banFrom(bestPalIndex); // Ban it from this palette
				bestPal.remove(minEfficiencyIter);
			}
		}
	}

	// Deal with palettes still overloaded, by emptying them
	for (AssignedProtos &pal : assignments) {
		if (pal.volume() > options.maxOpaqueColors()) {
			for (ProtoPalAttrs &attrs : pal) {
				queue.emplace(std::move(attrs));
			}
			pal.clear();
		}
	}
	// Place back any proto-palettes now in the queue via first-fit
	while (!queue.empty()) {
		ProtoPalAttrs const &attrs = queue.front();
		ProtoPalette const &protoPal = protoPalettes[attrs.protoPalIndex];
		auto iter =
		    std::find_if(assignments.begin(), assignments.end(),
		                 [&protoPal](AssignedProtos const &pal) { return pal.canFit(protoPal); });
		if (iter == assignments.end()) { // No such page, create a new one
			options.verbosePrint(Options::VERB_DEBUG,
			                     "Adding new palette (%zu) for overflowing proto-pal %zu\n",
			                     assignments.size(), attrs.protoPalIndex);
			assignments.emplace_back(protoPalettes, std::move(attrs));
		} else {
			options.verbosePrint(Options::VERB_DEBUG,
			                     "Assigning overflowing proto-pal %zu to palette %zu\n",
			                     attrs.protoPalIndex, iter - assignments.begin());
			iter->assign(std::move(attrs));
		}
		queue.pop();
	}

	if (options.verbosity >= Options::VERB_INTERM) {
		for (auto &&assignment : assignments) {
			fprintf(stderr, "{ ");
			for (auto &&attrs : assignment) {
				fprintf(stderr, "[%zu] ", attrs.protoPalIndex);
				for (auto &&colorIndex : protoPalettes[attrs.protoPalIndex]) {
					fprintf(stderr, "%04" PRIx16 ", ", colorIndex);
				}
			}
			fprintf(stderr, "} (volume = %zu)\n", assignment.volume());
		}
	}

	// "Decant" the result
	decant(assignments, protoPalettes);
	// Note that the result does not contain any empty palettes

	if (options.verbosity >= Options::VERB_INTERM) {
		for (auto &&assignment : assignments) {
			fprintf(stderr, "{ ");
			for (auto &&attrs : assignment) {
				fprintf(stderr, "[%zu] ", attrs.protoPalIndex);
				for (auto &&colorIndex : protoPalettes[attrs.protoPalIndex]) {
					fprintf(stderr, "%04" PRIx16 ", ", colorIndex);
				}
			}
			fprintf(stderr, "} (volume = %zu)\n", assignment.volume());
		}
	}

	DefaultInitVec<size_t> mappings(protoPalettes.size());
	for (size_t i = 0; i < assignments.size(); ++i) {
		for (ProtoPalAttrs const &attrs : assignments[i]) {
			mappings[attrs.protoPalIndex] = i;
		}
	}
	return {mappings, assignments.size()};
}

} // namespace packing
