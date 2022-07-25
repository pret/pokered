CeladonHotel_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeladonHotelTrainerHeaders
	ld de, CeladonHotel_ScriptPointers
	ld a, [wCeladonHotelCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonHotelCurScript], a
	ret

CeladonHotel_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw CeladonLaprasGuyLeaves


CeladonHotel_TextPointers:
	dw CeladonChannelerText
	dw CeladonHotelText1
	dw CeladonHotelText2
	dw CeladonHotelText3
	dw CeladonLaprasGuyText

CeladonHotelTrainerHeaders:
	def_trainers 2
CeladonHotelTrainerHeader0:
	trainer EVENT_BEAT_CELADON_HOTEL_TRAINER_0, 0, CeladonHotelBattleText1, CeladonHotelEndBattleText1, CeladonHotelAfterBattleText1
	db -1 ; end

CeladonChannelerText:
	text_asm
	CheckEvent EVENT_BEAT_CELADON_HOTEL_TRAINER_0
	jr nz, .beat
	ld hl, CeladonChannelerIntroText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no1
	jr .q2
.no1
	ld hl, CeladonChannelerNo1
	call PrintText
	jr .done
.q2
	ld hl, CeladonChannelerQ2
	call PrintText
	call YesNoChoice
	ld hl, CeladonHotelTrainerHeader0
	call TalkToTrainer
	jr .done
.beat
	ld hl, CeladonHotelAfterBattleText1
	call PrintText
.done
	jp TextScriptEnd

CeladonChannelerIntroText:
	text_far _CeladonChannelerIntro
	text_end

CeladonChannelerNo1:
	text_far _CeladonChannelerNo1
	text_end

CeladonChannelerQ2:
	text_far _CeladonChannelerQ2
	text_end

CeladonHotelBattleText1:
	text_far _CeladonHotelBattleText1
	text_end

CeladonHotelEndBattleText1:
	text_far _CeladonHotelEndBattleText1
	text_end

CeladonHotelAfterBattleText1:
	text_far _CeladonHotelAfterBattleText1
	text_end

CeladonHotelText1:
	text_far _CeladonHotelText1
	text_end

CeladonHotelText2:
	text_far _CeladonHotelText2
	text_end

CeladonHotelText3:
	text_far _CeladonHotelText3
	text_end

CeladonLaprasGuyText:
	text_asm
	CheckEventHL EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jr nz, .celadonRocketsGone
	ld hl, CeladonLaprasGuyIntro
	call PrintText
	jr .done
.celadonRocketsGone
	ld hl, CeladonLaprasGuyReady
	call PrintText
	lb bc, LAPRAS, 30
	call GivePokemon
	jr nc, .noBoxRoom
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	ld hl, CeladonHeresYourLaprasText
	call PrintText
	SetEvent EVENT_GOT_LAPRAS_EARLY
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	ld hl, CeladonLaprasGuyAfter
	call PrintText
	ld a, 3
	ld [wCeladonHotelCurScript], a
	jr .done
.noBoxRoom
	ld hl, CeladonLaprasGuyNoBoxRoom
	call PrintText
.done
	jp TextScriptEnd

CeladonLaprasGuyLeaves:
	; fade out, set hide show flag, fade back in
	call GBFadeOutToWhite
	ld a, HS_LAPRAS_GUY_CELADON
	ld [wMissableObjectIndex], a
	predef HideObject
	call Delay3
	call GBFadeInFromWhite
	xor a
	ld [wCeladonHotelCurScript], a
	ld [wCurMapScript], a
	ret

CeladonLaprasGuyIntro:
	text_far _CeladonLaprasGuyIntro
	text_end

CeladonLaprasGuyReady:
	text_far _CeladonLaprasGuyReady
	text_end

CeladonHeresYourLaprasText:
	text_far _HeresYourLaprasText
	text_end

CeladonLaprasGuyNoBoxRoom:
	text_far _SwitchPCBoxesFirst
	text_end

CeladonLaprasGuyAfter:
	text_far _CeladonLaprasGuyAfter
	text_end