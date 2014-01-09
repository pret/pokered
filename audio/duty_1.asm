Music2_Channel3DutyPointers: ; 0x8361
	dw Music2_Channel3Duty0
	dw Music2_Channel3Duty1
	dw Music2_Channel3Duty2
	dw Music2_Channel3Duty3
	dw Music2_Channel3Duty4
	dw Music2_Channel3Duty5 ; used in the Lavender Town theme
	dw Music2_Channel3Duty5 ; unused
	dw Music2_Channel3Duty5 ; unused
	dw Music2_Channel3Duty5 ; unused

; these are the definitions for the channel 3 instruments
; each instrument definition is made up of 32 points (nibbles) that form
; the graph of the wave
; the current instrument is copied to $FF30
Music2_Channel3Duty0: ; 0x8373
	db $02,$46,$8A,$CE,$FF,$FE,$ED,$DC,$CB,$A9,$87,$65,$44,$33,$22,$11

Music2_Channel3Duty1: ; 0x8383
	db $02,$46,$8A,$CE,$EF,$FF,$FE,$EE,$DD,$CB,$A9,$87,$65,$43,$22,$11

Music2_Channel3Duty2: ; 0x8393
	db $13,$69,$BD,$EE,$EE,$FF,$FF,$ED,$DE,$FF,$FF,$EE,$EE,$DB,$96,$31

Music2_Channel3Duty3: ; 0x83a3
	db $02,$46,$8A,$CD,$EF,$FE,$DE,$FF,$EE,$DC,$BA,$98,$76,$54,$32,$10

Music2_Channel3Duty4: ; 0x83b3
	db $01,$23,$45,$67,$8A,$CD,$EE,$F7,$7F,$EE,$DC,$A8,$76,$54,$32,$10

; duty 5 reads from sfx data
Music2_Channel3Duty5: ; 0x83c3

