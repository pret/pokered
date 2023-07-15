Route12SuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12SuperRodHouse_TextPointers:
	def_text_pointers
	dw_const Route12SuperRodHouseFishingGuruText, TEXT_ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouseFishingGuruText:
	text_asm
	ld a, [wd728]
	bit 5, a ; received super rod?
	jr nz, .got_item
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, SUPER_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 5, [hl] ; received super rod
	ld hl, .ReceivedSuperRodText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.refused
	ld hl, .ThatsDisappointingText
	jr .done
.got_item
	ld hl, .TryFishingText
.done
	call PrintText
	jp TextScriptEnd

.DoYouLikeToFishText:
	text_far _Route12SuperRodHouseFishingGuruDoYouLikeToFishText
	text_end

.ReceivedSuperRodText:
	text_far _Route12SuperRodHouseFishingGuruReceivedSuperRodText
	sound_get_item_1
	text_far _Route12SuperRodHouseFishingGuruFishingWayOfLifeText
	text_end

.ThatsDisappointingText:
	text_far _Route12SuperRodHouseFishingGuruThatsDisappointingText
	text_end

.TryFishingText:
	text_far _Route12SuperRodHouseFishingGuruTryFishingText
	text_end

.NoRoomText:
	text_far _Route12SuperRodHouseFishingGuruNoRoomText
	text_end
