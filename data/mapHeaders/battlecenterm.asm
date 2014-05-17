BattleCenterM_h: ; 0x4fd04 to 0x4fd10 (12 bytes) (id=239)
	db CLUB ; tileset
	db BATTLE_CENTER_HEIGHT, BATTLE_CENTER_WIDTH ; dimensions (y, x)
	dw BattleCenterMBlocks, BattleCenterMTextPointers, BattleCenterMScript ; blocks, texts, scripts
	db $00 ; connections
	dw BattleCenterMObject ; objects
