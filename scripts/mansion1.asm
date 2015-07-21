Mansion1Script: ; 442af (11:42af)
	call Mansion1Subscript1
	call EnableAutoTextBoxDrawing
	ld hl, Mansion1TrainerHeaders
	ld de, Mansion1ScriptPointers
	ld a, [W_MANSION1CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_MANSION1CURSCRIPT], a
	ret

Mansion1Subscript1: ; 442c5 (11:42c5)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .asm_442ec
	ld bc, $060c
	call Mansion1Script_4430b
	ld bc, $0308
	call Mansion1Script_44304
	ld bc, $080a
	call Mansion1Script_44304
	ld bc, $0d0d
	jp Mansion1Script_44304
.asm_442ec
	ld bc, $060c
	call Mansion1Script_44304
	ld bc, $0308
	call Mansion1Script_4430b
	ld bc, $080a
	call Mansion1Script_4430b
	ld bc, $0d0d
	jp Mansion1Script_4430b

Mansion1Script_44304: ; 44304 (11:4304)
	ld a, $2d
	ld [wd09f], a
	jr Mansion1ReplaceBlock

Mansion1Script_4430b: ; 4430b (11:430b)
	ld a, $e
	ld [wd09f], a
Mansion1ReplaceBlock: ; 44310 (11:4310)
	predef ReplaceTileBlock
	ret

Mansion1Script_Switches: ; 44316 (11:4316)
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

Mansion1ScriptPointers: ; 44326 (11:4326)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion1TextPointers: ; 4432c (11:432c)
	dw Mansion1Text1
	dw PickUpItemText
	dw PickUpItemText
	dw Mansion1Text4

Mansion1TrainerHeaders: ; 44334 (11:4334)
Mansion1TrainerHeader0: ; 44334 (11:4334)
	dbEventFlagBit EVENT_BEAT_MANSION_1_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_1_TRAINER_0
	dw Mansion1BattleText2 ; TextBeforeBattle
	dw Mansion1AfterBattleText2 ; TextAfterBattle
	dw Mansion1EndBattleText2 ; TextEndBattle
	dw Mansion1EndBattleText2 ; TextEndBattle

	db $ff

Mansion1Text1: ; 44341 (11:4341)
	TX_ASM
	ld hl, Mansion1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion1BattleText2: ; 4434b (11:434b)
	TX_FAR _Mansion1BattleText2
	db "@"

Mansion1EndBattleText2: ; 44350 (11:4350)
	TX_FAR _Mansion1EndBattleText2
	db "@"

Mansion1AfterBattleText2: ; 44355 (11:4355)
	TX_FAR _Mansion1AfterBattleText2
	db "@"

Mansion1Text4: ; 4435a (11:435a)
	TX_ASM
	ld hl, MansionSwitchText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_4438c
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wd126
	set 5, [hl]
	ld hl, MansionSwitchPressedText
	call PrintText
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckAndSetEvent EVENT_MANSION_SWITCH_ON
	jr z, .asm_44392
	ResetEventReuseHL EVENT_MANSION_SWITCH_ON
	jr .asm_44392
.asm_4438c
	ld hl, MansionSwitchNotPressedText
	call PrintText
.asm_44392
	jp TextScriptEnd

MansionSwitchText: ; 44395 (11:4395)
	TX_FAR _MansionSwitchText
	db "@"

MansionSwitchPressedText: ; 4439a (11:439a)
	TX_FAR _MansionSwitchPressedText
	db "@"

MansionSwitchNotPressedText: ; 4439f (11:439f)
	TX_FAR _MansionSwitchNotPressedText
	db "@"
