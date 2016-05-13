CeruleanPokecenterScript:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeruleanPokecenterTextPointers:
	dw CeruleanHealNurseText
	dw CeruleanPokecenterText2
	dw CeruleanPokecenterText3
	dw CeruleanTradeNurseText

CeruleanTradeNurseText:
	db $f6

CeruleanHealNurseText:
	db $ff

CeruleanPokecenterText2:
	TX_FAR _CeruleanPokecenterText2
	db "@"

CeruleanPokecenterText3:
	TX_FAR _CeruleanPokecenterText3
	db "@"
