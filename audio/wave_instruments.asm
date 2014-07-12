	dw .wave0
	dw .wave1
	dw .wave2
	dw .wave3
	dw .wave4
	dw .wave5 ; used in the Lavender Town and Pokemon Tower themes
	dw .wave5 ; unused
	dw .wave5 ; unused
	dw .wave5 ; unused

; these are the definitions for the channel 3 instruments
; each instrument definition is made up of 32 points (nibbles) that form
; the graph of the wave
; the current instrument is copied to $FF30
.wave0
	db $02,$46,$8A,$CE,$FF,$FE,$ED,$DC,$CB,$A9,$87,$65,$44,$33,$22,$11

.wave1
	db $02,$46,$8A,$CE,$EF,$FF,$FE,$EE,$DD,$CB,$A9,$87,$65,$43,$22,$11

.wave2
	db $13,$69,$BD,$EE,$EE,$FF,$FF,$ED,$DE,$FF,$FF,$EE,$EE,$DB,$96,$31

.wave3
	db $02,$46,$8A,$CD,$EF,$FE,$DE,$FF,$EE,$DC,$BA,$98,$76,$54,$32,$10

.wave4
	db $01,$23,$45,$67,$8A,$CD,$EE,$F7,$7F,$EE,$DC,$A8,$76,$54,$32,$10

; duty 5 reads from sfx data
.wave5

