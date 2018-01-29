VermilionDockObject:
	db $f ; border block

	db $2 ; warps
	warp $e, $0, $5, $ff
	warp $e, $2, $1, SS_ANNE_1

	db $0 ; signs

	db $0 ; objects

	; warp-to
	warp_to $e, $0, VERMILION_DOCK_WIDTH
	warp_to $e, $2, VERMILION_DOCK_WIDTH ; SS_ANNE_1
