; These routines manage gradual fading
; (e.g., entering a doorway)
LoadGBPal::
;;;;;;;;;; PureRGBnote: ADDED: an optimization for certain maps where we can skip showing the map from being faded to black until later.
	ld a, [wMapConnections]
	;;;;;; new bit in the map header that can mark a map as staying black visually until the map script changes it 
	;;;;;; (used for situations in which we may need to replace tile blocks)
	bit 4, a ; DEFER_SHOWING_MAP bit
	jr nz, .checkFirstLoad ; map starts by being black until map script changes this
.notFirstLoad
;;;;;;;;;;
	ld a, [wMapPalOffset] ; tells if wCurMap is dark (requires HM5_FLASH?)
	ld b, a
	ld hl, FadePal4
	ld a, l
	sub b
	ld l, a
	jr nc, .ok
	dec h
.ok
	ld a, [hli]
	ldh [rBGP], a
	ld a, [hli]
	ldh [rOBP0], a
	ld a, [hli]
	ldh [rOBP1], a
;;;;;;;;;; shinpokerednote: gbcnote: code to allow gbc color from yellow
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
;;;;;;;;;;
	ret
.checkFirstLoad
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	ret nz
	jr .notFirstLoad

GBFadeInFromBlack::
	ld hl, FadePal1
	ld b, 4
	jr GBFadeIncCommon

GBFadeOutToWhite::
	ld hl, FadePal6
	ld b, 3

GBFadeIncCommon:
	ld a, [hli]
	ldh [rBGP], a
	ld a, [hli]
	ldh [rOBP0], a
	ld a, [hli]
	ldh [rOBP1], a
;;;;;;;;;; shinpokerednote: gbcnote: code to allow gbc color from yellow
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
;;;;;;;;;;
	ld c, 8
	rst _DelayFrames
	dec b
	jr nz, GBFadeIncCommon
	ret

GBFadeOutToBlack::
	ld hl, FadePal4 + 2
	ld b, 4
	jr GBFadeDecCommon

GBFadeInFromWhite::
	ld hl, FadePal7 + 2
	ld b, 3

GBFadeDecCommon:
	ld a, [hld]
	ldh [rOBP1], a
	ld a, [hld]
	ldh [rOBP0], a
	ld a, [hld]
	ldh [rBGP], a
;;;;;;;;;; shinpokerednote: gbcnote: code to allow gbc color from yellow
	call UpdateGBCPal_BGP
	call UpdateGBCPal_OBP0
	call UpdateGBCPal_OBP1
;;;;;;;;;;
	ld c, 8
	rst _DelayFrames
	dec b
	jr nz, GBFadeDecCommon
	ret

FadePal1:: db %11111111, %11111111, %11111111
FadePal2:: db %11111110, %11111110, %11111000
FadePal3:: db %11111001, %11100100, %11100100
FadePal4:: db %11100100, %11010000, %11100000
;                rBGP      rOBP0      rOBP1
FadePal5:: db %11100100, %11010000, %11100000
FadePal6:: db %10010000, %10000000, %10010000
FadePal7:: db %01000000, %01000000, %01000000
FadePal8:: db %00000000, %00000000, %00000000
