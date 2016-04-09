CeladonPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeladonPokecenterTextPointers:
	dw CeladonHealNurseText
	dw CeladonPokecenterText2
	dw CeladonPokecenterText3
	dw CeladonTradeNurseText

CeladonTradeNurseText:
	db $f6

CeladonHealNurseText:
	db $ff

CeladonPokecenterText2:
	TX_FAR _CeladonPokecenterText2
	db "@"

CeladonPokecenterText3:
	TX_FAR _CeladonPokecenterText3
	db "@"
