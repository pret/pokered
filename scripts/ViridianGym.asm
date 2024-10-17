; PureRGBnote: ADDED: code that plays Giovanni's theme if we have the option turned on
; PureRGBnote: CHANGED: code related to spinners found in this map script was GREATLY simplified to reduce the space the script uses.

ViridianGym_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianGymTrainerHeaders
	ld de, ViridianGym_ScriptPointers
	ld a, [wViridianGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianGymCurScript], a
	ret

ViridianGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wViridianGymCurScript], a
	ld [wCurMapScript], a
	ret

ViridianGym_ScriptPointers:
	def_script_pointers
	dw_const ViridianGymDefaultScript,              SCRIPT_VIRIDIANGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VIRIDIANGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VIRIDIANGYM_END_BATTLE
	dw_const ViridianGymGiovanniPostBattle,         SCRIPT_VIRIDIANGYM_GIOVANNI_POST_BATTLE

ViridianGymDefaultScript:
	callfar CheckStartStopSpinning
	; we're doing this here because CheckFightingMapTrainers needs to be run while we're in this map's bank
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	jp z, CheckFightingMapTrainers
	jpfar LoadSpinnerArrowTiles

ViridianGymGiovanniPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ViridianGymResetScripts
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
; fallthrough
ViridianGymReceiveTM27:
	callfar PlayGiovanniMusic
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_EARTH_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	lb bc, TM_GIOVANNI, 1
	call GiveItem
	jr nc, .bag_full
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_RECEIVED_TM27
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM27
	jr .gym_victory
.bag_full
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_TM27_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gym_victory
	ld hl, wObtainedBadges
	set BIT_EARTHBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_EARTHBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7

	ld a, HS_ROUTE_22_RIVAL_2
	ld [wMissableObjectIndex], a
	predef ShowObject
	SetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	callfar PlayDefaultMusicIfMusicBitSet
	jp ViridianGymResetScripts

ViridianGym_TextPointers:
	def_text_pointers
	dw_const ViridianGymGiovanniText,               TEXT_VIRIDIANGYM_GIOVANNI
	dw_const ViridianGymCooltrainerM1Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M1
	dw_const ViridianGymHiker1Text,                 TEXT_VIRIDIANGYM_HIKER1
	dw_const ViridianGymRocker1Text,                TEXT_VIRIDIANGYM_ROCKER1
	dw_const ViridianGymHiker2Text,                 TEXT_VIRIDIANGYM_HIKER2
	dw_const ViridianGymCooltrainerM2Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M2
	dw_const ViridianGymHiker3Text,                 TEXT_VIRIDIANGYM_HIKER3
	dw_const ViridianGymRocker2Text,                TEXT_VIRIDIANGYM_ROCKER2
	dw_const ViridianGymCooltrainerM3Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M3
	dw_const ViridianGymGymGuideText,               TEXT_VIRIDIANGYM_GYM_GUIDE
	dw_const PickUpItemText,                        TEXT_VIRIDIANGYM_ITEM1
	dw_const ViridianGymGiovanniEarthBadgeInfoText, TEXT_VIRIDIANGYM_GIOVANNI_EARTH_BADGE_INFO
	dw_const ViridianGymGiovanniReceivedTM27Text,   TEXT_VIRIDIANGYM_GIOVANNI_RECEIVED_TM27
	dw_const ViridianGymGiovanniTM27NoRoomText,     TEXT_VIRIDIANGYM_GIOVANNI_TM27_NO_ROOM

ViridianGymTrainerHeaders:
	def_trainers 2
ViridianGymTrainerHeader0:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, 4, ViridianGymCooltrainerM1BattleText, ViridianGymCooltrainerM1EndBattleText, ViridianGymCooltrainerM1AfterBattleText
ViridianGymTrainerHeader1:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_1, 4, ViridianGymHiker1BattleText, ViridianGymHiker1EndBattleText, ViridianGymHiker1AfterBattleText
ViridianGymTrainerHeader2:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_2, 4, ViridianGymRocker1BattleText, ViridianGymRocker1EndBattleText, ViridianGymRocker1AfterBattleText
ViridianGymTrainerHeader3:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_3, 2, ViridianGymHiker2BattleText, ViridianGymHiker2EndBattleText, ViridianGymHiker2AfterBattleText
ViridianGymTrainerHeader4:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_4, 3, ViridianGymCooltrainerM2BattleText, ViridianGymCooltrainerM2EndBattleText, ViridianGymCooltrainerM2AfterBattleText
ViridianGymTrainerHeader5:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_5, 4, ViridianGymHiker3BattleText, ViridianGymHiker3EndBattleText, ViridianGymHiker3AfterBattleText
ViridianGymTrainerHeader6:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_6, 3, ViridianGymRocker2BattleText, ViridianGymRocker2EndBattleText, ViridianGymRocker2AfterBattleText
ViridianGymTrainerHeader7:
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7, 4, ViridianGymCooltrainerM3BattleText, ViridianGymCooltrainerM3EndBattleText, ViridianGymCooltrainerM3AfterBattleText
	db -1 ; end

