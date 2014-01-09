Music8_Channel3DutyPointers: ; 20361 (8:4361)
	dw Music8_Channel3Duty0
	dw Music8_Channel3Duty1
	dw Music8_Channel3Duty2
	dw Music8_Channel3Duty3
	dw Music8_Channel3Duty4
	dw Music8_Channel3Duty5 ; unused
	dw Music8_Channel3Duty5 ; unused
	dw Music8_Channel3Duty5 ; unused
	dw Music8_Channel3Duty5 ; unused

; these are the definitions for the channel 3 instruments
; each instrument definition is made up of 32 points (nibbles) that form
; the graph of the wave
; the current instrument is copied to $FF30
Music8_Channel3Duty0: ; 20373 (8:4373)
	db $02,$46,$8A,$CE,$FF,$FE,$ED,$DC,$CB,$A9,$87,$65,$44,$33,$22,$11

Music8_Channel3Duty1: ; 20383 (8:4383)
	db $02,$46,$8A,$CE,$EF,$FF,$FE,$EE,$DD,$CB,$A9,$87,$65,$43,$22,$11

Music8_Channel3Duty2: ; 20393 (8:4393)
	db $13,$69,$BD,$EE,$EE,$FF,$FF,$ED,$DE,$FF,$FF,$EE,$EE,$DB,$96,$31

Music8_Channel3Duty3: ; 203a3 (8:43a3)
	db $02,$46,$8A,$CD,$EF,$FE,$DE,$FF,$EE,$DC,$BA,$98,$76,$54,$32,$10

Music8_Channel3Duty4: ; 203b3 (8:43b3)
	db $01,$23,$45,$67,$8A,$CD,$EE,$F7,$7F,$EE,$DC,$A8,$76,$54,$32,$10

Music8_Channel3Duty5:

