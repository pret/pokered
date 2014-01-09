Music1f_Channel3DutyPointers: ; 7c361 (1f:4361)
	dw Music1f_Channel3Duty0
	dw Music1f_Channel3Duty1
	dw Music1f_Channel3Duty2
	dw Music1f_Channel3Duty3
	dw Music1f_Channel3Duty4
	dw Music1f_Channel3Duty5 ; used in the Pokemon Tower theme
	dw Music1f_Channel3Duty5 ; unused
	dw Music1f_Channel3Duty5 ; unused
	dw Music1f_Channel3Duty5 ; unused

; these are the definitions for the channel 3 instruments
; each instrument definition is made up of 32 points (nibbles) that form
; the graph of the wave
; the current instrument is copied to $FF30
Music1f_Channel3Duty0: ; 7c373 (1f:4373)
	db $02,$46,$8A,$CE,$FF,$FE,$ED,$DC,$CB,$A9,$87,$65,$44,$33,$22,$11

Music1f_Channel3Duty1: ; 7c383 (1f:4383)
	db $02,$46,$8A,$CE,$EF,$FF,$FE,$EE,$DD,$CB,$A9,$87,$65,$43,$22,$11

Music1f_Channel3Duty2: ; 7c393 (1f:4393)
	db $13,$69,$BD,$EE,$EE,$FF,$FF,$ED,$DE,$FF,$FF,$EE,$EE,$DB,$96,$31

Music1f_Channel3Duty3: ; 7c3a3 (1f:43a3)
	db $02,$46,$8A,$CD,$EF,$FE,$DE,$FF,$EE,$DC,$BA,$98,$76,$54,$32,$10

Music1f_Channel3Duty4: ; 7c3b3 (1f:43b3)
	db $01,$23,$45,$67,$8A,$CD,$EE,$F7,$7F,$EE,$DC,$A8,$76,$54,$32,$10

; duty 5 reads from sfx data
Music1f_Channel3Duty5: ; 7c3c3 (1f:43c3)

