PrintRedsNESText: ; 5db79 (17:5b79)
	call EnableAutoTextBoxDrawing
	ld a, $4 ; RedBedroomSNESText
	jp PrintPredefTextID

RedBedroomSNESText: ; 5db81 (17:5b81)
	TX_FAR _RedBedroomSNESText
	db "@"

OpenRedsPC: ; 5db86 (17:5b86)
	call EnableAutoTextBoxDrawing
	ld a, $3
	jp PrintPredefTextID

RedBedroomPC: ; 5db8e (17:5b8e)
	db $fc ; FuncTX_ItemStoragePC

Route15GateLeftBinoculars: ; 5db8f (17:5b8f)
	ld a, [wSpriteStateData1 + 9]
	cp $4 ; i
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $a ; text id Route15UpstairsBinocularsText
	call PrintPredefTextID
	ld a, ARTICUNO
	ld [wcf91], a
	call PlayCry
	jp DisplayMonFrontSpriteInBox

Route15UpstairsBinocularsText: ; 5dba8 (17:5ba8)
	TX_FAR _Route15UpstairsBinocularsText
	db "@"

AerodactylFossil: ; 5dbad (17:5bad)
	ld a, FOSSIL_AERODACTYL
	ld [wcf91], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	ld a, $9
	call PrintPredefTextID
	ret

AerodactylFossilText: ; 5dbbe (17:5bbe)
	TX_FAR _AerodactylFossilText
	db "@"

KabutopsFossil: ; 5bdc3 (17:5bc3)
	ld a, FOSSIL_KABUTOPS
	ld [wcf91], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	ld a, $b
	call PrintPredefTextID
	ret

KabutopsFossilText: ; 5dbd4 (17:5bd4)
	TX_FAR _KabutopsFossilText
	db "@"

DisplayMonFrontSpriteInBox: ; 5dbd9 (17:5bd9)
; Displays a pokemon's front sprite in a pop-up window.
; [wcf91] = pokemon interal id number
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Delay3
	xor a
	ld [hWY], a
	call SaveScreenTilesToBuffer1
	ld a, $11
	ld [wd125], a
	call DisplayTextBoxID
	call UpdateSprites
	ld a, [wcf91]
	ld [wd0b5], a
	call GetMonHeader
	ld de, vChars1 + $310
	call LoadMonFrontSprite
	ld a, $80
	ld [$ffe1], a
	hlCoord 10, 11
	predef Func_3f073
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer1
	call Delay3
	ld a, $90
	ld [hWY], a
	ret

PrintBlackboardLinkCableText: ; 5dc1a (17:5c1a)
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wWhichTrade]
	call PrintPredefTextID
	ret

LinkCableHelp: ; 5dc29 (17:5c29)
	db $08 ; asm
	call SaveScreenTilesToBuffer1
	ld hl, LinkCableHelpText1
	call PrintText
	xor a
	ld [W_ANIMATIONID], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, $3
	ld [wMenuWatchedKeys], a
	ld a, $3
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
.asm_5c51
	ld hl, wd730
	set 6, [hl]
	ld hl, wTileMap
	ld b, $8
	ld c, $d
	call TextBoxBorder
	ld hl, wTileMap + $2a
	ld de, HowToLinkText
	call PlaceString
	ld hl, LinkCableHelpText2
	call PrintText
	call HandleMenuInput
	bit 1, a
	jr nz, .asm_5dc93 ; 0x5dc74 $1d
	ld a, [wCurrentMenuItem]
	cp $3
	jr z, .asm_5dc93 ; 0x5dc7b $16
	ld hl, wd730
	res 6, [hl]
	ld hl, LinkCableInfoTexts
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp .asm_5c51
.asm_5dc93
	ld hl, wd730
	res 6, [hl]
	call LoadScreenTilesFromBuffer1
	jp TextScriptEnd

LinkCableHelpText1: ; 5dc9e (17:5c9e)
	TX_FAR _LinkCableHelpText1
	db "@"

LinkCableHelpText2: ; 5dca3 (17:5ca3)
	TX_FAR _LinkCableHelpText2
	db "@"

