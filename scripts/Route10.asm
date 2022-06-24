Route10_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route10TrainerHeaders
	ld de, Route10_ScriptPointers
	ld a, [wRoute10CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute10CurScript], a
	ret

Route10_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE10_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE10_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE10_END_BATTLE

Route10_TextPointers:
	def_text_pointers
	dw_const Route10SuperNerd1Text,     TEXT_ROUTE10_SUPER_NERD1
	dw_const Route10Hiker1Text,         TEXT_ROUTE10_HIKER1
	dw_const Route10SuperNerd2Text,     TEXT_ROUTE10_SUPER_NERD2
	dw_const Route10CooltrainerF1Text,  TEXT_ROUTE10_COOLTRAINER_F1
	dw_const Route10Hiker2Text,         TEXT_ROUTE10_HIKER2
	dw_const Route10CooltrainerF2Text,  TEXT_ROUTE10_COOLTRAINER_F2
	dw_const Route10RockTunnelSignText, TEXT_ROUTE10_ROCKTUNNEL_NORTH_SIGN
	dw_const PokeCenterSignText,        TEXT_ROUTE10_POKECENTER_SIGN
	dw_const Route10RockTunnelSignText, TEXT_ROUTE10_ROCKTUNNEL_SOUTH_SIGN
	dw_const Route10PowerPlantSignText, TEXT_ROUTE10_POWERPLANT_SIGN

Route10TrainerHeaders:
	def_trainers
Route10TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_0, 4, Route10SuperNerd1BattleText, Route10SuperNerd1EndBattleText, Route10SuperNerd1AfterBattleText
Route10TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_1, 3, Route10Hiker1BattleText, Route10Hiker1EndBattleText, Route10Hiker1AfterBattleText
Route10TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_2, 4, Route10SuperNerd2BattleText, Route10SuperNerd2EndBattleText, Route10SuperNerd2AfterBattleText
Route10TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_3, 3, Route10CooltrainerF1BattleText, Route10CooltrainerF1EndBattleText, Route10CooltrainerF1AfterBattleText
Route10TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_4, 2, Route10Hiker2BattleText, Route10Hiker2EndBattleText, Route10Hiker2AfterBattleText
Route10TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_5, 2, Route10CooltrainerF2BattleText, Route10CooltrainerF2EndBattleText, Route10CooltrainerF2AfterBattleText
	db -1 ; end

Route10SuperNerd1Text:
	text_asm
	ld hl, Route10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route10SuperNerd1BattleText:
	text_far _Route10SuperNerd1BattleText
	text_end

Route10SuperNerd1EndBattleText:
	text_far _Route10SuperNerd1EndBattleText
	text_end

Route10SuperNerd1AfterBattleText:
	text_far _Route10SuperNerd1AfterBattleText
	text_end

Route10Hiker1Text:
	text_asm
	ld hl, Route10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route10Hiker1BattleText:
	text_far _Route10Hiker1BattleText
	text_end

Route10Hiker1EndBattleText:
	text_far _Route10Hiker1EndBattleText
	text_end

Route10Hiker1AfterBattleText:
	text_far _Route10Hiker1AfterBattleText
	text_end

Route10SuperNerd2Text:
	text_asm
	ld hl, Route10TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route10SuperNerd2BattleText:
	text_far _Route10SuperNerd2BattleText
	text_end

Route10SuperNerd2EndBattleText:
	text_far _Route10SuperNerd2EndBattleText
	text_end

Route10SuperNerd2AfterBattleText:
	text_far _Route10SuperNerd2AfterBattleText
	text_end

Route10CooltrainerF1Text:
	text_asm
	ld hl, Route10TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route10CooltrainerF1BattleText:
	text_far _Route10CooltrainerF1BattleText
	text_end

Route10CooltrainerF1EndBattleText:
	text_far _Route10CooltrainerF1EndBattleText
	text_end

Route10CooltrainerF1AfterBattleText:
	text_far _Route10CooltrainerF1AfterBattleText
	text_end

Route10Hiker2Text:
	text_asm
	ld hl, Route10TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route10Hiker2BattleText:
	text_far _Route10Hiker2BattleText
	text_end

Route10Hiker2EndBattleText:
	text_far _Route10Hiker2EndBattleText
	text_end

Route10Hiker2AfterBattleText:
	text_far _Route10Hiker2AfterBattleText
	text_end

Route10CooltrainerF2Text:
	text_asm
	ld hl, Route10TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route10CooltrainerF2BattleText:
	text_far _Route10CooltrainerF2BattleText
	text_end

Route10CooltrainerF2EndBattleText:
	text_far _Route10CooltrainerF2EndBattleText
	text_end

Route10CooltrainerF2AfterBattleText:
	text_far _Route10CooltrainerF2AfterBattleText
	text_end

Route10RockTunnelSignText:
	text_far _Route10RockTunnelSignText
	text_end

Route10PowerPlantSignText:
	text_far _Route10PowerPlantSignText
	text_end
