SECTION "sec", ROM0
foo:
	add sp, .bar ; rgblink gives an "Unknown symbol" error here
