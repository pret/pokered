UndergroundPathEntranceRoute7CopyScript: ; 5d769 (17:5769)
	ld a, ROUTE_7
	ld [wLastMap], a
	ret

UndergroundPathEntranceRoute7CopyTextPointers: ; 5d76f (17:576f)
	dw UnnamedText_5d773
	dw UnnamedText_5d77d

UnnamedText_5d773: ; 5d773 (17:5773)
	TX_FAR _UnnamedText_5d773
	db "@"

UnnamedText_5d778: ; 5d778 (17:5778)
	TX_FAR _UnnamedText_5d778
	db "@"

UnnamedText_5d77d: ; 5d77d (17:577d)
	TX_FAR _UnnamedText_5d77d
	db "@"

UnnamedText_5d782: ; 5d782 (17:5782)
	TX_FAR _UnnamedText_5d782
	db "@"
