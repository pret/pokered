HiddenItemNear:
	ld hl, HiddenItemCoords
	ld b, 0
.loop
	ld de, 3
	ld a, [wCurMap]
	call IsInRestOfArray
	ret nc ; return if current map has no hidden items
	push bc
	push hl
	ld hl, wObtainedHiddenItemsFlags
	ld c, b
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	pop hl
	pop bc
	inc b
	and a
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	jr nz, .loop ; if the item has already been obtained
; check if the item is within 4-5 tiles (depending on the direction of item)
	ld a, [wYCoord]
	call Sub5ClampTo0
	cp d
	jr nc, .loop
	ld a, [wYCoord]
	add 4
	cp d
	jr c, .loop
	ld a, [wXCoord]
	call Sub5ClampTo0
	cp e
	jr nc, .loop
	ld a, [wXCoord]
	add 5
	cp e
	jr c, .loop
	call GetItemFinderFacing ; NEW: stores which direction the item is from the player for later
	scf
	ret

Sub5ClampTo0:
; subtract 5 but clamp to 0
	sub 5
	cp $f0
	ret c
	xor a
	ret

; NEW: Code for turning to face the direction of the item
; d = hidden item's y coord
; e = hidden item's x coord
GetItemFinderFacing:
	call CheckExactCoordMatch
	jr c, .exactMatch
	ld bc, 0
	ld a, [wYCoord] ; player's y coord
	sub d ; subtract hidden item's y value
	jr nc, .next
	cpl
	inc a
	inc b
.next
	ld d, a ; how far away in y direction the item is
	ld a, [wXCoord]
	sub e
	jr nc, .next2
	cpl
	inc a
	inc c
.next2
	ld e, a ; how far away in x direction the item is
	ld a, d
	sub e
	jr nc, .upOrDown
.leftOrRight
	ld a, c
	and a
	jr z, .left
	ld a, PLAYER_DIR_RIGHT
	jr .done
.upOrDown
	ld a, b
	and a
	jr z, .up
	ld a, PLAYER_DIR_DOWN
	jr .done
.left
	ld a, PLAYER_DIR_LEFT
	jr .done
.up
	ld a, PLAYER_DIR_UP
	jr .done
.exactMatch
	xor a
.done
  	ld [wItemFinderItemDirection], a
  	ret

	
CheckExactCoordMatch:
	ld a, [wYCoord] ; player's y coord
	sub d ; item's y value
	jr nz, .clearCF
	ld a, [wXCoord] ; player's x coord
	sub e ; item's x value
	jr nz, .clearCF
	scf
	ret
.clearCF
	and a ; clear carry flag
	ret