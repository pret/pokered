RockTunnelPokecenter_Script:
	call SetLastBlackoutMap
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

RockTunnelPokecenter_TextPointers:
	dw RockTunnelHealNurseText
	dw RockTunnelPokecenterText2
	dw RockTunnelPokecenterText3
	dw RockTunnelTradeNurseText
	dw RockTunnelCharityNurseText

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

RockTunnelCharityNurseText:
	text_asm
	ld hl, RockTunnelCharityNurseText1
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	xor a
	ldh [hMoney], a
	ld a, $30
	ldh [hMoney + 1], a
	ld a, $00
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .success
	ld hl, RockTunnelCharityNurseNotEnoughMoneyText
	call PrintText
	jr .done
.success
	SetEvent EVENT_DONATED_TO_POKECENTER_CHARITY
	xor a
	ld [wPriceTemp], a
	ld a, $30
	ld [wPriceTemp + 1], a
	ld a, $00
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, 3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, RockTunnelCharityNurseText2
	call PrintText
	jr .done
.no
	ld hl, RockTunnelCharityNurseFarewellText
	call PrintText
.done		
	jp TextScriptEnd

RockTunnelCharityNurseText1:
	text_far _RockTunnelCharityNurseText1
	text_end

RockTunnelCharityNurseText2:
	text_far _RockTunnelCharityNurseText2
	text_end

RockTunnelCharityNurseFarewellText:
	text_far _PokemonCenterFarewellText
	text_end

RockTunnelCharityNurseNotEnoughMoneyText:
	text_far _SafariZoneEntranceText_7536a
	text_end

