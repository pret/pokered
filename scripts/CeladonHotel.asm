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


CeladonHotel_TextPointers:
	dw CeladonChannelerText
	dw CeladonHotelText1
	dw CeladonHotelText2
	dw CeladonHotelText3

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
