Route4_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeaders
	ld de, Route4_ScriptPointers
	ld a, [wRoute4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute4CurScript], a
	ret

Route4_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route4_TextPointers:
	dw Route4Text1
	dw Route4Text2
	dw PickUpItemText
	dw MegaPunchGuy
	dw MegaKickGuy
	dw PokeCenterSignText
	dw Route4Text5
	dw Route4Text6

Route4TrainerHeaders:
	def_trainers 2
Route4TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_0, 3, Route4BattleText1, Route4EndBattleText1, Route4AfterBattleText1
	db -1 ; end

Route4Text1:
	text_far _Route4Text1
	text_end

Route4Text2:
	text_asm
	ld hl, Route4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText1:
	text_far _Route4BattleText1
	text_end

Route4EndBattleText1:
	text_far _Route4EndBattleText1
	text_end

Route4AfterBattleText1:
	text_far _Route4AfterBattleText1
	text_end

Route4Text5:
	text_far _Route4Text5
	text_end

Route4Text6:
	text_far _Route4Text6
	text_end

MegaPunchGuy:
	text_asm
	CheckEvent EVENT_GOT_TM01
	jr nz, .got_item
	ld hl, TM01PreReceiveText
	call PrintText
	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	lb bc, TM_MEGA_PUNCH, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM01Text
	call PrintText
	SetEvent EVENT_GOT_TM01
	jr .done
.refused
	ld hl, TM01Refused
	call PrintText
	jr .done
.bag_full
	ld hl, MegaNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM01ExplanationText
	call PrintText
.done
	jp TextScriptEnd

TM01PreReceiveText:
	text_far _TM01PreReceiveText
	text_end

ReceivedTM01Text:
	text_far _ReceivedTM01Text
	sound_get_item_1
	text_end

TM01ExplanationText:
	text_far _TM01ExplanationText
	text_end

TM01Refused:
	text_far _TM01Refused
	text_end

MegaNoRoomText:
	text_far _TMNPCNoRoomText
	text_end

MegaKickGuy:
	text_asm
	CheckEvent EVENT_GOT_TM05
	jr nz, .got_item
	ld hl, TM05PreReceiveText
	call PrintText
	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	lb bc, TM_MEGA_KICK, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM05Text
	call PrintText
	SetEvent EVENT_GOT_TM05
	jr .done
.bag_full
	ld hl, MegaNoRoomText
	call PrintText
	jr .done
.refused
	ld hl, TM05Refused
	call PrintText
	jr .done
.got_item
	ld hl, TM05ExplanationText
	call PrintText
.done
	jp TextScriptEnd

TM05PreReceiveText:
	text_far _TM05PreReceiveText
	text_end

ReceivedTM05Text:
	text_far _ReceivedTM05Text
	sound_get_item_1
	text_end

TM05ExplanationText:
	text_far _TM05ExplanationText
	text_end

TM05Refused:
	text_far _TM05Refused
	text_end
