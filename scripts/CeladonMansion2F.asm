; PureRGBnote: CHANGED: this map contains additional celadon houses that are combined into one map.

CeladonMansion2F_Script:
	call EnableAutoTextBoxDrawing
	call CheckBoomboxPlaying
	jp CheckJiggleBoombox

CeladonMansion2F_TextPointers:
	def_text_pointers
	dw_const ProspectorsHouseProspectorText, TEXT_CELADON_PROSPECTORS_HOUSE_PROSPECTOR
	dw_const ProspectorsHouseBoomboxText, TEXT_CELADON_PROSPECTORS_HOUSE_BOOMBOX
	dw_const ProspectorsHousePaperText, TEXT_CELADON_PROSPECTORS_HOUSE_NOTE
	dw_const CeladonMansion2FMeetingRoomSignText, TEXT_CELADONMANSION2F_MEETING_ROOM_SIGN
	dw_const ProspectorsHouseBookcaseText1, TEXT_PROSPECTORS_HOUSE_BOOKCASE1
	dw_const ProspectorsHouseBookcaseText2, TEXT_PROSPECTORS_HOUSE_BOOKCASE2
	dw_const ProspectorsHouseBookcaseText3, TEXT_PROSPECTORS_HOUSE_BOOKCASE3
	dw_const ProspectorsHouseBoomboxText, TEXT_CELADON_PROSPECTORS_HOUSE_BOOMBOX_2

CeladonMansion2FMeetingRoomSignText:
	text_far _CeladonMansion2FMeetingRoomSignText
	text_end

CeladonHouse2FBookCaseCheck::
	ld a, [wYCoord]
	cp 12
	ret

ProspectorsHouseProspectorText:
	text_asm
	CheckEvent EVENT_GOT_HM02
	ld hl, .greeting
	jr z, .done
	rst _PrintText
	CheckEvent EVENT_LEARNED_TO_DIG_BETWEEN_TOWNS
	jr nz, .reallyDone
	ld hl, TextScriptPromptButton
	call TextCommandProcessor
	ld hl, .byTheWayDigBetweenTowns
	rst _PrintText
	ld a, CELADON_PROSPECTORS_HOUSE_PROSPECTOR
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirection
	ld hl, .haveALookAtMap
	rst _PrintText
	call GBFadeOutToWhite
	ld c, 60
	rst _DelayFrames
	call GBFadeInFromWhite
	SetEvent EVENT_LEARNED_TO_DIG_BETWEEN_TOWNS
	ld hl, .learnedToDig
.done
	rst _PrintText
.reallyDone
	rst TextScriptEnd
.greeting
	text_far _ProspectorsHouseProspectorText1
	text_end
.byTheWayDigBetweenTowns
	text_far _ProspectorsHouseProspectorText2
	text_end
.haveALookAtMap
	text_far _ProspectorsHouseProspectorText3
	text_end
.learnedToDig
	text_far _ProspectorsHouseProspectorText4
	sound_get_item_2
	text_end

CheckJiggleBoombox:
	ld a, [wYCoord]
	cp 12
	ret c
	cp 22
	ret nc
	CheckEvent EVENT_PROSPECTORS_HOUSE_BOOMBOX_TURNED_ON
	ret z
	jpfar DiamondMineJiggleBoomBox.jiggleBoombox

CheckBoomboxPlaying::
	ld a, [wYCoord]
	cp 12
	ret c
	cp 22
	ret nc
	CheckEvent EVENT_PROSPECTORS_HOUSE_BOOMBOX_TURNED_ON
	ret z
	jpfar DiamondMinePlayMusic.playBoomboxMusic

ProspectorsHouseBoomboxText:
	text_asm
	CheckEvent EVENT_DIAMOND_MINE_COMPLETED
	ld hl, .dontTouch
	jr z, .done
	CheckEvent EVENT_PROSPECTORS_HOUSE_BOOMBOX_TURNED_ON
	jr z, .on
	ResetEvent EVENT_PROSPECTORS_HOUSE_BOOMBOX_TURNED_ON 
	ld hl, .turnedOff
	rst _PrintText
	call PlayDefaultMusic
	rst TextScriptEnd
.on
	SetEvent EVENT_PROSPECTORS_HOUSE_BOOMBOX_TURNED_ON 
	ld hl, .turnedOn
.done
	rst _PrintText
	rst TextScriptEnd
.dontTouch
	text_far _ProspectorsHouseBoomboxText1
	text_end 
.turnedOff
	text_far _ProspectorsHouseBoomboxText2
	text_far _ProspectorsHouseBoomboxOff
	text_end
.turnedOn
	text_far _ProspectorsHouseBoomboxText2
	text_far _ProspectorsHouseBoomboxOn
	text_end

ProspectorsHousePaperText:
	text_asm
	CheckEvent EVENT_DIAMOND_MINE_COMPLETED
	ld hl, .goneDigging
	jr z, .done
	ld hl, .topographicalMap
.done
	rst _PrintText
	rst TextScriptEnd
.goneDigging
	text_far _ProspectorsHousePaperText1
	text_end 
.topographicalMap
	text_far _ProspectorsHousePaperText2
	text_end

ProspectorsHouseBookcaseText1:
	text_far _ProspectorsHouseBookcase1Text
	text_far _FlippedToARandomPage
	text_far _ProspectorsHouseBookcase1Text2
	text_end
ProspectorsHouseBookcaseText2:
	text_far _ProspectorsHouseBookcase2Text
	text_end
ProspectorsHouseBookcaseText3:
	text_far _ProspectorsHouseBookcase3Text
	text_far _FlippedToARandomPage
	text_far _ProspectorsHouseBookcase3Text2
	text_end