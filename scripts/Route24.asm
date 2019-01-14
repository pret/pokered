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
	TX_ASM
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
	TX_FAR _Route24Text_51510
	TX_SFX_ITEM_1
	TX_FAR _Route24Text_51515
	db "@"

Route24Text_5151a:
	TX_FAR _Route24Text_5151a
	TX_SFX_ITEM_1
	TX_BLINK
	db "@"

Route24Text_51521:
	TX_FAR _Route24Text_51521
	db "@"

Route24Text_51526:
	TX_FAR _Route24Text_51526
	db "@"

Route24Text_5152b:
	TX_FAR _Route24Text_5152b
	db "@"

Route24Text_51530:
	TX_FAR _Route24Text_51530
	db "@"

Route24Text2:
	TX_ASM
	ld hl, Route24TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route24Text3:
	TX_ASM
	ld hl, Route24TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route24Text4:
	TX_ASM
	ld hl, Route24TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route24Text5:
	TX_ASM
	ld hl, Route24TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route24Text6:
	TX_ASM
	ld hl, Route24TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route24Text7:
	TX_ASM
	ld hl, Route24TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route24BattleText1:
	TX_FAR _Route24BattleText1
	db "@"

Route24EndBattleText1:
	TX_FAR _Route24EndBattleText1
	db "@"

Route24AfterBattleText1:
	TX_FAR _Route24AfterBattleText1
	db "@"

Route24BattleText2:
	TX_FAR _Route24BattleText2
	db "@"

Route24EndBattleText2:
	TX_FAR _Route24EndBattleText2
	db "@"

Route24AfterBattleText2:
	TX_FAR _Route24AfterBattleText2
	db "@"

Route24BattleText3:
	TX_FAR _Route24BattleText3
	db "@"

Route24EndBattleText3:
	TX_FAR _Route24EndBattleText3
	db "@"

Route24AfterBattleText3:
	TX_FAR _Route24AfterBattleText3
	db "@"

Route24BattleText4:
	TX_FAR _Route24BattleText4
	db "@"

Route24EndBattleText4:
	TX_FAR _Route24EndBattleText4
	db "@"

Route24AfterBattleText4:
	TX_FAR _Route24AfterBattleText4
	db "@"

Route24BattleText5:
	TX_FAR _Route24BattleText5
	db "@"

Route24EndBattleText5:
	TX_FAR _Route24EndBattleText5
	db "@"

Route24AfterBattleText5:
	TX_FAR _Route24AfterBattleText5
	db "@"

Route24BattleText6:
	TX_FAR _Route24BattleText6
	db "@"

Route24EndBattleText6:
	TX_FAR _Route24EndBattleText6
	db "@"

Route24AfterBattleText6:
	TX_FAR _Route24AfterBattleText6
	db "@"
