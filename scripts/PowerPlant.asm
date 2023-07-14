PowerPlant_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PowerPlantTrainerHeaders
	ld de, PowerPlant_ScriptPointers
	ld a, [wPowerPlantCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPowerPlantCurScript], a
	ret

PowerPlant_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POWERPLANT_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POWERPLANT_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POWERPLANT_END_BATTLE

PowerPlant_TextPointers:
	def_text_pointers
	dw_const PowerPlantVoltorb1Text,   TEXT_POWERPLANT_VOLTORB1
	dw_const PowerPlantVoltorb2Text,   TEXT_POWERPLANT_VOLTORB2
	dw_const PowerPlantVoltorb3Text,   TEXT_POWERPLANT_VOLTORB3
	dw_const PowerPlantElectrode1Text, TEXT_POWERPLANT_ELECTRODE1
	dw_const PowerPlantVoltorb4Text,   TEXT_POWERPLANT_VOLTORB4
	dw_const PowerPlantVoltorb5Text,   TEXT_POWERPLANT_VOLTORB5
	dw_const PowerPlantElectrode2Text, TEXT_POWERPLANT_ELECTRODE2
	dw_const PowerPlantVoltorb6Text,   TEXT_POWERPLANT_VOLTORB6
	dw_const PowerPlantZapdosText,     TEXT_POWERPLANT_ZAPDOS
	dw_const PickUpItemText,           TEXT_POWERPLANT_CARBOS
	dw_const PickUpItemText,           TEXT_POWERPLANT_HP_UP
	dw_const PickUpItemText,           TEXT_POWERPLANT_RARE_CANDY
	dw_const PickUpItemText,           TEXT_POWERPLANT_TM_THUNDER
	dw_const PickUpItemText,           TEXT_POWERPLANT_TM_REFLECT

PowerPlantTrainerHeaders:
	def_trainers
Voltorb0TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_0, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb1TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_1, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb2TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_2, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb3TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_3, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb4TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_4, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb5TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_5, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb6TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_6, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
Voltorb7TrainerHeader:
	trainer EVENT_BEAT_POWER_PLANT_VOLTORB_7, 0, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText, PowerPlantVoltorbBattleText
ZapdosTrainerHeader:
	trainer EVENT_BEAT_ZAPDOS, 0, PowerPlantZapdosBattleText, PowerPlantZapdosBattleText, PowerPlantZapdosBattleText
	db -1 ; end

PowerPlantInitBattleScript:
	call TalkToTrainer
	ld a, [wCurMapScript]
	ld [wPowerPlantCurScript], a
	jp TextScriptEnd

PowerPlantVoltorb1Text:
	text_asm
	ld hl, Voltorb0TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb2Text:
	text_asm
	ld hl, Voltorb1TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb3Text:
	text_asm
	ld hl, Voltorb2TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantElectrode1Text:
	text_asm
	ld hl, Voltorb3TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb4Text:
	text_asm
	ld hl, Voltorb4TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb5Text:
	text_asm
	ld hl, Voltorb5TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantElectrode2Text:
	text_asm
	ld hl, Voltorb6TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorb6Text:
	text_asm
	ld hl, Voltorb7TrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantZapdosText:
	text_asm
	ld hl, ZapdosTrainerHeader
	jr PowerPlantInitBattleScript

PowerPlantVoltorbBattleText:
	text_far _PowerPlantVoltorbBattleText
	text_end

PowerPlantZapdosBattleText:
	text_far _PowerPlantZapdosBattleText
	text_asm
	ld a, ZAPDOS
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
