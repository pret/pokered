FuchsiaPokecenterScript: ; 75063 (1d:5063)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

FuchsiaPokecenterTextPointers: ; 75069 (1d:5069)
	dw FuchsiaPokecenterText1
	dw FuchsiaPokecenterText2
	dw FuchsiaPokecenterText3
	dw FuchsiaPokecenterText4

FuchsiaPokecenterText1: ; 75071 (1d:5071)
	db $ff

FuchsiaPokecenterText2: ; 75072 (1d:5072)
	TX_FAR _FuchsiaPokecenterText1
	db "@"

FuchsiaPokecenterText3: ; 75077 (1d:5077)
	TX_FAR _FuchsiaPokecenterText3
	db "@"

FuchsiaPokecenterText4: ; 7507c (1d:507c)
	db $f6
