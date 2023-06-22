Route20_Script:
	CheckAndResetEvent EVENT_IN_SEAFOAM_ISLANDS
	call nz, Route20BoulderScript
	call EnableAutoTextBoxDrawing
	ld hl, Route20TrainerHeaders
	ld de, Route20_ScriptPointers
	ld a, [wRoute20CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute20CurScript], a
	ret

Route20BoulderScript:
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	jr z, .next_boulder_check
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_1
	call Route20ShowObjectScript
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_2
	call Route20ShowObjectScript
	ld hl, .MissableObjectIDs
.hide_missable_objects
	ld a, [hli]
	cp $ff
	jr z, .next_boulder_check
	push hl
	call Route20HideObjectScript
	pop hl
	jr .hide_missable_objects

.MissableObjectIDs:
	db HS_SEAFOAM_ISLANDS_B1F_BOULDER_1
	db HS_SEAFOAM_ISLANDS_B1F_BOULDER_2
	db HS_SEAFOAM_ISLANDS_B2F_BOULDER_1
	db HS_SEAFOAM_ISLANDS_B2F_BOULDER_2
	db HS_SEAFOAM_ISLANDS_B3F_BOULDER_3
	db HS_SEAFOAM_ISLANDS_B3F_BOULDER_4
	db -1 ; end

.next_boulder_check
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_1
	call Route20ShowObjectScript
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_2
	call Route20ShowObjectScript
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_1
	call Route20HideObjectScript
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_2
	call Route20HideObjectScript
	ret

Route20ShowObjectScript:
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

Route20HideObjectScript:
	ld [wMissableObjectIndex], a
	predef_jump HideObject

Route20_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE20_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE20_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE20_END_BATTLE

Route20_TextPointers:
	def_text_pointers
	dw_const Route20Swimmer1Text,           TEXT_ROUTE20_SWIMMER1
	dw_const Route20Swimmer2Text,           TEXT_ROUTE20_SWIMMER2
	dw_const Route20Swimmer3Text,           TEXT_ROUTE20_SWIMMER3
	dw_const Route20Swimmer4Text,           TEXT_ROUTE20_SWIMMER4
	dw_const Route20Swimmer5Text,           TEXT_ROUTE20_SWIMMER5
	dw_const Route20Swimmer6Text,           TEXT_ROUTE20_SWIMMER6
	dw_const Route20CooltrainerMText,       TEXT_ROUTE20_COOLTRAINER_M
	dw_const Route20Swimmer7Text,           TEXT_ROUTE20_SWIMMER7
	dw_const Route20Swimmer8Text,           TEXT_ROUTE20_SWIMMER8
	dw_const Route20Swimmer9Text,           TEXT_ROUTE20_SWIMMER9
	dw_const Route20SeafoamIslandsSignText, TEXT_ROUTE20_SEAFOAM_ISLANDS_WEST_SIGN
	dw_const Route20SeafoamIslandsSignText, TEXT_ROUTE20_SEAFOAM_ISLANDS_EAST_SIGN

Route20TrainerHeaders:
	def_trainers
Route20TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_0, 4, Route20Swimmer1BattleText, Route20Swimmer1EndBattleText, Route20Swimmer1AfterBattleText
Route20TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_1, 4, Route20Swimmer2BattleText, Route20Swimmer2EndBattleText, Route20Swimmer2AfterBattleText
Route20TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_2, 2, Route20Swimmer3BattleText, Route20Swimmer3EndBattleText, Route20Swimmer3AfterBattleText
Route20TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_3, 4, Route20Swimmer4BattleText, Route20Swimmer4EndBattleText, Route20Swimmer4AfterBattleText
Route20TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_4, 3, Route20Swimmer5BattleText, Route20Swimmer5EndBattleText, Route20Swimmer5AfterBattleText
Route20TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_5, 4, Route20Swimmer6BattleText, Route20Swimmer6EndBattleText, Route20Swimmer6AfterBattleText
Route20TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_6, 2, Route20CooltrainerMBattleText, Route20CooltrainerMEndBattleText, Route20CooltrainerMAfterBattleText
Route20TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_7, 4, Route20Swimmer7BattleText, Route20Swimmer7EndBattleText, Route20Swimmer7AfterBattleText
Route20TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_8, 3, Route20Swimmer8BattleText, Route20Swimmer8EndBattleText, Route20Swimmer8AfterBattleText
Route20TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_9, 4, Route20Swimmer9BattleText, Route20Swimmer9EndBattleText, Route20Swimmer9AfterBattleText
	db -1 ; end

