Route20_Script:
	CheckAndResetEvent EVENT_IN_SEAFOAM_ISLANDS
	call nz, Route20Script_50cc6
	call EnableAutoTextBoxDrawing
	ld hl, Route20TrainerHeaders
	ld de, Route20_ScriptPointers
	ld a, [wRoute20CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute20CurScript], a
	ret

Route20Script_50cc6:
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	jr z, .asm_50cef
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_1
	call Route20Script_50d0c
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_2
	call Route20Script_50d0c
	ld hl, .MissableObjectIDs
.asm_50cdc
	ld a, [hli]
	cp $ff
	jr z, .asm_50cef
	push hl
	call Route20Script_50d14
	pop hl
	jr .asm_50cdc

.MissableObjectIDs:
	db HS_SEAFOAM_ISLANDS_B1F_BOULDER_1
	db HS_SEAFOAM_ISLANDS_B1F_BOULDER_2
	db HS_SEAFOAM_ISLANDS_B2F_BOULDER_1
	db HS_SEAFOAM_ISLANDS_B2F_BOULDER_2
	db HS_SEAFOAM_ISLANDS_B3F_BOULDER_3
	db HS_SEAFOAM_ISLANDS_B3F_BOULDER_4
	db -1 ; end

.asm_50cef
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_1
	call Route20Script_50d0c
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_2
	call Route20Script_50d0c
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_1
	call Route20Script_50d14
	ld a, HS_SEAFOAM_ISLANDS_B4F_BOULDER_2
	call Route20Script_50d14
	ret

Route20Script_50d0c:
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

Route20Script_50d14:
	ld [wMissableObjectIndex], a
	predef_jump HideObject

Route20_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route20_TextPointers:
	dw Route20Text1
	dw Route20Text2
	dw Route20Text3
	dw Route20Text4
	dw Route20Text5
	dw Route20Text6
	dw Route20Text7
	dw Route20Text8
	dw Route20Text9
	dw Route20Text10
	dw Route20Text11
	dw Route20Text12

Route20TrainerHeaders:
	def_trainers
Route20TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_0, 4, Route20BattleText1, Route20EndBattleText1, Route20AfterBattleText1
Route20TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_1, 4, Route20BattleText2, Route20EndBattleText2, Route20AfterBattleText2
Route20TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_2, 2, Route20BattleText3, Route20EndBattleText3, Route20AfterBattleText3
Route20TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_3, 4, Route20BattleText4, Route20EndBattleText4, Route20AfterBattleText4
Route20TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_4, 3, Route20BattleText5, Route20EndBattleText5, Route20AfterBattleText5
Route20TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_5, 4, Route20BattleText6, Route20EndBattleText6, Route20AfterBattleText6
Route20TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_6, 2, Route20BattleText7, Route20EndBattleText7, Route20AfterBattleText7
Route20TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_7, 4, Route20BattleText8, Route20EndBattleText8, Route20AfterBattleText8
Route20TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_8, 3, Route20BattleText9, Route20EndBattleText9, Route20AfterBattleText9
Route20TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_20_TRAINER_9, 4, Route20BattleText10, Route20EndBattleText10, Route20AfterBattleText10
	db -1 ; end

Route20Text1:
	text_asm
	ld hl, Route20TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route20Text2:
	text_asm
	ld hl, Route20TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route20Text3:
	text_asm
	ld hl, Route20TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route20Text4:
	text_asm
	ld hl, Route20TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route20Text5:
	text_asm
	ld hl, Route20TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route20Text6:
	text_asm
	ld hl, Route20TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route20Text7:
	text_asm
	ld hl, Route20TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route20Text8:
	text_asm
	ld hl, Route20TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route20Text9:
	text_asm
	ld hl, Route20TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route20Text10:
	text_asm
	ld hl, Route20TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route20BattleText1:
	text_far _Route20BattleText1
	text_end

Route20EndBattleText1:
	text_far _Route20EndBattleText1
	text_end

Route20AfterBattleText1:
	text_far _Route20AfterBattleText1
	text_end

Route20BattleText2:
	text_far _Route20BattleText2
	text_end

Route20EndBattleText2:
	text_far _Route20EndBattleText2
	text_end

Route20AfterBattleText2:
	text_far _Route20AfterBattleText2
	text_end

Route20BattleText3:
	text_far _Route20BattleText3
	text_end

Route20EndBattleText3:
	text_far _Route20EndBattleText3
	text_end

Route20AfterBattleText3:
	text_far _Route20AfterBattleText3
	text_end

Route20BattleText4:
	text_far _Route20BattleText4
	text_end

Route20EndBattleText4:
	text_far _Route20EndBattleText4
	text_end

Route20AfterBattleText4:
	text_far _Route20AfterBattleText4
	text_end

Route20BattleText5:
	text_far _Route20BattleText5
	text_end

Route20EndBattleText5:
	text_far _Route20EndBattleText5
	text_end

Route20AfterBattleText5:
	text_far _Route20AfterBattleText5
	text_end

Route20BattleText6:
	text_far _Route20BattleText6
	text_end

Route20EndBattleText6:
	text_far _Route20EndBattleText6
	text_end

Route20AfterBattleText6:
	text_far _Route20AfterBattleText6
	text_end

Route20BattleText7:
	text_far _Route20BattleText7
	text_end

Route20EndBattleText7:
	text_far _Route20EndBattleText7
	text_end

Route20AfterBattleText7:
	text_far _Route20AfterBattleText7
	text_end

Route20BattleText8:
	text_far _Route20BattleText8
	text_end

Route20EndBattleText8:
	text_far _Route20EndBattleText8
	text_end

Route20AfterBattleText8:
	text_far _Route20AfterBattleText8
	text_end

Route20BattleText9:
	text_far _Route20BattleText9
	text_end

Route20EndBattleText9:
	text_far _Route20EndBattleText9
	text_end

Route20AfterBattleText9:
	text_far _Route20AfterBattleText9
	text_end

Route20BattleText10:
	text_far _Route20BattleText10
	text_end

Route20EndBattleText10:
	text_far _Route20EndBattleText10
	text_end

Route20AfterBattleText10:
	text_far _Route20AfterBattleText10
	text_end

Route20Text12:
Route20Text11:
	text_far _Route20Text11
	text_end
