; FORMAT: tileset number, tile 1, tile 2
; terminated by -1
; these entries indicate that the player may not cross between tile 1 and tile 2
; it's mainly used to simulate differences in elevation

TilePairCollisionsLand::
	db CAVERN, $20, $05
	db CAVERN, $41, $05
	db FOREST, $30, $2E
	db CAVERN, $2A, $05
	db CAVERN, $05, $21
	db FOREST, $52, $2E
	db FOREST, $55, $2E
	db FOREST, $56, $2E
	db FOREST, $20, $2E
	db FOREST, $5E, $2E
	db FOREST, $5F, $2E
	db -1 ; end

TilePairCollisionsWater::
	db FOREST, $14, $2E
	db FOREST, $48, $2E
	db CAVERN, $14, $05
	db -1 ; end
