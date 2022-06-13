;this function handles quick-use of fishing and biking
CheckForRodBike::
	;callfar IsNextTileShoreOrWater	;unsets carry if player is facing water or shore
	;jr c, .nofishing
	;ld hl, TilePairCollisionsWater
	;call CheckForTilePairCollisions
	;jr c, .nofishing
	;are rods in the bag?
	;ld b, SUPER_ROD
	;push bc
	;call IsItemInBag
	;pop bc
	;jr nz, .start
	;ld b, GOOD_ROD
	;push bc
	;call IsItemInBag
	;pop bc
	;jr nz, .start
	;ld b, OLD_ROD
	;push bc
	;call IsItemInBag
	;pop bc
	;jr nz, .start

;.nofishing
	;do nothing if forced to ride bike
	ld a, [wd732]
	bit 5, a
	ret nz
	;else check if bike is in bag
	ld b, BICYCLE
	push bc
	call IsItemInBag
	pop bc
	ret z

.start
	ld a, [wWalkBikeSurfState]
	cp 1
	jr z, .gotOff
	CheckEvent EVENT_SAW_GOT_ON_BIKE_TEXT
	jp z, PrepareText
	jr .sawText
.gotOff
	CheckEvent EVENT_SAW_GOT_OFF_BIKE_TEXT
	jp z, PrepareText
.sawText
	push bc
	call IsBikeRidingAllowed
	pop bc
	jp nc, PrepareText
	call UseBike
	call CloseTextDisplayNoSpriteUpdate ; instant bike usage
	ret

PrepareText:
	push bc
	;initialize a text box without drawing anything special
	ld a, 1
	ld [wAutoTextBoxDrawingControl], a
	callfar DisplayTextIDInit
	pop bc

	call UseBike
	
	;use $ff value loaded into hSpriteIndexOrTextID to make DisplayTextID display nothing and close any text
	ld a, $FF
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID

	ret

UseBike:
	;determine item to use
	ld a, b
	ld [wcf91], a	;load item to be used
	ld [wd11e], a	;load item so its name can be grabbed
	call GetItemName	;get the item name into de register
	call CopyToStringBuffer ; copy name from de to wcf4b so it shows up in text
	call UseItem	;use the item
	ret
	