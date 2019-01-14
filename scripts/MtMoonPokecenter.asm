MtMoonPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MtMoonPokecenter_TextPointers:
	dw MtMoonHealNurseText
	dw MtMoonPokecenterText2
	dw MtMoonPokecenterText3
	dw MagikarpSalesmanText
	dw MtMoonPokecenterText5
	dw MtMoonTradeNurseText

MtMoonHealNurseText:
	db $ff

MtMoonPokecenterText2:
	TX_FAR _MtMoonPokecenterText1
	db "@"

MtMoonPokecenterText3:
	TX_FAR _MtMoonPokecenterText3
	db "@"

MagikarpSalesmanText:
	TX_ASM
	CheckEvent EVENT_BOUGHT_MAGIKARP, 1
	jp c, .alreadyBoughtMagikarp
	ld hl, .Text1
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	ld [hMoney], a
	ld [hMoney + 2], a
	ld a, $5
	ld [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, MAGIKARP, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $5
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	SetEvent EVENT_BOUGHT_MAGIKARP
	jr .done
.choseNo
	ld hl, .RefuseText
	jr .printText
.alreadyBoughtMagikarp
	ld hl, .Text2
.printText
	call PrintText
.done
	jp TextScriptEnd

.Text1
	TX_FAR _MagikarpSalesmanText1
	db "@"

.RefuseText
	TX_FAR _MagikarpSalesmanNoText
	db "@"

.NoMoneyText
	TX_FAR _MagikarpSalesmanNoMoneyText
	db "@"

.Text2
	TX_FAR _MagikarpSalesmanText2
	db "@"

MtMoonPokecenterText5:
	TX_FAR _MtMoonPokecenterText5
	db "@"

MtMoonTradeNurseText:
	db $f6
