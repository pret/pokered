; PureRGBnote: CHANGED: the fishing guru relative here will now give you GOOD ROD.

VermilionOldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionOldRodHouse_TextPointers:
	def_text_pointers
	dw_const VermilionGuruHouseText1, TEXT_VERMILIONOLDRODHOUSE_FISHING_GURU

VermilionGuruHouseText1:
	text_asm
	ld a, [wd728]
	bit 4, a ; got good rod?
	jr nz, .got_item
	ld hl, .DoYouLikeToFishText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, GOOD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 4, [hl] ; got good rod
	ld hl, .TakeThisText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.refused
	ld hl, .ThatsSoDisappointingText
	jr .done
.got_item
	ld hl, .HowAreTheFishBitingText
.done
	rst _PrintText
	rst TextScriptEnd

.DoYouLikeToFishText:
	text_far _VermilionOldRodHouseFishingGuruDoYouLikeToFishText
	text_end

.TakeThisText:
	text_far _VermilionOldRodHouseFishingGuruTakeThisText
	sound_get_item_1
	text_end

.ThatsSoDisappointingText:
	text_far _VermilionOldRodHouseFishingGuruThatsSoDisappointingText
	text_end

.HowAreTheFishBitingText:
	text_far _VermilionOldRodHouseFishingGuruHowAreTheFishBitingText
	text_end

.NoRoomText:
	text_far _VermilionOldRodHouseFishingGuruNoRoomText
	text_end
