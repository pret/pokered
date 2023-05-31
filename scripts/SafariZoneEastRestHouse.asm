SafariZoneEastRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneEastRestHouse_TextPointers:
	dw SafariZoneRestHouse3Text1
	dw SafariZoneRestHouse3Text2
	dw SafariZoneRestHouse3Text3
	dw SafariZoneRestHouse3Meltan

SafariZoneRestHouse3Text1:
	text_far _SafariZoneRestHouse3Text1
	text_end

SafariZoneRestHouse3Text2:
	text_far _SafariZoneRestHouse3Text2
	text_end

SafariZoneRestHouse3Text3:
	text_far _SafariZoneRestHouse3Text3
	text_end

SafariZoneRestHouse3Meltan:
; Meltan Guy
; Originally, he was just going to give Meltan.
; But later on, we added the Mystery Box from GO for something more accurate, and for a possible Living Dex.
	text_asm
	CheckEvent EVENT_GOT_MELTAN
	jr nz, .got_item
	ld hl, MeltanGuyText
	call PrintText
	lb bc, MYSTERY_BOX, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedBoxText
	call PrintText
	SetEvent EVENT_GOT_MELTAN
	jr .done
.bag_full
	ld hl, BoxNoRoom
	call PrintText
	jr .done
.got_item
	ld hl, MeltanInfo
	call PrintText
.done
	jp TextScriptEnd

MeltanGuyText:
	text_far _MeltanGuyText
	text_end

MeltanInfo:
	text_far _MeltanInfo
	text_end

ReceivedBoxText:
	text_far _ReceivedBoxText
	text_end
	
BoxNoRoom:
	text_far _BoxNoRoom
	text_end