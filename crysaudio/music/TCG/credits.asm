Music_TCGCredits:
	db $C0
	dw Music_TCGCredits_Ch1
	db $01
	dw Music_TCGCredits_Ch2
	db $02
	dw Music_TCGCredits_Ch3
	db $03
	dw Music_TCGCredits_Ch4

Music_TCGCredits_Ch1: 
	notetype0 13
	vibrato 20, $33
	notetype2 8
	octave 2
	dutycycle 1
	notetype1 5
	note F_, 1
	notetype1 6
	note F_, 2
	notetype0 1
	note F_, 6
	notetype1 3
	note F_, 7
	notetype0 13
	notetype1 7
	note G_, 1
	notetype1 7
	note G_, 2
	notetype0 1
	note G_, 6
	notetype1 4
	note G_, 7
	notetype0 13
	notetype1 7
	note A_, 1
	notetype1 8
	note A_, 2
	notetype0 1
	note A_, 6
	notetype1 4
	note A_, 7
	notetype0 13
	notetype1 8
	note B_, 3
	notetype1 4
	note B_, 1
	inc_octave
	notetype1 8
	note C_, 1
	notetype1 3
	note C_, 1
	callchannel Branch_fb5bc
	octave 2
	note F_, 1
	notetype1 3
	note F_, 1
	notetype0 13
	octave 2
	notetype1 8
	note A_, 1
	note __, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 8
	note A_, 1
	note B_, 1
	inc_octave
	note C_, 1
	notetype1 3
	note C_, 1
	note __, 1
	callchannel Branch_fb5bc
	octave 2
	note A_, 2
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 8
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 8
	note B_, 1
	inc_octave
	callchannel Branch_fb5e4
	octave 4
	notetype1 10
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 10
	note G_, 4
	note G_, 8
	notetype1 3
	note G_, 1
	notetype1 10
	note E_, 1
	note F_, 1
	notetype0 1
	note G_, 6
	notetype1 3
	note G_, 7
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 4
	notetype1 3
	note G_, 1
	notetype1 10
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 10
	notetype0 1
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 2
	note E_, 1
	notetype0 1
	note E_, 6
	note F_, 4
	note E_, 3
	note D_, 13
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 4
	note D_, 8
	notetype1 3
	note D_, 2
	callchannel Branch_fb5e4
	octave 4
	notetype1 10
	note E_, 1
	notetype1 3
	note E_, 1
	dec_octave
	notetype1 10
	note G_, 4
	note G_, 8
	notetype1 3
	note G_, 1
	notetype1 10
	note E_, 1
	note F_, 1
	notetype0 1
	note G_, 6
	notetype1 3
	note G_, 7
	notetype1 10
	note G_, 3
	note G#, 10
	note G#, 13
	notetype1 3
	note G#, 13
	inc_octave
	notetype1 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 2
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 10
	note C_, 1
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 10
	notetype0 1
	note D#, 3
	note E_, 10
	notetype0 13
	note E_, 8
	callchannel Branch_fb60c
	notetype0 13
	octave 4
	note G_, 8
	notetype1 3
	note G_, 1
	notetype1 10
	notetype0 1
	note F#, 3
	note G_, 10
	notetype1 3
	note G_, 13
	notetype1 10
	note F_, 13
	notetype1 3
	note F_, 13
	notetype1 10
	note E_, 13
	notetype1 3
	note E_, 13
	notetype1 10
	note E_, 6
	note F_, 7
	note E_, 13
	dec_octave
	note A_, 6
	notetype1 3
	note A_, 7
	inc_octave
	notetype1 10
	note C_, 6
	notetype1 3
	note C_, 7
	dec_octave
	notetype1 10
	note F_, 6
	notetype1 3
	note F_, 13
	note __, 7
	notetype1 10
	note A_, 13
	inc_octave
	note C_, 6
	notetype1 3
	note C_, 7
	notetype1 10
	note D#, 3
	note E_, 10
	note E_, 13
	note F_, 6
	notetype1 3
	note F_, 7
	notetype1 10
	note E_, 6
	notetype1 3
	note E_, 7
	notetype1 10
	note C_, 6
	notetype1 3
	note C_, 13
	note __, 7
	notetype1 10
	note C#, 3
	note D_, 10
	note D_, 13
	note C#, 6
	note C_, 7
	dec_octave
	note B_, 13
	inc_octave
	note C_, 6
	notetype1 3
	note C_, 7
	notetype1 10
	note G_, 6
	notetype1 3
	note G_, 7
	notetype1 10
	notetype0 13
	note E_, 5
	callchannel Branch_fb60c
	notetype0 13
	octave 4
	note G_, 3
	notetype1 3
	note G_, 1
	notetype1 10
	note G_, 1
	notetype0 1
	note A_, 6
	notetype1 3
	note A_, 7
	notetype1 10
	note B_, 6
	notetype1 3
	note B_, 7
	notetype1 10
	note B_, 3
	inc_octave
	note C_, 10
	notetype1 3
	note C_, 13
	dec_octave
	notetype1 10
	note F#, 3
	note G_, 10
	notetype1 3
	note G_, 13
	notetype1 10
	note F_, 13
	notetype1 3
	note F_, 13
	notetype1 10
	note E_, 13
	notetype1 3
	note E_, 13
	notetype1 10
	note E_, 3
	note F_, 10
	note F_, 13
	note E_, 13
	note C_, 6
	notetype1 3
	note C_, 7
	dec_octave
	notetype1 10
	note A_, 6
	notetype1 3
	note A_, 7
	note __, 13
	inc_octave
	notetype1 10
	note C_, 13
	dec_octave
	note A_, 6
	notetype1 3
	note A_, 7
	inc_octave
	notetype1 10
	note E_, 3
	note F_, 10
	note F_, 13
	note E_, 13
	note C_, 6
	notetype1 3
	note C_, 7
	dec_octave
	notetype1 10
	note G#, 6
	notetype1 3
	note G#, 7
	note __, 13
	inc_octave
	notetype1 10
	note C_, 6
	notetype1 3
	note C_, 7
	note __, 13
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 8
	notetype1 3
	note G_, 1
	dec_octave
	dec_octave
	notetype1 8
	note G_, 1
	notetype1 2
	note G_, 1
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	notetype1 8
	note B_, 1
	notetype0 1
	notetype1 10
	note G_, 3
	note A_, 3
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 3
	note F_, 3
	note G_, 4
	callchannel Branch_fb651
	octave 3
	notetype1 10
	note G#, 3
	note A_, 10
	note A_, 13
	notetype1 3
	note A_, 13
	notetype1 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note F#, 3
	note G_, 10
	note G_, 13
	notetype1 3
	note G_, 13
	notetype1 10
	note D#, 3
	note E_, 10
	notetype1 3
	note E_, 13
	notetype1 10
	note D_, 13
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 4
	note D_, 8
	notetype1 3
	note D_, 1
	dec_octave
	notetype1 8
	note G_, 1
	notetype0 1
	note A_, 6
	notetype1 2
	note A_, 7
	notetype1 8
	note B_, 6
	notetype1 2
	note B_, 7
	callchannel Branch_fb651
	octave 3
	notetype1 10
	note G_, 3
	note G#, 10
	note G#, 13
	notetype1 3
	note G#, 13
	inc_octave
	notetype1 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 2
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 10
	note C_, 1
	note D_, 1
	notetype1 3
	note D_, 1
	octave 4
	notetype1 10
	notetype0 1
	note D#, 3
	note E_, 10
	notetype0 13
	note E_, 4
	notetype1 3
	note E_, 1
	notetype1 10
	note F_, 1
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 8
	notetype0 13
	notetype1 10
	note E_, 5
	notetype1 3
	note E_, 1
	notetype1 10
	note F_, 1
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 8
	notetype0 13
	notetype1 10
	note C_, 5
	notetype1 3
	note C_, 1
	dec_octave
	notetype0 1
	notetype1 10
	note A_, 6
	notetype1 3
	note A_, 13
	note __, 7
	inc_octave
	notetype1 10
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 2
	notetype1 3
	note D_, 1
	notetype1 10
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 10
	note G#, 1
	notetype1 3
	note G#, 1
	notetype1 10
	notetype0 1
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 3
	notetype1 3
	note G_, 1
	notetype1 10
	note G_, 1
	notetype0 1
	note A_, 5
	notetype1 3
	note A_, 8
	notetype1 10
	note B_, 5
	notetype1 3
	note B_, 8
	notetype1 10
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note C_, 2
	notetype0 1
	note C_, 6
	notetype1 3
	note C_, 13
	note __, 7
	dec_octave
	notetype1 10
	note B_, 3
	inc_octave
	note C_, 10
	note D_, 5
	notetype1 3
	note D_, 8
	notetype1 10
	note E_, 5
	notetype1 3
	note E_, 8
	notetype0 13
	notetype1 10
	note F_, 3
	note E_, 1
	notetype0 1
	note C_, 6
	notetype1 3
	note C_, 13
	note __, 7
	dec_octave
	notetype1 10
	note A_, 6
	notetype1 3
	note A_, 13
	note __, 7
	notetype1 10
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note C_, 2
	notetype0 1
	note C_, 6
	notetype1 3
	note C_, 13
	note __, 7
	notetype1 10
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 2
	notetype1 3
	note D_, 1
	notetype1 10
	note C_, 8
	note C_, 8
	note C_, 8
	notetype1 3
	note C_, 1
	notetype0 13
	octave 2
	notetype1 8
	note A_, 1
	note __, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 8
	note A_, 1
	note B_, 1
	inc_octave
	note C_, 1
	notetype1 3
	note C_, 1
	note __, 1
	callchannel Branch_fb5bc
	octave 2
	note A_, 2
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 8
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 8
	note B_, 1
	inc_octave
	callchannel Branch_fb5e4
	octave 4
	notetype1 10
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 10
	note G_, 4
	note G_, 8
	notetype1 3
	note G_, 1
	notetype1 10
	note E_, 1
	note F_, 1
	notetype0 1
	note G_, 6
	notetype1 3
	note G_, 7
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 4
	notetype1 3
	note G_, 1
	notetype1 10
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 10
	notetype0 1
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 2
	note E_, 1
	notetype0 1
	note E_, 6
	note F_, 4
	note E_, 3
	note D_, 13
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 4
	note D_, 8
	notetype1 3
	note D_, 2
	callchannel Branch_fb5e4
	octave 4
	notetype1 10
	note E_, 1
	notetype1 3
	note E_, 1
	dec_octave
	notetype1 10
	note G_, 4
	note G_, 8
	notetype1 3
	note G_, 1
	notetype1 10
	note E_, 1
	note F_, 1
	notetype0 1
	note G_, 6
	notetype1 3
	note G_, 7
	notetype1 10
	note G_, 3
	note G#, 10
	note G#, 13
	notetype1 3
	note G#, 13
	inc_octave
	notetype1 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 2
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 10
	note C_, 1
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 10
	notetype0 1
	note D#, 3
	note E_, 10
	notetype0 13
	note E_, 8
	callchannel Branch_fb60c
	notetype0 13
	octave 4
	note G_, 8
	notetype1 3
	note G_, 1
	notetype1 10
	notetype0 1
	note F#, 3
	note G_, 10
	notetype1 3
	note G_, 13
	notetype1 10
	note F_, 13
	notetype1 3
	note F_, 13
	notetype1 10
	note E_, 13
	notetype1 3
	note E_, 13
	notetype1 10
	note E_, 6
	note F_, 7
	note E_, 13
	dec_octave
	note A_, 6
	notetype1 3
	note A_, 7
	inc_octave
	notetype1 10
	note C_, 6
	notetype1 3
	note C_, 7
	dec_octave
	notetype1 10
	note F_, 6
	notetype1 3
	note F_, 13
	note __, 7
	notetype1 10
	note A_, 13
	inc_octave
	note C_, 6
	notetype1 3
	note C_, 7
	notetype1 10
	note D#, 3
	note E_, 10
	note E_, 13
	note F_, 6
	notetype1 3
	note F_, 7
	notetype1 10
	note E_, 6
	notetype1 3
	note E_, 7
	notetype1 10
	note C_, 6
	notetype1 3
	note C_, 13
	note __, 7
	notetype1 10
	note C#, 3
	note D_, 10
	note D_, 13
	note C#, 6
	note C_, 7
	dec_octave
	note B_, 13
	inc_octave
	note C_, 6
	notetype1 3
	note C_, 7
	notetype1 10
	note G_, 6
	notetype1 3
	note G_, 7
	notetype1 10
	notetype0 13
	note E_, 5
	callchannel Branch_fb60c
	notetype0 13
	octave 4
	note G_, 3
	notetype1 3
	note G_, 1
	notetype1 10
	note G_, 1
	notetype0 1
	note A_, 6
	notetype1 3
	note A_, 7
	notetype1 10
	note B_, 6
	notetype1 3
	note B_, 7
	notetype1 10
	note B_, 3
	inc_octave
	note C_, 10
	notetype1 3
	note C_, 13
	dec_octave
	notetype1 10
	note F#, 3
	note G_, 10
	notetype1 3
	note G_, 13
	notetype1 10
	note F_, 13
	notetype1 3
	note F_, 13
	notetype1 10
	note E_, 13
	notetype1 3
	note E_, 13
	notetype1 10
	note E_, 3
	note F_, 10
	note F_, 13
	note E_, 13
	note C_, 6
	notetype1 3
	note C_, 7
	dec_octave
	notetype1 10
	note A_, 6
	notetype1 3
	note A_, 7
	note __, 13
	inc_octave
	notetype1 10
	note C_, 13
	dec_octave
	note A_, 6
	notetype1 3
	note A_, 7
	inc_octave
	notetype1 10
	note E_, 3
	note F_, 10
	note F_, 13
	note E_, 13
	note C_, 6
	notetype1 3
	note C_, 7
	dec_octave
	notetype1 10
	note G#, 6
	notetype1 3
	note G#, 7
	note __, 13
	inc_octave
	notetype1 10
	note C_, 6
	notetype1 3
	note C_, 7
	note __, 13
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 8
	notetype1 3
	note G_, 1
	dec_octave
	dec_octave
	notetype1 8
	note G_, 1
	notetype1 2
	note G_, 1
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	notetype1 8
	note B_, 1
	notetype0 1
	notetype1 10
	note G_, 3
	note A_, 3
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 3
	note F_, 3
	note G_, 4
	callchannel Branch_fb651
	octave 3
	notetype1 10
	note G#, 3
	note A_, 10
	note A_, 13
	notetype1 3
	note A_, 13
	notetype1 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note F#, 3
	note G_, 10
	note G_, 13
	notetype1 3
	note G_, 13
	notetype1 10
	note D#, 3
	note E_, 10
	notetype1 3
	note E_, 13
	notetype1 10
	note D_, 13
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 4
	note D_, 8
	notetype1 3
	note D_, 1
	dec_octave
	notetype1 8
	note G_, 1
	notetype0 1
	note A_, 6
	notetype1 2
	note A_, 7
	notetype1 8
	note B_, 6
	notetype1 2
	note B_, 7
	callchannel Branch_fb651
	octave 3
	notetype1 10
	note G_, 3
	note G#, 10
	note G#, 13
	notetype1 3
	note G#, 13
	inc_octave
	notetype1 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note C#, 3
	note D_, 10
	note C_, 13
	notetype1 3
	note C_, 13
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 2
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 10
	note C_, 1
	note D_, 1
	notetype1 3
	note D_, 1
	octave 4
	notetype0 1
	notetype1 10
	note D_, 3
	note D#, 10
	notetype0 13
	note D#, 4
	notetype1 3
	note D#, 1
	notetype1 10
	note D_, 1
	notetype0 1
	note C_, 6
	notetype1 3
	note C_, 7
	notetype1 10
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 3
	notetype1 3
	note F_, 1
	notetype1 10
	note D#, 1
	note F_, 1
	notetype1 3
	note F_, 1
	notetype0 1
	notetype1 10
	note F#, 3
	note G_, 10
	notetype0 13
	note G_, 4
	dec_octave
	dec_octave
	notetype0 1
	notetype1 9
	note E_, 6
	note A_, 7
	inc_octave
	note C_, 6
	dec_octave
	note A_, 7
	note G_, 6
	inc_octave
	note C_, 7
	note F_, 6
	note D_, 7
	notetype0 13
	note E_, 8
	note E_, 1
	notetype1 3
	note E_, 2
	endchannel

