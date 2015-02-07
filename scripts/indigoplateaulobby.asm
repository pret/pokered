IndigoPlateauLobbyScript: ; 19c5b (6:5c5b)
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	ret z
	ld hl, wd869
	res 7, [hl]
	ld hl, wd734
	bit 1, [hl]
	res 1, [hl]
	ret z
	ld hl, wd863
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

IndigoPlateauLobbyTextPointers: ; 19c7f (6:5c7f)
	dw IndigoPlateauLobbyText1
	dw IndigoPlateauLobbyText2
	dw IndigoPlateauLobbyText3
	dw IndigoPlateauLobbyText4
	dw IndigoPlateauLobbyText5

IndigoPlateauLobbyText1: ; 19c89 (6:5c89)
	db $ff

IndigoPlateauLobbyText2: ; 19c8a (6:5c8a)
	TX_FAR _IndigoPlateauLobbyText1
	db "@"

IndigoPlateauLobbyText3: ; 19c8f (6:5c8f)
	TX_FAR _IndigoPlateauLobbyText3
	db "@"

IndigoPlateauLobbyText5: ; 19c94 (6:5c94)
	db $f6
