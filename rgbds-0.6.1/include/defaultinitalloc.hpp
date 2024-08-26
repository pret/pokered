/*
 * Allocator adaptor that interposes construct() calls to convert value-initialization
 * (which is what you get with e.g. `vector::resize`) into default-initialization (which does not
 * zero out non-class types).
 * From
 * https://stackoverflow.com/questions/21028299/is-this-behavior-of-vectorresizesize-type-n-under-c11-and-boost-container/21028912#21028912
 */

#ifndef DEFAULT_INIT_ALLOC_H
#define DEFAULT_INIT_ALLOC_H

#include <memory>
#include <vector>

template<typename T, typename A = std::allocator<T>>
class default_init_allocator : public A {
	using a_t = std::allocator_traits<A>;
public:
	template<typename U>
	struct rebind {
		using other = default_init_allocator<U, typename a_t::template rebind_alloc<U>>;
	};

	using A::A; // Inherit the allocator's constructors

	template<typename U>
	void construct(U *ptr) noexcept(std::is_nothrow_default_constructible_v<U>) {
		::new (static_cast<void *>(ptr)) U;
	}
	template<typename U, typename... Args>
	void construct(U *ptr, Args &&...args) {
		a_t::construct(static_cast<A &>(*this), ptr, std::forward<Args>(args)...);
	}
};

template<typename T>
using DefaultInitVec = std::vector<T, default_init_allocator<T>>;

#endif // DEFAULT_INIT_ALLOC_H
