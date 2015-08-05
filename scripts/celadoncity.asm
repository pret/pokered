CeladonCityScript: ; 19956 (6:5956)
	call EnableAutoTextBoxDrawing
	ResetEvents EVENT_1B8, EVENT_1BF
	ResetEvent EVENT_67F
	ret

CeladonCityTextPointers: ; 19966 (6:5966)
	dw CeladonCityText1
	dw CeladonCityText2
	dw CeladonCityText3
	dw CeladonCityText4
	dw CeladonCityText5
	dw CeladonCityText6
	dw CeladonCityText7
	dw CeladonCityText8
	dw CeladonCityText9
	dw CeladonCityText10
	dw CeladonCityText11
	dw PokeCenterSignText
	dw CeladonCityText13
	dw CeladonCityText14
	dw CeladonCityText15
	dw CeladonCityText16
	dw CeladonCityText17
	dw CeladonCityText18

CeladonCityText1: ; 1998a (6:598a)
	TX_FAR _CeladonCityText1
	db "@"

CeladonCityText2: ; 1998f (6:598f)
	TX_FAR _CeladonCityText2
	db "@"

CeladonCityText3: ; 19994 (6:5994)
	TX_FAR _CeladonCityText3
	db "@"

CeladonCityText4: ; 19999 (6:5999)
	TX_FAR _CeladonCityText4
	db "@"

CeladonCityText5: ; 1999e (6:599e)
	TX_ASM
	CheckEvent EVENT_GOT_TM41
	jr nz, .asm_7053f
	ld hl, TM41PreText
	call PrintText
	lb bc, TM_41, 1
	call GiveItem
	jr c, .Success
	ld hl, TM41NoRoomText
	call PrintText
	jr .Done
.Success
	ld hl, ReceivedTM41Text
	call PrintText
	SetEvent EVENT_GOT_TM41
	jr .Done
.asm_7053f
	ld hl, TM41ExplanationText
	call PrintText
.Done
	jp TextScriptEnd

TM41PreText: ; 199d2 (6:59d2)
	TX_FAR _TM41PreText
	db "@"

ReceivedTM41Text: ; 199d7 (6:59d7)
	TX_FAR _ReceivedTM41Text
	db $0B, "@"

TM41ExplanationText: ; 199dd (6:59dd)
	TX_FAR _TM41ExplanationText
	db "@"

TM41NoRoomText: ; 199e2 (6:59e2)
	TX_FAR _TM41NoRoomText
	db "@"

CeladonCityText6: ; 199e7 (6:59e7)
	TX_FAR _CeladonCityText6
	db "@"

CeladonCityText7: ; 199ec (6:59ec)
	TX_FAR _CeladonCityText7
	TX_ASM
	ld a, POLIWRATH
	call PlayCry
	jp TextScriptEnd

CeladonCityText8: ; 199f9 (6:59f9)
	TX_FAR _CeladonCityText8
	db "@"

CeladonCityText9: ; 199fe (6:59fe)
	TX_FAR _CeladonCityText9
	db "@"

CeladonCityText10: ; 19a03 (6:5a03)
	TX_FAR _CeladonCityText10
	db "@"

CeladonCityText11: ; 19a08 (6:5a08)
	TX_FAR _CeladonCityText11
	db "@"

CeladonCityText13: ; 19a0d (6:5a0d)
	TX_FAR _CeladonCityText13
	db "@"

CeladonCityText14: ; 19a12 (6:5a12)
	TX_FAR _CeladonCityText14
	db "@"

CeladonCityText15: ; 19a17 (6:5a17)
	TX_FAR _CeladonCityText15
	db "@"

CeladonCityText16: ; 19a1c (6:5a1c)
	TX_FAR _CeladonCityText16
	db "@"

CeladonCityText17: ; 19a21 (6:5a21)
	TX_FAR _CeladonCityText17
	db "@"

CeladonCityText18: ; 19a26 (6:5a26)
	TX_FAR _CeladonCityText18
	db "@"
