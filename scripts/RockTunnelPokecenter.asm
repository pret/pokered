RockTunnelPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

RockTunnelPokecenter_TextPointers:
	dw RockTunnelHealNurseText
	dw RockTunnelPokecenterText2
	dw RockTunnelPokecenterText3
	dw RockTunnelTradeNurseText
	dw DittoSalesmanText
	dw RockTunnelPokecenterText4

RockTunnelHealNurseText:
	script_pokecenter_nurse

RockTunnelPokecenterText2:
	text_far _RockTunnelPokecenterText2
	text_end

RockTunnelPokecenterText3:
	text_far _RockTunnelPokecenterText3
	text_end

RockTunnelTradeNurseText:
	script_cable_club_receptionist

DittoSalesmanText:
	text_asm
	CheckEvent EVENT_BOUGHT_DITTO, 1
	jp c, .alreadyBoughtDitto
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
	ld a, $5
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, DITTO, 23
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
	SetEvent EVENT_BOUGHT_DITTO
	jr .done
.choseNo
	ld hl, .RefuseText
	jr .printText
.alreadyBoughtDitto
	ld hl, .Text2
.printText
	call PrintText
.done
	jp TextScriptEnd

.Text1
	text_far _DittoSalesmanText1
	text_end

.RefuseText
	text_far _DittoSalesmanNoText
	text_end

.NoMoneyText
	text_far _DittoSalesmanNoMoneyText
	text_end

.Text2
	text_far _DittoSalesmanText2
	text_end

RockTunnelPokecenterText4:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd	
