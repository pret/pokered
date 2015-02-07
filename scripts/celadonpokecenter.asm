CeladonPokecenterScript: ; 488b8 (12:48b8)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeladonPokecenterTextPointers: ; 488be (12:48be)
	dw CeladonPokecenterText1
	dw CeladonPokecenterText2
	dw CeladonPokecenterText3
	dw CeladonPokecenterText4

CeladonPokecenterText4: ; 488c6 (12:48c6)
	db $f6

CeladonPokecenterText1: ; 488c7 (12:48c7)
	db $ff

CeladonPokecenterText2: ; 488c8 (12:48c8)
	TX_FAR _CeladonPokecenterText2
	db "@"

CeladonPokecenterText3: ; 488cd (12:48cd)
	TX_FAR _CeladonPokecenterText3
	db "@"
