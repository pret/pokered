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
; meltan guy
	text_asm
	ld a, [wd72e]
	bit 0, a ; got meltan?
	jr z, .giveMeltan
	CheckEvent EVENT_GOT_MELTAN
	jr nz, .MeltanInfo
	ld hl, .MeltanGuyText
	call PrintText
	jr .done
.giveMeltan
	ld hl, .MeltanGuyText
	call PrintText
	lb bc, MELTAN, 5
	SetEvent EVENT_GOT_MELTAN
	call GivePokemon
	jr nc, .done
	ld a, [wSimulatedJoypadStatesEnd]
	and a
	call z, WaitForTextScrollButtonPress
	call EnableAutoTextBoxDrawing
	ld hl, .MeltanInfoWithBlackjackAndHookers
	call PrintText
	ld hl, wd72e
	set 0, [hl]
	jr .done
.MeltanInfo
	ld hl, .MeltanInfoWithBlackjackAndHookers
	call PrintText
.done
	jp TextScriptEnd

.MeltanInfoWithBlackjackAndHookers
	text_far _MeltanInfo
	text_end

.MeltanGuyText
	text_far _MeltanGuyText
	text_end
