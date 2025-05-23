; PureRGBnote: FIXED: Always updated sprite 15??? is this even needed then??? What is the point of this function?
; PureRGBnote: CHANGED: this code was removed in yellow anyway so lets just remove it.
;UpdateSpriteFacingOffsetAndDelayMovement::
;	ld a, SPRITESTATEDATA2_MOVEMENTDELAY
;	ldh [hSpriteDataOffset], a
;	call GetPointerWithinSpriteStateData2
;	ld [hl], $7f ; x#SPRITESTATEDATA2_MOVEMENTDELAY = maximum movement delay
;	assert SPRITESTATEDATA1_FACINGDIRECTION == SPRITESTATEDATA2_MOVEMENTDELAY + 1
;	inc l
;	dec h       ; move to SPRITESTATEDATA1 and FACINGDIRECTION
;	ld a, [hld] ; x#SPRITESTATEDATA1_FACINGDIRECTION
;	ld b, a
;	xor a
;	ld [hld], a ; x#SPRITESTATEDATA1_ANIMFRAMECOUNTER
;	ld [hl], a  ; x#SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER
;	ld a, l
;	assert SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER > SPRITESTATEDATA1_IMAGEINDEX
;	sub SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER - SPRITESTATEDATA1_IMAGEINDEX
;	ld l, a
;	ld a, [hl] ; x#SPRITESTATEDATA1_IMAGEINDEX
;	or b ; or in the facing direction
;	ld [hld], a
;	ld [hl], 2 ; x#SPRITESTATEDATA1_MOVEMENTSTATUS = delayed movement status
;	ret