ViridianGymGiovanniText:
	text_asm
	callfar PlayGiovanniMusic
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM27
	jr nz, .afterBeat
	call z, ViridianGymReceiveTM27
	call DisableWaitingAfterTextDisplay
	rst TextScriptEnd
.afterBeat
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PostBattleAdviceText
	rst _PrintText
	call GBFadeOutToBlack
	ld a, HS_VIRIDIAN_GYM_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	CheckEvent EVENT_CAUGHT_GHOST_MAROWAK
	jr z, .dontMoveKarateKing
	ld a, VIRIDIANGYM_HIKER3
	call SetSpriteFacingUp
	; move karate king position for ghost marowak text
	ld c, VIRIDIANGYM_HIKER3
	lb de, 0, 1 ; same x coord, down 1 y coord
	callfar FarMoveSpriteInRelationToPlayer
	call UpdateSprites
.dontMoveKarateKing
	call GBFadeInFromBlack
	callfar PlayDefaultMusicIfMusicBitSet
;;;;; PureRGBnote: ADDED: if you caught ghost marowak, a scene where marowak tells the player to lay it to rest plays after
;;;;; giovanni disappears.
	CheckEvent EVENT_CAUGHT_GHOST_MAROWAK
	jr z, .text_script_end
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld hl, .GhostMarowakText
	rst _PrintText
	ld a, SFX_TELEPORT_EXIT_2
	call PlaySoundWaitForCurrent
	ld d, VIRIDIANGYM_HIKER3
	callfar FarNPCSpriteQuickSpin
	rst TextScriptEnd
;;;;;
.beforeBeat
	ld hl, .PreBattleText
	rst _PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedEarthBadgeText
	ld de, .ReceivedEarthBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $8
	ld [wGymLeaderNo], a
	ld a, SCRIPT_VIRIDIANGYM_GIOVANNI_POST_BATTLE
	ld [wViridianGymCurScript], a
.text_script_end
	rst TextScriptEnd

.PreBattleText:
	text_far _ViridianGymGiovanniPreBattleText
	text_end

.ReceivedEarthBadgeText:
	text_far _ViridianGymGiovanniReceivedEarthBadgeText
	sound_level_up ; probably supposed to play SFX_GET_ITEM_1 but the wrong music bank is loaded
	text_end

.PostBattleAdviceText:
	text_far _ViridianGymGiovanniPostBattleAdviceText
	text_waitbutton
	text_end

.GhostMarowakText:
	text_far _GhostMarowakAfterGiovanniText
	text_waitbutton
	text_end

ViridianGymGiovanniEarthBadgeInfoText:
	text_far _ViridianGymGiovanniEarthBadgeInfoText
	text_end

ViridianGymGiovanniReceivedTM27Text:
	text_far _ViridianGymGiovanniReceivedTM27Text
	sound_get_item_1

ViridianGymGiovanniTM27ExplanationText:
	text_far _ViridianGymGiovanniTM27ExplanationText
	text_end

ViridianGymGiovanniTM27NoRoomText:
	text_far _ViridianGymGiovanniTM27NoRoomText
	text_end

ViridianGymCooltrainerM1Text:
	text_asm
	ld hl, ViridianGymTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymCooltrainerM1BattleText:
	text_far _ViridianGymCooltrainerM1BattleText
	text_end

ViridianGymCooltrainerM1EndBattleText:
	text_far _ViridianGymCooltrainerM1EndBattleText
	text_end

ViridianGymCooltrainerM1AfterBattleText:
	text_far _ViridianGymCooltrainerM1AfterBattleText
	text_end

ViridianGymHiker1Text:
	text_asm
	ld hl, ViridianGymTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymHiker1BattleText:
	text_far _ViridianGymHiker1BattleText
	text_end

ViridianGymHiker1EndBattleText:
	text_far _ViridianGymHiker1EndBattleText
	text_end

ViridianGymHiker1AfterBattleText:
	text_far _ViridianGymHiker1AfterBattleText
	text_end

ViridianGymRocker1Text:
	text_asm
	ld hl, ViridianGymTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymRocker1BattleText:
	text_far _ViridianGymRocker1BattleText
	text_end

ViridianGymRocker1EndBattleText:
	text_far _ViridianGymRocker1EndBattleText
	text_end

ViridianGymRocker1AfterBattleText:
	text_far _ViridianGymRocker1AfterBattleText
	text_end

ViridianGymHiker2Text:
	text_asm
	ld hl, ViridianGymTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymHiker2BattleText:
	text_far _ViridianGymHiker2BattleText
	text_end

