Mansion2Script: ; 51fd8 (14:5fd8)
	call Mansion2Script_51fee
	call EnableAutoTextBoxDrawing
	ld hl, Mansion2TrainerHeaders
	ld de, Mansion2ScriptPointers
	ld a, [wMansion2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wMansion2CurScript], a
	ret

Mansion2Script_51fee: ; 51fee (14:5fee)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .asm_52016
	ld a, $e
	lb bc, 2, 4
	call Mansion2Script_5202f
	ld a, $54
	lb bc, 4, 9
	call Mansion2Script_5202f
	ld a, $5f
	lb bc, 11, 3
	call Mansion2Script_5202f
	ret
.asm_52016
	ld a, $5f
	lb bc, 2, 4
	call Mansion2Script_5202f
	ld a, $e
	lb bc, 4, 9
	call Mansion2Script_5202f
	ld a, $e
	lb bc, 11, 3
	call Mansion2Script_5202f
	ret

Mansion2Script_5202f: ; 5202f (14:602f)
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

Mansion2Script_Switches: ; 52037 (14:6037)
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

Mansion2ScriptPointers: ; 52047 (14:6047)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion2TextPointers: ; 5204d (14:604d)
	dw Mansion2Text1
	dw PickUpItemText
	dw Mansion2Text3
	dw Mansion2Text4
	dw Mansion2Text5

Mansion2TrainerHeaders: ; 52057 (14:6057)
Mansion2TrainerHeader0: ; 52057 (14:6057)
	dbEventFlagBit EVENT_BEAT_MANSION_2_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_2_TRAINER_0
	dw Mansion2BattleText1 ; TextBeforeBattle
	dw Mansion2AfterBattleText1 ; TextAfterBattle
	dw Mansion2EndBattleText1 ; TextEndBattle
	dw Mansion2EndBattleText1 ; TextEndBattle

	db $ff

Mansion2Text1: ; 52064 (14:6064)
	TX_ASM
	ld hl, Mansion2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion2BattleText1: ; 5206e (14:606e)
	TX_FAR _Mansion2BattleText1
	db "@"

Mansion2EndBattleText1: ; 52073 (14:6073)
	TX_FAR _Mansion2EndBattleText1
	db "@"

Mansion2AfterBattleText1: ; 52078 (14:6078)
	TX_FAR _Mansion2AfterBattleText1
	db "@"

Mansion2Text3: ; 5207d (14:607d)
	TX_FAR _Mansion2Text3
	db "@"

Mansion2Text4: ; 52082 (14:6082)
	TX_FAR _Mansion2Text4
	db "@"

Mansion3Text6: ; 52087 (14:6087)
Mansion2Text5: ; 52087 (14:6087)
	TX_ASM
	ld hl, Mansion2Text_520c2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_520b9
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wd126
	set 5, [hl]
	ld hl, Mansion2Text_520c7
	call PrintText
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckAndSetEvent EVENT_MANSION_SWITCH_ON
	jr z, .asm_520bf
	ResetEventReuseHL EVENT_MANSION_SWITCH_ON
	jr .asm_520bf
.asm_520b9
	ld hl, Mansion2Text_520cc
	call PrintText
.asm_520bf
	jp TextScriptEnd

Mansion2Text_520c2: ; 520c2 (14:60c2)
	TX_FAR _Mansion2Text_520c2
	db "@"

Mansion2Text_520c7: ; 520c7 (14:60c7)
	TX_FAR _Mansion2Text_520c7
	db "@"

Mansion2Text_520cc: ; 520cc (14:60cc)
	TX_FAR _Mansion2Text_520cc
	db "@"
