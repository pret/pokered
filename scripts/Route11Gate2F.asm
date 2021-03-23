Route11Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route11Gate2F_TextPointers:
	dw Route11GateUpstairsText1
	dw Route11GateUpstairsText2
	dw Route11GateUpstairsText3
	dw Route11GateUpstairsText4

Route11GateUpstairsText1:
	text_asm
	xor a ; TRADE_FOR_TERRY
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
Route11GateUpstairsScriptEnd:
	jp TextScriptEnd

Route11GateUpstairsText2:
	text_asm
	CheckEvent EVENT_GOT_ITEMFINDER, 1
	jr c, .got_item
	ld a, 30
	ldh [hOaksAideRequirement], a
	ld a, ITEMFINDER
	ldh [hOaksAideRewardItem], a
	ld [wd11e], a
	call GetItemName
	ld h, d
	ld l, e
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	call CopyData
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	dec a ; OAKS_AIDE_GOT_ITEM?
	jr nz, .no_item
	SetEvent EVENT_GOT_ITEMFINDER
.got_item
	ld hl, Route11GateUpstairsText_494a3
	call PrintText
.no_item
	jr Route11GateUpstairsScriptEnd

Route11GateUpstairsText_494a3:
	text_far _Route11GateUpstairsText_494a3
	text_end

Route11GateUpstairsText3:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jp nz, GateUpstairsScript_PrintIfFacingUp
	CheckEvent EVENT_BEAT_ROUTE12_SNORLAX
	ld hl, BinocularsSnorlaxText
	jr z, .print
	ld hl, BinocularsNoSnorlaxText
.print
	call PrintText
	jp TextScriptEnd

BinocularsSnorlaxText:
	text_far _BinocularsSnorlaxText
	text_end

BinocularsNoSnorlaxText:
	text_far _BinocularsNoSnorlaxText
	text_end

Route11GateUpstairsText4:
	text_asm
	ld hl, Route11GateUpstairsText_494d5
	jp GateUpstairsScript_PrintIfFacingUp

Route11GateUpstairsText_494d5:
	text_far _Route11GateUpstairsText_494d5
	text_end
