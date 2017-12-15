PrintRedSNESText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomSNESText

RedBedroomSNESText:
	TX_FAR _RedBedroomSNESText
	db "@"

OpenRedsPC:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomPCText

RedBedroomPCText:
	TX_PLAYERS_PC

Route15GateLeftBinoculars:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route15UpstairsBinocularsText
	ld a, ARTICUNO
	ld [wcf91], a
	call PlayCry
	jp DisplayMonFrontSpriteInBox

Route15UpstairsBinocularsText:
	TX_FAR _Route15UpstairsBinocularsText
	db "@"

AerodactylFossil:
	ld a, FOSSIL_AERODACTYL
	ld [wcf91], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre AerodactylFossilText
	ret

AerodactylFossilText:
	TX_FAR _AerodactylFossilText
	db "@"

KabutopsFossil:
	ld a, FOSSIL_KABUTOPS
	ld [wcf91], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre KabutopsFossilText
	ret

KabutopsFossilText:
	TX_FAR _KabutopsFossilText
	db "@"

DisplayMonFrontSpriteInBox:
; Displays a pokemon's front sprite in a pop-up window.
; [wcf91] = pokemon internal id number
	ld a, 1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	xor a
	ld [hWY], a
	call SaveScreenTilesToBuffer1
	ld a, MON_SPRITE_POPUP
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSprites
	ld a, [wcf91]
	ld [wd0b5], a
	call GetMonHeader
	ld de, vChars1 + $310
	call LoadMonFrontSprite
	ld a, $80
	ld [hStartTileID], a
	coord hl, 10, 11
	predef AnimateSendingOutMon
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer1
	call Delay3
	ld a, $90
	ld [hWY], a
	ret

PrintBlackboardLinkCableText:
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenObjectFunctionArgument]
	call PrintPredefTextID
	ret

LinkCableHelp:
	TX_ASM
	call SaveScreenTilesToBuffer1
	ld hl, LinkCableHelpText1
	call PrintText
	xor a
	ld [wMenuItemOffset], a ; not used
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 3
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
.linkHelpLoop
	ld hl, wd730
	set 6, [hl]
	coord hl, 0, 0
	ld b, 8
	ld c, 13
	call TextBoxBorder
	coord hl, 2, 2
	ld de, HowToLinkText
	call PlaceString
	ld hl, LinkCableHelpText2
	call PrintText
	call HandleMenuInput
	bit 1, a ; pressed b
	jr nz, .exit
	ld a, [wCurrentMenuItem]
	cp 3 ; pressed a on "STOP READING"
	jr z, .exit
	ld hl, wd730
	res 6, [hl]
	ld hl, LinkCableInfoTexts
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp .linkHelpLoop
.exit
	ld hl, wd730
	res 6, [hl]
	call LoadScreenTilesFromBuffer1
	jp TextScriptEnd

LinkCableHelpText1:
	TX_FAR _LinkCableHelpText1
	db "@"

LinkCableHelpText2:
	TX_FAR _LinkCableHelpText2
	db "@"

HowToLinkText:
	db   "HOW TO LINK"
	next "COLOSSEUM"
	next "TRADE CENTER"
	next "STOP READING@"

LinkCableInfoTexts:
	dw LinkCableInfoText1
	dw LinkCableInfoText2
	dw LinkCableInfoText3

LinkCableInfoText1:
	TX_FAR _LinkCableInfoText1
	db "@"

LinkCableInfoText2:
	TX_FAR _LinkCableInfoText2
	db "@"

LinkCableInfoText3:
	TX_FAR _LinkCableInfoText3
	db "@"

ViridianSchoolBlackboard:
	TX_ASM
	call SaveScreenTilesToBuffer1
	ld hl, ViridianSchoolBlackboardText1
	call PrintText
	xor a
	ld [wMenuItemOffset], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
.blackboardLoop
	ld hl, wd730
	set 6, [hl]
	coord hl, 0, 0
	lb bc, 6, 10
	call TextBoxBorder
	coord hl, 1, 2
	ld de, StatusAilmentText1
	call PlaceString
	coord hl, 6, 2
	ld de, StatusAilmentText2
	call PlaceString
	ld hl, ViridianSchoolBlackboardText2
	call PrintText
	call HandleMenuInput ; pressing up and down is handled in here
	bit 1, a ; pressed b
	jr nz, .exitBlackboard
	bit 4, a ; pressed right
	jr z, .didNotPressRight
	; move cursor to right column
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 6
	ld [wTopMenuItemX], a
	ld a, 3 ; in the the right column, use an offset to prevent overlap
	ld [wMenuItemOffset], a
	jr .blackboardLoop
.didNotPressRight
	bit 5, a ; pressed left
	jr z, .didNotPressLeftOrRight
	; move cursor to left column
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	xor a
	ld [wMenuItemOffset], a
	jr .blackboardLoop
.didNotPressLeftOrRight
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wMenuItemOffset]
	add b
	cp 5 ; cursor is pointing to "QUIT"
	jr z, .exitBlackboard
	; we must have pressed a on a status condition
	; so print the text
	ld hl, wd730
	res 6, [hl]
	ld hl, ViridianBlackboardStatusPointers
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp .blackboardLoop
.exitBlackboard
	ld hl, wd730
	res 6, [hl]
	call LoadScreenTilesFromBuffer1
	jp TextScriptEnd

