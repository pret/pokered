RockTunnelPokecenter_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

RockTunnelPokecenter_TextPointers:
	def_text_pointers
	dw_const RockTunnelPokecenterNurseText,            TEXT_ROCKTUNNELPOKECENTER_NURSE
	dw_const RockTunnelPokecenterGentlemanText,        TEXT_ROCKTUNNELPOKECENTER_GENTLEMAN
	dw_const RockTunnelPokecenterFisherText,           TEXT_ROCKTUNNELPOKECENTER_FISHER
	dw_const RockTunnelPokecenterLinkReceptionistText, TEXT_ROCKTUNNELPOKECENTER_LINK_RECEPTIONIST
	dw_const RockTunnelCharityNurseText,               TEXT_ROCKTUNNELPOKECENTER_NURSE2

RockTunnelPokecenterNurseText:
	script_pokecenter_nurse

RockTunnelPokecenterGentlemanText:
	text_far _RockTunnelPokecenterGentlemanText
	text_end

RockTunnelPokecenterFisherText:
	text_far _RockTunnelPokecenterFisherText
	text_end

RockTunnelPokecenterLinkReceptionistText:
	script_cable_club_receptionist

; PureRGBnote: ADDED: by donating to this nurse you unlock the ability to speed up pokemon center healing by holding B before talking to the nurse
RockTunnelCharityNurseText: 
	text_asm
	ld hl, RockTunnelCharityNurseText1
	rst _PrintText
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
	rst _PrintText
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
	rst _PrintText
	jr .done
.no
	ld hl, RockTunnelCharityNurseFarewellText
	rst _PrintText
.done		
	rst TextScriptEnd

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
	text_far _GenericNotEnoughMoneyText
	text_end

