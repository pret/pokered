BrunswickTrail_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BrunswickTrailTrainerHeaders
	ld de, BrunswickTrail_ScriptPointers
	ld a, [wBrunswickTrailCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBrunswickTrailCurScript], a
	ret

BrunswickTrail_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

BrunswickTrail_TextPointers:
	dw FakeTreeEvent
	dw ZapdosGuy
	dw GalarianZapdosText

BrunswickTrailTrainerHeaders:
	def_trainers
CactusTrainerHeader:
	trainer EVENT_BEAT_CACTUS, 0, CactusBattleText, CactusBattleText, CactusBattleText
GalarianZapdosTrainerHeader:
	trainer EVENT_BEAT_ZAPDOSG, 0, GalarianZapdosBattleText, GalarianZapdosBattleText, GalarianZapdosBattleText
	db -1 ; end

ZapdosGuy:
	text_far _ZapdosGuy
	text_end

FakeTreeNoCut: 
	text_far _FakeTreeNoCut
	text_end

FakeTreePrompt:
	text_far _FakeTreePrompt
	text_end

; Ok, so here's how it is.
; So look, I tried to make the text work more efficiently with FakeTreeEvent. 
; But one bug literally took me back to the fucking title screen and at that point I gave up and decided to do it this hacky way.
; I wanted to have some text before the CUT check. It did not work. It was terrifying.
; So instead I have two different versions of the same text, despite some being the same.
; It is inefficient, but it works. There's a lot to see in this life, and I'm not wasting it in Notepad++.
FakeTreeEvent:
	text_asm
;	ld d, CUT
;	farcall HasPartyMove
;	jr z, .NoCut
;	jr nz, .HasCut	
;.HasCut
	ld hl, FakeTreePrompt
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	ld a, SFX_CUT
	call PlaySound

	ld hl, CactusTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd ; I have tried a lot of things and it's not disappearing AAA
;.NoCut
;	ld hl, FakeTreeNoCut ; Why do you have to be this way? I scream, for I do not know.
;	call PrintText
;	ret
.refused
	jp TextScriptEnd

CactusBattleText:
	text_far _FakeTreeAttack
	text_asm
	ld a, CACTUS
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

GalarianZapdosText:
	text_asm
	ld hl, GalarianZapdosTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

GalarianZapdosBattleText:
	text_far _GalarianZapdosBattleText
	text_asm
	ld a, ZAPDOS_G
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

	text_end ; unused
