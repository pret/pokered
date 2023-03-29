CeladonUniversityOutside_Script:
	call EnableAutoTextBoxDrawing
	ld de, CeladonUniversityOutside_ScriptPointers
	ld a, [wCeladonUniversityOutsideCurScript]
	ret

CeladonUniversityOutside_ScriptPointers:
	dw EndTrainerBattle

CeladonUniversityOutside_TextPointers:
	dw CeladonUniversityOutsideText1
	dw CeladonUniversityOutsideText2
	dw CeladonUniversityOutsideText3
	dw CeladonUniversityOutsideText4
	dw CeladonUniversityOutsideNPC1
	dw CeladonUniversityOutsideNPC2
	dw CeladonMagikarp
	db -1 ; end

CeladonUniversityOutsideText1: ; Starter girl
	text_asm
	ld hl, CeladonUniversityOutsideYesNo1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused

	ld hl, CeladonUniversityOutsideBattleText1
	call PrintText
	
	ld c, BANK(Music_MeetFemaleTrainer)
	ld a, MUSIC_MEET_FEMALE_TRAINER
	call PlayMusic
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_JR_TRAINER_F
	ld [wCurOpponent], a
	ld a, 4
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $2
	ld [wCeladonUniversityOutsideCurScript], a
	ld hl, CeladonUniversityOutsideLoseText1
	ld de, CeladonUniversityOutsideWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText
	call PrintText
	jp TextScriptEnd

CeladonUniversityOutsideText2: ; Porygon guy
	text_asm
	ld hl, CeladonUniversityOutsideYesNo2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused

	ld hl, CeladonUniversityOutsideBattleText2
	call PrintText
	
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_SUPER_NERD
	ld [wCurOpponent], a
	ld a, 6
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $2
	ld [wCeladonUniversityOutsideCurScript], a
	ld hl, CeladonUniversityOutsideLoseText2
	ld de, CeladonUniversityOutsideWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText
	call PrintText
	jp TextScriptEnd

CeladonUniversityOutsideText3: ; Golem guy
	text_asm
	ld hl, CeladonUniversityOutsideYesNo3
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused

	ld hl, CeladonUniversityOutsideBattleText3
	call PrintText
	
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_ENGINEER
	ld [wCurOpponent], a
	ld a, 1
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $2
	ld [wCeladonUniversityOutsideCurScript], a
	ld hl, CeladonUniversityOutsideLoseText3
	ld de, CeladonUniversityOutsideWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText
	call PrintText
	jp TextScriptEnd

CeladonUniversityOutsideText4: ; Mt Moon guy
	text_asm
	ld hl, CeladonUniversityOutsideYesNo4
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused

	ld hl, CeladonUniversityOutsideBattleText4
	call PrintText
	
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_SUPER_NERD
	ld [wCurOpponent], a
	ld a, 7
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $2
	ld [wCeladonUniversityOutsideCurScript], a
	ld hl, CeladonUniversityOutsideLoseText4
	ld de, CeladonUniversityOutsideWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText
	call PrintText
	jp TextScriptEnd

CeladonUniversityOutsideNPC1:
	text_far _CeladonUniversityOutsideNPC1
	text_end
	
CeladonUniversityOutsideNPC2:
	text_far _CeladonUniversityOutsideNPC2
	text_end

CeladonUniversityOutsideBattleText1:
	text_far _CeladonUniversityOutsideBattleText1
	text_end

CeladonUniversityOutsideBattleText2:
	text_far _CeladonUniversityOutsideBattleText2
	text_end

CeladonUniversityOutsideBattleText3:
	text_far _CeladonUniversityOutsideBattleText3
	text_end

CeladonUniversityOutsideBattleText4:
	text_far _CeladonUniversityOutsideBattleText4
	text_end

CeladonUniversityOutsideLoseText1:
	text_far _CeladonUniversityOutsideLoseText1
	text_end

CeladonUniversityOutsideLoseText2:
	text_far _CeladonUniversityOutsideLoseText2
	text_end

CeladonUniversityOutsideLoseText3:
	text_far _CeladonUniversityOutsideLoseText3
	text_end

CeladonUniversityOutsideLoseText4:
	text_far _CeladonUniversityOutsideLoseText4
	text_end

CeladonUniversityOutsideWinText:
	text_far _CeladonUniversityOutsideWinText
	text_end

CeladonUniversityOutsideAfterBattleText:
	text_far _CeladonUniversityOutsideAfterBattleText
	text_end

CeladonUniversityOutsideYesNo1:
	text_far _CeladonUniversityOutsideYesNo1
	text_end

CeladonUniversityOutsideYesNo2:
	text_far _CeladonUniversityOutsideYesNo2
	text_end

CeladonUniversityOutsideYesNo3:
	text_far _CeladonUniversityOutsideYesNo3
	text_end

CeladonUniversityOutsideYesNo4:
	text_far _CeladonUniversityOutsideYesNo4
	text_end

CeladonUniversityRefuse:
	text_far _CeladonUniversityRefuse
	text_end

CeladonMagikarp:
	text_far _CeladonMagikarp
	text_asm
	ld a, MAGIKARP
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

	text_end ; unused
