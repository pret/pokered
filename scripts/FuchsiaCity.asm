FuchsiaCity_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaCity_TextPointers:
	dw FuchsiaCityText1
	dw FuchsiaCityText2
	dw FuchsiaCityText3
	dw FuchsiaCityText4
	dw FuchsiaCityText5
	dw FuchsiaCityText6
	dw FuchsiaCityText7
	dw FuchsiaCityText8
	dw FuchsiaCityText9
	dw FuchsiaCityText10
	dw FuchsiaCityText11
	dw FuchsiaCityText12
	dw FuchsiaCityText13
	dw MartSignText
	dw PokeCenterSignText
	dw FuchsiaCityText16
	dw FuchsiaCityText17
	dw FuchsiaCityText18
	dw FuchsiaCityText19
	dw FuchsiaCityText20
	dw FuchsiaCityText21
	dw FuchsiaCityText22
	dw FuchsiaCityText23
	dw FuchsiaCityText24
	dw SubstituteGuy

FuchsiaCityText1:
	text_far _FuchsiaCityText1
	text_end

FuchsiaCityText2:
	text_far _FuchsiaCityText2
	text_end

FuchsiaCityText3:
	text_far _FuchsiaCityText3
	text_end

FuchsiaCityText4:
	text_far _FuchsiaCityText4
	text_end

FuchsiaCityText5:
FuchsiaCityText6:
FuchsiaCityText7:
FuchsiaCityText8:
FuchsiaCityText9:
FuchsiaCityText10:
	text_far _FuchsiaCityText5
	text_end

FuchsiaCityText12:
FuchsiaCityText11:
	text_far _FuchsiaCityText11
	text_end

FuchsiaCityText13:
	text_far _FuchsiaCityText13
	text_end

FuchsiaCityText16:
	text_far _FuchsiaCityText16
	text_end

FuchsiaCityText17:
	text_far _FuchsiaCityText17
	text_end

FuchsiaCityText18:
	text_far _FuchsiaCityText18
	text_end

FuchsiaCityText19:
	text_asm
	ld hl, FuchsiaCityChanseyText
	call PrintText
	ld a, CHANSEY
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityChanseyText:
	text_far _FuchsiaCityChanseyText
	text_end

FuchsiaCityText20:
	text_asm
	ld hl, FuchsiaCityVoltorbText
	call PrintText
	ld a, VOLTORB
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityVoltorbText:
	text_far _FuchsiaCityVoltorbText
	text_end

FuchsiaCityText21:
	text_asm
	ld hl, FuchsiaCityKangaskhanText
	call PrintText
	ld a, KANGASKHAN
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityKangaskhanText:
	text_far _FuchsiaCityKangaskhanText
	text_end

FuchsiaCityText22:
	text_asm
	ld hl, FuchsiaCitySlowpokeText
	call PrintText
	ld a, SLOWPOKE
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCitySlowpokeText:
	text_far _FuchsiaCitySlowpokeText
	text_end

FuchsiaCityText23:
	text_asm
	ld hl, FuchsiaCityLaprasText
	call PrintText
	ld a, LAPRAS
	call DisplayPokedex
	jp TextScriptEnd

FuchsiaCityLaprasText:
	text_far _FuchsiaCityLaprasText
	text_end

FuchsiaCityText24:
	text_asm
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .asm_3b4e8
	CheckEventReuseA EVENT_GOT_HELIX_FOSSIL
	jr nz, .asm_667d5
	ld hl, FuchsiaCityText_19b2a
	call PrintText
	jr .asm_4343f
.asm_3b4e8
	ld hl, FuchsiaCityOmanyteText
	call PrintText
	ld a, OMANYTE
	jr .asm_81556
.asm_667d5
	ld hl, FuchsiaCityKabutoText
	call PrintText
	ld a, KABUTO
.asm_81556
	call DisplayPokedex
.asm_4343f
	jp TextScriptEnd

FuchsiaCityOmanyteText:
	text_far _FuchsiaCityOmanyteText
	text_end

FuchsiaCityKabutoText:
	text_far _FuchsiaCityKabutoText
	text_end

FuchsiaCityText_19b2a:
	text_far _FuchsiaCityText_19b2a
	text_end

; FireRed NPC
; This guy has a Kangaskhan fetish or something wtf
SubstituteGuy:
	text_asm
	CheckEvent EVENT_GOT_TM50
	jr nz, .got_item
	ld hl, TM50PreReceiveText
	call PrintText
	
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	lb bc, TM_SUBSTITUTE, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM50Text
	call PrintText
	SetEvent EVENT_GOT_TM50
	jr .done
.refused
	ld hl, TM50Refused
	call PrintText
	jr .done
.bag_full
	ld hl, SubstituteNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM50ExplanationText
	call PrintText
.done
	jp TextScriptEnd

TM50PreReceiveText:
	text "Aww, I wish I was"
	line "a KANGASKHAN"
	cont "baby."
	
	para "I'd love to be a"
	line "SUBSTITUTE for"
	cont "the baby..."
	
	para "And snuggle in"
	line "the mother"
	cont "KANGASKHAN's"
	cont "belly pouch."
	
	para "But only #MON"
	line "can use the"
	cont "move SUBSTITUTE."
	
	para "Want to teach it"
	line "to one?"
	prompt

ReceivedTM50Text:
	text_far _ReceivedTM50Text
	sound_get_item_1
	text_end

TM50ExplanationText:
	text "Boy, what I'd"
	line "give to crawl"
	cont "inside a"
	cont "KANGASKHAN belly"
	cont "pouch..."
	done

TM50Refused:
	text "Oh really?"
	
	para "SUBSTITUTE seems"
	line "so fun..."
	done

SubstituteNoRoomText:
	text_far _TMNPCNoRoomText
	text_end
