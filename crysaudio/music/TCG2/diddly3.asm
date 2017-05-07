Music_TCG2Diddly3:
	db $80
	dw Music_TCG2Diddly3_Ch1
	db $01
	dw Music_TCG2Diddly3_Ch2
	db $02
	dw Music_TCG2Diddly3_Ch3

Music_TCG2Diddly3_Ch2: 
	notetype1 10
	notetype0 1
	octave 5
	note C_, 3
	dec_octave
	note C_, 2
	note C_, 1
	note G_, 3
	inc_octave
	note C_, 3
	note G_, 3
	inc_octave
	note C_, 5
	note C_, 6
	endchannel


Music_TCG2Diddly3_Ch1: 
	notetype1 10
	notetype0 1
	note __, 1
	octave 5
	note C_, 3
	dec_octave
	note C_, 2
	note C_, 1
	note G_, 3
	inc_octave
	note C_, 3
	note G_, 3
	inc_octave
	note C_, 5
	note C_, 6
	endchannel


Music_TCG2Diddly3_Ch3: 
	notetype1 10
	notetype2 15
	notetype0 1
	notetype1 2
	notetype0 1
	octave 5
	note G_, 3
	dec_octave
	note G_, 3
	note E_, 3
	inc_octave
	note C_, 3
	note E_, 3
	inc_octave
	note C_, 4
	notetype1 128
	note C_, 4
	endchannel

