UndergroundTunnelEntranceRoute6Script: ; 5d6ef (17:56ef)
	ld a, $11
	ld [$d365], a
	jp EnableAutoTextBoxDrawing

UndergroundTunnelEntranceRoute6TextPointers: ; 5d6f7 (17:56f7)
	dw UndergroundTunnelEntranceRoute6Text1

UndergroundTunnelEntranceRoute6Text1: ; 5d6f9 (17:56f9)
	TX_FAR _UndergrdTunnelEntRoute6Text1
	db "@"
	
