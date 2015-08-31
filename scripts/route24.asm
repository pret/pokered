Route24Script: ; 513ad (14:53ad)
	call EnableAutoTextBoxDrawing
	ld hl, Route24TrainerHeaders
	ld de, Route24ScriptPointers
	ld a, [wRoute24CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute24CurScript], a
	ret

Route24Script_513c0: ; 513c0 (14:53c0)
	xor a
	ld [wJoyIgnore], a
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24ScriptPointers: ; 513cb (14:53cb)
	dw Route24Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route24Script3
	dw Route24Script4

Route24Script0: ; 513d5 (14:53d5)
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

CoordsData_5140e: ; 5140e (14:540e)
	db $0F,$0A,$FF

Route24Script4: ; 51411 (14:5411)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $0
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24Script3: ; 51422 (14:5422)
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

Route24TextPointers: ; 5144b (14:544b)
	dw Route24Text1
	dw Route24Text2
	dw Route24Text3
	dw Route24Text4
	dw Route24Text5
	dw Route24Text6
	dw Route24Text7
	dw PickUpItemText

Route24TrainerHeaders: ; 5145b (14:545b)
Route24TrainerHeader0: ; 5145b (14:545b)
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_0
	dw Route24BattleText1 ; TextBeforeBattle
	dw Route24AfterBattleText1 ; TextAfterBattle
	dw Route24EndBattleText1 ; TextEndBattle
	dw Route24EndBattleText1 ; TextEndBattle

Route24TrainerHeader2: ; 51467 (14:5467)
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_2
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_2
	dw Route24BattleText2 ; TextBeforeBattle
	dw Route24AfterBattleText2 ; TextAfterBattle
	dw Route24EndBattleText2 ; TextEndBattle
	dw Route24EndBattleText2 ; TextEndBattle

Route24TrainerHeader3: ; 51473 (14:5473)
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_3
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_3
	dw Route24BattleText3 ; TextBeforeBattle
	dw Route24AfterBattleText3 ; TextAfterBattle
	dw Route24EndBattleText3 ; TextEndBattle
	dw Route24EndBattleText3 ; TextEndBattle

Route24TrainerHeader4: ; 5147f (14:547f)
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_4
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_4
	dw Route24BattleText4 ; TextBeforeBattle
	dw Route24AfterBattleText4 ; TextAfterBattle
	dw Route24EndBattleText4 ; TextEndBattle
	dw Route24EndBattleText4 ; TextEndBattle

Route24TrainerHeader5: ; 5148b (14:548b)
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_5
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_5
	dw Route24BattleText5 ; TextBeforeBattle
	dw Route24AfterBattleText5 ; TextAfterBattle
	dw Route24EndBattleText5 ; TextEndBattle
	dw Route24EndBattleText5 ; TextEndBattle

Route24TrainerHeader6: ; 51497 (14:5497)
	dbEventFlagBit EVENT_BEAT_ROUTE_24_TRAINER_6
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_24_TRAINER_6
	dw Route24BattleText6 ; TextBeforeBattle
	dw Route24AfterBattleText6 ; TextAfterBattle
	dw Route24EndBattleText6 ; TextEndBattle
	dw Route24EndBattleText6 ; TextEndBattle

	db $ff

Route24Text1: ; 514a4 (14:54a4)
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

Route24Text_51510: ; 51510 (14:5510)
	TX_FAR _Route24Text_51510
	db $0B
	TX_FAR _Route24Text_51515
	db "@"

Route24Text_5151a: ; 5151a (14:551a)
	TX_FAR _Route24Text_5151a
	db $0B, $6, "@"

Route24Text_51521: ; 51521 (14:5521)
	TX_FAR _Route24Text_51521
	db "@"

Route24Text_51526: ; 51526 (14:5526)
	TX_FAR _Route24Text_51526
	db "@"

Route24Text_5152b: ; 5152b (14:552b)
	TX_FAR _Route24Text_5152b
	db "@"

Route24Text_51530: ; 51530 (14:5530)
	TX_FAR _Route24Text_51530
	db "@"

Route24Text2: ; 51535 (14:5535)
	TX_ASM
	ld hl, Route24TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route24Text3: ; 5153f (14:553f)
	TX_ASM
	ld hl, Route24TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route24Text4: ; 51549 (14:5549)
	TX_ASM
	ld hl, Route24TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route24Text5: ; 51553 (14:5553)
	TX_ASM
	ld hl, Route24TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route24Text6: ; 5155d (14:555d)
	TX_ASM
	ld hl, Route24TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route24Text7: ; 51567 (14:5567)
	TX_ASM
	ld hl, Route24TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route24BattleText1: ; 51571 (14:5571)
	TX_FAR _Route24BattleText1
	db "@"

Route24EndBattleText1: ; 51576 (14:5576)
	TX_FAR _Route24EndBattleText1
	db "@"

Route24AfterBattleText1: ; 5157b (14:557b)
	TX_FAR _Route24AfterBattleText1
	db "@"

Route24BattleText2: ; 51580 (14:5580)
	TX_FAR _Route24BattleText2
	db "@"

Route24EndBattleText2: ; 51585 (14:5585)
	TX_FAR _Route24EndBattleText2
	db "@"

Route24AfterBattleText2: ; 5158a (14:558a)
	TX_FAR _Route24AfterBattleText2
	db "@"

Route24BattleText3: ; 5158f (14:558f)
	TX_FAR _Route24BattleText3
	db "@"

Route24EndBattleText3: ; 51594 (14:5594)
	TX_FAR _Route24EndBattleText3
	db "@"

Route24AfterBattleText3: ; 51599 (14:5599)
	TX_FAR _Route24AfterBattleText3
	db "@"

Route24BattleText4: ; 5159e (14:559e)
	TX_FAR _Route24BattleText4
	db "@"

Route24EndBattleText4: ; 515a3 (14:55a3)
	TX_FAR _Route24EndBattleText4
	db "@"

Route24AfterBattleText4: ; 515a8 (14:55a8)
	TX_FAR _Route24AfterBattleText4
	db "@"

Route24BattleText5: ; 515ad (14:55ad)
	TX_FAR _Route24BattleText5
	db "@"

Route24EndBattleText5: ; 515b2 (14:55b2)
	TX_FAR _Route24EndBattleText5
	db "@"

Route24AfterBattleText5: ; 515b7 (14:55b7)
	TX_FAR _Route24AfterBattleText5
	db "@"

Route24BattleText6: ; 515bc (14:55bc)
	TX_FAR _Route24BattleText6
	db "@"

Route24EndBattleText6: ; 515c1 (14:55c1)
	TX_FAR _Route24EndBattleText6
	db "@"

Route24AfterBattleText6: ; 515c6 (14:55c6)
	TX_FAR _Route24AfterBattleText6
	db "@"
