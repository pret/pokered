Route24_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route24TrainerHeader0
	ld de, Route24_ScriptPointers
	ld a, [wRoute24CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute24CurScript], a
	ret

Route24Script_513c0:
	xor a
	ld [wJoyIgnore], a
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_ScriptPointers:
	dw Route24Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route24Script3
	dw Route24Script4

Route24Script0:
	CheckEvent EVENT_GOT_NUGGET
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_5140e
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [hJoyHeld], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	CheckAndResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	ret z
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $4
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

CoordsData_5140e:
	db $0F,$0A,$FF

Route24Script4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $0
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route24Script_513c0
	call UpdateSprites
	ld a, $f0
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE24_ROCKET
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_TextPointers:
	dw Route24Text1
	dw Route24Text2
	dw Route24Text3
	dw Route24Text4
	dw Route24Text5
	dw Route24Text6
	dw Route24Text7
	dw PickUpItemText

Route24TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_0
	dw Route24BattleText1 ; TextBeforeBattle
	dw Route24AfterBattleText1 ; TextAfterBattle
	dw Route24EndBattleText1 ; TextEndBattle
	dw Route24EndBattleText1 ; TextEndBattle

Route24TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_1
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_1
	dw Route24BattleText2 ; TextBeforeBattle
	dw Route24AfterBattleText2 ; TextAfterBattle
	dw Route24EndBattleText2 ; TextEndBattle
	dw Route24EndBattleText2 ; TextEndBattle

Route24TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_2
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_2
	dw Route24BattleText3 ; TextBeforeBattle
	dw Route24AfterBattleText3 ; TextAfterBattle
	dw Route24EndBattleText3 ; TextEndBattle
	dw Route24EndBattleText3 ; TextEndBattle

Route24TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_3
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_3
	dw Route24BattleText4 ; TextBeforeBattle
	dw Route24AfterBattleText4 ; TextAfterBattle
	dw Route24EndBattleText4 ; TextEndBattle
	dw Route24EndBattleText4 ; TextEndBattle

Route24TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_4
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_4
	dw Route24BattleText5 ; TextBeforeBattle
	dw Route24AfterBattleText5 ; TextAfterBattle
	dw Route24EndBattleText5 ; TextEndBattle
	dw Route24EndBattleText5 ; TextEndBattle

Route24TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_5
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_5
	dw Route24BattleText6 ; TextBeforeBattle
	dw Route24AfterBattleText6 ; TextAfterBattle
	dw Route24EndBattleText6 ; TextEndBattle
	dw Route24EndBattleText6 ; TextEndBattle

	db $ff

Route24Text1:
	text_asm
	ResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	CheckEvent EVENT_GOT_NUGGET
	jr nz, .asm_514f9
	ld hl, Route24Text_51510
	call PrintText
	lb bc, NUGGET, 1
	call GiveItem
	jr nc, .BagFull
	SetEvent EVENT_GOT_NUGGET
	ld hl, Route24Text_5151a
	call PrintText
	ld hl, Route24Text_51526
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, Route24Text_5152b
	ld de, Route24Text_5152b
	call SaveEndBattleTextPointers
	ld a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ld [hJoyHeld], a
	ld a, $3
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd
.asm_514f9
	ld hl, Route24Text_51530
	call PrintText
	jp TextScriptEnd
.BagFull
	ld hl, Route24Text_51521
	call PrintText
	SetEvent EVENT_NUGGET_REWARD_AVAILABLE
	jp TextScriptEnd

Route24Text_51510:
	text_far _Route24Text_51510
	sound_get_item_1
	text_far _Route24Text_51515
	text_end

Route24Text_5151a:
	text_far _Route24Text_5151a
	sound_get_item_1
	text_promptbutton
	text_end

Route24Text_51521:
	text_far _Route24Text_51521
	text_end

Route24Text_51526:
	text_far _Route24Text_51526
	text_end

Route24Text_5152b:
	text_far _Route24Text_5152b
	text_end

Route24Text_51530:
	text_far _Route24Text_51530
	text_end

Route24Text2:
	text_asm
	ld hl, Route24TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route24Text3:
	text_asm
	ld hl, Route24TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route24Text4:
	text_asm
	ld hl, Route24TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route24Text5:
	text_asm
	ld hl, Route24TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route24Text6:
	text_asm
	ld hl, Route24TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route24Text7:
	text_asm
	ld hl, Route24TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route24BattleText1:
	text_far _Route24BattleText1
	text_end

Route24EndBattleText1:
	text_far _Route24EndBattleText1
	text_end

Route24AfterBattleText1:
	text_far _Route24AfterBattleText1
	text_end

Route24BattleText2:
	text_far _Route24BattleText2
	text_end

Route24EndBattleText2:
	text_far _Route24EndBattleText2
	text_end

Route24AfterBattleText2:
	text_far _Route24AfterBattleText2
	text_end

Route24BattleText3:
	text_far _Route24BattleText3
	text_end

Route24EndBattleText3:
	text_far _Route24EndBattleText3
	text_end

Route24AfterBattleText3:
	text_far _Route24AfterBattleText3
	text_end

Route24BattleText4:
	text_far _Route24BattleText4
	text_end

Route24EndBattleText4:
	text_far _Route24EndBattleText4
	text_end

Route24AfterBattleText4:
	text_far _Route24AfterBattleText4
	text_end

Route24BattleText5:
	text_far _Route24BattleText5
	text_end

Route24EndBattleText5:
	text_far _Route24EndBattleText5
	text_end

Route24AfterBattleText5:
	text_far _Route24AfterBattleText5
	text_end

Route24BattleText6:
	text_far _Route24BattleText6
	text_end

Route24EndBattleText6:
	text_far _Route24EndBattleText6
	text_end

Route24AfterBattleText6:
	text_far _Route24AfterBattleText6
	text_end
