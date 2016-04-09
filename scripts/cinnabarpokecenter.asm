CinnabarPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CinnabarPokecenterTextPointers:
	dw CinnabarHealNurseText
	dw CinnabarPokecenterText2
	dw CinnabarPokecenterText3
	dw CinnabarTradeNurseText

CinnabarHealNurseText:
	db $ff

CinnabarPokecenterText2:
	TX_FAR _CinnabarPokecenterText2
	db "@"

CinnabarPokecenterText3:
	TX_FAR _CinnabarPokecenterText3
	db "@"

CinnabarTradeNurseText:
	db $f6
