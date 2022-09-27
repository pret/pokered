CeladonUniversityPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeladonUniversityPokecenter_TextPointers:
	dw CeladonUniversityHealNurseText
	dw CeladonUniversityPokecenterText2
	dw CuboneSalesmanText
	dw CeladonUniversityTradeNurseText

CeladonUniversityTradeNurseText:
	script_cable_club_receptionist

CeladonUniversityHealNurseText:
	script_pokecenter_nurse

CeladonUniversityPokecenterText2:
	text_far _CeladonUniversityPokecenterText4
	text_end

CuboneSalesmanText:
	text_asm
	CheckEvent EVENT_BOUGHT_CUBONE, 1
	jp c, .alreadyBoughtCubone
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
	lb bc, CUBONE, 17
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
	SetEvent EVENT_BOUGHT_CUBONE
	jr .done
.choseNo
	ld hl, .RefuseText
	jr .printText
.alreadyBoughtCubone
	ld hl, .Text2
.printText
	call PrintText
.done
	jp TextScriptEnd

.Text1
	text_far _CuboneSalesmanText1
	text_end

.RefuseText
	text_far _CuboneSalesmanNoText
	text_end

.NoMoneyText
	text_far _CuboneSalesmanNoMoneyText
	text_end

.Text2
	text_far _CuboneSalesmanText2
	text_end
