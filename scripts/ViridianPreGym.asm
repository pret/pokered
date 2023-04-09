; This code has a lot of problems with solutions that barely escape me. Many references from Erika's Gym have been taken to make a fight that cannot be done again, but with a rematch later. In other words, your average gym.
; SetEvent EVENT_BEAT_YUJIROU does not seem to be applying.
; It's very easy to cause an infinite loop where you somehow get catapulted into the rematch fight
; And much more. 
; Commit on 30-3-23 has a somewhat stable version of the fight.

ViridianPreGym_Script:
	ld de, ViridianPreGym_ScriptPointers
	ld a, [wViridianPreGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianPreGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "VIRIDIAN PRE-GYM@"

.LeaderName:
	db "YUJIROU@"
	
ViridianPreGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wViridianPreGymCurScript], a
	ld [wCurMapScript], a
	ret

ViridianPreGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw ViridianGymYujirouPostBattle

ViridianGymYujirouPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ViridianGymResetScripts
	ld a, $f0
	ld [wJoyIgnore], a

YujirouHasBeenBeaten:
	SetEvent EVENT_BEAT_YUJIROU
	jp ViridianPreGymResetScripts

ViridianPreGym_TextPointers:
	dw YujirouText
	dw YujirouHasBeenBeaten
	dw YujirouRematch

YujirouText:
	text_asm
	
	CheckEvent EVENT_BEAT_YUJIROU
	jr nz, .YujirouBeaten
	
	ld hl, YujirouIntro
	call PrintText
	
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_YUJIROU
	ld [wCurOpponent], a
	ld a, 1
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld hl, YujirouLoseText
	ld de, YujirouWinText
	call SaveEndBattleTextPointers
	ld a, $3
	ld [wViridianPreGymCurScript], a
	ld [wCurMapScript], a
	jr .done
.YujirouBeaten
	ld hl, YujirouAfterBattleText
	call PrintText
	jr .done
.done
	jp TextScriptEnd
; where the hell do i put SetEvent EVENT_BEAT_YUJIROU



YujirouIntro::
	text_far _YujirouIntro
	text_end
	
YujirouLoseText::
	text_far _YujirouLoseText
	text_end

YujirouWinText::
	text_far _YujirouWinText
	text_end

YujirouAfterBattleText::
	text_far _YujirouAfterBattleText
	text_end

YujirouRematch:
	text_asm
	ld hl, YujirouIntro2
	call PrintText
	
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_YUJIROU
	ld [wCurOpponent], a
	ld a, 2
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $2
	ld [wViridianPreGymCurScript], a
	ld hl, YujirouLoseText2
	ld de, YujirouWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .done
	ld hl, YujirouAfterBattleText2
	call PrintText
	jp TextScriptEnd

YujirouIntro2::
	text_far _YujirouIntro2
	text_end
	
YujirouLoseText2::
	text_far _YujirouLoseText2
	text_end

YujirouAfterBattleText2::
	text_far _YujirouAfterBattleText2
	text_end

	text_end ; unused
