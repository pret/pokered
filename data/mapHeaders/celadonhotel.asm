CeladonHotel_h: ; 0x4925d to 0x49269 (12 bytes) (bank=12) (id=140)
	db POKECENTER ; tileset
	db CELADON_HOTEL_HEIGHT, CELADON_HOTEL_WIDTH ; dimensions (y, x)
	dw CeladonHotelBlocks, CeladonHotelTextPointers, CeladonHotelScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonHotelObject ; objects
