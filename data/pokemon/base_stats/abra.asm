	db DEX_ABRA ; pokedex id

	db  25,  20,  15,  90, 105
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBackSW

	db TELEPORT, PSYWAVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	ROLLING_KICK,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SUBSTITUTE,\
	FLASH
	; end

	; TODO: since I used two words here instead of two bytes, can expand to 4 bytes and use the 2nd and 4th bytes for other data if necessary (like bank of alt front sprite)
	dw BANK(AbraPicFront), BANK(AbraPicBack) ; PureRGBnote: ADDED: in pokemon base stat headers, these point to which bank the front and original back pic are stored in.

	dw AbraPicFrontAlt, AbraPicBack ; PureRGBnote: ADDED: the first byte is a pointer to alt front sprite if the pokemon has one, the second is a pointer to the original back sprite.
