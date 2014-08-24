; INPUT:
; c: if nonzero, show at least a sliver of health
; d = number of HP bar sections (normally 6)
; e = health (in eighths of bar sections) (normally out of 48)
DrawHPBar:: ; 1336 (0:1336)
	push hl
	push de
	push bc
	ld a,$71 ; left of HP bar tile 1
	ld [hli],a
	ld a,$62 ; left of HP bar tile 2
	ld [hli],a
	push hl
	ld a,$63 ; empty bar section tile
.drawEmptyBarLoop
	ld [hli],a
	dec d
	jr nz,.drawEmptyBarLoop
	ld a,[wListMenuID]
	dec a ; what should the right of HP bar tile be?
	ld a,$6d ; right of HP bar tile, in status screen and battles
	jr z,.writeTile
	dec a ; right of HP bar tile, in pokemon menu
.writeTile
	ld [hl],a
	pop hl
	ld a,e
	and a ; is there enough health to show up on the HP bar?
	jr nz,.loop ; if so, draw the HP bar
	ld a,c
	and a ; should a sliver of health be shown no matter what?
	jr z,.done
	ld e,1 ; if so, fill one eighth of a bar section
; loop to draw every full bar section
.loop
	ld a,e
	sub a,8
	jr c,.drawPartialBarSection
	ld e,a
	ld a,$6b ; filled bar section tile
	ld [hli],a
	ld a,e
	and a
	jr z,.done
	jr .loop
; draws a partial bar section at the end (if necessary)
; there are 7 possible partial bar sections from 1/8 to 7/8 full
.drawPartialBarSection
	ld a,$63 ; empty bar section tile
	add e ; add e to get the appropriate partial bar section tile
	ld [hl],a ; write the tile
.done
	pop bc
	pop de
	pop hl
	ret