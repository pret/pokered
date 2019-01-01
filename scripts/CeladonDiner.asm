CeladonDiner_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonDiner_TextPointers:
	dw CeladonDinerText1
	dw CeladonDinerText2
	dw CeladonDinerText3
	dw CeladonDinerText4
	dw CeladonDinerText5

CeladonDinerText1:
	TX_FAR _CeladonDinerText1
	db "@"

CeladonDinerText2:
	TX_FAR _CeladonDinerText2
	db "@"

CeladonDinerText3:
	TX_FAR _CeladonDinerText3
	db "@"

CeladonDinerText4:
	TX_FAR _CeladonDinerText4
	db "@"

CeladonDinerText5:
	TX_ASM
	CheckEvent EVENT_GOT_COIN_CASE
	jr nz, .asm_eb14d
	ld hl, CeladonDinerText_491a7
	call PrintText
	lb bc, COIN_CASE, 1
	call GiveItem
	jr nc, .BagFull
	SetEvent EVENT_GOT_COIN_CASE
	ld hl, ReceivedCoinCaseText
	call PrintText
	jr .asm_68b61
.BagFull
	ld hl, CoinCaseNoRoomText
	call PrintText
	jr .asm_68b61
.asm_eb14d
	ld hl, CeladonDinerText_491b7
	call PrintText
.asm_68b61
	jp TextScriptEnd

CeladonDinerText_491a7:
	TX_FAR _CeladonDinerText_491a7
	db "@"

ReceivedCoinCaseText:
	TX_FAR _ReceivedCoinCaseText
	TX_SFX_KEY_ITEM
	db "@"

CoinCaseNoRoomText:
	TX_FAR _CoinCaseNoRoomText
	db "@"

CeladonDinerText_491b7:
	TX_FAR _CeladonDinerText_491b7
	db "@"
