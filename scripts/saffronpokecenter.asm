SaffronPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

SaffronPokecenterTextPointers:
	dw SaffronHealNurseText
	dw SaffronPokecenterText2
	dw SaffronPokecenterText3
	dw SaffronTradeNurseText

SaffronHealNurseText:
	db $ff

SaffronPokecenterText2:
	TX_FAR _SaffronPokecenterText2
	db "@"

SaffronPokecenterText3:
	TX_FAR _SaffronPokecenterText3
	db "@"

SaffronTradeNurseText:
	db $f6
