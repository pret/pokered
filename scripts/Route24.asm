Route24_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route24TrainerHeaders
	ld de, Route24_ScriptPointers
	ld a, [wRoute24CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute24CurScript], a
	ret

Route24SetDefaultScript:
	xor a ; SCRIPT_ROUTE24_DEFAULT
	ld [wJoyIgnore], a
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_ScriptPointers:
	def_script_pointers
	dw_const Route24DefaultScript,                  SCRIPT_ROUTE24_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE24_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE24_END_BATTLE
	dw_const Route24AfterRocketBattleScript,        SCRIPT_ROUTE24_AFTER_ROCKET_BATTLE
	dw_const Route24PlayerMovingScript,             SCRIPT_ROUTE24_PLAYER_MOVING

Route24DefaultScript:
	CheckEvent EVENT_GOT_NUGGET
	jp nz, CheckFightingMapTrainers
	ld hl, .PlayerCoordsArray
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_ROUTE24_COOLTRAINER_M1
	ldh [hTextID], a
	call DisplayTextID
	CheckAndResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	ret z
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE24_PLAYER_MOVING
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

.PlayerCoordsArray:
	dbmapcoord 10, 15
	db -1 ; end

Route24PlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, SCRIPT_ROUTE24_DEFAULT
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24AfterRocketBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route24SetDefaultScript
	call UpdateSprites
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE24_ROCKET
	ld a, TEXT_ROUTE24_COOLTRAINER_M1
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_ROUTE24_DEFAULT
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_TextPointers:
	def_text_pointers
	dw_const Route24CooltrainerM1Text, TEXT_ROUTE24_COOLTRAINER_M1
	dw_const Route24CooltrainerM2Text, TEXT_ROUTE24_COOLTRAINER_M2
	dw_const Route24CooltrainerM3Text, TEXT_ROUTE24_COOLTRAINER_M3
	dw_const Route24CooltrainerF1Text, TEXT_ROUTE24_COOLTRAINER_F1
	dw_const Route24Youngster1Text,    TEXT_ROUTE24_YOUNGSTER1
	dw_const Route24CooltrainerF2Text, TEXT_ROUTE24_COOLTRAINER_F2
	dw_const Route24Youngster2Text,    TEXT_ROUTE24_YOUNGSTER2
	dw_const PickUpItemText,           TEXT_ROUTE24_TM_THUNDER_WAVE

Route24TrainerHeaders:
	def_trainers 2
Route24TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_0, 4, Route24CooltrainerM2BattleText, Route24CooltrainerM2EndBattleText, Route24CooltrainerM2AfterBattleText
Route24TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_1, 1, Route24CooltrainerM3BattleText, Route24CooltrainerM3EndBattleText, Route24CooltrainerM3AfterBattleText
Route24TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_2, 1, Route24CooltrainerF1BattleText, Route24CooltrainerF1EndBattleText, Route24CooltrainerF1AfterBattleText
Route24TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_3, 1, Route24Youngster1BattleText, Route24Youngster1EndBattleText, Route24Youngster1AfterBattleText
Route24TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_4, 1, Route24CooltrainerF2BattleText, Route24CooltrainerF2EndBattleText, Route24CooltrainerF2AfterBattleText
Route24TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_5, 1, Route24Youngster2BattleText, Route24Youngster2EndBattleText, Route24Youngster2AfterBattleText
	db -1 ; end

Route24CooltrainerM1Text:
	text_asm
	ResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	CheckEvent EVENT_GOT_NUGGET
	jr nz, .got_item
	ld hl, .YouBeatOurContestText
	call PrintText
	lb bc, NUGGET, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_NUGGET
	ld hl, .ReceivedNuggetText
	call PrintText
	ld hl, .JoinTeamRocketText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .DefeatedText
	ld de, .DefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_ROUTE24_AFTER_ROCKET_BATTLE
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd
.got_item
	ld hl, .YouCouldBecomeATopLeaderText
	call PrintText
	jp TextScriptEnd
.bag_full
	ld hl, .NoRoomText
	call PrintText
	SetEvent EVENT_NUGGET_REWARD_AVAILABLE
	jp TextScriptEnd

.YouBeatOurContestText:
	text_far _Route24CooltrainerM1YouBeatOurContestText
	sound_get_item_1
	text_far _Route24CooltrainerM1YouJustEarnedAPrizeText
	text_end

.ReceivedNuggetText:
	text_far _Route24CooltrainerM1ReceivedNuggetText
	sound_get_item_1
	text_promptbutton
	text_end

.NoRoomText:
	text_far _Route24CooltrainerM1NoRoomText
	text_end

.JoinTeamRocketText:
	text_far _Route24CooltrainerM1JoinTeamRocketText
	text_end

.DefeatedText:
	text_far _Route24CooltrainerM1DefeatedText
	text_end

.YouCouldBecomeATopLeaderText:
	text_far _Route24CooltrainerM1YouCouldBecomeATopLeaderText
	text_end

Route24CooltrainerM2Text:
	text_asm
	ld hl, Route24TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerM3Text:
	text_asm
	ld hl, Route24TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerF1Text:
	text_asm
	ld hl, Route24TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route24Youngster1Text:
	text_asm
	ld hl, Route24TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerF2Text:
	text_asm
	ld hl, Route24TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route24Youngster2Text:
	text_asm
	ld hl, Route24TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerM2BattleText:
	text_far _Route24CooltrainerM2BattleText
	text_end

Route24CooltrainerM2EndBattleText:
	text_far _Route24CooltrainerM2EndBattleText
	text_end

Route24CooltrainerM2AfterBattleText:
	text_far _Route24CooltrainerM2AfterBattleText
	text_end

Route24CooltrainerM3BattleText:
	text_far _Route24CooltrainerM3BattleText
	text_end

Route24CooltrainerM3EndBattleText:
	text_far _Route24CooltrainerM3EndBattleText
	text_end

Route24CooltrainerM3AfterBattleText:
	text_far _Route24CooltrainerM3AfterBattleText
	text_end

Route24CooltrainerF1BattleText:
	text_far _Route24CooltrainerF1BattleText
	text_end

Route24CooltrainerF1EndBattleText:
	text_far _Route24CooltrainerF1EndBattleText
	text_end

Route24CooltrainerF1AfterBattleText:
	text_far _Route24CooltrainerF1AfterBattleText
	text_end

Route24Youngster1BattleText:
	text_far _Route24Youngster1BattleText
	text_end

Route24Youngster1EndBattleText:
	text_far _Route24Youngster1EndBattleText
	text_end

Route24Youngster1AfterBattleText:
	text_far _Route24Youngster1AfterBattleText
	text_end

Route24CooltrainerF2BattleText:
	text_far _Route24CooltrainerF2BattleText
	text_end

Route24CooltrainerF2EndBattleText:
	text_far _Route24CooltrainerF2EndBattleText
	text_end

Route24CooltrainerF2AfterBattleText:
	text_far _Route24CooltrainerF2AfterBattleText
	text_end

Route24Youngster2BattleText:
	text_far _Route24Youngster2BattleText
	text_end

Route24Youngster2EndBattleText:
	text_far _Route24Youngster2EndBattleText
	text_end

Route24Youngster2AfterBattleText:
	text_far _Route24Youngster2AfterBattleText
	text_end
