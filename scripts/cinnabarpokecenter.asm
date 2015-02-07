CinnabarPokecenterScript: ; 75e2c (1d:5e2c)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CinnabarPokecenterTextPointers: ; 75e32 (1d:5e32)
	dw CinnabarPokecenterText1
	dw CinnabarPokecenterText2
	dw CinnabarPokecenterText3
	dw CinnabarPokecenterText4

CinnabarPokecenterText1: ; 75e3a (1d:5e3a)
	db $ff

CinnabarPokecenterText2: ; 75e3b (1d:5e3b)
	TX_FAR _CinnabarPokecenterText1
	db "@"

CinnabarPokecenterText3: ; 75e40 (1d:5e40)
	TX_FAR _CinnabarPokecenterText3
	db "@"

CinnabarPokecenterText4: ; 75e45 (1d:5e45)
	db $f6