HowToLinkText: ; 5dca8 (17:5ca8)
	db   "HOW TO LINK"
	next "COLOSSEUM"
	next "TRADE CENTER"
	next "STOP READING@"

LinkCableInfoTexts: ; 5dcd8 (17:5cd8)
	dw LinkCableInfoText1
	dw LinkCableInfoText2
	dw LinkCableInfoText3

LinkCableInfoText1: ; 5dcde (17:5cde)
	TX_FAR _LinkCableInfoText1
	db "@"

LinkCableInfoText2: ; 5dce3 (17:5ce3)
	TX_FAR _LinkCableInfoText2
	db "@"

LinkCableInfoText3: ; 5dce8 (17:5ce8)
	TX_FAR _LinkCableInfoText3
	db "@"

ViridianSchoolBlackboard: ; 5dced (17:5ced)
	db $08 ; asm
	call SaveScreenTilesToBuffer1
	ld hl, ViridianSchoolBlackboardText1
	call PrintText
	xor a
	ld [W_ANIMATIONID], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, $33
	ld [wMenuWatchedKeys], a
	ld a, $2
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
.asm_5dd15
	ld hl, wd730
	set 6, [hl]
	ld hl, wTileMap
	ld bc, $060a
	call TextBoxBorder
	ld hl, wTileMap + $29
	ld de, StatusAilmentText1
	call PlaceString
	ld hl, wTileMap + $2e
	ld de, StatusAilmentText2
	call PlaceString
	ld hl, ViridianSchoolBlackboardText2
	call PrintText
	call HandleMenuInput
	bit 1, a
	jr nz, .exitBlackboard
	bit 4, a
	jr z, .asm_5dd5c
	ld a, $2
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $6
	ld [wTopMenuItemX], a
	ld a, $3
	ld [W_ANIMATIONID], a
	jr .asm_5dd15
.asm_5dd5c
	bit 5, a
	jr z, .asm_5dd75
	ld a, $2
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	xor a
	ld [W_ANIMATIONID], a
	jr .asm_5dd15
.asm_5dd75
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [W_ANIMATIONID]
	add b
	cp $5
	jr z, .exitBlackboard
	ld hl, wd730
	res 6, [hl]
	ld hl, ViridianBlackboardStatusPointers
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp .asm_5dd15
.exitBlackboard
	ld hl, wd730
	res 6, [hl]
	call LoadScreenTilesFromBuffer1
	jp TextScriptEnd

ViridianSchoolBlackboardText1: ; 5dda2 (17:5da2)
	TX_FAR _ViridianSchoolBlackboardText1
	db "@"

ViridianSchoolBlackboardText2: ; 5dda7 (17:5da7)
	TX_FAR _ViridianSchoolBlackboardText2
	db "@"

StatusAilmentText1: ; 5ddac (17:5dac)
	db   " SLP"
	next " PSN"
	next " PAR@"

StatusAilmentText2: ; 5ddbb (17:5dbb)
	db   " BRN"
	next " FRZ"
	next " QUIT@@"

ViridianBlackboardStatusPointers: ; 5ddcc (17:5ddc)
	dw ViridianBlackboardSleepText
	dw ViridianBlackboardPoisonText
	dw ViridianBlackbaordPrlzText
	dw ViridianBlackboardBurnText
	dw ViridianBlackboardFrozenText

ViridianBlackboardSleepText: ; 5ddd6 (17:5dd6)
	TX_FAR _ViridianBlackboardSleepText
	db "@"

ViridianBlackboardPoisonText: ; 5dddb (17:5ddb)
	TX_FAR _ViridianBlackboardPoisonText
	db "@"

ViridianBlackbaordPrlzText: ; 5dde0 (17:5de0)
	TX_FAR _ViridianBlackbaordPrlzText
	db "@"

ViridianBlackboardBurnText: ; 5dde5 (17:5de5)
	TX_FAR _ViridianBlackboardBurnText
	db "@"

ViridianBlackboardFrozenText: ; 5ddea (17:5dea)
	TX_FAR _ViridianBlackboardFrozenText
	db "@"

PrintTrashText: ; 5ddef (17:5def)
	call EnableAutoTextBoxDrawing
	ld a, $26
	jp PrintPredefTextID

