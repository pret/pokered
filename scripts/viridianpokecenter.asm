ViridianPokeCenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

ViridianPokecenterTextPointers:
	dw ViridianHealNurseText
	dw ViridianPokeCenterText2
	dw ViridianPokeCenterText3
	dw ViridianTradeNurseText

ViridianHealNurseText:
	db $ff

ViridianPokeCenterText2:
	TX_FAR _ViridianPokeCenterText2
	db "@"

ViridianPokeCenterText3:
	TX_FAR _ViridianPokeCenterText3
	db "@"

ViridianTradeNurseText:
	db $f6
