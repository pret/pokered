; PureRGBnote: ADDED: this mapping is to be able to swap overworld sprites when switching the ICONS setting in the options menu.
; 					  the left value is what it will look like with enhanced icons turned on, the right is the original sprite.

AltSpriteMappingTable:
	; first byte = defined sprite
	; second byte = sprite it should be replaced with when new icon sprites are turned off
	db SPRITE_MONSTER2, SPRITE_MONSTER
	db SPRITE_MONSTER2_STILL, SPRITE_MONSTER
	db SPRITE_FIGHTING, SPRITE_MONSTER
	db SPRITE_QUADRUPED2, SPRITE_MONSTER
	db SPRITE_PSYCHIC, SPRITE_MONSTER
	db SPRITE_CAT, SPRITE_MONSTER
	db SPRITE_BIRD2, SPRITE_BIRD
	db SPRITE_BROCK, SPRITE_SUPER_NERD
	db SPRITE_MISTY, SPRITE_BRUNETTE_GIRL
	db SPRITE_LT_SURGE, SPRITE_ROCKER
	db SPRITE_ERIKA, SPRITE_SILPH_WORKER_WOMAN
	db SPRITE_SABRINA, SPRITE_GIRL
	db SPRITE_BLAINE, SPRITE_MIDDLE_AGED_MAN
	db SPRITE_CHIEF, SPRITE_GAMBLER
	db -1 ; end
