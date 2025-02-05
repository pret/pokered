; this function temporarily makes the starters owned so that the full Pokedex information gets displayed in Oak's lab
; PureRGBnote: CHANGED: refactored to mark the starters indicated by the starter constants 
; by converting them to dex constants so no changes are necessary other than changing the constant values
; downside is this function takes up more space than before
StarterDex:
	ld b, FLAG_SET
	ld a, [wPokedexNum] ; currently has the pokemon's index number stored, need to save for when we display it after marking seen
	push af
	call .markInPokedex
	pop af
	ld [wPokedexNum], a
	predef ShowPokedexData
	ld b, FLAG_RESET
	; fall through
.markInPokedex
	ld hl, StarterDexArray
	ld c, 3 ; number of starters available
.loop
	ld a, [hli]
	; a = pokemon index constant, need to convert to dex constant
	push hl
	push bc
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	; a = pokemon dex constant, now either set it or reset the pokedex flag for this mon \
	; based on what was loaded into b before calling .markInPokedex
	dec a
	ld hl, wPokedexOwned
	pop bc
	push bc
	ld c, a
	predef FlagActionPredef
	pop bc
	pop hl
	dec c
	jr nz, .loop
	ret

StarterDexArray:
	db STARTER1
	db STARTER2
	db STARTER3