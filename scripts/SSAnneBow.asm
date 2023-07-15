SSAnneBow_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne5TrainerHeaders
	ld de, SSAnneBow_ScriptPointers
	ld a, [wSSAnneBowCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnneBowCurScript], a
	ret

SSAnneBow_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNEBOW_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNEBOW_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNEBOW_END_BATTLE

SSAnneBow_TextPointers:
	def_text_pointers
	dw_const SSAnneBowSuperNerdText,    TEXT_SSANNEBOW_SUPER_NERD
	dw_const SSAnneBowSailor1Text,      TEXT_SSANNEBOW_SAILOR1
	dw_const SSAnneBowCooltrainerMText, TEXT_SSANNEBOW_COOLTRAINER_M
	dw_const SSAnneBowSailor2Text,      TEXT_SSANNEBOW_SAILOR2
	dw_const SSAnneBowSailor3Text,      TEXT_SSANNEBOW_SAILOR3

SSAnne5TrainerHeaders:
	def_trainers 4
SSAnne5TrainerHeader0:
	trainer EVENT_BEAT_SS_ANNE_5_TRAINER_0, 3, SSAnneBowSailor2BattleText, SSAnneBowSailor2EndBattleText, SSAnneBowSailor2AfterBattleText
SSAnne5TrainerHeader1:
	trainer EVENT_BEAT_SS_ANNE_5_TRAINER_1, 3, SSAnneBowSailor3BattleText, SSAnneBowSailor3EndBattleText, SSAnneBowSailor3AfterBattleText
	db -1 ; end

SSAnneBowSuperNerdText:
	text_far _SSAnneBowSuperNerdText
	text_end

SSAnneBowSailor1Text:
	text_far _SSAnneBowSailor1Text
	text_end

SSAnneBowCooltrainerMText:
	text_far _SSAnneBowCooltrainerMText
	text_end

SSAnneBowSailor2Text:
	text_asm
	ld hl, SSAnne5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnneBowSailor2BattleText:
	text_far _SSAnneBowSailor2BattleText
	text_end

SSAnneBowSailor2EndBattleText:
	text_far _SSAnneBowSailor2EndBattleText
	text_end

SSAnneBowSailor2AfterBattleText:
	text_far _SSAnneBowSailor2AfterBattleText
	text_end

SSAnneBowSailor3Text:
	text_asm
	ld hl, SSAnne5TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnneBowSailor3BattleText:
	text_far _SSAnneBowSailor3BattleText
	text_end

SSAnneBowSailor3EndBattleText:
	text_far _SSAnneBowSailor3EndBattleText
	text_end

SSAnneBowSailor3AfterBattleText:
	text_far _SSAnneBowSailor3AfterBattleText
	text_end
