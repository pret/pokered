VictoryRoad2F_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, VictoryRoad2FResetBoulderEventScript
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, VictoryRoad2FCheckBoulderEventScript
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad2TrainerHeaders
	ld de, VictoryRoad2F_ScriptPointers
	ld a, [wVictoryRoad2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad2FCurScript], a
	ret

VictoryRoad2FResetBoulderEventScript:
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
; fallthrough
VictoryRoad2FCheckBoulderEventScript:
	CheckEvent EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	jr z, .not_on_switch
	push af
	ld a, $15
	lb bc, 4, 3
	call VictoryRoad2FReplaceTileBlockScript
	pop af
.not_on_switch
	CheckEventReuseA EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ret z
	ld a, $1d
	lb bc, 7, 11
VictoryRoad2FReplaceTileBlockScript:
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

VictoryRoad2F_ScriptPointers:
	def_script_pointers
	dw_const VictoryRoad2FDefaultScript,            SCRIPT_VICTORYROAD2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VICTORYROAD2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VICTORYROAD2F_END_BATTLE

VictoryRoad2FDefaultScript:
	ld hl, .SwitchCoords
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	EventFlagAddress hl, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ld a, [wCoordIndex]
	cp $2
	jr z, .second_switch
	CheckEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ret nz
	jr .set_script_flag
.second_switch
	CheckEventAfterBranchReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ret nz
.set_script_flag
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ret

.SwitchCoords:
	dbmapcoord  1, 16
	dbmapcoord  9, 16
	db -1 ; end

VictoryRoad2F_TextPointers:
	def_text_pointers
	dw_const VictoryRoad2FHikerText,        TEXT_VICTORYROAD2F_HIKER
	dw_const VictoryRoad2FSuperNerd1Text,   TEXT_VICTORYROAD2F_SUPER_NERD1
	dw_const VictoryRoad2FCooltrainerMText, TEXT_VICTORYROAD2F_COOLTRAINER_M
	dw_const VictoryRoad2FSuperNerd2Text,   TEXT_VICTORYROAD2F_SUPER_NERD2
	dw_const VictoryRoad2FSuperNerd3Text,   TEXT_VICTORYROAD2F_SUPER_NERD3
	dw_const VictoryRoad2FMoltresText,      TEXT_VICTORYROAD2F_MOLTRES
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_TM_SUBMISSION
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_FULL_HEAL
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_TM_MEGA_KICK
	dw_const PickUpItemText,                TEXT_VICTORYROAD2F_GUARD_SPEC
	dw_const BoulderText,                   TEXT_VICTORYROAD2F_BOULDER1
	dw_const BoulderText,                   TEXT_VICTORYROAD2F_BOULDER2
	dw_const BoulderText,                   TEXT_VICTORYROAD2F_BOULDER3

VictoryRoad2TrainerHeaders:
	def_trainers
VictoryRoad2TrainerHeader0:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0, 4, VictoryRoad2FHikerBattleText, VictoryRoad2FHikerEndBattleText, VictoryRoad2FHikerAfterBattleText
VictoryRoad2TrainerHeader1:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1, 3, VictoryRoad2FSuperNerd1BattleText, VictoryRoad2FSuperNerd1EndBattleText, VictoryRoad2FSuperNerd1AfterBattleText
VictoryRoad2TrainerHeader2:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2, 3, VictoryRoad2FCooltrainerMBattleText, VictoryRoad2FCooltrainerMEndBattleText, VictoryRoad2FCooltrainerMAfterBattleText
VictoryRoad2TrainerHeader3:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3, 1, VictoryRoad2FSuperNerd2BattleText, VictoryRoad2FSuperNerd2EndBattleText, VictoryRoad2FSuperNerd2AfterBattleText
VictoryRoad2TrainerHeader4:
	trainer EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4, 3, VictoryRoad2FSuperNerd3BattleText, VictoryRoad2FSuperNerd3EndBattleText, VictoryRoad2FSuperNerd3AfterBattleText
MoltresTrainerHeader:
	trainer EVENT_BEAT_MOLTRES, 0, VictoryRoad2FMoltresBattleText, VictoryRoad2FMoltresBattleText, VictoryRoad2FMoltresBattleText
	db -1 ; end

VictoryRoad2FHikerText:
	text_asm
	ld hl, VictoryRoad2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2FSuperNerd1Text:
	text_asm
	ld hl, VictoryRoad2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2FCooltrainerMText:
	text_asm
	ld hl, VictoryRoad2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2FSuperNerd2Text:
	text_asm
	ld hl, VictoryRoad2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2FSuperNerd3Text:
	text_asm
	ld hl, VictoryRoad2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2FMoltresText:
	text_asm
	ld hl, MoltresTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2FMoltresBattleText:
	text_far _VictoryRoad2FMoltresBattleText
	text_asm
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VictoryRoad2FHikerBattleText:
	text_far _VictoryRoad2FHikerBattleText
	text_end

VictoryRoad2FHikerEndBattleText:
	text_far _VictoryRoad2FHikerEndBattleText
	text_end

VictoryRoad2FHikerAfterBattleText:
	text_far _VictoryRoad2FHikerAfterBattleText
	text_end

VictoryRoad2FSuperNerd1BattleText:
	text_far _VictoryRoad2FSuperNerd1BattleText
	text_end

VictoryRoad2FSuperNerd1EndBattleText:
	text_far _VictoryRoad2FSuperNerd1EndBattleText
	text_end

VictoryRoad2FSuperNerd1AfterBattleText:
	text_far _VictoryRoad2FSuperNerd1AfterBattleText
	text_end

VictoryRoad2FCooltrainerMBattleText:
	text_far _VictoryRoad2FCooltrainerMBattleText
	text_end

VictoryRoad2FCooltrainerMEndBattleText:
	text_far _VictoryRoad2FCooltrainerMEndBattleText
	text_end

VictoryRoad2FCooltrainerMAfterBattleText:
	text_far _VictoryRoad2FCooltrainerMAfterBattleText
	text_end

VictoryRoad2FSuperNerd2BattleText:
	text_far _VictoryRoad2FSuperNerd2BattleText
	text_end

VictoryRoad2FSuperNerd2EndBattleText:
	text_far _VictoryRoad2FSuperNerd2EndBattleText
	text_end

VictoryRoad2FSuperNerd2AfterBattleText:
	text_far _VictoryRoad2FSuperNerd2AfterBattleText
	text_end

VictoryRoad2FSuperNerd3BattleText:
	text_far _VictoryRoad2FSuperNerd3BattleText
	text_end

VictoryRoad2FSuperNerd3EndBattleText:
	text_far _VictoryRoad2FSuperNerd3EndBattleText
	text_end

VictoryRoad2FSuperNerd3AfterBattleText:
	text_far _VictoryRoad2FSuperNerd3AfterBattleText
	text_end
