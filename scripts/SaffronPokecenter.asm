SaffronPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

SaffronPokecenter_TextPointers:
	dw SaffronHealNurseText
	dw SaffronPokecenterText2
	dw SaffronPokecenterText3
	dw SaffronTradeNurseText
	dw RaichuTrade
	dw SaffronPokecenterText4

SaffronHealNurseText:
	script_pokecenter_nurse

SaffronPokecenterText2:
	text_far _SaffronPokecenterText2
	text_end

SaffronPokecenterText3:
	text_far _SaffronPokecenterText3
	text_end

SaffronTradeNurseText:
	script_cable_club_receptionist

RaichuTrade:
	text_asm
	ld a, TRADE_FOR_RAICHU_A
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

SaffronPokecenterText4:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
