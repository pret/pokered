UndergroundPathEntranceRoute7CopyScript: ; 5d769 (17:5769)
	ld a, ROUTE_7
	ld [wLastMap], a
	ret

UndergroundPathEntranceRoute7CopyTextPointers: ; 5d76f (17:576f)
	dw UGPathRoute7EntranceUnusedText_5d773
	dw UGPathRoute7EntranceUnusedText_5d77d

UGPathRoute7EntranceUnusedText_5d773: ; 5d773 (17:5773)
	TX_FAR _UGPathRoute7EntranceUnusedText_5d773
	db "@"

UGPathRoute7EntranceUnusedText_5d778: ; 5d778 (17:5778)
	TX_FAR _UGPathRoute7EntranceUnusedText_5d778
	db "@"

UGPathRoute7EntranceUnusedText_5d77d: ; 5d77d (17:577d)
	TX_FAR _UGPathRoute7EntranceUnusedText_5d77d
	db "@"

UGPathRoute7EntranceUnusedText_5d782: ; 5d782 (17:5782)
	TX_FAR _UGPathRoute7EntranceUnusedText_5d782
	db "@"
