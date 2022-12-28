RocketHideoutB4F_Script:
	call RocketHideout4Script_45473
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout4TrainerHeaders
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
	ldh [hSpriteIndexOrTextID], a
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

RocketHideout4TrainerHeaders:
	def_trainers 2
RocketHideout4TrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0, 0, RocketHideout4BattleText2, RocketHideout4EndBattleText2, RocketHideout4AfterBattleText2
RocketHideout4TrainerHeader1:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1, 0, RocketHideout4BattleText3, RocketHideout4EndBattleText3, RocketHideout4AfterBattleText3
RocketHideout4TrainerHeader2:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2, 1, RocketHideout4BattleText4, RocketHideout4EndBattleText4, RocketHideout4AfterBattleText4
	db -1 ; end

RocketHideout4Text1:
	text_asm
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
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
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
	text_far _RocketHideout4Text_4557a
	text_end

RocketHideout4Text_4557f:
	text_far _RocketHideout4Text_4557f
	text_end

RocketHideout4Text10:
	text_far _RocketHideout4Text_45584
	text_end

RocketHideout4Text2:
	text_asm
	ld hl, RocketHideout4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText2:
	text_far _RocketHideout4BattleText2
	text_end

RocketHideout4EndBattleText2:
	text_far _RocketHideout4EndBattleText2
	text_end

RocketHideout4AfterBattleText2:
	text_far _RocketHide4AfterBattleText2
	text_end

RocketHideout4Text3:
	text_asm
	ld hl, RocketHideout4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText3:
	text_far _RocketHideout4BattleText3
	text_end

RocketHideout4EndBattleText3:
	text_far _RocketHideout4EndBattleText3
	text_end

RocketHideout4AfterBattleText3:
	text_far _RocketHide4AfterBattleText3
	text_end

RocketHideout4Text4:
	text_asm
	ld hl, RocketHideout4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4BattleText4:
	text_far _RocketHideout4BattleText4
	text_end

RocketHideout4EndBattleText4:
	text_far _RocketHideout4EndBattleText4
	text_end

RocketHideout4AfterBattleText4:
	text_asm
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
	text_far _RocketHideout4Text_455ec
	text_end
