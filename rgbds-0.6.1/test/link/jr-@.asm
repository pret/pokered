SECTION "Floating", ROM0
	; RGBASM knows how to compute `jr @` by itself, but this will evade it
	jr @ - 1 + 1
