Music_TCGMatchVictory:
	db $80
	dw Music_TCGMatchVictory_Ch1
	db $01
	dw Music_TCGMatchVictory_Ch2
	db $02
	dw Music_TCGMatchVictory_Ch3

Music_TCGMatchVictory_Ch1: 
	vibrato 20, $33
	notetype2 8
	octave 3
	dutycycle 0
	notetype1 11
	notetype0 1
	note A_, 15
	note A_, 9
	notetype1 2
	note A_, 5
	notetype1 11
	note A_, 7
	notetype1 2
	note A_, 3
	notetype1 11
	note F_, 7
	notetype1 2
	note F_, 3
	notetype1 11
	note A_, 7
	notetype1 2
	note A_, 2
	notetype1 11
	note B_, 11
	notetype1 2
	note B_, 10
	inc_octave
	notetype1 11
	note C_, 10
	notetype1 2
	note C_, 11
	notetype1 11
	note D_, 10
	notetype1 2
	note D_, 10
	notetype1 11
	note C#, 8
	notetype1 2
	note C#, 13
	notetype1 11
	note D_, 5
	notetype1 2
	note D_, 6
	notetype1 11
	notetype0 8
	note E_, 12
	notetype1 2
	note E_, 4
	endchannel


Music_TCGMatchVictory_Ch2: 
	vibrato 20, $33
	notetype2 8
	octave 3
	dutycycle 0
	notetype1 11
	notetype0 1
	note F_, 5
	notetype1 2
	note F_, 5
	dec_octave
	notetype1 11
	note A_, 5
	inc_octave
	note C_, 5
	note F_, 5
	notetype1 2
	note F_, 4
	notetype1 11
	note C_, 7
	notetype1 2
	note C_, 3
	dec_octave
	notetype1 11
	note A_, 7
	notetype1 2
	note A_, 3
	inc_octave
	notetype1 11
	note C_, 7
	notetype1 2
	note C_, 2
	notetype1 11
	note G_, 11
	notetype1 2
	note G_, 10
	notetype1 11
	note A_, 10
	notetype1 2
	note A_, 11
	notetype1 11
	note B_, 10
	notetype1 2
	note B_, 10
	notetype1 11
	note A_, 8
	notetype1 2
	note A_, 13
	notetype1 11
	note B_, 5
	notetype1 2
	note B_, 6
	inc_octave
	notetype1 11
	notetype0 8
	note C#, 12
	notetype1 2
	note C#, 4
	endchannel


Music_TCGMatchVictory_Ch3: 
	notetype2 11
	notetype1 1
	octave 2
	notetype0 1
	note F_, 15
	note F_, 9
	note __, 5
	note F_, 7
	note __, 3
	note F_, 7
	note __, 3
	note F_, 7
	note __, 2
	note G_, 11
	note __, 10
	note G_, 11
	note __, 10
	note G_, 10
	note __, 10
	note A_, 8
	note __, 13
	note E_, 5
	note __, 6
	notetype0 8
	note A_, 12
	endchannel