Branch_fb5bc:
	octave 2
	notetype0 13
	note __, 2
	notetype1 8
	note G_, 1
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
	note A_, 1
	notetype1 3
	note A_, 1
	note __, 2
	notetype1 8
	note B_, 1
	notetype1 3
	note B_, 1
	notetype1 8
	note A_, 1
	note __, 1
	inc_octave
	note C_, 1
	notetype1 3
	note C_, 1
	note __, 3
	dec_octave
	notetype1 8
	note G_, 1
	inc_octave
	note C_, 1
	note __, 1
	endchannel

Branch_fb5e4:
	octave 3
	notetype1 10
	notetype0 1
	note F#, 3
	note G_, 10
	note F_, 6
	notetype1 3
	note F_, 7
	notetype0 13
	notetype1 8
	note E_, 4
	notetype1 3
	note E_, 1
	notetype1 10
	note G_, 1
	notetype1 3
	note G_, 1
	inc_octave
	notetype1 10
	notetype0 1
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 4
	notetype1 3
	note D_, 1
	endchannel

Branch_fb60c:
	octave 4
	notetype0 13
	notetype1 3
	note E_, 1
	notetype1 10
	notetype0 1
	note D#, 3
	note E_, 10
	notetype0 13
	notetype1 3
	note E_, 1
	notetype1 10
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 10
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 10
	notetype0 1
	note G#, 3
	note A_, 10
	notetype0 13
	note A_, 8
	notetype1 3
	note A_, 1
	notetype1 10
	notetype0 1
	note G#, 3
	note A_, 10
	notetype1 3
	note A_, 13
	notetype1 10
	note G_, 13
	notetype1 3
	note G_, 13
	notetype1 10
	note F_, 13
	notetype1 3
	note F_, 13
	notetype1 10
	note F#, 3
	note G_, 10
	endchannel

