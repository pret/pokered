; These tables are probably supposed to be door locations in Silph Co.,
; but they are unused.
; The reason there are 3 tables is unknown.

; Format: map ID, Y, X, gate ID?

CardKeyTable1:
	db  SILPH_CO_2F, $04, $04, 0
	db  SILPH_CO_2F, $04, $05, 1
	db  SILPH_CO_4F, $0C, $04, 2
	db  SILPH_CO_4F, $0C, $05, 3
	db  SILPH_CO_7F, $06, $0A, 4
	db  SILPH_CO_7F, $06, $0B, 5
	db  SILPH_CO_9F, $04, $12, 6
	db  SILPH_CO_9F, $04, $13, 7
	db SILPH_CO_10F, $08, $0A, 8
	db SILPH_CO_10F, $08, $0B, 9
	db -1 ; end

CardKeyTable2:
	db SILPH_CO_3F, $08, $09, 10
	db SILPH_CO_3F, $09, $09, 11
	db SILPH_CO_5F, $04, $07, 12
	db SILPH_CO_5F, $05, $07, 13
	db SILPH_CO_6F, $0C, $05, 14
	db SILPH_CO_6F, $0D, $05, 15
	db SILPH_CO_8F, $08, $07, 16
	db SILPH_CO_8F, $09, $07, 17
	db SILPH_CO_9F, $08, $03, 18
	db SILPH_CO_9F, $09, $03, 19
	db -1 ; end

CardKeyTable3:
	db SILPH_CO_11F, $08, $09, 20
	db SILPH_CO_11F, $09, $09, 21
	db -1 ; end
