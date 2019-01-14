ViridianPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

ViridianPokecenter_TextPointers:
	dw ViridianHealNurseText
	dw ViridianPokeCenterText2
	dw ViridianPokeCenterText3
	dw ViridianTradeNurseText

ViridianHealNurseText:
	TX_POKECENTER_NURSE

ViridianPokeCenterText2:
	TX_FAR _ViridianPokeCenterText2
	db "@"

ViridianPokeCenterText3:
	TX_FAR _ViridianPokeCenterText3
	db "@"

ViridianTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST
