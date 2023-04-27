CelesteHill_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CelesteHill_ScriptPointers
	ld a, [wCelesteHillCurScript]
	jp CallFunctionInTable

CelesteHill_ScriptPointers:
	dw GalarianBirdScript1

CelesteHillCoords1:
	dbmapcoord 13,  8
	db -1 ; end

GalarianBirdScript1:
;	CheckEvent EVENT_BIRDS_FOUND
;	jr z, .cont
;	jr nz, .done
;.cont - This code is unfinished and bad.
; If you have any ideas lmk :3
	ld hl, CelesteHillCoords1
	call ArePlayerCoordsInArray
	jp nc, .done
	
	ld [wJoyIgnore], a
	SetEvent EVENT_BIRDS_FOUND
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	
	ld a, ARTICUNO_G
	call PlayCry
	call WaitForSoundToFinish
	pop hl
	ld de, BirdSprite
	ld hl, vNPCSprites
	lb bc, BANK(BirdSprite), $0c
	call CopyVideoData
	farcall LoadBirdSpriteGraphics
	ld a, SFX_FLY
	call PlaySound
	ld hl, wFlyAnimUsingCoordList
	xor a ; is using coord list
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, 12
	ld [hli], a ; wFlyAnimCounter
	ld [hl], $8 ; wFlyAnimBirdSpriteImageIndex (facing right)
	xor a ; is using coord list
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, $c
	ld [hli], a ; wFlyAnimCounter
	ld [hl], $c ; wFlyAnimBirdSpriteImageIndex (facing right)
	ld de, GalarianArticunoFlyScreenCoords1
	call GalarianArticunoFlyLoop
	ld c, 40
	call DelayFrames
	ld hl, wFlyAnimCounter
	ld a, 11
	ld [hli], a ; wFlyAnimCounter
	ld [hl], $8 ; wFlyAnimBirdSpriteImageIndex (facing left)
	ld de, GalarianArticunoFlyScreenCoords2
	call GalarianArticunoFlyLoop
	
	ld a, HS_CELESTE_ARTICUNO_G
	ld [wMissableObjectIndex], a
	predef ShowObject
	
	ld a, ZAPDOS_G
	call PlayCry
	call ZapdosRunThrough
	
	ld a, HS_CELESTE_ZAPDOS_G
	ld [wMissableObjectIndex], a
	predef ShowObject
	
	ld a, $1
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, [wXCoord]
	
	jr .done
.done
	ret

	; DoFlyAnimation clone, but for Articuno.
GalarianArticunoFlyLoop:
	ld a, [wFlyAnimBirdSpriteImageIndex]
	xor $1 ; make the bird flap its wings
	ld [wFlyAnimBirdSpriteImageIndex], a
	ld [wSprite03StateData1ImageIndex], a
	call Delay3
	ld a, [wFlyAnimUsingCoordList]
	cp $ff
	jr z, .skipCopyingCoords ; if the bird is flapping its wings in place
	ld hl, wSprite03StateData1YPixels
	ld a, [de]
	inc de
	ld [hli], a ; y
	inc hl
	ld a, [de]
	inc de
	ld [hl], a ; x
.skipCopyingCoords
	ld a, [wFlyAnimCounter]
	dec a
	ld [wFlyAnimCounter], a
	jr nz, GalarianArticunoFlyLoop
	ret

; Clones of the initial part of the Fly animation.
GalarianArticunoFlyScreenCoords1:
; y, x pairs
	db $06, $0B ; 6, 11 $3C, $48
	db $3C, $50
	db $3B, $58
	db $3A, $60
	db $39, $68
	db $37, $70
	db $37, $78
	db $33, $80
	db $30, $88
	db $2D, $90
	db $2A, $98
	db $27, $A0

GalarianArticunoFlyScreenCoords2:
	db $1A, $90
	db $19, $80
	db $17, $70
	db $15, $60
	db $12, $50
	db $0F, $40
	db $0C, $30
	db $09, $20
	db $05, $10
	db $00, $00

	db $F0, $00

ZapdosRunThrough:
	call Delay3
	ld a, $2
	ldh [hSpriteIndex], a
	ld de, GalarianZapdosMovement1
	call MoveSprite
	
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_PlayerGZapMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ldh [hSpriteIndex], a
	xor a
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	
	ld a, $2
	ldh [hSpriteIndex], a
	ld de, GalarianZapdosMovement2
	call MoveSprite
	ret

GalarianZapdosMovement1:
	db NPC_MOVEMENT_DOWN
	db -1

GalarianZapdosMovement2:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

CelesteHill_TextPointers:
	dw CelesteHillGalarianBirdScreech
	dw CelesteHillSign1
	dw CelesteHillSign2

CelesteHillGalarianBirdScreech:
	text_far _CelesteHillGalarianBirdScreech
	text_end

CelesteHillSign1:
	text_far _CelesteHillSign1
	text_end
	
CelesteHillSign2:
	text_far _CelesteHillSign2
	text_end
	
	text_end ; unused
	