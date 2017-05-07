Music_TCGMatchLoss:
	db $80
	dw Music_TCGMatchLoss_Ch1
	db $01
	dw Music_TCGMatchLoss_Ch2
	db $02
	dw Music_TCGMatchLoss_Ch3

Music_TCGMatchLoss_Ch1: 
	vibrato 20, $33
	notetype2 8
	octave 4
	dutycycle 2
	notetype1 11
	notetype0 1
	note E_, 3
	note F_, 2
	notetype0 5
	note F_, 3
	note C_, 1
	notetype1 3
	note C_, 3
	dec_octave
	notetype1 10
	note A#, 1
	notetype1 3
	note A#, 3
	inc_octave
	notetype0 1
	notetype1 10
	note D_, 3
	note D#, 2
	note D#, 16
	dec_octave
	note A#, 6
	notetype1 3
	note A#, 16
	notetype1 10
	note G#, 6
	notetype1 3
	note G#, 16
	inc_octave
	notetype1 10
	note C_, 3
	note C#, 8
	note C#, 12
	dec_octave
	notetype0 6
	note G#, 1
	notetype1 3
	note G#, 3
	notetype1 10
	note F#, 1
	notetype0 7
	notetype1 3
	note F#, 3
	notetype0 1
	notetype1 10
	note B_, 5
	inc_octave
	note C_, 4
	notetype0 9
	note C_, 11
	notetype1 3
	note C_, 2
	endchannel


Music_TCGMatchLoss_Ch2: 
	vibrato 20, $33
	notetype2 8
	octave 3
	dutycycle 2
	notetype1 9
	notetype0 9
	note __, 9
	notetype0 11
	note __, 5
	notetype0 1
	note __, 8
	notetype0 9
	note __, 6
	note G_, 6
	note G_, 6
	notetype1 3
	note G_, 2
	endchannel


Music_TCGMatchLoss_Ch3: 
	notetype2 11
	notetype1 1
	octave 2
	notetype0 5
	note A#, 4
	inc_octave
	note F_, 4
	note A#, 4
	dec_octave
	notetype0 7
	note G#, 3
	inc_octave
	notetype0 2
	note D#, 11
	note G#, 11
	dec_octave
	notetype0 1
	note F#, 11
	note F#, 12
	inc_octave
	notetype0 12
	note C#, 2
	notetype0 2
	note F#, 13
	dec_octave
	notetype0 9
	note F_, 12
	endchannel

