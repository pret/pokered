UndergroundPathRoute7Copy_Script:
	ld a, ROUTE_7
	ld [wLastMap], a
	ret

UndergroundPathRoute7Copy_TextPointers:
	dw UGPathRoute7EntranceUnusedText_5d773
	dw UGPathRoute7EntranceUnusedText_5d77d

UGPathRoute7EntranceUnusedText_5d773:
	TX_FAR _UGPathRoute7EntranceUnusedText_5d773
	db "@"

UGPathRoute7EntranceUnusedText_5d778:
	TX_FAR _UGPathRoute7EntranceUnusedText_5d778
	db "@"

UGPathRoute7EntranceUnusedText_5d77d:
	TX_FAR _UGPathRoute7EntranceUnusedText_5d77d
	db "@"

UGPathRoute7EntranceUnusedText_5d782:
	TX_FAR _UGPathRoute7EntranceUnusedText_5d782
	db "@"