Branch_fb651:
	octave 3
	notetype1 10
	note D#, 3
	note E_, 10
	note F_, 6
	notetype1 3
	note F_, 7
	notetype1 10
	note G_, 5
	notetype1 3
	note G_, 8
	inc_octave
	notetype1 10
	note C#, 3
	note D_, 10
	note D_, 13
	note C_, 6
	notetype1 3
	note C_, 13
	note __, 7
	dec_octave
	notetype0 13
	notetype1 10
	note G_, 6
	note G_, 6
	note G_, 8
	notetype1 3
	note G_, 1
	notetype1 10
	notetype0 1
	note D#, 3
	note E_, 10
	note F_, 5
	notetype1 3
	note F_, 8
	notetype1 10
	note G_, 5
	notetype1 3
	note G_, 8
	endchannel


Music_TCGCredits_Ch2: 
	vibrato 20, $33
	notetype2 8
	dutycycle 1
	octave 2
	notetype0 13
	notetype1 4
	note A_, 1
	notetype1 7
	note A_, 2
	notetype0 1
	note A_, 6
	notetype1 2
	note A_, 7
	notetype0 13
	notetype1 8
	note B_, 1
	notetype1 8
	note B_, 2
	notetype0 1
	note B_, 6
	notetype1 3
	note B_, 7
	inc_octave
	notetype0 13
	notetype1 6
	note C_, 1
	notetype1 9
	note C_, 2
	notetype0 1
	note C_, 6
	notetype1 3
	note C_, 7
	notetype0 13
	notetype1 9
	note D_, 3
	notetype1 3
	note D_, 1
	notetype0 13
	octave 3
	notetype1 9
	note E_, 1
	notetype1 3
	note E_, 1
	callchannel Branch_fba68
	octave 2
	notetype1 9
	note A_, 1
	notetype1 3
	note A_, 1
	inc_octave
	notetype1 9
	note C_, 1
	notetype1 9
	note C_, 1
	dec_octave
	notetype1 9
	note B_, 1
	notetype1 3
	note B_, 1
	inc_octave
	notetype1 9
	note C_, 1
	note D_, 1
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	callchannel Branch_fba68
	notetype1 9
	octave 3
	notetype0 1
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 1
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 9
	note C_, 1
	notetype1 3
	note C_, 1
	notetype1 9
	note D_, 3
	notetype1 9
	dutycycle 1
.Loop1
	note __, 2
	note C_, 1
	note __, 1
	loopchannel 2, .Loop1
.Loop2
	note __, 2
	note D_, 1
	note __, 1
	loopchannel 2, .Loop2
	note __, 2
	note C_, 1
	note __, 2
	callchannel Branch_fba9d
	note __, 2
	dutycycle 1
	notetype1 9
	octave 3
	note C_, 1
	note __, 1