VermilionGymTrashText: ; 5ddf7 (17:5df7)
	TX_FAR _VermilionGymTrashText
	db "@"

GymTrashScript: ; 5ddfc (17:5dfc)
	call EnableAutoTextBoxDrawing
	ld a, [wWhichTrade] ; wWhichTrade
	ld [wcd5b], a

; Don't do the trash can puzzle if it's already been done.
	ld a, [wd773]
	bit 0, a
	jr z, .ok

	ld a, $26 ; DisplayTextID $26 = VermilionGymTrashText (nothing in the trash)
	jp PrintPredefTextID

.ok
	bit 1, a
	jr nz, .trySecondLock

	ld a, [wd743]
	ld b, a
	ld a, [wcd5b]
	cp b
	jr z, .openFirstLock

	ld a, $26 ; DisplayTextID $26 = VermilionGymTrashText (nothing in the trash)
	jr .done

.openFirstLock
; Next can is trying for the second switch.
	ld hl, wd773
	set 1, [hl]

	ld hl, GymTrashCans ; $5e7d
	ld a, [wcd5b]
	; * 5
	ld b, a
	add a
	add a
	add b

	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]

	ld [$ffdb], a
	push hl
	call Random
	swap a
	ld b, a
	ld a, [$ffdb]
	and b
	dec a
	pop hl

	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	and $f
	ld [wd744], a

	ld a, $3b ; DisplayTextID $3b = VermilionGymTrashSuccesText1 (first lock opened!)
	jr .done

.trySecondLock
	ld a, [wd744]
	ld b, a
	ld a, [wcd5b]
	cp b
	jr z, .openSecondLock

; Reset the cans.
	ld hl, wd773
	res 1, [hl]
	call Random

	and $e
	ld [wd743], a

	ld a, $3e ; DisplayTextID $3e = VermilionGymTrashFailText (locks reset!)
	jr .done

.openSecondLock
; Completed the trash can puzzle.
	ld hl, wd773
	set 0, [hl]
	ld hl, wd126
	set 6, [hl]

	ld a, $3d ; DisplayTextID $3d = VermilionGymTrashSuccesText3 (2nd lock opened!)

.done
	jp PrintPredefTextID

GymTrashCans: ; 5de7d (17:5e7d)
	db 2,  1,  3,  0,  0 ; 0
	db 3,  0,  2,  4,  0 ; 1
	db 2,  1,  5,  0,  0 ; 2
	db 3,  0,  4,  6,  0 ; 3
	db 4,  1,  3,  5,  7 ; 4
	db 3,  2,  4,  8,  0 ; 5
	db 3,  3,  7,  9,  0 ; 6
	db 4,  4,  6,  8, 10 ; 7
	db 3,  5,  7, 11,  0 ; 8
	db 3,  6, 10, 12,  0 ; 9
	db 4,  7,  9, 11, 13 ; 10
	db 3,  8, 10, 14,  0 ; 11
	db 2,  9, 13,  0,  0 ; 12
	db 3, 10, 12, 14,  0 ; 13
	db 2, 11, 13,  0,  0 ; 14
; 5dec8

VermilionGymTrashSuccesText1: ; 5dec8 (17:5ec8)
	TX_FAR _VermilionGymTrashSuccesText1
	db $08 ; asm
	call WaitForSoundToFinish
	ld a, (SFX_02_49 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionGymTrashSuccesText2: ; 5dedb (17:5edb)
	TX_FAR _VermilionGymTrashSuccesText2
	db "@"

UnnamedText_5dee0: ; 5dee0 (17:5ee0)
	db $08 ; asm
	call WaitForSoundToFinish
	ld a, (SFX_02_49 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionGymTrashSuccesText3: ; 5deef (17:5eef)
	TX_FAR _VermilionGymTrashSuccesText3
	db $08 ; asm
	call WaitForSoundToFinish
	ld a, (SFX_02_57 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionGymTrashFailText: ; 5df02 (17:5f02)
	TX_FAR _VermilionGymTrashFailText
	db $08 ; asm
	call WaitForSoundToFinish
	ld a, (SFX_02_51 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd
