SECTION "Test", ROM0

	assert STRIN("foo bar baz", "bar") == STRRIN("foo bar baz", "bar")

	assert STRIN("foo bar bargain", "bar") == 5
	assert STRRIN("foo bar bargain", "bar") == 9

	assert STRIN("foo bar", "qux") == 0
	assert STRRIN("foo bar", "qux") == 0

	assert STRIN("foo", "foobar") == 0
	assert STRRIN("foo", "foobar") == 0

	assert STRIN("foobar", "") == 1
	assert STRRIN("foobar", "") == STRLEN("foobar") + 1