.Loop3
	note __, 2
	note C_, 1
	note __, 1
	loopchannel 4, .Loop3
	note __, 2
	dutycycle 2
	notetype1 7
	notetype0 1
	note E_, 3
	note F_, 10
	note A_, 5
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 7
	note C_, 5
	notetype1 2
	note C_, 8
	notetype1 7
	note E_, 5
	notetype1 2
	note E_, 8
	dec_octave
	notetype1 9
	dutycycle 1
	note C_, 13
	inc_octave
	dutycycle 2
	notetype1 7
	note E_, 3
	note F_, 10
	note F_, 13
	note E_, 5
	note F_, 4
	note E_, 4
	dec_octave
	dutycycle 1
	notetype1 9
	note C_, 13
	dutycycle 2
	notetype1 7
	note A_, 5
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 7
	note C_, 5
	notetype1 2
	note C_, 8
	notetype1 7
	note C#, 3
	note D_, 10
	dec_octave
	dutycycle 1
	notetype1 9
	note C_, 13
	note __, 13
	dec_octave
	notetype1 8
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note C_, 3
	note __, 1
	note E_, 1
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note A#, 3
	note B_, 10
	notetype0 13
	note B_, 4
	note __, 1
	inc_octave
	note C_, 1
	dec_octave
	dutycycle 1
	notetype1 9
	note D_, 1
	notetype1 8
	note E_, 5
	note __, 1
	callchannel Branch_fba9d
	dutycycle 1
	octave 3
	note C_, 1
	note D_, 1
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note F_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	notetype0 1
	note D_, 3
	note D#, 10
	notetype0 13
	note D#, 2
	dec_octave
	dec_octave
	notetype1 9
	note G#, 1
	note __, 1
	inc_octave
	notetype1 8
	note G#, 1
	note A#, 1
	dec_octave
	notetype1 9
	note G#, 1
	inc_octave
	inc_octave
	notetype1 8
	note C_, 3
	dec_octave
	notetype1 9
	note C_, 1
	note __, 1
	notetype1 8
	notetype0 1
	note F#, 3
	note G_, 10
	inc_octave
	notetype0 13
	notetype2 4
	note C_, 1
	dec_octave
	note B_, 1
	notetype2 8
	note A#, 1
	note __, 1
	callchannel Branch_fbacb
	octave 3
	notetype1 9
	notetype2 8
	note D_, 1
	notetype0 1
	notetype1 8
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 1
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 1
	note C_, 1
	dec_octave
	notetype2 4
	note F_, 1
	notetype2 8
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note D_, 1
	note __, 1
	notetype2 8
	note F_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 2
	notetype2 4
	note D_, 1
	dec_octave
	notetype2 8
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note A_, 1
	note __, 1
	notetype2 8
	note B_, 1
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note A_, 1
	notetype2 8
	note G_, 1
	notetype2 4
	note A_, 1
	notetype2 8
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 2
	dec_octave
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 10
	dec_octave
	notetype0 13
	notetype2 4
	note B_, 1
	notetype2 6
	note A#, 2
	callchannel Branch_fbacb
	octave 4
	note G_, 1
	notetype2 8
	note E_, 1
	notetype0 13
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 1
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	notetype2 7
	note C_, 2
	notetype2 8
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note F_, 1
	note __, 1
	notetype2 8
	note A_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	notetype2 7
	note C_, 2
	notetype2 8
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note F_, 1
	note __, 1
	note G#, 1
	notetype2 8
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note C_, 3
	note __, 1
	dec_octave
	note A_, 1
	inc_octave
	notetype2 4
	note C_, 1
	dec_octave
	notetype2 8
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note A#, 3
	note B_, 10
	note __, 13
	dec_octave
	notetype1 9
	note A#, 3
	note B_, 10
	notetype1 2
	note B_, 13
	inc_octave
	notetype1 9
	note C_, 13
	notetype1 2
	note C_, 13
	notetype1 9
	notetype0 13
	note D_, 2
	notetype1 2
	note D_, 1
	callchannel Branch_fbb10
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	note B_, 1
	note A_, 1
	inc_octave
	notetype1 9
	note C_, 1
	notetype1 8
	note E_, 2
	note __, 1
	note C_, 1
	note __, 1
	dec_octave
	notetype2 7
	note G_, 1
	notetype2 8
	note G_, 1
	inc_octave
	notetype1 9
	note C_, 1
	dec_octave
	notetype0 1
	notetype1 8
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note F_, 13
	note A_, 6
	notetype1 2
	note A_, 7
	inc_octave
	notetype1 7
	note C_, 6
	notetype1 2
	note C_, 7
	notetype1 7
	note E_, 6
	notetype1 2
	note E_, 7
	dec_octave
	dutycycle 1
	notetype1 9
	note C_, 13
	inc_octave
	dutycycle 2
	notetype1 7
	note D#, 3
	note E_, 10
	notetype0 13
	note E_, 1
	note F_, 1
	notetype0 1
	note E_, 5
	notetype1 2
	note E_, 8
	notetype1 7
	note D_, 5
	notetype1 2
	note D_, 8
	notetype0 13
	note __, 1
	dec_octave
	dec_octave
	notetype1 9
	dutycycle 1
	note B_, 1
	inc_octave
	notetype0 1
	note C_, 6
	notetype1 2
	note C_, 7
	notetype1 9
	note D_, 6
	notetype1 2
	note D_, 7
	callchannel Branch_fbb10
	octave 3
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note F_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype0 1
	notetype1 8
	note D_, 3
	note D#, 10
	notetype0 13
	note D#, 2
	dec_octave
	dec_octave
	notetype1 9
	note G#, 1
	note __, 1
	notetype0 1
	note __, 6
	notetype1 9
	note G#, 7
	inc_octave
	note C_, 6
	note D#, 7
	note G_, 6
	note A#, 7
	octave 4
	notetype0 13
	notetype1 8
	note C_, 3
	dec_octave
	notetype1 9
	note C_, 1
	note __, 2
	inc_octave
	notetype1 8
	note D_, 1
	notetype2 4
	note E_, 1
	notetype2 8
	note C_, 3
	dec_octave
	notetype1 9
	note D_, 1
	note __, 2
	inc_octave
	notetype1 8
	note D_, 1
	notetype2 4
	note E_, 1
	dec_octave
	notetype2 8
	note A_, 3
	notetype1 9
	note C_, 1
	note __, 2
	notetype2 4
	notetype1 8
	note F_, 1
	notetype2 8
	notetype1 9
	note C_, 1
	notetype1 8
	note G#, 3
	notetype1 9
	note C_, 1
	notetype1 8
	note G#, 1
	note __, 1
	note F_, 1
	notetype1 9
	note C_, 1
	notetype1 8
	note E_, 3
	notetype1 9
	note D_, 1
	note __, 1
	dec_octave
	notetype1 8
	note B_, 1
	inc_octave
	notetype2 4
	note C_, 1
	notetype1 9
	notetype2 8
	note D_, 1
	notetype1 8
	note E_, 3
	notetype1 9
	note C_, 1
	note __, 1
	notetype1 8
	note E_, 1
	notetype2 4
	note F_, 1
	notetype2 8
	notetype1 9
	note C_, 1
	notetype1 8
	note A_, 3
	notetype1 9
	note C_, 1
	notetype2 4
	note A_, 1
	note __, 1
	note F_, 1
	notetype2 8
	notetype1 9
	note C_, 1
	notetype1 8
	note A_, 3
	notetype1 9
	note C_, 1
	note __, 1
	notetype1 8
	note G#, 3
	note __, 1
	notetype0 13
	octave 3
	notetype1 9
	note E_, 1
	notetype1 3
	note E_, 1
	callchannel Branch_fba68
	octave 2
	notetype1 9
	note A_, 1
	notetype1 3
	note A_, 1
	inc_octave
	notetype1 9
	note C_, 1
	notetype1 9
	note C_, 1
	dec_octave
	notetype1 9
	note B_, 1
	notetype1 3
	note B_, 1
	inc_octave
	notetype1 9
	note C_, 1
	note D_, 1
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	callchannel Branch_fba68
	notetype1 9
	octave 3
	notetype0 1
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 1
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 9
	note C_, 1
	notetype1 3
	note C_, 1
	notetype1 9
	note D_, 3
	notetype1 9
	dutycycle 1
