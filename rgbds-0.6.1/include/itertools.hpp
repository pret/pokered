/*
 * This file is part of RGBDS.
 *
 * Copyright (c) 2022, Eldred Habert and RGBDS contributors.
 *
 * SPDX-License-Identifier: MIT
 */

#ifndef RGBDS_ITERTOOLS_HPP
#define RGBDS_ITERTOOLS_HPP

#include <tuple>
#include <utility>

template<typename... Ts>
static inline void report() {
	puts(__PRETTY_FUNCTION__);
}

// This is not a fully generic implementation; its current use cases only require for-loop behavior.
// We also assume that all iterators have the same length.
template<typename... Iters>
class Zip {
	std::tuple<Iters...> _iters;

public:
	explicit Zip(std::tuple<Iters...> &&iters) : _iters(iters) {}

	Zip &operator++() {
		std::apply([](auto &&...it) { (++it, ...); }, _iters);
		return *this;
	}

	auto operator*() const {
		return std::apply([](auto &&...it) { return std::tuple<decltype(*it)...>(*it...); },
		                  _iters);
	}

	friend auto operator==(Zip const &lhs, Zip const &rhs) {
		return std::get<0>(lhs._iters) == std::get<0>(rhs._iters);
	}

	friend auto operator!=(Zip const &lhs, Zip const &rhs) {
		return std::get<0>(lhs._iters) != std::get<0>(rhs._iters);
	}
};

namespace detail {
template<typename... Containers>
class ZipContainer {
	std::tuple<Containers...> _containers;

public:
	ZipContainer(Containers &&...containers)
	    : _containers(std::forward<Containers>(containers)...) {}

	auto begin() {
		return Zip(std::apply(
		    [](auto &&...containers) {
			    using std::begin;
			    return std::make_tuple(begin(containers)...);
		    },
		    _containers));
	}

	auto end() {
		return Zip(std::apply(
		    [](auto &&...containers) {
			    using std::end;
			    return std::make_tuple(end(containers)...);
		    },
		    _containers));
	}
};

// Take ownership of objects and rvalue refs passed to us, but not lvalue refs
template<typename T>
using Holder = std::conditional_t<std::is_lvalue_reference_v<T>, T,
                                  std::remove_cv_t<std::remove_reference_t<T>>>;
}

// Does the same number of iterations as the first container's iterator!
template<typename... Containers>
static constexpr auto zip(Containers &&...cs) {
	return detail::ZipContainer<detail::Holder<Containers>...>(std::forward<Containers>(cs)...);
}

#endif // RGBDS_ITERTOOLS_HPP
