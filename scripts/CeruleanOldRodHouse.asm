; PureRGBnote: ADDED: new house in cerulean where the fishing guru was moved to, he will give you old rod earlier.
CeruleanOldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanOldRodHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanOldRodHouse1Text1,  TEXT_CERULEANOLDRODHOUSE_FISHING_GURU
	dw_const CeruleanOldRodHouseFoodText,  TEXT_CERULEANOLDRODHOUSE_FOOD

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
	text_far _VermilionOldRodHouseISimplyLoveFishing
	text_end

.CeruleanOldRodHouseGiveRod:
	text_far _VermilionOldRodHouseFishingGuruTakeThisText
	sound_get_item_1
	text_far _CeruleanOldRodHouseFishingIsAWayOfLifeText
	text_end

.CeruleanOldRodHouseDisappointing:
	text_far _LastTwoGurusTextNo
	text_end

.CeruleanOldRodHouseHowAreFishBiting:
	text_far _VermilionOldRodHouseFishingGuruHowAreTheFishBitingText
	text_far _CeruleanOldRodHouseOldRodInfo
	text_end

.CeruleanOldRodHouseNoRoom:
	text_far _LastTwoGurusTextBagFull
	text_end

; PureRGBnote: ADDED: some text where it seems like there should be an interaction.

CeruleanOldRodHouseFoodText:
	text_asm
	ld hl, .wowFish
	rst _PrintText
	ld a, CERULEANOLDRODHOUSE_FISHING_GURU
	call SetSpriteFacingUp
	ld hl, .whatCanISayLoveCooking
	rst _PrintText
	rst TextScriptEnd
.wowFish
	text_far _CeruleanOldRodHouseFoodText
	text_end
.whatCanISayLoveCooking
	text_far _CeruleanOldRodHouseFoodText2
	text_end