.Loop4
	note __, 2
	note C_, 1
	note __, 1
	loopchannel 2, .Loop4
.Loop5
	note __, 2
	note D_, 1
	note __, 1
	loopchannel 2, .Loop5
	note __, 2
	note C_, 1
	note __, 2
	callchannel Branch_fba9d
	note __, 2
	dutycycle 1
	notetype1 9
	octave 3
	note C_, 1
	note __, 1
.Loop6
	note __, 2
	note C_, 1
	note __, 1
	loopchannel 4, .Loop6
	note __, 2
	dutycycle 2
	notetype1 7
	notetype0 1
	note E_, 3
	note F_, 10
	note A_, 5
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 7
	note C_, 5
	notetype1 2
	note C_, 8
	notetype1 7
	note E_, 5
	notetype1 2
	note E_, 8
	dec_octave
	notetype1 9
	dutycycle 1
	note C_, 13
	inc_octave
	dutycycle 2
	notetype1 7
	note E_, 3
	note F_, 10
	note F_, 13
	note E_, 5
	note F_, 4
	note E_, 4
	dec_octave
	dutycycle 1
	notetype1 9
	note C_, 13
	dutycycle 2
	notetype1 7
	note A_, 5
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 7
	note C_, 5
	notetype1 2
	note C_, 8
	notetype1 7
	note C#, 3
	note D_, 10
	dec_octave
	dutycycle 1
	notetype1 9
	note C_, 13
	note __, 13
	dec_octave
	notetype1 8
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note C_, 3
	note __, 1
	note E_, 1
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note A#, 3
	note B_, 10
	notetype0 13
	note B_, 4
	note __, 1
	inc_octave
	note C_, 1
	dec_octave
	dutycycle 1
	notetype1 9
	note D_, 1
	notetype1 8
	note E_, 5
	note __, 1
	callchannel Branch_fba9d
	dutycycle 1
	octave 3
	note C_, 1
	note D_, 1
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note F_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	notetype0 1
	note D_, 3
	note D#, 10
	notetype0 13
	note D#, 2
	dec_octave
	dec_octave
	notetype1 9
	note G#, 1
	note __, 1
	inc_octave
	notetype1 8
	note G#, 1
	note A#, 1
	dec_octave
	notetype1 9
	note G#, 1
	inc_octave
	inc_octave
	notetype1 8
	note C_, 3
	dec_octave
	notetype1 9
	note C_, 1
	note __, 1
	notetype1 8
	notetype0 1
	note F#, 3
	note G_, 10
	inc_octave
	notetype0 13
	notetype2 4
	note C_, 1
	dec_octave
	note B_, 1
	notetype2 8
	note A#, 1
	note __, 1
	callchannel Branch_fbacb
	octave 3
	notetype1 9
	notetype2 8
	note D_, 1
	notetype0 1
	notetype1 8
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 1
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 1
	note C_, 1
	dec_octave
	notetype2 4
	note F_, 1
	notetype2 8
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note D_, 1
	note __, 1
	notetype2 8
	note F_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 2
	notetype2 4
	note D_, 1
	dec_octave
	notetype2 8
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note A_, 1
	note __, 1
	notetype2 8
	note B_, 1
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note A_, 1
	notetype2 8
	note G_, 1
	notetype2 4
	note A_, 1
	notetype2 8
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 2
	dec_octave
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 10
	dec_octave
	notetype0 13
	notetype2 4
	note B_, 1
	notetype2 6
	note A#, 2
	callchannel Branch_fbacb
	octave 4
	note G_, 1
	notetype2 8
	note E_, 1
	notetype0 13
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note C_, 1
	note __, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	notetype2 7
	note C_, 2
	notetype2 8
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note F_, 1
	note __, 1
	notetype2 8
	note A_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	notetype2 7
	note C_, 2
	notetype2 8
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	notetype1 8
	notetype2 4
	note F_, 1
	note __, 1
	note G#, 1
	notetype2 8
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	note C_, 3
	note __, 1
	dec_octave
	note A_, 1
	inc_octave
	notetype2 4
	note C_, 1
	dec_octave
	notetype2 8
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note A#, 3
	note B_, 10
	note __, 13
	dec_octave
	notetype1 9
	note A#, 3
	note B_, 10
	notetype1 2
	note B_, 13
	inc_octave
	notetype1 9
	note C_, 13
	notetype1 2
	note C_, 13
	notetype1 9
	notetype0 13
	note D_, 2
	notetype1 2
	note D_, 1
	callchannel Branch_fbb10
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	note B_, 1
	note A_, 1
	inc_octave
	notetype1 9
	note C_, 1
	notetype1 8
	note E_, 2
	note __, 1
	note C_, 1
	note __, 1
	dec_octave
	notetype2 7
	note G_, 1
	notetype2 8
	note G_, 1
	inc_octave
	notetype1 9
	note C_, 1
	dec_octave
	notetype0 1
	notetype1 8
	note E_, 3
	note F_, 10
	notetype0 13
	note F_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note F_, 13
	note A_, 6
	notetype1 2
	note A_, 7
	inc_octave
	notetype1 7
	note C_, 6
	notetype1 2
	note C_, 7
	notetype1 7
	note E_, 6
	notetype1 2
	note E_, 7
	dec_octave
	dutycycle 1
	notetype1 9
	note C_, 13
	inc_octave
	dutycycle 2
	notetype1 7
	note D#, 3
	note E_, 10
	notetype0 13
	note E_, 1
	note F_, 1
	notetype0 1
	note E_, 5
	notetype1 2
	note E_, 8
	notetype1 7
	note D_, 5
	notetype1 2
	note D_, 8
	notetype0 13
	note __, 1
	dec_octave
	dec_octave
	notetype1 9
	dutycycle 1
	note B_, 1
	inc_octave
	notetype0 1
	note C_, 6
	notetype1 2
	note C_, 7
	notetype1 9
	note D_, 6
	notetype1 2
	note D_, 7
	callchannel Branch_fbb10
	octave 3
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note F_, 1
	notetype1 9
	note C_, 1
	inc_octave
	notetype0 1
	notetype1 8
	note D_, 3
	note D#, 10
	notetype0 13
	note D#, 2
	dec_octave
	dec_octave
	notetype1 9
	note G#, 1
	note __, 1
	notetype0 1
	note __, 6
	notetype1 9
	note G#, 7
	inc_octave
	note C_, 6
	note D#, 7
	note G_, 6
	note A#, 7
	octave 4
	notetype0 13
	notetype1 8
	note C_, 1
	note C_, 2
	dec_octave
	dec_octave
	notetype1 9
	note G#, 1
	note __, 2
	inc_octave
	notetype1 8
	note A#, 1
	dec_octave
	notetype1 9
	note G#, 1
	inc_octave
	inc_octave
	notetype1 8
	note C_, 1
	note C_, 2
	dec_octave
	notetype1 9
	note C_, 1
	note __, 1
	inc_octave
	notetype1 8
	note C_, 1
	note C_, 1
	dec_octave
	notetype1 9
	note C_, 1
	inc_octave
	notetype1 8
	note E_, 1
	note E_, 4
	dec_octave
	dec_octave
	notetype0 1
	notetype1 8
	note C_, 6
	note F_, 7
	note A_, 6
	note F_, 7
	note E_, 6
	note G_, 7
	inc_octave
	note D_, 6
	dec_octave
	note B_, 7
	inc_octave
	notetype0 13
	note C_, 8
	note C_, 1
	notetype1 2
	note C_, 2
	endchannel

