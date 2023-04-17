ViridianPreGym_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianPreGymTrainerHeaders
	ld de, ViridianPreGym_ScriptPointers
	ld a, [wViridianPreGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianPreGymCurScript], a
	ret

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
	SetEvent EVENT_BEAT_YUJIROU, EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_1
	jp ViridianPreGymResetScripts

ViridianPreGym_TextPointers:
	dw YujirouText
	dw YujirouHasBeenBeaten
	dw YujirouRematch
	dw ViridianPreGymText1
	dw ViridianPreGymText2
	dw ViridianPreGymGuide
	dw ViridianPreGymSign1
	dw ViridianPreGymSign2
	dw ViridianPreGymSign3
	dw ViridianPreGymSign4
	dw ViridianPreGymStatue1
	dw ViridianPreGymStatue2

ViridianPreGymTrainerHeaders:
	def_trainers 3
ViridianPreGymTrainerHeader0:
	trainer EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_0, 3, ViridianPreGymBattleText1, ViridianPreGymEndBattleText1, ViridianPreGymAfterBattleText1
ViridianPreGymTrainerHeader1:
	trainer EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_1, 3, ViridianPreGymBattleText2, ViridianPreGymEndBattleText2, ViridianPreGymAfterBattleText2
	db -1 ;end

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

ViridianPreGymText1:
	text_asm
	ld hl, ViridianPreGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianPreGymBattleText1:
	text_far _ViridianPreGymBattleText1
	text_end

ViridianPreGymEndBattleText1:
	text_far _ViridianPreGymEndBattleText1
	text_end

ViridianPreGymAfterBattleText1:
	text_far _ViridianPreGymAfterBattleText1
	text_end

ViridianPreGymText2:
	text_asm
	ld hl, ViridianPreGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianPreGymBattleText2:
	text_far _ViridianPreGymBattleText2
	text_end

ViridianPreGymEndBattleText2:
	text_far _ViridianPreGymEndBattleText2
	text_end

ViridianPreGymAfterBattleText2:
	text_far _ViridianPreGymAfterBattleText2
	text_end

ViridianPreGymGuide:
	text_far _ViridianPreGymGuide
	text_end

ViridianPreGymSign1:
	text_far _ViridianPreGymSign1
	text_end

ViridianPreGymSign2:
	text_far _ViridianPreGymSign2
	text_end

ViridianPreGymSign3:
	text_far _ViridianPreGymSign3
	text_end

ViridianPreGymSign4:
	text_far _ViridianPreGymSign4
	text_end

ViridianPreGymStatue1:
	text_far _PreGymStatueText
	text_end

ViridianPreGymStatue2:
	text_far _PreGymStatueText
	text_end

	text_end ; unused
