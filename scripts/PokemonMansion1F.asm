PokemonMansion1F_Script:
	call Mansion1Subscript1
	call EnableAutoTextBoxDrawing
	ld hl, Mansion1TrainerHeader0
	ld de, PokemonMansion1F_ScriptPointers
	ld a, [wPokemonMansion1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansion1FCurScript], a
	ret

Mansion1Subscript1:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .asm_442ec
	lb bc, 6, 12
	call Mansion1Script_4430b
	lb bc, 3, 8
	call Mansion1Script_44304
	lb bc, 8, 10
	call Mansion1Script_44304
	lb bc, 13, 13
	jp Mansion1Script_44304
.asm_442ec
	lb bc, 6, 12
	call Mansion1Script_44304
	lb bc, 3, 8
	call Mansion1Script_4430b
	lb bc, 8, 10
	call Mansion1Script_4430b
	lb bc, 13, 13
	jp Mansion1Script_4430b

Mansion1Script_44304:
	ld a, $2d
	ld [wNewTileBlockID], a
	jr Mansion1ReplaceBlock

Mansion1Script_4430b:
	ld a, $e
	ld [wNewTileBlockID], a
Mansion1ReplaceBlock:
	predef ReplaceTileBlock
	ret

Mansion1Script_Switches:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

PokemonMansion1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonMansion1F_TextPointers:
	dw Mansion1Text1
	dw PickUpItemText
	dw PickUpItemText
	dw Mansion1Text4

Mansion1TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_MANSION_1_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_1_TRAINER_0
	dw Mansion1BattleText2 ; TextBeforeBattle
	dw Mansion1AfterBattleText2 ; TextAfterBattle
	dw Mansion1EndBattleText2 ; TextEndBattle
	dw Mansion1EndBattleText2 ; TextEndBattle

	db $ff

Mansion1Text1:
	TX_ASM
	ld hl, Mansion1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion1BattleText2:
	TX_FAR _Mansion1BattleText2
	db "@"

Mansion1EndBattleText2:
	TX_FAR _Mansion1EndBattleText2
	db "@"

Mansion1AfterBattleText2:
	TX_FAR _Mansion1AfterBattleText2
	db "@"

Mansion1Text4:
	TX_ASM
	ld hl, MansionSwitchText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_4438c
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wCurrentMapScriptFlags
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

MansionSwitchText:
	TX_FAR _MansionSwitchText
	db "@"

MansionSwitchPressedText:
	TX_FAR _MansionSwitchPressedText
	db "@"

MansionSwitchNotPressedText:
	TX_FAR _MansionSwitchNotPressedText
	db "@"
