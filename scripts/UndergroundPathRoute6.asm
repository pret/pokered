UndergroundPathRoute6_Script:
	ld a, ROUTE_6
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathRoute6_TextPointers:
	dw UndergroundPathEntranceRoute6Text1

UndergroundPathEntranceRoute6Text1:
	text_far _UndergrdTunnelEntRoute6Text1
	text_end
