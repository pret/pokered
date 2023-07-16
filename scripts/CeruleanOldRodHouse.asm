; PureRGBnote: ADDED: new house in cerulean where the fishing guru was moved to, he will give you old rod earlier.
CeruleanOldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanOldRodHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanOldRodHouse1Text1,  TEXT_CERULEANOLDRODHOUSE_FISHING_GURU

CeruleanOldRodHouse1Text1:
	text_asm
	ld a, [wd728]
	bit 3, a ; got old rod?
	jr nz, .got_item
	ld hl, .CeruleanOldRodHouseImTheFishingGuruText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, OLD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 3, [hl] ; got old rod ; TODO: make constant for this
	ld hl, .CeruleanOldRodHouseGiveRod
	jr .done
.bag_full
	ld hl, .CeruleanOldRodHouseNoRoom
	jr .done
.refused
	ld hl, .CeruleanOldRodHouseDisappointing
	jr .done
.got_item
	ld hl, .CeruleanOldRodHouseHowAreFishBiting
.done
	rst _PrintText
	rst TextScriptEnd

.CeruleanOldRodHouseImTheFishingGuruText:
	text_far _CeruleanOldRodHouseImTheFishingGuruText
	text_end

.CeruleanOldRodHouseGiveRod:
	text_far _CeruleanOldRodHouseGrandILikeYourStyleText
	sound_get_item_1
	text_far _CeruleanOldRodHouseFishingIsAWayOfLifeText
	text_end

.CeruleanOldRodHouseDisappointing:
	text_far _CeruleanOldRodHouseDisappointing
	text_end

.CeruleanOldRodHouseHowAreFishBiting:
	text_far _CeruleanOldRodHouseHowAreFishBiting
	text_end

.CeruleanOldRodHouseNoRoom:
	text_far _CeruleanOldRodHouseNoRoom
	text_end