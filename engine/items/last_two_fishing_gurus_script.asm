; PureRGBnote: ADDED: script code for the behaviour of the last two fishing gurus, because they largely behave the same.
;                     whichever you encounter first will give a super rod, the other a different gift item.
;                     this is needed because the good rod now is given in vermilion and the old rod in cerulean.

LastTwoGurusScript::
	ld hl, LastTwoGurusTextQuestion
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld a, [wd728]
	bit 5, a ; received super rod?
	jr nz, .got_rod
	lb bc, SUPER_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 5, [hl] ; received super rod
	ld hl, LastTwoGurusTextYes
	call PrintText
	jr .gotItem
.bag_full
	ld hl, LastTwoGurusTextBagFull
	jr .done
.refused
	ld hl, LastTwoGurusTextNo
	jr .done
.got_rod
	lb bc, ITEM_GOT_SUPER_ROD_ALREADY_REWARD_NEW, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, LastTwoGurusTextAlreadyHaveSuperRod
	call PrintText
	jr .gotItem
.gotItem
	call SetEventFlag
	ld hl, LastTwoGurusReceivedItemText
.done
	call PrintText
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


LastTwoGurusTextQuestion:
	text_far _LastTwoGurusTextQuestion
	text_end

LastTwoGurusTextYes:
	text_far _LastTwoGurusTextYes
	text_end

LastTwoGurusReceivedItemText:
	text_far _LastTwoGurusReceivedItemText
	sound_get_item_1
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