Branch_fba68:
	octave 3
	notetype1 9
	note C_, 1
	note __, 1
	notetype1 9
	note C_, 1
	note E_, 1
	notetype1 9
	note C_, 1
	notetype1 9
	note F_, 1
	notetype1 3
	note F_, 1
	note __, 1
	notetype1 9
	note C_, 1
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 1
	notetype1 9
	note C_, 1
	notetype1 9
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	notetype1 9
	note C_, 1
	note __, 1
	notetype1 9
	note C_, 1
	note E_, 1
	notetype1 9
	note C_, 1
	endchannel

Branch_fba9d:
	octave 4
	dutycycle 2
	notetype1 7
	notetype0 1
	note F#, 3
	note G_, 10
	dec_octave
	dutycycle 1
	notetype1 9
	note C_, 13
	inc_octave
	dutycycle 2
	notetype1 7
	note E_, 5
	notetype1 2
	note E_, 8
	notetype1 7
	note E_, 3
	note F_, 10
	note E_, 5
	notetype1 2
	note E_, 8
	dec_octave
	notetype0 13
	dutycycle 1
	notetype1 9
	note C_, 1
	dutycycle 2
	notetype1 7
	note G_, 1
	endchannel

Branch_fbacb:
	octave 3
	notetype2 8
.Loop4
	note A#, 1
	note __, 1
	loopchannel 3, .Loop4
	inc_octave
	note C_, 3
	dec_octave
	notetype1 9
	note C_, 1
	note __, 1
	notetype1 8
	note A_, 1
	inc_octave
	notetype2 4
	note C_, 1
	dec_octave
	notetype2 8
	notetype1 9
	note C_, 1
	notetype0 1
	notetype1 8
	note A#, 3
	note B_, 16
	note __, 7
	note A#, 3
	note B_, 10
	dec_octave
	notetype0 13
	notetype1 9
	note B_, 1
	inc_octave
	notetype1 8
	note B_, 1
	note __, 1
	note A_, 1
	dec_octave
	notetype1 9
	note B_, 1
	inc_octave
	notetype1 8
	note B_, 3
	notetype1 9
	note D_, 1
	note __, 1
	notetype1 8
	note B_, 1
	inc_octave
	notetype2 4
	note D_, 1
	endchannel

Branch_fbb10:
	octave 3
	notetype0 13
	notetype1 8
	note C_, 1
	notetype2 3
	note D_, 1
	notetype1 9
	notetype2 8
	note C_, 1
	notetype1 8
	note B_, 2
	notetype2 3
	note A_, 1
	notetype1 9
	notetype2 8
	note C_, 1
	notetype0 1
	notetype1 8
	note D#, 3
	note E_, 10
	notetype0 13
	note E_, 2
	notetype1 9
	note D_, 1
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note G_, 5
	notetype1 2
	note G_, 8
	notetype1 7
	note F_, 5
	note G_, 4
	note F_, 4
	note E_, 5
	notetype1 2
	note E_, 8
	dec_octave
	dutycycle 1
	notetype1 9
	note D_, 13
	inc_octave
	dutycycle 2
	notetype1 7
	note C_, 5
	notetype1 2
	note C_, 8
	notetype1 7
	note D_, 13
	note E_, 5
	notetype1 2
	note E_, 8
	notetype1 7
	note C_, 5
	notetype1 2
	note C_, 8
	dec_octave
	notetype0 13
	notetype1 7
	note E_, 4
	inc_octave
	inc_octave
	notetype0 1
	note C_, 5
	notetype1 2
	note C_, 8
	dec_octave
	notetype1 7
	note B_, 13
	inc_octave
	note C_, 5
	notetype1 2
	note C_, 8
	dec_octave
	notetype1 7
	note B_, 5
	notetype1 2
	note B_, 8
	notetype1 7
	note G_, 5
	notetype1 2
	note G_, 8
	dec_octave
	dec_octave
	dutycycle 1
	notetype1 8
	note B_, 3
	inc_octave
	note C_, 10
	notetype0 13
	notetype2 3
	note D_, 1
	note E_, 1
	notetype2 8
	note F_, 2
	endchannel


Music_TCGCredits_Ch3: 
	notetype0 1
	notetype1 1
	notetype2 11
	octave 2
.Loop1
	note G_, 6
	note __, 7
	loopchannel 12, .Loop1
	note G_, 6
	note A_, 7
	note B_, 6
	inc_octave
	note C_, 7
	note D_, 6
	note E_, 7
	note F_, 6
	note G_, 7
	notetype0 1
	octave 3
	callchannel Branch_fbd47
	callchannel Branch_fbe23
	callchannel Branch_fbd47
.Loop7
	note C_, 6
	note __, 7
	loopchannel 2, .Loop7
	note A_, 13
	note C_, 6
	note __, 7
.Loop8
	note C_, 6
	note __, 7
	loopchannel 2, .Loop8
	inc_octave
	note C_, 13
	dec_octave
	note C_, 6
	note __, 7
	callchannel Branch_fbd47
	callchannel Branch_fbe23
	octave 3
.Loop9
	note C_, 6
	note __, 7
	loopchannel 2, .Loop9
	note G_, 13
	note C_, 6
	note __, 7
