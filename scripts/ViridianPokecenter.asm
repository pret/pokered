ViridianPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

ViridianPokecenter_TextPointers:
	dw ViridianHealNurseText
	dw ViridianPokeCenterText2
	dw ViridianPokeCenterText3
	dw ViridianTradeNurseText
	dw RaticateTrade
	dw ViridianPokeCenterText4

ViridianHealNurseText:
	script_pokecenter_nurse

ViridianPokeCenterText2:
	text_far _ViridianPokeCenterText2
	text_end

ViridianPokeCenterText3:
	text_far _ViridianPokeCenterText3
	text_end

ViridianTradeNurseText:
	script_cable_club_receptionist

RaticateTrade:
	text_asm
	ld a, TRADE_FOR_RATICATE_A
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

ViridianPokeCenterText4:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
