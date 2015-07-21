PowerPlantScript: ; 1e2c6 (7:62c6)
	call EnableAutoTextBoxDrawing
	ld hl, PowerPlantTrainerHeaders
	ld de, PowerPlantScriptPointers
	ld a, [W_POWERPLANTCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_POWERPLANTCURSCRIPT], a
	ret

PowerPlantScriptPointers: ; 1e2d9 (7:62d9)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PowerPlantTextPointers: ; 1e2df (7:62df)
	dw PowerPlantText1
	dw PowerPlantText2
	dw PowerPlantText3
	dw PowerPlantText4
	dw PowerPlantText5
	dw PowerPlantText6
	dw PowerPlantText7
	dw PowerPlantText8
	dw PowerPlantText9
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

PowerPlantTrainerHeaders: ; 1e2fb (7:62fb)
PowerPlantTrainerHeader0: ; 1e2fb (7:62fb)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_0
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_0
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader1: ; 1e307 (7:6307)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_1
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_1
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader2: ; 1e313 (7:6313)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_2
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_2
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader3: ; 1e31f (7:631f)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_3
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_3
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader4: ; 1e32b (7:632b)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_4
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_4
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader5: ; 1e337 (7:6337)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_5
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_5
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader6: ; 1e343 (7:6343)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_6
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_6
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader7: ; 1e34f (7:634f)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_7, 1
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_7, 1
	dw VoltorbBattleText ; TextBeforeBattle
	dw VoltorbBattleText ; TextAfterBattle
	dw VoltorbBattleText ; TextEndBattle
	dw VoltorbBattleText ; TextEndBattle

PowerPlantTrainerHeader8: ; 1e35b (7:635b)
	dbEventFlagBit EVENT_BEAT_POWER_PLANT_TRAINER_8, 1
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_POWER_PLANT_TRAINER_8, 1
	dw ZapdosBattleText ; TextBeforeBattle
	dw ZapdosBattleText ; TextAfterBattle
	dw ZapdosBattleText ; TextEndBattle
	dw ZapdosBattleText ; TextEndBattle

	db $ff

InitVoltorbBattle: ; 1e368 (7:6368)
	call TalkToTrainer
	ld a, [W_CURMAPSCRIPT]
	ld [W_POWERPLANTCURSCRIPT], a
	jp TextScriptEnd

PowerPlantText1: ; 1e374 (7:6374)
	TX_ASM
	ld hl, PowerPlantTrainerHeader0
	jr InitVoltorbBattle

PowerPlantText2: ; 1e37a (7:637a)
	TX_ASM
	ld hl, PowerPlantTrainerHeader1
	jr InitVoltorbBattle

PowerPlantText3: ; 1e380 (7:6380)
	TX_ASM
	ld hl, PowerPlantTrainerHeader2
	jr InitVoltorbBattle

PowerPlantText4: ; 1e386 (7:6386)
	TX_ASM
	ld hl, PowerPlantTrainerHeader3
	jr InitVoltorbBattle

PowerPlantText5: ; 1e38c (7:638c)
	TX_ASM
	ld hl, PowerPlantTrainerHeader4
	jr InitVoltorbBattle

PowerPlantText6: ; 1e392 (7:6392)
	TX_ASM
	ld hl, PowerPlantTrainerHeader5
	jr InitVoltorbBattle

PowerPlantText7: ; 1e398 (7:6398)
	TX_ASM
	ld hl, PowerPlantTrainerHeader6
	jr InitVoltorbBattle

PowerPlantText8: ; 1e39e (7:639e)
	TX_ASM
	ld hl, PowerPlantTrainerHeader7
	jr InitVoltorbBattle

PowerPlantText9: ; 1e3a4 (7:63a4)
	TX_ASM
	ld hl, PowerPlantTrainerHeader8
	jr InitVoltorbBattle

VoltorbBattleText: ; 1e3aa (7:63aa)
	TX_FAR _VoltorbBattleText
	db "@"

ZapdosBattleText: ; 1e3af (7:63af)
	TX_FAR _ZapdosBattleText
	TX_ASM
	ld a, ZAPDOS
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
