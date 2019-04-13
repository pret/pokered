VermilionPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenter_TextPointers:
	dw VermilionHealNurseText
	dw VermilionPokecenterText2
	dw VermilionPokecenterText3
	dw VermilionTradeNurseText

VermilionHealNurseText:
	TX_POKECENTER_NURSE

VermilionPokecenterText2:
	TX_FAR _VermilionPokecenterText2
	db "@"

VermilionPokecenterText3:
	TX_FAR _VermilionPokecenterText3
	db "@"

VermilionTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST
