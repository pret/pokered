Route12_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route12TrainerHeaders
	ld de, Route12_ScriptPointers
	ld a, [wRoute12CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute12CurScript], a
	ret

Route12ResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12_ScriptPointers:
	def_script_pointers
	dw_const Route12DefaultScript,                  SCRIPT_ROUTE12_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE12_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE12_END_BATTLE
	dw_const Route12SnorlaxPostBattleScript,        SCRIPT_ROUTE12_SNORLAX_POST_BATTLE

Route12DefaultScript:
	CheckEventHL EVENT_BEAT_ROUTE12_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, TEXT_ROUTE12_SNORLAX_WOKE_UP
	ldh [hTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLevel], a
	xor a
	ld [wIsTrainerBattle], a
	ld a, HS_ROUTE_12_SNORLAX
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, SCRIPT_ROUTE12_SNORLAX_POST_BATTLE
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12SnorlaxPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, Route12ResetScripts
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .caught_snorlax
	ld a, TEXT_ROUTE12_SNORLAX_CALMED_DOWN
	ldh [hTextID], a
	call DisplayTextID
.caught_snorlax
	SetEvent EVENT_BEAT_ROUTE12_SNORLAX
	call Delay3
	ld a, SCRIPT_ROUTE12_DEFAULT
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12_TextPointers:
	def_text_pointers
	dw_const Route12SnorlaxText,           TEXT_ROUTE12_SNORLAX
	dw_const Route12Fisher1Text,           TEXT_ROUTE12_FISHER1
	dw_const Route12Fisher2Text,           TEXT_ROUTE12_FISHER2
	dw_const Route12CooltrainerMText,      TEXT_ROUTE12_COOLTRAINER_M
	dw_const Route12SuperNerdText,         TEXT_ROUTE12_SUPER_NERD
	dw_const Route12Fisher3Text,           TEXT_ROUTE12_FISHER3
	dw_const Route12Fisher4Text,           TEXT_ROUTE12_FISHER4
	dw_const Route12Fisher5Text,           TEXT_ROUTE12_FISHER5
	dw_const PickUpItemText,               TEXT_ROUTE12_TM_PAY_DAY
	dw_const PickUpItemText,               TEXT_ROUTE12_IRON
	dw_const Route12SignText,              TEXT_ROUTE12_SIGN
	dw_const Route12SportFishingSignText,  TEXT_ROUTE12_SPORT_FISHING_SIGN
	dw_const Route12SnorlaxWokeUpText,     TEXT_ROUTE12_SNORLAX_WOKE_UP
	dw_const Route12SnorlaxCalmedDownText, TEXT_ROUTE12_SNORLAX_CALMED_DOWN

Route12TrainerHeaders:
	def_trainers 2
Route12TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_0, 4, Route12Fisher1BattleText, Route12Fisher1EndBattleText, Route12Fisher1AfterBattleText
Route12TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_1, 4, Route12Fisher2BattleText, Route12Fisher2EndBattleText, Route12Fisher2AfterBattleText
Route12TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_2, 4, Route12CooltrainerMBattleText, Route12CooltrainerMEndBattleText, Route12CooltrainerMAfterBattleText
Route12TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_3, 4, Route12SuperNerdBattleText, Route12SuperNerdEndBattleText, Route12SuperNerdAfterBattleText
Route12TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_4, 4, Route12Fisher3BattleText, Route12Fisher3EndBattleText, Route12Fisher3AfterBattleText
Route12TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_5, 4, Route12Fisher4BattleText, Route12Fisher4EndBattleText, Route12Fisher4AfterBattleText
Route12TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_6, 1, Route12Fisher5BattleText, Route12Fisher5EndBattleText, Route12Fisher5AfterBattleText
	db -1 ; end

Route12SnorlaxText:
	text_far _Route12SnorlaxText
	text_end

Route12SnorlaxWokeUpText:
	text_far _Route12SnorlaxWokeUpText
	text_end

Route12SnorlaxCalmedDownText:
	text_far _Route12SnorlaxCalmedDownText
	text_end

Route12Fisher1Text:
	text_asm
	ld hl, Route12TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher1BattleText:
	text_far _Route12Fisher1BattleText
	text_end

Route12Fisher1EndBattleText:
	text_far _Route12Fisher1EndBattleText
	text_end

Route12Fisher1AfterBattleText:
	text_far _Route12Fisher1AfterBattleText
	text_end

Route12Fisher2Text:
	text_asm
	ld hl, Route12TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher2BattleText:
	text_far _Route12Fisher2BattleText
	text_end

Route12Fisher2EndBattleText:
	text_far _Route12Fisher2EndBattleText
	text_end

Route12Fisher2AfterBattleText:
	text_far _Route12Fisher2AfterBattleText
	text_end

Route12CooltrainerMText:
	text_asm
	ld hl, Route12TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route12CooltrainerMBattleText:
	text_far _Route12CooltrainerMBattleText
	text_end

Route12CooltrainerMEndBattleText:
	text_far _Route12CooltrainerMEndBattleText
	text_end

Route12CooltrainerMAfterBattleText:
	text_far _Route12CooltrainerMAfterBattleText
	text_end

Route12SuperNerdText:
	text_asm
	ld hl, Route12TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route12SuperNerdBattleText:
	text_far _Route12SuperNerdBattleText
	text_end

Route12SuperNerdEndBattleText:
	text_far _Route12SuperNerdEndBattleText
	text_end

Route12SuperNerdAfterBattleText:
	text_far _Route12SuperNerdAfterBattleText
	text_end

Route12Fisher3Text:
	text_asm
	ld hl, Route12TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher3BattleText:
	text_far _Route12Fisher3BattleText
	text_end

Route12Fisher3EndBattleText:
	text_far _Route12Fisher3EndBattleText
	text_end

Route12Fisher3AfterBattleText:
	text_far _Route12Fisher3AfterBattleText
	text_end

Route12Fisher4Text:
	text_asm
	ld hl, Route12TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher4BattleText:
	text_far _Route12Fisher4BattleText
	text_end

Route12Fisher4EndBattleText:
	text_far _Route12Fisher4EndBattleText
	text_end

Route12Fisher4AfterBattleText:
	text_far _Route12Fisher4AfterBattleText
	text_end

Route12Fisher5Text:
	text_asm
	ld hl, Route12TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher5BattleText:
	text_far _Route12Fisher5BattleText
	text_end

Route12Fisher5EndBattleText:
	text_far _Route12Fisher5EndBattleText
	text_end

Route12Fisher5AfterBattleText:
	text_far _Route12Fisher5AfterBattleText
	text_end

Route12SignText:
	text_far _Route12SignText
	text_end

Route12SportFishingSignText:
	text_far _Route12SportFishingSignText
	text_end
