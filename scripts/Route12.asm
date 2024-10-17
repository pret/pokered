; PureRGBnote: ADDED: new trainers on this route.

Route12_Script:
	call EnableAutoTextBoxDrawing
	call Route12CheckHideCutTree
	ld hl, Route12TrainerHeaders
	ld de, Route12_ScriptPointers
	ld a, [wRoute12CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute12CurScript], a
	ret

; PureRGBnote: ADDED: code that keeps the cut tree cut down if we're in its alcove. Prevents getting softlocked if you delete cut.
Route12CheckHideCutTree:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl] ; did we load the map from a save/warp/door/battle, etc?
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z ; map wasn't just loaded
	ld de, Route12CutAlcove1
	callfar FarArePlayerCoordsInRange
	lb bc, 44, 3
	ld a, $4C
	call c, .removeTreeBlocker
	ld de, Route12CutAlcove2
	callfar FarArePlayerCoordsInRange
	lb bc, 49, 4
	ld a, $6C
	call c, .removeTreeBlocker
	ret
.removeTreeBlocker
	; if we're in the cut alcove, remove the tree
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

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
	jp z, CheckFightingMapTrainers
	call SnorlaxWakesUpAnimation
	ld a, TEXT_ROUTE12_SNORLAX_WOKE_UP
	ldh [hTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 40 ; PureRGBnote: CHANGED: raised snorlax's level to balance with party levels
	ld [wCurEnemyLevel], a
	ld a, ROUTE12_SNORLAX
	ldh [hSpriteIndex], a ; makes snorlax stay on screen during battle transition
	ld a, SCRIPT_ROUTE12_SNORLAX_POST_BATTLE
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

; PureRGBnote: ADDED: There's a new animation when snorlax wakes up.
SnorlaxWakesUpAnimation::
	; show an exclamation bubble when snorlax wakes up for effect
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, [wAudioROMBank]
	push af
	ld a, BANK(ExclamationBubbleSFX)
	ld [wAudioROMBank], a
	ld de, ExclamationBubbleSFX
	call PlayNewSoundChannel5
	ld a, EXCLAMATION_BUBBLE
	call Route12PrepareEmotionBubble
	call WaitForSoundToFinish
	pop af
	ld [wAudioROMBank], a
	ld a, SNORLAX
	call PlayCry
	; make snorlax move around a bit
	ld b, 12
.loop
	push bc
	srl b
	ld de, PartyMonSprites2 tile 10
	lb bc, BANK(PartyMonSprites2), 2
	jr nc, .replaceSprite
	ld de, SnorlaxSprite
	lb bc, BANK(SnorlaxSprite), 2
.replaceSprite
	ld hl, vNPCSprites tile $7C
	call CopyVideoData
	pop bc
	rst _DelayFrame
	rst _DelayFrame
	dec b
	jr nz, .loop
	ret

Route12SnorlaxPostBattleScript:
	ResetEvent EVENT_FIGHT_ROUTE12_SNORLAX
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route12ResetScripts
	ld hl, wCurrentMapScriptFlags
	res BIT_MAP_LOADED_AFTER_BATTLE, [hl] ; indicates we loaded the map after battle, since we went to a script need to reset here to prevent a double fade
	ld a, [wBattleFunctionalFlags]
	bit 1, a ; ran from battle
	jr nz, .goBackToSleep
	ld a, [wBattleResult]
	cp $2 ; caught pokemon (or ran away)
	jr z, .caught_snorlax
.didntCatch
	ld a, TEXT_ROUTE12_SNORLAX_CALMED_DOWN
	call FadeInAndDisplayText
	ld d, SFX_RUN
	ld hl, .snorlaxruns
	call PlayBattleSFXWhenNotInBattle
	call .hide_snorlax
	jr .done
.snorlaxruns
	ld a, 0
.loop
	push af
	ld d, ROUTE12_SNORLAX
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_DOWN
	jr z, .moveDown
	callfar FarSlideSpriteUp
	jr .doneSlide
.moveDown
	callfar FarSlideSpriteDown
.doneSlide
	pop af
	call ReplaceSnorlaxSprite
	inc a
	cp 5
	jr nz, .loop
	ret
.caught_snorlax
	call .hide_snorlax
	call GBFadeInFromWhite
	jr .done
.hide_snorlax
	SetEvent EVENT_BEAT_ROUTE12_SNORLAX
	ld a, HS_ROUTE_12_SNORLAX
	ld [wMissableObjectIndex], a
	predef_jump HideObject
.done
	ld a, SCRIPT_ROUTE12_DEFAULT
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret
.goBackToSleep
	ld a, TEXT_ROUTE12_SNORLAX_WENT_BACK_TO_SLEEP
	call FadeInAndDisplayText
	jr .done

FadeInAndDisplayText:
	ldh [hTextID], a
	call GBFadeInFromWhite
	jp DisplayTextID

ReplaceSnorlaxSprite:
	ld d, 0
	ld e, a
	push af
	and %11 ; only first 2 bits so it loops
	ld hl, SnorlaxRollingSprites
	add hl, de
	add hl, de
	hl_deref
	pop af
	push af
	and %11 ; only first 2 bits so it loops
	cp 3
	lb bc, BANK(SnorlaxSprite), 4
	jr z, .load
	lb bc, BANK(SnorlaxRollingSprite), 4
.load
	ld d, h
	ld e, l
	ld hl, vNPCSprites tile $7C
	call CopyVideoData
	pop af
	ret

SnorlaxRollingSprites:
	dw SnorlaxRollingSprite
	dw SnorlaxRollingSprite tile 4
	dw SnorlaxRollingSprite tile 8
	dw SnorlaxSprite



Route12_TextPointers:
	def_text_pointers
	dw_const SnorlaxText,                  TEXT_ROUTE12_SNORLAX
	dw_const Route12Fisher1Text,           TEXT_ROUTE12_FISHER1
	dw_const Route12Fisher2Text,           TEXT_ROUTE12_FISHER2
	dw_const Route12CooltrainerMText,      TEXT_ROUTE12_COOLTRAINER_M
	dw_const Route12SuperNerdText,         TEXT_ROUTE12_ROCKER
	dw_const Route12Fisher3Text,           TEXT_ROUTE12_FISHER3
	dw_const Route12Fisher4Text,           TEXT_ROUTE12_FISHER4
	dw_const Route12Fisher5Text,           TEXT_ROUTE12_FISHER5
	dw_const Route12Text9,                 TEXT_ROUTE12_TAMER
	dw_const Route12Text10,                TEXT_ROUTE12_SUPER_NERD
	dw_const PickUpItemText,               TEXT_ROUTE12_ITEM1
	dw_const PickUpItemText,               TEXT_ROUTE12_ITEM2
	dw_const PickUpItemText,               TEXT_ROUTE12_ITEM3 ; PureRGBnote: ADDED: new item in this location
	dw_const Route12SignText,              TEXT_ROUTE12_SIGN
	dw_const Route12SportFishingSignText,  TEXT_ROUTE12_SPORT_FISHING_SIGN
	dw_const Route12SnorlaxWokeUpText,     TEXT_ROUTE12_SNORLAX_WOKE_UP
	dw_const Route12SnorlaxCalmedDownText, TEXT_ROUTE12_SNORLAX_CALMED_DOWN
	dw_const Route12SnorlaxWentBackToSleepText, TEXT_ROUTE12_SNORLAX_WENT_BACK_TO_SLEEP

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
Route12TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_7, 4, Route12BattleText8, Route12EndBattleText8, Route12AfterBattleText8
Route12TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_8, 3, Route12BattleText9, Route12EndBattleText9, Route12AfterBattleText9
	db -1 ; end

SnorlaxText:: ; PureRGBnote: CHANGED: now also used by route 16's snorlax
	text_asm
	call SnorlaxSnoring
	ld hl, .sleeping
	rst _PrintText
	rst TextScriptEnd
.sleeping
	text_far _Route12SnorlaxText
	text_end

; PureRGBnote: ADDED: when you talk to sleeping snorlax, there's a little snoring animation.
SnorlaxSnoring::
	call .sound
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld c, 10
	rst _DelayFrames
.sound
	ld d, SFX_BATTLE_21
	lb bc, $10, $12
	ld hl, .showEmotionBubble
	jp PlayBattleSFXWhenNotInBattleWithMods
.showEmotionBubble
	ld a, SLEEPING_BUBBLE
	jp Route12PrepareEmotionBubble

Route12PrepareEmotionBubble:
  	ld [wWhichEmotionBubble], a
  	ld a, [wCurMap]
  	cp ROUTE_12
	ld a, ROUTE12_SNORLAX
  	jr z, .load
  	ld a, ROUTE16_SNORLAX
.load
	ld [wEmotionBubbleSpriteIndex], a
	predef_jump EmotionBubble

Route12SnorlaxWokeUpText: ; PureRGBnote: CHANGED: now also used by route 16's snorlax
	text_asm
	ld hl, .wokeUp
	rst _PrintText
	callfar PlayTrainerMusic
	rst TextScriptEnd
.wokeUp
	text_far _Route12SnorlaxWokeUpText
	text_end

Route12SnorlaxCalmedDownText: ; PureRGBnote: CHANGED: now also used by route 16's snorlax
	text_far _Route12SnorlaxCalmedDownText
	text_end

Route12Fisher1Text:
	text_asm
	ld hl, Route12TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

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
	rst TextScriptEnd

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
	rst TextScriptEnd

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
	rst TextScriptEnd

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
	rst TextScriptEnd

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
	rst TextScriptEnd

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
	rst TextScriptEnd

Route12Fisher5BattleText:
	text_far _Route12Fisher5BattleText
	text_end

Route12Fisher5EndBattleText:
	text_far _Route12Fisher5EndBattleText
	text_end

Route12Fisher5AfterBattleText:
	text_far _Route12Fisher5AfterBattleText
	text_end

Route12Text9:
	text_asm
	ld hl, Route12TrainerHeader7
	call TalkToTrainer
	rst TextScriptEnd

Route12BattleText8:
	text_far _Route12BattleText8
	text_end

Route12EndBattleText8:
	text_far _Route12EndBattleText8
	text_end

Route12AfterBattleText8:
	text_far _Route12AfterBattleText8
	text_end

Route12Text10:
	text_asm
	ld hl, Route12TrainerHeader8
	call TalkToTrainer
	rst TextScriptEnd

Route12BattleText9:
	text_far _Route12BattleText9
	text_end

Route12EndBattleText9:
	text_far _Route12EndBattleText9
	text_end

Route12AfterBattleText9:
	text_far _Route12AfterBattleText9
	text_end

Route12SignText:
	text_far _Route12SignText
	text_end

Route12SportFishingSignText:
	text_far _Route12SportFishingSignText
	text_end

Route12SnorlaxWentBackToSleepText:
	text_far _SnorlaxWentBackToSleepText
	text_end