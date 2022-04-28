AltSpriteMappingTable:
	; first byte = defined sprite
	; second byte = sprite it should be replaced with when new icon sprites are turned off
	db SPRITE_MONSTER2, SPRITE_MONSTER
	db SPRITE_MONSTER2_STILL, SPRITE_MONSTER
	db SPRITE_FIGHTING, SPRITE_MONSTER
	db SPRITE_QUADRUPED2, SPRITE_MONSTER
	db SPRITE_PSYCHIC, SPRITE_MONSTER
	db SPRITE_FUZZBALL, SPRITE_MONSTER
	db SPRITE_FUZZBALL2, SPRITE_BIRD
	db -1 ; end
