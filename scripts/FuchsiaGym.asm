FuchsiaGym_Script:
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaGymTrainerHeaders
	ld de, FuchsiaGym_ScriptPointers
	ld a, [wFuchsiaGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFuchsiaGymCurScript], a
	ret

FuchsiaGymResetScripts:
	xor a ; SCRIPT_FUCHSIAGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wFuchsiaGymCurScript], a
	ld [wCurMapScript], a
	ret

FuchsiaGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_FUCHSIAGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_FUCHSIAGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_FUCHSIAGYM_END_BATTLE
	dw_const FuchsiaGymKogaPostBattleScript,        SCRIPT_FUCHSIAGYM_KOGA_POST_BATTLE

FuchsiaGymKogaPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, FuchsiaGymResetScripts
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
; fallthrough
FuchsiaGymReceiveTM06:
	ld a, TEXT_FUCHSIAGYM_KOGA_SOUL_BADGE_INFO
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_KOGA
	lb bc, TM_KOGA, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_FUCHSIAGYM_KOGA_RECEIVED_TM06
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM06
	jr .gymVictory
.BagFull
	ld a, TEXT_FUCHSIAGYM_KOGA_TM06_NO_ROOM
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_SOULBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_SOULBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, EVENT_BEAT_FUCHSIA_GYM_TRAINER_5

	jp FuchsiaGymResetScripts

FuchsiaGym_TextPointers:
	def_text_pointers
	dw_const FuchsiaGymKogaText,              TEXT_FUCHSIAGYM_KOGA
	dw_const FuchsiaGymJuggler1Text,          TEXT_FUCHSIAGYM_JUGGLER1
	dw_const FuchsiaGymJuggler2Text,          TEXT_FUCHSIAGYM_JUGGLER2
	dw_const FuchsiaGymJuggler3Text,          TEXT_FUCHSIAGYM_JUGGLER3
	dw_const FuchsiaGymTamer1Text,            TEXT_FUCHSIAGYM_TAMER1
	dw_const FuchsiaGymTamer2Text,            TEXT_FUCHSIAGYM_TAMER2
	dw_const FuchsiaGymJuggler4Text,          TEXT_FUCHSIAGYM_JUGGLER4
	dw_const FuchsiaGymGymGuideText,          TEXT_FUCHSIAGYM_GYM_GUIDE
	dw_const FuchsiaGymKogaSoulBadgeInfoText, TEXT_FUCHSIAGYM_KOGA_SOUL_BADGE_INFO
	dw_const FuchsiaGymKogaReceivedTM06Text,  TEXT_FUCHSIAGYM_KOGA_RECEIVED_TM06
	dw_const FuchsiaGymKogaTM06NoRoomText,    TEXT_FUCHSIAGYM_KOGA_TM06_NO_ROOM

FuchsiaGymTrainerHeaders:
	def_trainers 2
FuchsiaGymTrainerHeader0:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, 2, FuchsiaGymJuggler1BattleText, FuchsiaGymJuggler1EndBattleText, FuchsiaGymJuggler1AfterBattleText
FuchsiaGymTrainerHeader1:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_1, 2, FuchsiaGymJuggler2BattleText, FuchsiaGymJuggler2EndBattleText, FuchsiaGymJuggler2AfterBattleText
FuchsiaGymTrainerHeader2:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_2, 4, FuchsiaGymJuggler3BattleText, FuchsiaGymJuggler3EndBattleText, FuchsiaGymJuggler3AfterBattleText
FuchsiaGymTrainerHeader3:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_3, 2, FuchsiaGymTamer1BattleText, FuchsiaGymTamer1EndBattleText, FuchsiaGymTamer1AfterBattleText
FuchsiaGymTrainerHeader4:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_4, 2, FuchsiaGymTamer2BattleText, FuchsiaGymTamer2EndBattleText, FuchsiaGymTamer2AfterBattleText
FuchsiaGymTrainerHeader5:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_5, 2, FuchsiaGymJuggler4BattleText, FuchsiaGymJuggler4EndBattleText, FuchsiaGymJuggler4AfterBattleText
	db -1 ; end

FuchsiaGymKogaText:
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM06
	jr nz, .afterBeat
	call z, FuchsiaGymReceiveTM06
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, .PostBattleAdviceText
	rst _PrintText
	jr .done
.beforeBeat
	ld hl, .BeforeBattleText
	rst _PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, .ReceivedSoulBadgeText
	ld de, .ReceivedSoulBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $5
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_FUCHSIAGYM_KOGA_POST_BATTLE
	ld [wFuchsiaGymCurScript], a
.done
	rst TextScriptEnd

.BeforeBattleText:
	text_far _FuchsiaGymKogaBeforeBattleText
	text_end

.ReceivedSoulBadgeText:
	text_far _FuchsiaGymKogaReceivedSoulBadgeText
	text_end

.PostBattleAdviceText:
	text_far _FuchsiaGymKogaPostBattleAdviceText
	text_end

FuchsiaGymKogaSoulBadgeInfoText:
	text_far _FuchsiaGymKogaSoulBadgeInfoText
	text_end

FuchsiaGymKogaReceivedTM06Text:
	text_far _FuchsiaGymKogaReceivedTM06Text
	sound_get_key_item
	text_far _FuchsiaGymKogaTM06ExplanationText
	text_end

