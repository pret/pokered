ViridianPreGym_Script:
	call EnableAutoTextBoxDrawing
	ld de, ViridianPreGym_ScriptPointers
	ld a, [wViridianPreGymCurScript]
	ret

ViridianPreGym_ScriptPointers:
	dw EndTrainerBattle

ViridianPreGym_TextPointers:
	dw YujirouText

YujirouText:
	text_asm
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
	ld [wIsTrainerBattle], a ; note to self - make him play gym music...somehow.
	ld a, $2
	ld [wViridianPreGymCurScript], a
	ld hl, YujirouLoseText
	ld de, YujirouWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .done
	ld hl, YujirouAfterBattleText
	call PrintText
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

	text_end ; unused