.Loop10
	note C_, 6
	note __, 7
	loopchannel 2, .Loop10
	note G_, 13
	dec_octave
	note G_, 13
	notetype0 13
	note G_, 7
	note __, 1
	notetype0 1
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbd91
	callchannel Branch_fbda4
	callchannel Branch_fbdb7
	callchannel Branch_fbdca
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbddd
	callchannel Branch_fbdf0
	callchannel Branch_fbd47
	callchannel Branch_fbe03
	callchannel Branch_fbd91
	callchannel Branch_fbdca
	callchannel Branch_fbe10
	callchannel Branch_fbd6b
	callchannel Branch_fbdb7
	callchannel Branch_fbdca
	callchannel Branch_fbd47
	callchannel Branch_fbe03
	callchannel Branch_fbd91
	callchannel Branch_fbdca
	callchannel Branch_fbe10
	callchannel Branch_fbd6b
	callchannel Branch_fbdb7
	callchannel Branch_fbdf0
	callchannel Branch_fbdca
	octave 2
	note G_, 6
	note __, 7
	note G_, 13
	inc_octave
	note G_, 6
	note __, 7
	dec_octave
	note A_, 6
	note __, 7
	note A_, 6
	note __, 7
	notetype0 13
	note B_, 2
	note G_, 1
	notetype0 1
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbd91
	callchannel Branch_fbda4
	callchannel Branch_fbdb7
	callchannel Branch_fbe3d
	octave 2
	note B_, 6
	note __, 7
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbddd
	octave 2
.Loop11
	note A#, 6
	note __, 7
	loopchannel 2, .Loop11
	inc_octave
	note F_, 13
	dec_octave
	note A#, 6
	note __, 7
	note A#, 6
	inc_octave
	note F_, 7
	note G#, 6
	inc_octave
	note C_, 7
	note D#, 6
	note G_, 7
	dec_octave
	dec_octave
	note A#, 6
	note __, 7
	callchannel Branch_fbd47
	octave 2
.Loop2
	rept 2
	note B_, 6
	note __, 7
	endr
	inc_octave
	note G_, 13
	dec_octave
	note B_, 6
	note __, 7
	loopchannel 2, .Loop2
.Loop3
	rept 2
	note A_, 6
	note __, 7
	endr
	inc_octave
	note F_, 13
	dec_octave
	note A_, 6
	note __, 7
	loopchannel 2, .Loop3
.Loop4
	rept 2
	note G#, 6
	note __, 7
	endr
	inc_octave
	note F_, 13
	dec_octave
	note G#, 6
	note __, 7
	loopchannel 2, .Loop4
	callchannel Branch_fbe10
	callchannel Branch_fbd6b
	callchannel Branch_fbdb7
	callchannel Branch_fbe3d
	octave 2
	note B_, 13
	notetype0 1
	octave 3
	callchannel Branch_fbd47
	callchannel Branch_fbe23
	callchannel Branch_fbd47
.Loop12
	note C_, 6
	note __, 7
	loopchannel 2, .Loop12
	note A_, 13
	note C_, 6
	note __, 7
.Loop13
	note C_, 6
	note __, 7
	loopchannel 2, .Loop13
	inc_octave
	note C_, 13
	dec_octave
	note C_, 6
	note __, 7
	callchannel Branch_fbd47
	callchannel Branch_fbe23
	octave 3
.Loop14
	note C_, 6
	note __, 7
	loopchannel 2, .Loop14
	note G_, 13
	note C_, 6
	note __, 7
.Loop15
	note C_, 6
	note __, 7
	loopchannel 2, .Loop15
	note G_, 13
	dec_octave
	note G_, 13
	notetype0 13
	note G_, 7
	note __, 1
	notetype0 1
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbd91
	callchannel Branch_fbda4
	callchannel Branch_fbdb7
	callchannel Branch_fbdca
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbddd
	callchannel Branch_fbdf0
	callchannel Branch_fbd47
	callchannel Branch_fbe03
	callchannel Branch_fbd91
	callchannel Branch_fbdca
	callchannel Branch_fbe10
	callchannel Branch_fbd6b
	callchannel Branch_fbdb7
	callchannel Branch_fbdca
	callchannel Branch_fbd47
	callchannel Branch_fbe03
	callchannel Branch_fbd91
	callchannel Branch_fbdca
	callchannel Branch_fbe10
	callchannel Branch_fbd6b
	callchannel Branch_fbdb7
	callchannel Branch_fbdf0
	callchannel Branch_fbdca
	octave 2
	note G_, 6
	note __, 7
	note G_, 13
	inc_octave
	note G_, 6
	note __, 7
	dec_octave
	note A_, 6
	note __, 7
	note A_, 6
	note __, 7
	notetype0 13
	note B_, 2
	note G_, 1
	notetype0 1
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbd91
	callchannel Branch_fbda4
	callchannel Branch_fbdb7
	callchannel Branch_fbe3d
	octave 2
	note B_, 6
	note __, 7
	callchannel Branch_fbd47
	callchannel Branch_fbd58
	callchannel Branch_fbd6b
	callchannel Branch_fbd7e
	callchannel Branch_fbddd
	octave 2
.Loop16
	note A#, 6
	note __, 7
	loopchannel 2, .Loop16
	inc_octave
	note F_, 13
	dec_octave
	note A#, 6
	note __, 7
	note A#, 6
	inc_octave
	note F_, 7
	note G#, 6
	inc_octave
	note C_, 7
	note D#, 6
	note G_, 7
	dec_octave
	dec_octave
	note A#, 6
	note __, 7
	notetype0 1
	octave 2
.Loop5
	note G#, 6
	note __, 7
	note G#, 6
	note __, 7
	inc_octave
	inc_octave
	note D#, 13
	dec_octave
	dec_octave
	note G#, 6
	note __, 7
	loopchannel 2, .Loop5
	inc_octave
.Loop6
	note C#, 6
	note __, 7
	note C#, 6
	note __, 7
	inc_octave
	note F_, 13
	dec_octave
	note C#, 6
	note __, 7
	loopchannel 2, .Loop6
	note C_, 6
	note __, 7
	note C_, 6
	note __, 7
	inc_octave
	note C_, 13
	dec_octave
	note C_, 6
	note __, 7
	note C_, 6
	note __, 7
	note C_, 6
	note __, 7
	dec_octave
	note G_, 6
	note __, 7
	note G_, 6
	note __, 7
	notetype0 13
	note C_, 8
	note C_, 1
	note __, 2
	endchannel

Branch_fbd47:
	octave 3
.Loop12
	rept 2
	note C_, 6
	note __, 7
	endr
	note G_, 13
	note C_, 6
	note __, 7
	loopchannel 2, .Loop12
	endchannel

Branch_fbd58:
	octave 2
.Loop13
	rept 2
	note B_, 6
	note __, 7
	endr
	inc_octave
	note G_, 13
	dec_octave
	note B_, 6
	note __, 7
	loopchannel 2, .Loop13
	endchannel

Branch_fbd6b:
	octave 2
