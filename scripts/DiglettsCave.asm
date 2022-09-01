DiglettsCave_Script:
	jp EnableAutoTextBoxDrawing

DiglettsCave_TextPointers:
;    dw CrockyText
	text_end ; unused

; Edited from Articuno - PvK
;	def_trainers 1
;CrockyTrainerHeader:
;	trainer EVENT_BEAT_CROCKY, 0, CrockyBattleText, CrockyBattleText, CrockyBattleText
;	db -1 ; end
;
;CrockyText:
;	text_asm
;	ld hl, CrockyTrainerHeader
;	call TalkToTrainer
;	ld a, $4
;	ld [wSeafoamIslandsB4FCurScript], a
;	jp TextScriptEnd
;
;CrockyBattleText:
;	text_far _CrockyBattleText
;	text_asm
;	ld a, CROCKY
;	call PlayCry
;	call WaitForSoundToFinish
;	jp TextScriptEnd
