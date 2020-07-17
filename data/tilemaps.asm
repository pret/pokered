tile_ids: MACRO
	dw \1
	dn \3, \2
ENDM

TileIDListPointerTable:
	; tilemap pointer, width, height
	tile_ids Unknown_79b24,      7,  7
	tile_ids Unknown_79b55,      7,  5
	tile_ids Unknown_79b78,      7,  3
	tile_ids GengarIntroTiles1,  7,  7
	tile_ids GengarIntroTiles2,  7,  7
	tile_ids GengarIntroTiles3,  7,  7
	tile_ids Unknown_79c20,      6,  8
	tile_ids Unknown_79c50,     12,  3

DownscaledMonTiles_5x5:
	db $31,$38,$46,$54,$5B
	db $32,$39,$47,$55,$5C
	db $34,$3B,$49,$57,$5E
	db $36,$3D,$4B,$59,$60
	db $37,$3E,$4C,$5A,$61

DownscaledMonTiles_3x3:
	db $31,$46,$5B
	db $34,$49,$5E
	db $37,$4C,$61

Unknown_79b24:
	db $00,$07,$0E,$15,$1C,$23,$2A
	db $01,$08,$0F,$16,$1D,$24,$2B
	db $02,$09,$10,$17,$1E,$25,$2C
	db $03,$0A,$11,$18,$1F,$26,$2D
	db $04,$0B,$12,$19,$20,$27,$2E
	db $05,$0C,$13,$1A,$21,$28,$2F
	db $06,$0D,$14,$1B,$22,$29,$30

Unknown_79b55:
	db $00,$07,$0E,$15,$1C,$23,$2A
	db $01,$08,$0F,$16,$1D,$24,$2B
	db $03,$0A,$11,$18,$1F,$26,$2D
	db $04,$0B,$12,$19,$20,$27,$2E
	db $05,$0C,$13,$1A,$21,$28,$2F

Unknown_79b78:
	db $00,$07,$0E,$15,$1C,$23,$2A
	db $02,$09,$10,$17,$1E,$25,$2C
	db $04,$0B,$12,$19,$20,$27,$2E

GengarIntroTiles1:
	INCBIN "gfx/intro_credits/gengar_1.tilemap"

GengarIntroTiles2:
	INCBIN "gfx/intro_credits/gengar_2.tilemap"

GengarIntroTiles3:
	INCBIN "gfx/intro_credits/gengar_3.tilemap"

Unknown_79c20:
	db $31,$32,$32,$32,$32,$33
	db $34,$35,$36,$36,$37,$38
	db $34,$39,$3A,$3A,$3B,$38
	db $3C,$3D,$3E,$3E,$3F,$40
	db $41,$42,$43,$43,$44,$45
	db $46,$47,$43,$48,$49,$4A
	db $41,$43,$4B,$4C,$4D,$4E
	db $4F,$50,$50,$50,$51,$52

Unknown_79c50:
	db $43,$55,$56,$53,$53,$53,$53,$53,$53,$53,$53,$53
	db $43,$57,$58,$54,$54,$54,$54,$54,$54,$54,$54,$54
	db $43,$59,$5A,$43,$43,$43,$43,$43,$43,$43,$43,$43