ViridianSchoolBlackboardText1:
	TX_FAR _ViridianSchoolBlackboardText1
	db "@"

ViridianSchoolBlackboardText2:
	TX_FAR _ViridianSchoolBlackboardText2
	db "@"

StatusAilmentText1:
	db   " SLP"
	next " PSN"
	next " PAR@"

StatusAilmentText2:
	db   " BRN"
	next " FRZ"
	next " QUIT@@"

ViridianBlackboardStatusPointers:
	dw ViridianBlackboardSleepText
	dw ViridianBlackboardPoisonText
	dw ViridianBlackboardPrlzText
	dw ViridianBlackboardBurnText
	dw ViridianBlackboardFrozenText

ViridianBlackboardSleepText:
	TX_FAR _ViridianBlackboardSleepText
	db "@"

ViridianBlackboardPoisonText:
	TX_FAR _ViridianBlackboardPoisonText
	db "@"

ViridianBlackboardPrlzText:
	TX_FAR _ViridianBlackboardPrlzText
	db "@"

ViridianBlackboardBurnText:
	TX_FAR _ViridianBlackboardBurnText
	db "@"

ViridianBlackboardFrozenText:
	TX_FAR _ViridianBlackboardFrozenText
	db "@"

PrintTrashText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump VermilionGymTrashText

VermilionGymTrashText:
	TX_FAR _VermilionGymTrashText
	db "@"

GymTrashScript:
	call EnableAutoTextBoxDrawing
	ld a, [wHiddenObjectFunctionArgument]
	ld [wGymTrashCanIndex], a

; Don't do the trash can puzzle if it's already been done.
	CheckEvent EVENT_2ND_LOCK_OPENED
	jr z, .ok

	tx_pre_jump VermilionGymTrashText

.ok
	CheckEventReuseA EVENT_1ST_LOCK_OPENED
	jr nz, .trySecondLock

	ld a, [wFirstLockTrashCanIndex]
	ld b, a
	ld a, [wGymTrashCanIndex]
	cp b
	jr z, .openFirstLock

	tx_pre_id VermilionGymTrashText
	jr .done

.openFirstLock
; Next can is trying for the second switch.
	SetEvent EVENT_1ST_LOCK_OPENED

	ld hl, GymTrashCans
	ld a, [wGymTrashCanIndex]
	; * 5
	ld b, a
	add a
	add a
	add b

	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]

; There is a bug in this code. It should calculate a value in the range [0, 3]
; but if the mask and random number don't have any 1 bits in common, then
; the result of the AND will be 0. When 1 is subtracted from that, the value
; will become $ff. This will result in 255 being added to hl, which will cause
; hl to point to one of the zero bytes that pad the end of the ROM bank.
; Trash can 0 was intended to be able to have the second lock only when the
; first lock was in trash can 1 or 3. However, due to this bug, trash can 0 can
; have the second lock regardless of which trash can had the first lock.

	ld [hGymTrashCanRandNumMask], a
	push hl
	call Random
	swap a
	ld b, a
	ld a, [hGymTrashCanRandNumMask]
	and b
	dec a
	pop hl

	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	and $f
	ld [wSecondLockTrashCanIndex], a

	tx_pre_id VermilionGymTrashSuccessText1
	jr .done

.trySecondLock
	ld a, [wSecondLockTrashCanIndex]
	ld b, a
	ld a, [wGymTrashCanIndex]
	cp b
	jr z, .openSecondLock

; Reset the cans.
	ResetEvent EVENT_1ST_LOCK_OPENED
	call Random

	and $e
	ld [wFirstLockTrashCanIndex], a

	tx_pre_id VermilionGymTrashFailText
	jr .done

.openSecondLock
; Completed the trash can puzzle.
	SetEvent EVENT_2ND_LOCK_OPENED
	ld hl, wCurrentMapScriptFlags
	set 6, [hl]

	tx_pre_id VermilionGymTrashSuccessText3

.done
	jp PrintPredefTextID

GymTrashCans:
; byte 0: mask for random number
; bytes 1-4: indices of the trash cans that can have the second lock
;            (but see the comment above explaining a bug regarding this)
; Note that the mask is simply the number of valid trash can indices that
; follow. The remaining bytes are filled with 0 to pad the length of each entry
; to 5 bytes.
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

VermilionGymTrashSuccessText1:
	TX_FAR _VermilionGymTrashSuccessText1
	TX_ASM
	call WaitForSoundToFinish
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

; unused
VermilionGymTrashSuccessText2:
	TX_FAR _VermilionGymTrashSuccessText2
	db "@"

; unused
VermilionGymTrashSuccesPlaySfx:
	TX_ASM
	call WaitForSoundToFinish
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionGymTrashSuccessText3:
	TX_FAR _VermilionGymTrashSuccessText3
	TX_ASM
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionGymTrashFailText:
	TX_FAR _VermilionGymTrashFailText
	TX_ASM
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd
