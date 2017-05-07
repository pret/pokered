Music_TCGMedal:
	db $80
	dw Music_TCGMedal_Ch1
	db $01
	dw Music_TCGMedal_Ch2
	db $02
	dw Music_TCGMedal_Ch3

Music_TCGMedal_Ch1: 
	vibrato 20, $33
	notetype2 8
	octave 2
	dutycycle 1
	notetype1 10
	notetype0 1
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	dec_octave
	dec_octave
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	notetype0 15
	note A_, 2
	notetype0 1
	note A_, 10
	notetype1 3
	note A_, 5
	notetype1 10
	notetype2 7
	note A_, 5
	note A_, 5
	note A_, 5
	notetype2 8
	note A_, 15
	notetype1 3
	note A_, 5
	notetype1 10
	note A_, 16
	notetype1 3
	note A_, 5
	notetype1 10
	note A_, 16
	notetype1 3
	note A_, 6
	notetype1 10
	notetype0 9
	note A_, 5
	note A_, 8
	notetype0 1
	note A_, 2
	notetype1 3
	note A_, 16
	endchannel


Music_TCGMedal_Ch2: 
	vibrato 20, $33
	notetype2 8
	octave 1
	dutycycle 0
	notetype1 9
	notetype0 1
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	dec_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	notetype0 15
	note C_, 2
	notetype0 1
	note C_, 10
	notetype1 2
	note C_, 5
	notetype1 10
	notetype2 7
	note C_, 5
	note C_, 5
	note C_, 5
	notetype2 8
	note D_, 15
	notetype1 3
	note D_, 5
	notetype1 9
	note D_, 16
	notetype1 2
	note D_, 5
	notetype1 9
	note D_, 16
	notetype1 3
	note D_, 6
	notetype1 9
	notetype0 9
	note C#, 5
	note C#, 8
	notetype0 1
	note C#, 2
	notetype1 2
	note C#, 16
	endchannel


Music_TCGMedal_Ch3: 
	notetype2 11
	notetype1 1
	octave 2
	notetype0 1
	notetype0 15
	note __, 4
	note F_, 2
	notetype0 1
	note F_, 10
	note __, 5
	note F_, 5
	note F_, 5
	note F_, 5
	note A#, 15
	note __, 5
	note A#, 16
	note __, 5
	note A#, 16
	note __, 6
	notetype0 9
	note A_, 13
	notetype0 1
	note A_, 2
	endchannel

