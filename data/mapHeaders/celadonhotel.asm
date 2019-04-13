CeladonHotel_h:
	db POKECENTER ; tileset
	db CELADON_HOTEL_HEIGHT, CELADON_HOTEL_WIDTH ; dimensions (y, x)
	dw CeladonHotelBlocks, CeladonHotelTextPointers, CeladonHotelScript ; blocks, texts, scripts
	db 0 ; connections
	dw CeladonHotelObject ; objects
