VermilionPokecenterScript: ; 5c98f (17:498f)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenterTextPointers: ; 5c995 (17:4995)
	dw VermilionPokecenterText1
	dw VermilionPokecenterText2
	dw VermilionPokecenterText3
	dw VermilionPokecenterText4

VermilionPokecenterText1: ; 5c99d (17:499d)
	db $ff

VermilionPokecenterText2: ; 5c99e (17:499e)
	TX_FAR _VermilionPokecenterText1
	db "@"

VermilionPokecenterText3: ; 5c9a3 (17:49a3)
	TX_FAR _VermilionPokecenterText3
	db "@"

VermilionPokecenterText4: ; 5c9a8 (17:49a8)
	db $f6
