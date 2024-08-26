SECTION "test", ROM0[0]
	ld [ $ff00 + c ], a
	; 257 spaces exceeds both LEXER_BUF_SIZE (42) and uint8_t limit (255)
	ld [ $ff00 +                                                                                                                                                                                                                                                                 c ], a
	ld [ $ff00                                                                                                                                                                                                                                                                 + c ], a
