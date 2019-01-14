FuchsiaPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

FuchsiaPokecenter_TextPointers:
	dw FuchsiaHealNurseText
	dw FuchsiaPokecenterText2
	dw FuchsiaPokecenterText3
	dw FuchsiaTradeNurseText

FuchsiaHealNurseText:
	TX_POKECENTER_NURSE

FuchsiaPokecenterText2:
	TX_FAR _FuchsiaPokecenterText1
	db "@"

FuchsiaPokecenterText3:
	TX_FAR _FuchsiaPokecenterText3
	db "@"

FuchsiaTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST
