VermilionOldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionOldRodHouse_TextPointers:
	def_text_pointers
	dw_const VermilionOldRodHouseFishingGuruText, TEXT_VERMILIONOLDRODHOUSE_FISHING_GURU

VermilionOldRodHouseFishingGuruText:
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_OLD_ROD, a
	jr nz, .got_old_rod
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, OLD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wStatusFlags1
	set BIT_GOT_OLD_ROD, [hl]
	ld hl, .TakeThisText
	jr .print_text
.bag_full
	ld hl, .NoRoomText
	jr .print_text
.refused
	ld hl, .ThatsSoDisappointingText
	jr .print_text
.got_old_rod
	ld hl, .HowAreTheFishBitingText
.print_text
	call PrintText
	jp TextScriptEnd

.DoYouLikeToFishText:
	text_far _VermilionOldRodHouseFishingGuruDoYouLikeToFishText
	text_end

.TakeThisText:
	text_far _VermilionOldRodHouseFishingGuruTakeThisText
	sound_get_item_1
	text_far _VermilionOldRodHouseFishingGuruFishingIsAWayOfLifeText
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