ViridianGymHiker2EndBattleText:
	text_far _ViridianGymHiker2EndBattleText
	text_end

ViridianGymHiker2AfterBattleText:
	text_far _ViridianGymHiker2AfterBattleText
	text_end

ViridianGymCooltrainerM2Text:
	text_asm
	ld hl, ViridianGymTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymCooltrainerM2BattleText:
	text_far _ViridianGymCooltrainerM2BattleText
	text_end

ViridianGymCooltrainerM2EndBattleText:
	text_far _ViridianGymCooltrainerM2EndBattleText
	text_end

ViridianGymCooltrainerM2AfterBattleText:
	text_far _ViridianGymCooltrainerM2AfterBattleText
	text_end

ViridianGymHiker3Text:
	text_asm
;;;;; PureRGBnote: ADDED: if the ghost marowak scene has just played, make him say something about it.
	CheckBothEventsSet EVENT_CAUGHT_GHOST_MAROWAK, EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .normal
	ld a, [wSprite07StateData2MapX]
	cp 14 ; 10 + 4 = normal position
	jr z, .normal
	ld hl, .what
	rst _PrintText
	rst TextScriptEnd
.normal
	ld hl, ViridianGymTrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd
;;;;;
.what
	text_far _ViridianGymHiker3WhatText
	text_end

ViridianGymHiker3BattleText:
	text_far _ViridianGymHiker3BattleText
	text_end

ViridianGymHiker3EndBattleText:
	text_far _ViridianGymHiker3EndBattleText
	text_end

ViridianGymHiker3AfterBattleText:
	text_far _ViridianGymHiker3AfterBattleText
	text_end

ViridianGymRocker2Text:
	text_asm
	ld hl, ViridianGymTrainerHeader6
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymRocker2BattleText:
	text_far _ViridianGymRocker2BattleText
	text_end

ViridianGymRocker2EndBattleText:
	text_far _ViridianGymRocker2EndBattleText
	text_end

ViridianGymRocker2AfterBattleText:
	text_far _ViridianGymRocker2AfterBattleText
	text_end

ViridianGymCooltrainerM3Text:
	text_asm
	ld hl, ViridianGymTrainerHeader7
	call TalkToTrainer
	rst TextScriptEnd

ViridianGymCooltrainerM3BattleText:
	text_far _ViridianGymCooltrainerM3BattleText
	text_end

ViridianGymCooltrainerM3EndBattleText:
	text_far _ViridianGymCooltrainerM3EndBattleText
	text_end

ViridianGymCooltrainerM3AfterBattleText:
	text_far _ViridianGymCooltrainerM3AfterBattleText
	text_end

ViridianGymGymGuideText: ; PureRGBnote: ADDED: gym guide gives you apex chips after beating the leader
	text_asm
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .afterBeat
	ld hl, ViridianGymGuidePreBattleText
	rst _PrintText
	jr .done
.afterBeat
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt
	ld hl, ViridianGymGuidePostBattleTextPrompt
	rst _PrintText
	CheckEvent EVENT_GOT_VIRIDIAN_APEX_CHIPS
	jr nz, .alreadyApexChips
.giveApexChips
	ld hl, GymGuideMoreApexChipText8
	rst _PrintText
	lb bc, APEX_CHIP, 2
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedApexChipsText8
	rst _PrintText
	ld hl, ViridianGymGuideApexChipGroundText
	rst _PrintText
	SetEvent EVENT_GOT_VIRIDIAN_APEX_CHIPS
.alreadyApexChips
	ld hl, AlreadyReceivedApexChipsText8
	rst _PrintText
	jr .done
.BagFull
	ld hl, ApexNoRoomText8
	rst _PrintText
.done
	rst TextScriptEnd
.donePrompt
	ld hl, ViridianGymGuidePostBattleText
	rst _PrintText
	jr .done

ReceivedApexChipsText8:
	text_far _ReceivedApexChipsText
	sound_get_item_1
	text_end

ApexNoRoomText8:
	text_far _PewterGymTM34NoRoomText
	text_end

GymGuideMoreApexChipText8:
	text_far _GymGuideMoreApexChipText
	text_end

AlreadyReceivedApexChipsText8:
	text_far _ViridianGymGuideSeeAtPokemonLeagueText
	text_end

ViridianGymGuideApexChipGroundText:
	text_far _ViridianGymGuideApexChipGroundText
	text_end

ViridianGymGuidePreBattleText:
	text_far _ViridianGymGuidePreBattleText
	text_end

ViridianGymGuidePostBattleText:
	text_far _ViridianGymGuidePostBattleText
	text_end

ViridianGymGuidePostBattleTextPrompt:
	text_far _ViridianGymGuidePostBattleText
	text_promptbutton
	text_end