.Loop14
	rept 2
	note A_, 6
	note __, 7
	endr
	inc_octave
	note G_, 13
	dec_octave
	note A_, 6
	note __, 7
	loopchannel 2, .Loop14
	endchannel

Branch_fbd7e:
	octave 2
.Loop15
	rept 2
	note G_, 6
	note __, 7
	endr
	inc_octave
	note G_, 13
	dec_octave
	note G_, 6
	note __, 7
	loopchannel 2, .Loop15
	endchannel

Branch_fbd91:
	octave 2
.Loop16
	rept 2
	note F_, 6
	note __, 7
	endr
	inc_octave
	note F_, 13
	dec_octave
	note F_, 6
	note __, 7
	loopchannel 2, .Loop16
	endchannel

Branch_fbda4:
	octave 2
.Loop17
	rept 2
	note E_, 6
	note __, 7
	endr
	inc_octave
	note E_, 13
	dec_octave
	note E_, 6
	note __, 7
	loopchannel 2, .Loop17
	endchannel

Branch_fbdb7:
	octave 2
.Loop18
	rept 2
	note D_, 6
	note __, 7
	endr
	inc_octave
	note F_, 13
	dec_octave
	note D_, 6
	note __, 7
	loopchannel 2, .Loop18
	endchannel

Branch_fbdca:
	octave 2
.Loop19
	rept 2
	note G_, 6
	note __, 7
	endr
	inc_octave
	note F_, 13
	dec_octave
	note G_, 6
	note __, 7
	loopchannel 2, .Loop19
	endchannel

Branch_fbddd:
	octave 2
.Loop20
	rept 2
	note F_, 6
	note __, 7
	endr
	inc_octave
	note G#, 13
	dec_octave
	note F_, 6
	note __, 7
	loopchannel 2, .Loop20
	endchannel

Branch_fbdf0:
	octave 2
.Loop21
	rept 2
	note A#, 6
	note __, 7
	endr
	inc_octave
	note F_, 13
	dec_octave
	note A#, 6
	note __, 7
	loopchannel 2, .Loop21
	endchannel

Branch_fbe03:
	octave 3
	note C_, 6
	note __, 7
	dec_octave
	note C_, 13
	note __, 13
	note D_, 13
	note __, 13
	note E_, 13
	note __, 13
	note C_, 6
	note __, 7
	endchannel

Branch_fbe10:
	octave 2
.Loop22
	rept 2
	note E_, 6
	note __, 7
	endr
	inc_octave
	note G_, 13
	dec_octave
	note E_, 6
	note __, 7
	loopchannel 2, .Loop22
	endchannel

Branch_fbe23:
	octave 3
.Loop23
	note C_, 6
	note __, 7
	loopchannel 2, .Loop23
	note A_, 13
	note C_, 6
	note __, 7
.Loop24
	note C_, 6
	note __, 7
	loopchannel 2, .Loop24
	note F_, 13
	note C_, 6
	note __, 7
	endchannel

Branch_fbe3d:
	octave 2
.Loop25
	note G_, 6
	note __, 7
	loopchannel 2, .Loop25
	inc_octave
	note F_, 13
	dec_octave
	note G_, 6
	note __, 7
	note G_, 6
	note __, 7
	note G_, 13
	note A_, 13
	endchannel


Music_TCGCredits_Ch4: 
	togglenoise $06
	notetype 1
	octave 1
.Loop1
	note D_, 13
	loopchannel 8, .Loop1
.Loop2
	note C#, 13
	loopchannel 4, .Loop2
.Loop3
	note C#, 6
	note C#, 7
	loopchannel 4, .Loop3
.Loop7
	callchannel Branch_fbed1
	loopchannel 6, .Loop7
	note C_, 13
	note D#, 13
	note C#, 13
	note D#, 6
	note D#, 7
	note C_, 13
	note D#, 13
	note C#, 13
	notetype 13
	note F_, 7
	note C#, 2
	notetype 1
.Loop8
	callchannel Branch_fbed1
	loopchannel 15, .Loop8
	callchannel Branch_fbedb
.Loop9
	callchannel Branch_fbed1
	loopchannel 7, .Loop9
	callchannel Branch_fbedb
.Loop10
	callchannel Branch_fbed1
	loopchannel 7, .Loop10
	callchannel Branch_fbeea
.Loop11
	callchannel Branch_fbed1
	loopchannel 7, .Loop11
	note C_, 13
	note D#, 13
	note C#, 13
	note D#, 6
	note D#, 7
	note C_, 13
	note D#, 6
	note D_, 4
	note D_, 3
	note C#, 6
	note C#, 7
	note C#, 13
.Loop12
	callchannel Branch_fbed1
	loopchannel 5, .Loop12
	callchannel Branch_fbeea
.Loop4
	callchannel Branch_fbed1
	loopchannel 7, .Loop4
	note C_, 13
	note D#, 13
	note C#, 13
	note D#, 6
	note D_, 4
	note D_, 3
.Loop5
	note C#, 6
	note C#, 7
	loopchannel 4, .Loop5
.Loop13
	callchannel Branch_fbed1
	loopchannel 6, .Loop13
	note C_, 13
	note D#, 13
	note C#, 13
	note D#, 6
	note D#, 7
	note C_, 13
	note D#, 13
	note C#, 13
	notetype 13
	note F_, 7
	note C#, 2
	notetype 1
.Loop14
	callchannel Branch_fbed1
	loopchannel 15, .Loop14
	callchannel Branch_fbedb
.Loop15
	callchannel Branch_fbed1
	loopchannel 7, .Loop15
	callchannel Branch_fbedb
.Loop16
	callchannel Branch_fbed1
	loopchannel 7, .Loop16
	callchannel Branch_fbeea
.Loop17
	callchannel Branch_fbed1
	loopchannel 7, .Loop17
	note C_, 13
	note D#, 13
	note C#, 13
	note D#, 6
	note D#, 7
	note C_, 13
	note D#, 6
	note D_, 4
	note D_, 3
	note C#, 6
	note C#, 7
	note C#, 13
.Loop18
	callchannel Branch_fbed1
	loopchannel 5, .Loop18
	callchannel Branch_fbeea
.Loop6
	callchannel Branch_fbed1
	loopchannel 2, .Loop6
	callchannel Branch_fbeea
	notetype 13
	note F_, 8
	note __, 3
	endchannel

Branch_fbed1:
	note C_, 13
	note D#, 13
	note C#, 13
	note D#, 6
	note D#, 7
	note C_, 13
	note D#, 13
	note C#, 13
	note E_, 13
	endchannel

Branch_fbedb:
	note C_, 13
	note D#, 6
	note D_, 7
	note C#, 6
	note C#, 7
.Loop13
	note C#, 6
	note D_, 4
	note D_, 3
	note C#, 6
	note C#, 7
	loopchannel 2, .Loop13
	note C#, 13
	endchannel

Branch_fbeea:
	note C_, 13
	note D#, 13
	note C#, 13
	note D#, 6
	note D_, 4
	note D_, 3
.Loop14
	note C#, 6
	note C#, 7
	loopchannel 3, .Loop14
	note C#, 13
	endchannel

