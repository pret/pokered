; These routines manage gradual fading
; (e.g., entering a doorway)
LoadGBPal::
;;;;;;;;;; PureRGBnote: ADDED: an optimization for certain maps where we can skip showing the map from being faded to black until later.
	ld a, [wCurMapConnections]
	;;;;;; new bit in the map header that can mark a map as staying black visually until the map script changes it 
	;;;;;; (used for situations in which we may need to replace tile blocks)
	bit BIT_DEFER_SHOWING_MAP, a
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
	call Delay3
	farcall GBCFadeInFromBlack
	ld hl, FadePal4
	ld b, 1
	ld c, 1
	jr z, GBFadeIncCommon.delayset
	ld hl, FadePal1
	ld b, 4
	jr GBFadeIncCommon

GBFadeOutToWhite::
	call Delay3
	farcall GBCFadeOutToWhite
	ld hl, FadePal8
	ld b, 1
	ld c, 1
	jr z, GBFadeIncCommon.delayset
	ld hl, FadePal6
	ld b, 3

GBFadeIncCommon:
	ld c, 8
.delayset
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
	rst _DelayFrames
	dec b
	jr nz, GBFadeIncCommon
	ret

GBFadeOutToBlack::
	farcall GBCFadeOutToBlack
	ld hl, FadePal1 + 2
	ld b, 1
	ld c, 1
	jr z, GBFadeDecCommon.delayset
	ld hl, FadePal4 + 2
	ld b, 4
	jr GBFadeDecCommon

GBFadeInFromWhite::
	farcall GBCFadeInFromWhite
	ld hl, FadePal5 + 2
	ld b, 1
	ld c, 1
	jr z, GBFadeDecCommon.delayset
	ld hl, FadePal7 + 2
	ld b, 3

GBFadeDecCommon:
	ld c, 8
.delayset
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
	rst _DelayFrames
	dec b
	jr nz, GBFadeDecCommon
	ret

FadePal1:: dc 3,3,3,3, 3,3,3,3, 3,3,3,3
FadePal2:: dc 3,3,3,2, 3,3,3,2, 3,3,2,0
FadePal3:: dc 3,3,2,1, 3,2,1,0, 3,2,1,0
FadePal4:: dc 3,2,1,0, 3,1,0,0, 3,2,0,0
;              rBGP     rOBP0    rOBP1
FadePal5:: dc 3,2,1,0, 3,1,0,0, 3,2,0,0
FadePal6:: dc 2,1,0,0, 2,0,0,0, 2,1,0,0
FadePal7:: dc 1,0,0,0, 1,0,0,0, 1,0,0,0
FadePal8:: dc 0,0,0,0, 0,0,0,0, 0,0,0,0