FuchsiaGymKogaTM06NoRoomText:
	text_far _FuchsiaGymKogaTM06NoRoomText
	text_end

FuchsiaGymJuggler1Text:
	text_asm
	ld hl, FuchsiaGymTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

FuchsiaGymJuggler1BattleText:
	text_far _FuchsiaGymJuggler1BattleText
	text_end

FuchsiaGymJuggler1EndBattleText:
	text_far _FuchsiaGymJuggler1EndBattleText
	text_end

FuchsiaGymJuggler1AfterBattleText:
	text_far _FuchsiaGymJuggler1AfterBattleText
	text_end

FuchsiaGymJuggler2Text:
	text_asm
	ld hl, FuchsiaGymTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

FuchsiaGymJuggler2BattleText:
	text_far _FuchsiaGymJuggler2BattleText
	text_end

FuchsiaGymJuggler2EndBattleText:
	text_far _FuchsiaGymJuggler2EndBattleText
	text_end

FuchsiaGymJuggler2AfterBattleText:
	text_far _FuchsiaGymJuggler2AfterBattleText
	text_end

FuchsiaGymJuggler3Text:
	text_asm
	ld hl, FuchsiaGymTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

FuchsiaGymJuggler3BattleText:
	text_far _FuchsiaGymJuggler3BattleText
	text_end

FuchsiaGymJuggler3EndBattleText:
	text_far _FuchsiaGymJuggler3EndBattleText
	text_end

FuchsiaGymJuggler3AfterBattleText:
	text_far _FuchsiaGymJuggler3AfterBattleText
	text_end

FuchsiaGymTamer1Text:
	text_asm
	ld hl, FuchsiaGymTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

FuchsiaGymTamer1BattleText:
	text_far _FuchsiaGymTamer1BattleText
	text_end

FuchsiaGymTamer1EndBattleText:
	text_far _FuchsiaGymTamer1EndBattleText
	text_end

FuchsiaGymTamer1AfterBattleText:
	text_far _FuchsiaGymTamer1AfterBattleText
	text_end

FuchsiaGymTamer2Text:
	text_asm
	ld hl, FuchsiaGymTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

FuchsiaGymTamer2BattleText:
	text_far _FuchsiaGymTamer2BattleText
	text_end

FuchsiaGymTamer2EndBattleText:
	text_far _FuchsiaGymTamer2EndBattleText
	text_end

FuchsiaGymTamer2AfterBattleText:
	text_far _FuchsiaGymTamer2AfterBattleText
	text_end

FuchsiaGymJuggler4Text:
	text_asm
	ld hl, FuchsiaGymTrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd

FuchsiaGymJuggler4BattleText:
	text_far _FuchsiaGymJuggler4BattleText
	text_end

FuchsiaGymJuggler4EndBattleText:
	text_far _FuchsiaGymJuggler4EndBattleText
	text_end

FuchsiaGymJuggler4AfterBattleText:
	text_far _FuchsiaGymJuggler4AfterBattleText
	text_end

FuchsiaGymGymGuideText: ; PureRGBnote: ADDED: gym guide gives you apex chips after beating the leader
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	jr nz, .afterBeat
	ld hl, FuchsiaGymChampInMakingText
	rst _PrintText
	jr .done
.afterBeat
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt
	ld hl, FuchsiaGymGuidePostBattleTextPrompt
	rst _PrintText
	CheckEvent EVENT_GOT_FUCHSIA_APEX_CHIPS
	jr nz, .alreadyApexChips
.giveApexChips
	ld hl, GymGuideMoreApexChipText5
	rst _PrintText
	lb bc, APEX_CHIP, 2
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedApexChipsText5
	rst _PrintText
	ld hl, FuchsiaGymGuideApexChipPoisonText
	rst _PrintText
	SetEvent EVENT_GOT_FUCHSIA_APEX_CHIPS
.alreadyApexChips
	ld hl, AlreadyReceivedApexChipsText5
	rst _PrintText
	jr .done
.BagFull
	ld hl, ApexNoRoomText5
	rst _PrintText
.done
	rst TextScriptEnd
.donePrompt
	ld hl, FuchsiaGymGuidePostBattleText
	rst _PrintText
	jr .done

ReceivedApexChipsText5:
	text_far _ReceivedApexChipsText
	sound_get_item_1
	text_end

ApexNoRoomText5:
	text_far _PewterGymTM34NoRoomText
	text_end

GymGuideMoreApexChipText5:
	text_far _GymGuideMoreApexChipText
	text_end

AlreadyReceivedApexChipsText5:
	text_far _AlreadyReceivedApexChipsText
	text_end

FuchsiaGymChampInMakingText:
	text_far _FuchsiaGymGymGuideChampInMakingText
	text_end

FuchsiaGymGuidePostBattleText:
	text_far _FuchsiaGymGymGuideBeatKogaText
	text_end

FuchsiaGymGuidePostBattleTextPrompt:
	text_far _FuchsiaGymGymGuideBeatKogaText
	text_promptbutton
	text_end

FuchsiaGymGuideApexChipPoisonText:
	text_far _FuchsiaGymGuideApexChipPoisonText
	text_end