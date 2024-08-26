
SECTION "test", ROM0

FloatingBase:
	assert WARN, FloatingBase, "Worry about me, but not too much."
	assert FAIL, FloatingBase, "Okay, this is getting serious!"
	assert FATAL, FloatingBase, "It all ends now."
	assert FAIL, FloatingBase, "Not even time to roll credits!"
	assert WARN, 0, "Still can finish the film, though!"
