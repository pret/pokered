Museum2F_Script:
	jp EnableAutoTextBoxDrawing

Museum2F_TextPointers:
	dw Museum2FText1
	dw Museum2FText2
	dw Museum2FText3
	dw Museum2FText4
	dw Museum2FText5
	dw Museum2FText6
	dw Museum2FText7
	dw SeismicTossGuy

Museum2FText1:
	text_far _Museum2FText1
	text_end

Museum2FText2:
	text_far _Museum2FText2
	text_end

Museum2FText3:
	text_far _Museum2FText3
	text_end

Museum2FText4:
	text_far _Museum2FText4
	text_end

Museum2FText5:
	text_far _Museum2FText5
	text_end

Museum2FText6:
	text_far _Museum2FText6
	text_end

Museum2FText7:
	text_far _Museum2FText7
	text_end

; FireRed NPC
SeismicTossGuy:
	text_asm
	CheckEvent EVENT_GOT_TM19_2
	jr nz, .got_item
	ld hl, TM19PreReceiveText
	call PrintText
	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	lb bc, TM_SEISMIC_TOSS, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM19Text
	call PrintText
	SetEvent EVENT_GOT_TM19_2
	jr .done
.refused
	ld hl, TM19Refused
	call PrintText
	jr .done
.bag_full
	ld hl, SeismicTossNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM19ExplanationText
	call PrintText
.done
	jp TextScriptEnd

TM19PreReceiveText:
	text "The secrets of"
	line "space..."
	
	para "The mysteries of"
	line "earth..."
	
	para "There are so many"
	line "things about"
	cont "which we know so"
	cont "little."
	
	para "But that should"
	line "spur us to study"
	cont "harder, not toss"
	cont "in the towel!"
	
	para "The only thing you"
	line "should toss..."
	
	para "Well, how about"
	line "SEISMIC TOSS?"
	prompt

ReceivedTM19Text:
	text_far _ReceivedTM19Text
	sound_get_item_1
	text_end

TM19ExplanationText:
	text "I hope you won't"
	line "toss in the"
	cont "towel."
	
	para "Good luck!"
	done

TM19Refused:
	text "Is that so?"
	
	para "I'm sure you'll"
	line "be back for it."
	done

SeismicTossNoRoomText:
	text_far _TMNPCNoRoomText
	text_end
