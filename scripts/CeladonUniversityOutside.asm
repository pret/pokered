CeladonUniversityOutside_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeladonUniversityOutsideTrainerHeaders
	ld de, CeladonUniversityOutside_ScriptPointers
	; ld a, [wCeladonUniversityOutsideCurScript] these caused the trainers to have lines of sight?
	; call ExecuteCurMapScriptInTable
	; ld [wCeladonUniversityOutsideCurScript], a
	ret

CeladonUniversityOutside_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

CeladonUniversityOutside_TextPointers:
	dw CeladonUniversityOutsideText1
	dw CeladonUniversityOutsideText2
	dw CeladonUniversityOutsideText3
	dw CeladonUniversityOutsideText4
	dw CeladonUniversityOutsideNPC1
	dw CeladonUniversityOutsideNPC2
	dw CeladonMagikarp

CeladonUniversityOutsideTrainerHeaders:
	def_trainers 2
CeladonUniversityOutsideTrainerHeader0:
	trainer EVENT_BEAT_CELADON_UNIVERSITY_OUTSIDE_TRAINER_0, 3, CeladonUniversityOutsideBattleText1, CeladonUniversityOutsideEndBattleText1, CeladonUniversityOutsideAfterBattleText1
CeladonUniversityOutsideTrainerHeader1:
	trainer EVENT_BEAT_CELADON_UNIVERSITY_OUTSIDE_TRAINER_1, 3, CeladonUniversityOutsideBattleText1, CeladonUniversityOutsideEndBattleText1, CeladonUniversityOutsideAfterBattleText1
CeladonUniversityOutsideTrainerHeader2:
	trainer EVENT_BEAT_CELADON_UNIVERSITY_OUTSIDE_TRAINER_2, 3, CeladonUniversityOutsideBattleText1, CeladonUniversityOutsideEndBattleText1, CeladonUniversityOutsideAfterBattleText1
CeladonUniversityOutsideTrainerHeader3:
	trainer EVENT_BEAT_CELADON_UNIVERSITY_OUTSIDE_TRAINER_3, 3, CeladonUniversityOutsideBattleText1, CeladonUniversityOutsideEndBattleText1, CeladonUniversityOutsideAfterBattleText1
	db -1 ; end

CeladonUniversityOutsideText1: ; Starter girl
	text_asm
	ld hl, CeladonUniversityOutsideYesNo1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, CeladonUniversityOutsideTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText1
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
	ld hl, CeladonUniversityOutsideTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText1
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
	ld hl, CeladonUniversityOutsideTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText1
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
	ld hl, CeladonUniversityOutsideTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, CeladonUniversityRefuse
	 jr .done
 .done
	ld hl, CeladonUniversityOutsideAfterBattleText1
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

CeladonUniversityOutsideEndBattleText1:
	text_far _CeladonUniversityOutsideEndBattleText1
	text_end

CeladonUniversityOutsideAfterBattleText1:
	text_far _CeladonUniversityOutsideAfterBattleText1
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
