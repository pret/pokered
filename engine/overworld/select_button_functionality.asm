; shinpokerednote: ADDED: this function handles quick-use of fishing and biking on pressing select.
; PureRGBnote: at the moment fishing with select is commented out since we've made it easier to select from the item menu the rod repeatedly.
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
	ld a, [wStatusFlags6]
	bit BIT_ALWAYS_ON_BIKE, a
	ret nz
	; do nothing if surfing
	ld a, [wWalkBikeSurfState]
	cp SURFING
	ret z
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, SelectInVolcano
	;else check if bike is in bag
	ld b, BICYCLE
	push bc
	call IsItemInBag
	pop bc
	ret z

.start
	ld a, [wWalkBikeSurfState]
	cp BIKING
	jr z, .gotOff
	CheckEvent EVENT_SAW_GOT_ON_BIKE_TEXT
	jr z, PrepareText
	jr .sawText
.gotOff
	CheckEvent EVENT_SAW_GOT_OFF_BIKE_TEXT
	jr z, PrepareText
.sawText
	call IsBikeRidingAllowed
	jr nc, PrepareText
	call UseBike
	jp LoadPlayerSpriteGraphics ; instant bike usage

PrepareText:
	;initialize a text box without drawing anything special
	ld a, 1
	ld [wAutoTextBoxDrawingControl], a
	callfar DisplayTextIDInit

	call UseBike
	
	;use $ff value loaded into hTextID to make DisplayTextID display nothing and close any text
	ld a, $FF
	ldh [hTextID], a
	jp DisplayTextID

; PureRGBnote: ADDED: In the volcano, select will use a drill that allows the player to dig down to the next floor.

SelectInVolcano:
	CheckEvent EVENT_GOT_DRILL
	ret z
	call DrillAnimation
	jpfar VolcanoDrillingResult


DrillAnimation::
	; copy drilling sprite to red's sprite
	xor a
	ld [wPlayerMovingDirection], a ; make player stop
	call UpdateSprites
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a ; make player look downward
	call UpdateSprites
	; play drilling sound effect
	ld de, SFX_Drill
	call PlayNewSoundChannel8
	
	ld hl, vChars0
	ld de, LavaSuitDrillingSprite
	lb bc, BANK(LavaSuitDrillingSprite), 4
	call CopyVideoData
	ld b, 1
	ld c, 30
.animationLoop
 	ld hl, wSpritePlayerStateData1YPixels
	ld a, c
	rra
	jr nc, .down ; on even iterations make the sprite move down 1 pixel, odd move up 1 pixel
 	inc [hl]
	jr .continue
.down
 	dec [hl]
.continue
	rst _DelayFrame
	ld a, c
	rra 
	jr nc, .extraDelay
	call c, .frameChange ; on odd iterations of the loop we mirror the drill too instead of just making the sprite go up and down
	jr .noExtraDelay
.extraDelay
	rst _DelayFrame ; on even iterations of the loop we need to delay an extra frame
.noExtraDelay
	dec c
	jr nz, .animationLoop
.reset
	ld hl, vChars0
	ld de, LavaSuitSprite
	lb bc, BANK(LavaSuitSprite), 4
	jp CopyVideoData
.frameChange
	ld hl, vChars0 tile 2
	ld a, b
	xor 1
	ld b, a
	push bc
	and a
	jr nz, .secondDrillFrame
.firstDrillFrame
	ld de, LavaSuitDrillingSprite tile 2
	lb bc, BANK(LavaSuitDrillingSprite), 2
	jr .finishFrameChange
.secondDrillFrame
	ld de, LavaSuitDrillingSprite2
	lb bc, BANK(LavaSuitDrillingSprite2), 2
.finishFrameChange
	call CopyVideoData
	pop bc
	ret

UseBike:
	;determine item to use
	ld a, BICYCLE
	ld [wCurItem], a	;load item to be used
	ld [wNamedObjectIndex], a	;load item so its name can be grabbed
	call GetItemName	;get the item name into de register
	call CopyToStringBuffer ; copy name from de to wcf4b so it shows up in text
	jp UseItem	;use the item
	