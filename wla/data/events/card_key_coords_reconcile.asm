; Reconciled from master RGBDS source: data/events/card_key_coords.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; These tables are probably supposed to be door locations in Silph Co.,
; but they are unused.
; The reason there are 3 tables is unknown.

; Format: map ID, Y, X, gate ID?

CardKeyTable1:
.DB SILPH_CO_2F, $04, $04, 0
.DB SILPH_CO_2F, $04, $05, 1
.DB SILPH_CO_4F, $0C, $04, 2
.DB SILPH_CO_4F, $0C, $05, 3
.DB SILPH_CO_7F, $06, $0A, 4
.DB SILPH_CO_7F, $06, $0B, 5
.DB SILPH_CO_9F, $04, $12, 6
.DB SILPH_CO_9F, $04, $13, 7
.DB SILPH_CO_10F, $08, $0A, 8
.DB SILPH_CO_10F, $08, $0B, 9
.DB -1

CardKeyTable2:
.DB SILPH_CO_3F, $08, $09, 10
.DB SILPH_CO_3F, $09, $09, 11
.DB SILPH_CO_5F, $04, $07, 12
.DB SILPH_CO_5F, $05, $07, 13
.DB SILPH_CO_6F, $0C, $05, 14
.DB SILPH_CO_6F, $0D, $05, 15
.DB SILPH_CO_8F, $08, $07, 16
.DB SILPH_CO_8F, $09, $07, 17
.DB SILPH_CO_9F, $08, $03, 18
.DB SILPH_CO_9F, $09, $03, 19
.DB -1

CardKeyTable3:
.DB SILPH_CO_11F, $08, $09, 20
.DB SILPH_CO_11F, $09, $09, 21
.DB -1
