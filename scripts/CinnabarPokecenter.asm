CinnabarPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CinnabarPokecenter_TextPointers:
	dw CinnabarHealNurseText
	dw CinnabarPokecenterText2
	dw CinnabarPokecenterText3
	dw CinnabarTradeNurseText
	dw PoryZSalesmanText
	dw MukTrade
	dw CinnabarPokecenterText4

CinnabarHealNurseText:
	script_pokecenter_nurse

CinnabarPokecenterText2:
	text_far _CinnabarPokecenterText2
	text_end

CinnabarPokecenterText3:
	text_far _CinnabarPokecenterText3
	text_end

CinnabarTradeNurseText:
	script_cable_club_receptionist

PoryZSalesmanText:
	text_asm
	CheckEvent EVENT_BOUGHT_DUBIOUS_DISC, 1
	jp c, .alreadyBoughtPoryZ
	ld hl, .Text1
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $21
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, DUBIOUS_DISC, 1
	call GiveItem
	jr nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $21
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	SetEvent EVENT_BOUGHT_DUBIOUS_DISC
	jr .done
.choseNo
	ld hl, .RefuseText
	jr .printText
.alreadyBoughtPoryZ
	ld hl, .Text2
.printText
	call PrintText
.done
	jp TextScriptEnd

.Text1
	text_far _PoryZSalesmanText1
	text_end

.RefuseText
	text_far _PoryZSalesmanNoText
	text_end

.NoMoneyText
	text_far _PoryZSalesmanNoMoneyText
	text_end

.Text2
	text_far _PoryZSalesmanText2
	text_end

PoryZBagFull:
	text_far _PoryZBagFull
	text_end

MukTrade:
	text_asm
	ld a, TRADE_FOR_MUK_A
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

CinnabarPokecenterText4:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
