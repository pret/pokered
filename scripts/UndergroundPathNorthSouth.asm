; PureRGBnote: ADDED: trainers in this location
; PureRGBnote: CHANGED: if you found the secret path from saffron to here, it will be open on loading the map.

UndergroundPathNorthSouth_Script:
	call UndergroundPathNorthSouthOnMapLoad
	call EnableAutoTextBoxDrawing
	ld hl, UndergroundPathNorthSouthTrainerHeaders
	ld de, UndergroundPathNorthSouth_ScriptPointers
	ld a, [wUndergroundPathNorthSouthCurScript]
	call ExecuteCurMapScriptInTable
	ld [wUndergroundPathNorthSouthCurScript], a
	ret

UndergroundPathNorthSouthOnMapLoad:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld a, ROUTE_5
	ld [wLastMap], a
	CheckEvent EVENT_FOUND_SECRET_DIG_TUNNEL
	ret nz
	lb bc, 11, 0
	ld a, 13
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

UndergroundPathNorthSouth_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_UNDERGROUNDPATHNORTHSOUTH_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_UNDERGROUNDPATHNORTHSOUTH_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_UNDERGROUNDPATHNORTHSOUTH_END_BATTLE

UndergroundPathNorthSouth_TextPointers:
	def_text_pointers
	dw_const UndergroundPathNorthSouthTrainer1Text,     TEXT_UNDERGROUNDPATHNORTHSOUTH_GENTLEMAN
	dw_const UndergroundPathNorthSouthTrainer2Text,     TEXT_UNDERGROUNDPATHNORTHSOUTH_COOL_KID1
	dw_const UndergroundPathNorthSouthTrainer3Text,     TEXT_UNDERGROUNDPATHNORTHSOUTH_COOL_KID2

UndergroundPathNorthSouthTrainerHeaders:
	def_trainers 5
UndergroundPathNorthSouthTrainerHeader0:
	trainer EVENT_BEAT_UNDERGROUND_PATH_NORTH_SOUTH_TRAINER_0, 0, UndergroundPathNorthSouthBattleText1, UndergroundPathNorthSouthEndBattleText1, UndergroundPathNorthSouthAfterBattleText1
UndergroundPathNorthSouthTrainerHeader1:
	trainer EVENT_BEAT_UNDERGROUND_PATH_NORTH_SOUTH_TRAINER_1, 0, UndergroundPathNorthSouthBattleText2, UndergroundPathNorthSouthEndBattleText2, UndergroundPathNorthSouthAfterBattleText2
UndergroundPathNorthSouthTrainerHeader2:
	trainer EVENT_BEAT_UNDERGROUND_PATH_NORTH_SOUTH_TRAINER_2, 0, UndergroundPathNorthSouthBattleText3, UndergroundPathNorthSouthEndBattleText3, UndergroundPathNorthSouthAfterBattleText3
	db -1 ;end

UndergroundPathNorthSouthTrainer1Text:
	text_asm
	ld hl, UndergroundPathNorthSouthTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

UndergroundPathNorthSouthBattleText1:
	text_far _UndergroundPathNorthSouthBattleText1
	text_end

UndergroundPathNorthSouthEndBattleText1:
	text_far _UndergroundPathNorthSouthEndBattleText1
	text_end

UndergroundPathNorthSouthAfterBattleText1:
	text_far _UndergroundPathNorthSouthAfterBattleText1
	text_end

UndergroundPathNorthSouthTrainer2Text:
	text_asm
	ld hl, UndergroundPathNorthSouthTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

UndergroundPathNorthSouthBattleText2:
	text_far _UndergroundPathNorthSouthBattleText2
	text_end

UndergroundPathNorthSouthEndBattleText2:
	text_far _UndergroundPathNorthSouthEndBattleText2
	text_end

UndergroundPathNorthSouthAfterBattleText2:
	text_far _UndergroundPathNorthSouthAfterBattleText2
	text_end

UndergroundPathNorthSouthTrainer3Text:
	text_asm
	ld hl, UndergroundPathNorthSouthTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

UndergroundPathNorthSouthBattleText3:
	text_far _UndergroundPathNorthSouthBattleText3
	text_end

UndergroundPathNorthSouthEndBattleText3:
	text_far _UndergroundPathNorthSouthEndBattleText3
	text_end

UndergroundPathNorthSouthAfterBattleText3:
	text_far _UndergroundPathNorthSouthAfterBattleText3
	text_end