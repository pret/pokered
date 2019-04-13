RocketHideoutB4F_Script:
	call RocketHideout4Script_45473
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout4TrainerHeader0
	ld de, RocketHideoutB4F_ScriptPointers
	ld a, [wRocketHideoutB4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB4FCurScript], a
	ret

RocketHideout4Script_45473:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_ROCKET_HIDEOUT_4_DOOR_UNLOCKED
	jr nz, .asm_45496
	CheckBothEventsSet EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0, EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1, 1
	jr z, .asm_4548c
	ld a, $2d
	jr .asm_45498
.asm_4548c
	ld a, SFX_GO_INSIDE
	call PlaySound
	SetEvent EVENT_ROCKET_HIDEOUT_4_DOOR_UNLOCKED
.asm_45496
	ld a, $e
.asm_45498
	ld [wNewTileBlockID], a
	lb bc, 5, 12
	predef_jump ReplaceTileBlock

RocketHideout4Script_454a3:
	xor a
	ld [wJoyIgnore], a
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	ret

RocketHideoutB4F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RocketHideout4Script3

RocketHideout4Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, RocketHideout4Script_454a3
	call UpdateSprites
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	ld a, $a
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, HS_ROCKET_HIDEOUT_B4F_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_ROCKET_HIDEOUT_B4F_ITEM_4
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call GBFadeInFromBlack
	xor a
	ld [wJoyIgnore], a
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld a, $0
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	ret

RocketHideoutB4F_TextPointers:
	dw RocketHideout4Text1
	dw RocketHideout4Text2
	dw RocketHideout4Text3
	dw RocketHideout4Text4
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw RocketHideout4Text10

RocketHideout4TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0
	dw RocketHideout4BattleText2 ; TextBeforeBattle
	dw RocketHideout4AfterBattleText2 ; TextAfterBattle
	dw RocketHideout4EndBattleText2 ; TextEndBattle
	dw RocketHideout4EndBattleText2 ; TextEndBattle

RocketHideout4TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	dw RocketHideout4BattleText3 ; TextBeforeBattle
	dw RocketHideout4AfterBattleText3 ; TextAfterBattle
	dw RocketHideout4EndBattleText3 ; TextEndBattle
	dw RocketHideout4EndBattleText3 ; TextEndBattle

RocketHideout4TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2
	dw RocketHideout4BattleText4 ; TextBeforeBattle
	dw RocketHideout4AfterBattleText4 ; TextAfterBattle
	dw RocketHideout4EndBattleText4 ; TextEndBattle
	dw RocketHideout4EndBattleText4 ; TextEndBattle

	db $ff

RocketHideout4Text1:
	TX_ASM
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jp nz, .asm_545571
	ld hl, RocketHideout4Text_4557a
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, RocketHideout4Text_4557f
	ld de, RocketHideout4Text_4557f
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ld [hJoyHeld], a
	ld a, $3
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	jr .asm_209f0
.asm_545571
	ld hl, RocketHideout4Text10
	call PrintText
.asm_209f0
	jp TextScriptEnd

RocketHideout4Text_4557a:
	TX_FAR _RocketHideout4Text_4557a
	db "@"

RocketHideout4Text_4557f:
	TX_FAR _RocketHideout4Text_4557f
	db "@"

RocketHideout4Text10:
	TX_FAR _RocketHideout4Text_45584
	db "@"

RocketHideout4Text2:
	TX_ASM
	ld hl, RocketHideout4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText2:
	TX_FAR _RocketHideout4BattleText2
	db "@"

RocketHideout4EndBattleText2:
	TX_FAR _RocketHideout4EndBattleText2
	db "@"

RocketHideout4AfterBattleText2:
	TX_FAR _RocketHide4AfterBattleText2
	db "@"

RocketHideout4Text3:
	TX_ASM
	ld hl, RocketHideout4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText3:
	TX_FAR _RocketHideout4BattleText3
	db "@"

RocketHideout4EndBattleText3:
	TX_FAR _RocketHideout4EndBattleText3
	db "@"

RocketHideout4AfterBattleText3:
	TX_FAR _RocketHide4AfterBattleText3
	db "@"

RocketHideout4Text4:
	TX_ASM
	ld hl, RocketHideout4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText4:
	TX_FAR _RocketHideout4BattleText4
	db "@"

RocketHideout4EndBattleText4:
	TX_FAR _RocketHideout4EndBattleText4
	db "@"

RocketHideout4AfterBattleText4:
	TX_ASM
	ld hl, RocketHideout4Text_455ec
	call PrintText
	CheckAndSetEvent EVENT_ROCKET_DROPPED_LIFT_KEY
	jr nz, .asm_455e9
	ld a, HS_ROCKET_HIDEOUT_B4F_ITEM_5
	ld [wMissableObjectIndex], a
	predef ShowObject
.asm_455e9
	jp TextScriptEnd

RocketHideout4Text_455ec:
	TX_FAR _RocketHideout4Text_455ec
	db "@"
