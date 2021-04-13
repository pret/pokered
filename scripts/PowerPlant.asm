PowerPlant_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PowerPlantTrainerHeaders
	ld de, PowerPlant_ScriptPointers
	ld a, [wPowerPlantCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPowerPlantCurScript], a
	ret

PowerPlant_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PowerPlant_TextPointers:
	dw Voltorb0Text
	dw Voltorb1Text
	dw Voltorb2Text
	dw Voltorb3Text
	dw Voltorb4Text
	dw Voltorb5Text
	dw Voltorb6Text
	dw Voltorb7Text
	dw ZapdosText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

PowerPlantTrainerHeaders:
	def_trainers
Voltorb0TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_0, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb1TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_1, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb2TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_2, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb3TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_3, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb4TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_4, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb5TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_5, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb6TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_6, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
Voltorb7TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_7, 0, VoltorbBattleText, VoltorbBattleText, VoltorbBattleText
ZapdosTrainerHeader:
	trainer EVENT_BEAT_ZAPDOS, 0, ZapdosBattleText, ZapdosBattleText, ZapdosBattleText
	db -1 ; end

InitVoltorbBattle:
	call TalkToTrainer
	ld a, [wCurMapScript]
	ld [wPowerPlantCurScript], a
	jp TextScriptEnd

Voltorb0Text:
	text_asm
	ld hl, Voltorb0TrainerHeader
	jr InitVoltorbBattle

Voltorb1Text:
	text_asm
	ld hl, Voltorb1TrainerHeader
	jr InitVoltorbBattle

Voltorb2Text:
	text_asm
	ld hl, Voltorb2TrainerHeader
	jr InitVoltorbBattle

Voltorb3Text:
	text_asm
	ld hl, Voltorb3TrainerHeader
	jr InitVoltorbBattle

Voltorb4Text:
	text_asm
	ld hl, Voltorb4TrainerHeader
	jr InitVoltorbBattle

Voltorb5Text:
	text_asm
	ld hl, Voltorb5TrainerHeader
	jr InitVoltorbBattle

Voltorb6Text:
	text_asm
	ld hl, Voltorb6TrainerHeader
	jr InitVoltorbBattle

Voltorb7Text:
	text_asm
	ld hl, Voltorb7TrainerHeader
	jr InitVoltorbBattle

ZapdosText:
	text_asm
	ld hl, ZapdosTrainerHeader
	jr InitVoltorbBattle

VoltorbBattleText:
	text_far _VoltorbBattleText
	text_end

ZapdosBattleText:
	text_far _ZapdosBattleText
	text_asm
	ld a, ZAPDOS
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
