; This file is INCLUDEd three times, once for each audio engine.
; PureRGBnote: ADDED: additional wave definitions were added that are used in tcg/tcg2/pinball songs
	dw .wave0
	dw .wave1
	dw .wave2
	dw .wave3
	dw .wave4
	dw .wave5 ; used in the Lavender Town and Pokemon Tower themes
	dw .wave6 ; 
	dw .wave7 ; 
	dw .wave8 ; 
	dw .wave9 ; 
	dw .wave10 ; 
	dw .wave11 ; 
	dw .wave12 ; 
	dw .wave13 ; 
	dw .wave14 ; 

; these are the definitions for the channel 3 instruments
; each instrument definition is made up of 32 points (nibbles) that form
; the graph of the wave
; the current instrument is copied to rWave_0--rWave_f
.wave0
	dn  0,  2,  4,  6,  8, 10, 12, 14, 15, 15, 15, 14, 14, 13, 13, 12, 12, 11, 10,  9,  8,  7,  6,  5,  4,  4,  3,  3,  2,  2,  1,  1

.wave1
	dn  0,  2,  4,  6,  8, 10, 12, 14, 14, 15, 15, 15, 15, 14, 14, 14, 13, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  2,  1,  1

.wave2
	dn  1,  3,  6,  9, 11, 13, 14, 14, 14, 14, 15, 15, 15, 15, 14, 13, 13, 14, 15, 15, 15, 15, 14, 14, 14, 14, 13, 11,  9,  6,  3,  1

.wave3
	dn  0,  2,  4,  6,  8, 10, 12, 13, 14, 15, 15, 14, 13, 14, 15, 15, 14, 14, 13, 12, 11, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0

.wave4
	dn  0,  1,  2,  3,  4,  5,  6,  7,  8, 10, 12, 13, 14, 14, 15,  7,  7, 15, 14, 14, 13, 12, 10,  8,  7,  6,  5,  4,  3,  2,  1,  0

;.wave5
    ;dn  0,  0,  1,  1,  2,  2,  3,  3,  4,  4,  3,  3,  2,  2,  1,  1, 15, 15, 14, 14, 12, 12, 10, 10,  8,  8, 10, 10, 12, 12, 14, 14
.wave6
	dn  0,  2,  4,  6,  8, 10, 12, 14, 12, 11, 10,  9,  8,  7,  6,  5, 15, 15, 15, 14, 14, 13, 13, 12,  4,  4,  3,  3,  2,  2,  1,  1
.wave7
	dn 12,  0, 10,  9,  8,  7, 15,  5, 15, 15, 15, 14, 14, 13, 13, 12,  4,  4,  3,  3,  2,  2, 15,  1,  0,  2,  4,  6,  8, 10, 12, 14
.wave8
	dn  4,  4,  3,  3,  2,  2,  1, 15,  0,  0,  4,  6,  8, 10, 12, 14, 15,  8, 15, 14, 14, 13, 13, 12, 12, 11, 10,  9,  8,  7,  6,  5
.wave9
	dn  1,  1,  0,  0,  0,  0,  0,  8,  0,  0,  1,  3,  5,  7,  9, 10, 11,  4, 11, 10, 10,  9,  9,  8,  8,  7,  6,  5,  4,  3,  2,  1
.wave10
	dn  7,  9, 11, 13, 15, 15, 15, 15, 15, 15, 15, 15, 15, 13, 11,  9,  7,  5,  3,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  3,  5
.wave11
	dn  0,  1,  1,  2,  2,  3,  3,  4,  4,  5,  5,  6,  6,  7,  7,  7,  8,  8,  9,  9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15
.wave12
	dn  4,  6,  8, 10, 12, 12, 12, 12, 12, 12, 12, 12, 12, 10,  8,  6,  4,  2,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  2
.wave13
	dn  7, 10, 13, 15, 15, 15, 13, 10,  7,  4,  1,  0,  0,  0,  1,  4,  7, 10, 13, 15, 15, 15, 13, 10,  7,  4,  1,  0,  0,  0,  1,  4
.wave14
	dn 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0

; duty 5 reads from sfx data ; TODO: ensure it's used correctly
.wave5
; in audio 1: (used by audio/music/lavender.asm)
;	dn  2,  1, 14,  2,  3,  3,  2,  8, 14,  1,  2,  2, 15, 15, 14, 10,  1,  0,  1,  4, 13, 12,  1,  0, 14,  3,  4,  1,  5,  1,  7,  3
; in audio 2:
;	dn 14, 12,  0,  2,  2,  0,  9,  1,  0,  7, 12,  0,  2,  0,  8,  1,  0,  7, 13,  0,  2,  0,  9,  1,  0,  7, 12,  0,  2, 12, 10,  1
; in audio 3: (used by audio/music/pokemontower.asm)
;	dn  2,  1, 14,  2,  3,  3,  2,  8, 14,  1,  2,  2, 15, 15,  2,  2, 15,  7,  2,  4,  2,  2, 15,  7,  3,  4,  2,  4, 15,  7,  4,  4
