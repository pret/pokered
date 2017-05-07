Music_TCG2Diddly4:
	db $80
	dw Music_TCG2Diddly4_Ch1
	db $01
	dw Music_TCG2Diddly4_Ch2
	db $02
	dw Music_TCG2Diddly4_Ch3

Music_TCG2Diddly4_Ch2: 
	notetype1 10
	notetype0 1
	octave 3
	note C_, 4
	note C_, 2
	note A_, 4
	note A_, 2
	note F_, 4
	note F_, 2
	inc_octave
	note C_, 4
	note C_, 1
	dec_octave
	note A_, 4
	note A_, 2
	inc_octave
	note F_, 15
	note F_, 11
	endchannel


Music_TCG2Diddly4_Ch1: 
	notetype1 10
	notetype0 1
	octave 2
	note A_, 4
	note A_, 2
	inc_octave
	note C_, 4
	note C_, 2
	dec_octave
	note A_, 4
	note A_, 2
	inc_octave
	note F_, 4
	note F_, 1
	note C_, 4
	note C_, 2
	note A_, 15
	note A_, 11
	endchannel


Music_TCG2Diddly4_Ch3: 
	notetype1 10
	notetype2 14
	notetype0 1
	notetype1 2
	notetype0 1
	note __, 6
	note __, 5
	note __, 6
	note __, 5
	note __, 6
	octave 4
	note F_, 16
	note F_, 6
	endchannel

