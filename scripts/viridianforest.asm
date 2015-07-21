ViridianForestScript: ; 6110d (18:510d)
	call EnableAutoTextBoxDrawing
	ld hl, ViridianForestTrainerHeaders
	ld de, ViridianForestScriptPointers
	ld a, [W_VIRIDIANFORESTCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VIRIDIANFORESTCURSCRIPT], a
	ret

ViridianForestScriptPointers: ; 61120 (18:5120)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

ViridianForestTextPointers: ; 61126 (18:5126)
	dw ViridianForestText1
	dw ViridianForestText2
	dw ViridianForestText3
	dw ViridianForestText4
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw ViridianForestText8
	dw ViridianForestText9
	dw ViridianForestText10
	dw ViridianForestText11
	dw ViridianForestText12
	dw ViridianForestText13
	dw ViridianForestText14

ViridianForestTrainerHeaders: ; 61142 (18:5142)
ViridianForestTrainerHeader0: ; 61142 (18:5142)
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	dw ViridianForestBattleText1 ; TextBeforeBattle
	dw ViridianForestAfterBattleText1 ; TextAfterBattle
	dw ViridianForestEndBattleText1 ; TextEndBattle
	dw ViridianForestEndBattleText1 ; TextEndBattle

ViridianForestTrainerHeader1: ; 6114e (18:514e)
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	dw ViridianForestBattleText2 ; TextBeforeBattle
	dw ViridianForestAfterBattleText2 ; TextAfterBattle
	dw ViridianForestEndBattleText2 ; TextEndBattle
	dw ViridianForestEndBattleText2 ; TextEndBattle

ViridianForestTrainerHeader2: ; 6115a (18:515a)
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	dw ViridianForestBattleText3 ; TextBeforeBattle
	dw ViridianForestAfterBattleText3 ; TextAfterBattle
	dw ViridianForestEndBattleText3 ; TextEndBattle
	dw ViridianForestEndBattleText3 ; TextEndBattle

	db $ff

ViridianForestText1: ; 61167 (18:5167)
	TX_FAR _ViridianForestText1
	db "@"

ViridianForestText2: ; 6116c (18:516c)
	TX_ASM
	ld hl, ViridianForestTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestText3: ; 61176 (18:5176)
	TX_ASM
	ld hl, ViridianForestTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestText4: ; 61180 (18:5180)
	TX_ASM
	ld hl, ViridianForestTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestBattleText1: ; 6118a (18:518a)
	TX_FAR _ViridianForestBattleText1
	db "@"

ViridianForestEndBattleText1: ; 6118f (18:518f)
	TX_FAR _ViridianForestEndBattleText1
	db "@"

ViridianForestAfterBattleText1: ; 61194 (18:5194)
	TX_FAR _ViridianFrstAfterBattleText1
	db "@"

ViridianForestBattleText2: ; 61199 (18:5199)
	TX_FAR _ViridianForestBattleText2
	db "@"

ViridianForestEndBattleText2: ; 6119e (18:519e)
	TX_FAR _ViridianForestEndBattleText2
	db "@"

ViridianForestAfterBattleText2: ; 611a3 (18:51a3)
	TX_FAR _ViridianFrstAfterBattleText2
	db "@"

ViridianForestBattleText3: ; 611a8 (18:51a8)
	TX_FAR _ViridianForestBattleText3
	db "@"

ViridianForestEndBattleText3: ; 611ad (18:51ad)
	TX_FAR _ViridianForestEndBattleText3
	db "@"

ViridianForestAfterBattleText3: ; 611b2 (18:51b2)
	TX_FAR _ViridianFrstAfterBattleText3
	db "@"

ViridianForestText8: ; 611b7 (18:51b7)
	TX_FAR _ViridianForestText8
	db "@"

ViridianForestText9: ; 611bc (18:51bc)
	TX_FAR _ViridianForestText9
	db "@"

ViridianForestText10: ; 611c1 (18:51c1)
	TX_FAR _ViridianForestText10
	db "@"

ViridianForestText11: ; 611c6 (18:51c6)
	TX_FAR _ViridianForestText11
	db "@"

ViridianForestText12: ; 611cb (18:51cb)
	TX_FAR _ViridianForestText12
	db "@"

ViridianForestText13: ; 611d0 (18:51d0)
	TX_FAR _ViridianForestText13
	db "@"

ViridianForestText14: ; 611d5 (18:51d5)
	TX_FAR _ViridianForestText14
	db "@"
