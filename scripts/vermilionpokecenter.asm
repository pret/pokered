VermilionPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenterTextPointers:
	dw VermilionHealNurseText
	dw VermilionPokecenterText2
	dw VermilionPokecenterText3
	dw VermilionTradeNurseText

VermilionHealNurseText:
	db $ff

VermilionPokecenterText2:
	TX_FAR _VermilionPokecenterText2
	db "@"

VermilionPokecenterText3:
	TX_FAR _VermilionPokecenterText3
	db "@"

VermilionTradeNurseText:
	db $f6