Route20Swimmer1Text:
	text_asm
	ld hl, Route20TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer2Text:
	text_asm
	ld hl, Route20TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer3Text:
	text_asm
	ld hl, Route20TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer4Text:
	text_asm
	ld hl, Route20TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer5Text:
	text_asm
	ld hl, Route20TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer6Text:
	text_asm
	ld hl, Route20TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route20CooltrainerMText:
	text_asm
	ld hl, Route20TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer7Text:
	text_asm
	ld hl, Route20TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer8Text:
	text_asm
	ld hl, Route20TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer9Text:
	text_asm
	ld hl, Route20TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer1BattleText:
	text_far _Route20Swimmer1BattleText
	text_end

Route20Swimmer1EndBattleText:
	text_far _Route20Swimmer1EndBattleText
	text_end

Route20Swimmer1AfterBattleText:
	text_far _Route20Swimmer1AfterBattleText
	text_end

Route20Swimmer2BattleText:
	text_far _Route20Swimmer2BattleText
	text_end

Route20Swimmer2EndBattleText:
	text_far _Route20Swimmer2EndBattleText
	text_end

Route20Swimmer2AfterBattleText:
	text_far _Route20Swimmer2AfterBattleText
	text_end

Route20Swimmer3BattleText:
	text_far _Route20Swimmer3BattleText
	text_end

Route20Swimmer3EndBattleText:
	text_far _Route20Swimmer3EndBattleText
	text_end

Route20Swimmer3AfterBattleText:
	text_far _Route20Swimmer3AfterBattleText
	text_end

Route20Swimmer4BattleText:
	text_far _Route20Swimmer4BattleText
	text_end

Route20Swimmer4EndBattleText:
	text_far _Route20Swimmer4EndBattleText
	text_end

Route20Swimmer4AfterBattleText:
	text_far _Route20Swimmer4AfterBattleText
	text_end

Route20Swimmer5BattleText:
	text_far _Route20Swimmer5BattleText
	text_end

Route20Swimmer5EndBattleText:
	text_far _Route20Swimmer5EndBattleText
	text_end

Route20Swimmer5AfterBattleText:
	text_far _Route20Swimmer5AfterBattleText
	text_end

Route20Swimmer6BattleText:
	text_far _Route20Swimmer6BattleText
	text_end

Route20Swimmer6EndBattleText:
	text_far _Route20Swimmer6EndBattleText
	text_end

Route20Swimmer6AfterBattleText:
	text_far _Route20Swimmer6AfterBattleText
	text_end

Route20CooltrainerMBattleText:
	text_far _Route20CooltrainerMBattleText
	text_end

Route20CooltrainerMEndBattleText:
	text_far _Route20CooltrainerMEndBattleText
	text_end

Route20CooltrainerMAfterBattleText:
	text_far _Route20CooltrainerMAfterBattleText
	text_end

Route20Swimmer7BattleText:
	text_far _Route20Swimmer7BattleText
	text_end

Route20Swimmer7EndBattleText:
	text_far _Route20Swimmer7EndBattleText
	text_end

Route20Swimmer7AfterBattleText:
	text_far _Route20Swimmer7AfterBattleText
	text_end

Route20Swimmer8BattleText:
	text_far _Route20Swimmer8BattleText
	text_end

Route20Swimmer8EndBattleText:
	text_far _Route20Swimmer8EndBattleText
	text_end

Route20Swimmer8AfterBattleText:
	text_far _Route20Swimmer8AfterBattleText
	text_end

Route20Swimmer9BattleText:
	text_far _Route20Swimmer9BattleText
	text_end

Route20Swimmer9EndBattleText:
	text_far _Route20Swimmer9EndBattleText
	text_end

Route20Swimmer9AfterBattleText:
	text_far _Route20Swimmer9AfterBattleText
	text_end

Route20SeafoamIslandsSignText:
	text_far _Route20SeafoamIslandsSignText
	text_end
