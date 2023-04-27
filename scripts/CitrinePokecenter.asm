CitrinePokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CitrinePokecenter_TextPointers:
	dw CitrineHealNurseText
	dw CitrinePokecenterText2
	dw CitrinePokecenterText3
	dw CitrineTradeNurseText
	dw KadabraTrade
	dw CitrinePokeCenterText4

CitrineTradeNurseText:
	script_cable_club_receptionist

CitrineHealNurseText:
	script_pokecenter_nurse

CitrinePokecenterText2:
	text_far _CitrinePokecenterText2
	text_end

CitrinePokecenterText3:
	text_far _CitrinePokecenterText3
	text_end
	
KadabraTrade:
	text_asm
	ld a, TRADE_FOR_HARRY
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

CitrinePokeCenterText4:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
