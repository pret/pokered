Route25_Script:
	call Route25Script_515e1
	call EnableAutoTextBoxDrawing
	ld hl, Route25TrainerHeaders
	ld de, Route25_ScriptPointers
	ld a, [wRoute25CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute25CurScript], a
	ret

Route25Script_515e1:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	CheckEventHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ret nz
	CheckEventReuseHL EVENT_MET_BILL_2
	jr nz, .asm_515ff
	ResetEventReuseHL EVENT_BILL_SAID_USE_CELL_SEPARATOR
	ld a, HS_BILL_POKEMON
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.asm_515ff
	CheckEventAfterBranchReuseHL EVENT_GOT_SS_TICKET, EVENT_MET_BILL_2
	ret z
	SetEventReuseHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ld a, HS_NUGGET_BRIDGE_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_BILL_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_BILL_2
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

Route25_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route25_TextPointers:
	dw Route25Text1
	dw Route25Text2
	dw Route25Text3
	dw Route25Text4
	dw Route25Text5
	dw Route25Text6
	dw Route25Text7
	dw Route25Text8
	dw Route25Text9
	dw PickUpItemText
	dw Route25Text11

Route25TrainerHeaders:
	def_trainers
Route25TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_0, 2, Route25BattleText1, Route25EndBattleText1, Route25AfterBattleText1
Route25TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_1, 3, Route25BattleText2, Route25EndBattleText2, Route25AfterBattleText2
Route25TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_2, 3, Route25BattleText3, Route25EndBattleText3, Route25AfterBattleText3
Route25TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_3, 2, Route25BattleText4, Route25EndBattleText4, Route25AfterBattleText4
Route25TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_4, 4, Route25BattleText5, Route25EndBattleText5, Route25AfterBattleText5
Route25TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_5, 4, Route25BattleText6, Route25EndBattleText6, Route25AfterBattleText6
Route25TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_6, 3, Route25BattleText7, Route25EndBattleText7, Route25AfterBattleText7
Route25TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_7, 2, Route25BattleText8, Route25EndBattleText8, Route25AfterBattleText8
Route25TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_25_TRAINER_8, 2, Route25BattleText9, Route25EndBattleText9, Route25AfterBattleText9
	db -1 ; end

Route25Text1:
	text_asm
	ld hl, Route25TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route25Text2:
	text_asm
	ld hl, Route25TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route25Text3:
	text_asm
	ld hl, Route25TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route25Text4:
	text_asm
	ld hl, Route25TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route25Text5:
	text_asm
	ld hl, Route25TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route25Text6:
	text_asm
	ld hl, Route25TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route25Text7:
	text_asm
	ld hl, Route25TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route25Text8:
	text_asm
	ld hl, Route25TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route25Text9:
	text_asm
	ld hl, Route25TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route25BattleText1:
	text_far _Route25BattleText1
	text_end

Route25EndBattleText1:
	text_far _Route25EndBattleText1
	text_end

Route25AfterBattleText1:
	text_far _Route25AfterBattleText1
	text_end

Route25BattleText2:
	text_far _Route25BattleText2
	text_end

Route25EndBattleText2:
	text_far _Route25EndBattleText2
	text_end

Route25AfterBattleText2:
	text_far _Route25AfterBattleText2
	text_end

Route25BattleText3:
	text_far _Route25BattleText3
	text_end

Route25EndBattleText3:
	text_far _Route25EndBattleText3
	text_end

Route25AfterBattleText3:
	text_far _Route25AfterBattleText3
	text_end

Route25BattleText4:
	text_far _Route25BattleText4
	text_end

Route25EndBattleText4:
	text_far _Route25EndBattleText4
	text_end

Route25AfterBattleText4:
	text_far _Route25AfterBattleText4
	text_end

Route25BattleText5:
	text_far _Route25BattleText5
	text_end

Route25EndBattleText5:
	text_far _Route25EndBattleText5
	text_end

Route25AfterBattleText5:
	text_far _Route25AfterBattleText5
	text_end

Route25BattleText6:
	text_far _Route25BattleText6
	text_end

Route25EndBattleText6:
	text_far _Route25EndBattleText6
	text_end

Route25AfterBattleText6:
	text_far _Route25AfterBattleText6
	text_end

Route25BattleText7:
	text_far _Route25BattleText7
	text_end

Route25EndBattleText7:
	text_far _Route25EndBattleText7
	text_end

Route25AfterBattleText7:
	text_far _Route25AfterBattleText7
	text_end

Route25BattleText8:
	text_far _Route25BattleText8
	text_end

Route25EndBattleText8:
	text_far _Route25EndBattleText8
	text_end

Route25AfterBattleText8:
	text_far _Route25AfterBattleText8
	text_end

Route25BattleText9:
	text_far _Route25BattleText9
	text_end

Route25EndBattleText9:
	text_far _Route25EndBattleText9
	text_end

Route25AfterBattleText9:
	text_far _Route25AfterBattleText9
	text_end

Route25Text11:
	text_far _Route25Text11
	text_end
