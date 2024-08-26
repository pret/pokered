SECTION "fixed", ROM0[0]
	db @, @, @
; We need this section to be floating because RGBASM can know the value of PC
; otherwise, leading to different behavior
; FIXME: we rely on this landing at address 2, which isn't *guaranteed*...
SECTION "floating", ROM0
	db @, @, @
