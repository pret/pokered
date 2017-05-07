Music_TCGDarkDiddly:
	db $80
	dw Music_TCGDarkDiddly_Ch1
	db $01
	dw Music_TCGDarkDiddly_Ch2
	db $02
	dw Music_TCGDarkDiddly_Ch3

Music_TCGDarkDiddly_Ch1: 
	notetype0 3
	notetype2 8
	octave 4
	dutycycle 1
	notetype1 11
	note C_, 4
	dec_octave
	note B_, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note F#, 2
	note F_, 4
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	dec_octave
	note B_, 2
	note A#, 4
	note B_, 2
	notetype1 2
	note B_, 2
	notetype1 11
	note F#, 4
	note G_, 2
	notetype1 2
	note G_, 2
	notetype1 11
	note C_, 2
	notetype1 2
	note C_, 4
	inc_octave
	notetype1 11
	note E_, 1
	note G_, 1
	inc_octave
	note C_, 2
	notetype1 2
	note C_, 2
	endchannel


Music_TCGDarkDiddly_Ch2: 
	notetype0 3
	notetype2 8
	octave 3
	dutycycle 1
	notetype1 11
	note __, 16
	note C_, 4
	dec_octave
	note B_, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note F#, 2
	note F_, 4
	note F#, 2
	notetype1 2
	note F#, 2
	notetype1 11
	note C#, 4
	note D_, 2
	notetype1 2
	note D_, 2
	dec_octave
	notetype1 11
	note G_, 2
	notetype1 2
	note G_, 6
	inc_octave
	inc_octave
	notetype1 11
	note E_, 2
	notetype1 2
	note E_, 2
	endchannel


Music_TCGDarkDiddly_Ch3: 
	notetype0 6
	notetype2 11
	notetype1 1
	octave 2
	note __, 16
	note G_, 2
	note F#, 1
	note __, 1
	note D#, 2
	note C#, 1
	note __, 1
	note C_, 1
	note __, 3
	inc_octave
	note C_, 1
	endchannel

