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
	ld a, [wd796]
	bit 0, a
	jr nz, .asm_442ec ; 0x442d2 $18
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
	jr asm_44310

Mansion1Script_4430b: ; 4430b (11:430b)
	ld a, $e
	ld [wd09f], a
asm_44310: ; 44310 (11:4310)
	predef ReplaceTileBlock
	ret

Mansion1Script_Switches: ; 44316 (11:4316)
	ld a, [wSpriteStateData1 + 9]
	cp $4
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $4
	ld [H_SPRITEHEIGHT], a
	jp DisplayTextID

Mansion1ScriptPointers: ; 44326 (11:4326)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion1TextPointers: ; 4432c (11:432c)
	dw Mansion1Text1
	dw Predef5CText
	dw Predef5CText
	dw Mansion1Text4

Mansion1TrainerHeaders: ; 44334 (11:4334)
Mansion1TrainerHeader0: ; 44334 (11:4334)
	db $1 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd798 ; flag's byte
	dw Mansion1BattleText2 ; 0x434b TextBeforeBattle
	dw Mansion1AfterBattleText2 ; 0x4355 TextAfterBattle
	dw Mansion1EndBattleText2 ; 0x4350 TextEndBattle
	dw Mansion1EndBattleText2 ; 0x4350 TextEndBattle

	db $ff

Mansion1Text1: ; 44341 (11:4341)
	db $08 ; asm
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
	db $8
	ld hl, MansionSwitchText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_4438c ; 0x44368 $22
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wd126
	set 5, [hl]
	ld hl, MansionSwitchPressedText
	call PrintText
	ld a, (SFX_02_57 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wd796
	bit 0, [hl]
	set 0, [hl]
	jr z, .asm_44392 ; 0x44386 $a
	res 0, [hl]
	jr .asm_44392 ; 0x4438a $6
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
