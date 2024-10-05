; PureRGBnote: ADDED: script code for the behaviour of the last two fishing gurus, because they largely behave the same.
;                     whichever you encounter first will give a super rod, the other a FISHING GUIDE (unlocks fishing locations in pokedex).
;                     this is needed because the good rod now is given in vermilion and the old rod in cerulean.

LastTwoGurusScript::
	ld hl, LastTwoGurusTextQuestion
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld a, [wStatusFlags1]
	bit BIT_GOT_SUPER_ROD, a ; received super rod?
	jr nz, .got_rod
	lb bc, SUPER_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wStatusFlags1
	set BIT_GOT_SUPER_ROD, [hl] ; received super rod
	ld hl, LastTwoGurusTextYes
	rst _PrintText
	jr .gotItem
.bag_full
	ld hl, LastTwoGurusTextBagFull
	jr .done
.refused
	ld hl, LastTwoGurusTextNo
	jr .done
.got_rod
	ld hl, LastTwoGurusTextAlreadyHaveSuperRod
	rst _PrintText
	call SetEventFlag
	ld hl, LastTwoGurusFishingGuideReceived
	rst _PrintText
	ld hl, LastTwoGurusFishingGuideInfo
	jr .done
.gotItem
	call SetEventFlag
	ld hl, LastTwoGurusReceivedItemText
.done
	rst _PrintText
	ret

SetEventFlag:
	ld a, [wCurMap]
	cp ROUTE_12_SUPER_ROD_HOUSE
	jr z, .route12
	SetEvent EVENT_GOT_FUCHSIA_FISHING_GURU_ITEM
	ret
.route12
	SetEvent EVENT_GOT_ROUTE12_FISHING_GURU_ITEM
	ret

LastTwoGurusFishingGuideBookText::
	CheckBothEventsSet EVENT_GOT_FUCHSIA_FISHING_GURU_ITEM, EVENT_GOT_ROUTE12_FISHING_GURU_ITEM
	ld hl, FishingGuideBookText
	jr nz, .done
	ld hl, FishingGuideBookTextPrompt
	rst _PrintText
	ld hl, LastTwoGurusFishingGuideInfo
.done
	rst _PrintText
	ret

FishingGuideBookText:
	text_far _FishingGuideBookText
	text_end

FishingGuideBookTextPrompt:
	text_far _FishingGuideBookText
	text_promptbutton
	text_end


LastTwoGurusTextQuestion:
	text_far _LastTwoGurusTextQuestion
	text_end

LastTwoGurusTextYes:
	text_far _LastTwoGurusTextYes
	text_end

LastTwoGurusReceivedItemText:
	text_far _LastTwoGurusReceivedItemText
	sound_get_item_2
	text_end

LastTwoGurusTextNo:
	text_far _LastTwoGurusTextNo
	text_end

LastTwoGurusTextBagFull:
	text_far _LastTwoGurusTextBagFull
	text_end

LastTwoGurusTextAlreadyHaveSuperRod:
	text_far _LastTwoGurusTextAlreadyHaveSuperRod
	text_end

LastTwoGurusFishingGuideReceived:
	text_far _LastTwoGurusFishingGuideReceived
	sound_get_item_2
	text_promptbutton
	text_end

LastTwoGurusFishingGuideInfo:
	text_far _LastTwoGurusFishingGuideInfo
	text_end