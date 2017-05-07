Music_TCG2Fort1:
	db $C0
	dw Music_TCG2Fort1_Ch1
	db $01
	dw Music_TCG2Fort1_Ch2
	db $02
	dw Music_TCG2Fort1_Ch3
	db $03
	dw Music_TCG2Fort1_Ch4

Music_TCG2Fort1_Ch2: 
	notetype1 10
	notetype0 1
	octave 2
	note A#, 3
	note B_, 3
	inc_octave
	note C_, 3
	note C#, 6
	note C#, 2
	note C#, 16
	note __, 7
	note E_, 6
	note E_, 16
	note __, 2
	vibrato 16, $33
	octave 4
	note D#, 3
	note E_, 4
.MainLoop
	callchannel Branch_1ed865
	note C#, 16
	note C#, 15
	note E_, 2
	note F#, 14
	note F#, 8
	note F#, 7
	callchannel Branch_1ed865
	note C#, 16
	note D#, 15
	note E_, 16
	note F#, 15
	callchannel Branch_1ed8a8
	note G_, 16
	note F#, 15
	note E_, 16
	note D_, 8
	note D_, 15
	note D_, 8
	dec_octave
	note B_, 8
	note B_, 15
	note B_, 8
	inc_octave
	note D#, 3
	note E_, 12
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note D#, 2
	note E_, 14
	note E_, 15
	note F#, 16
	note F#, 15
	callchannel Branch_1ed8a8
	note G_, 16
	note F#, 15
	note E_, 16
	note D_, 8
	note D_, 15
	note D_, 8
	dec_octave
	note B_, 8
	note B_, 7
	inc_octave
	note D#, 2
	note E_, 14
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 13
	note E_, 2
	note D#, 6
	note D#, 16
	note __, 9
	note D#, 6
	note D#, 16
	note __, 9
	note F#, 16
	note G#, 8
	note G#, 7
	callchannel Branch_1edb5a
	octave 4
	note B_, 8
	note B_, 15
	note B_, 8
	note D#, 8
	note D#, 7
	callchannel Branch_1edb5a
	octave 4
	note F#, 8
	note F#, 7
	note F#, 16
	note E_, 8
	note E_, 7
	note E_, 16
	note E_, 8
	note E_, 7
	note E_, 16
	note D#, 15
	note E_, 16
	note F#, 8
	note F#, 7
	note F#, 16
	note G#, 8
	note G#, 7
	callchannel Branch_1edb5a
	octave 4
	note B_, 8
	note B_, 15
	note B_, 8
	note D#, 8
	note D#, 7
	callchannel Branch_1edb5a
	octave 4
	note D#, 2
	note E_, 13
	note E_, 16
	note E_, 15
	callchannel Branch_1edb5a
	octave 4
	note E_, 15
	note E_, 16
	note D#, 15
	note E_, 16
	note F#, 8
	note F#, 7
	note F#, 16
	note G#, 8
	note G#, 7
	callchannel Branch_1edb5a
	octave 4
	note B_, 8
	note B_, 15
	note B_, 8
	note D#, 8
	note D#, 7
	callchannel Branch_1edb5a
	octave 4
	note F#, 8
	note F#, 7
	note F#, 16
	note E_, 8
	note E_, 7
	note E_, 16
	note E_, 8
	note E_, 7
	note E_, 16
	note D#, 15
	note E_, 16
	note F#, 8
	note F#, 7
	note F#, 16
	note G#, 8
	note G#, 7
	callchannel Branch_1edb5a
	octave 4
	note B_, 8
	note B_, 15
	note B_, 8
	note D#, 8
	note D#, 7
	callchannel Branch_1edb5a
	octave 4
	note D#, 2
	note E_, 13
	note E_, 16
	note E_, 15
	callchannel Branch_1edb5a
	octave 4
	note E_, 15
	note E_, 16
	note D#, 15
	note E_, 16
	note F#, 8
	note F#, 7
	note F#, 16
	note G_, 8
	note G_, 7
	callchannel Branch_1edb5a
	octave 4
	note B_, 8
	note B_, 15
	note B_, 8
	note G_, 8
	note G_, 7
	callchannel Branch_1edb5a
	octave 4
	note G_, 2
	note A_, 13
	note A_, 16
	note A_, 15
	callchannel Branch_1edb5a
	octave 4
	note F#, 15
	note F#, 16
	note F#, 15
	callchannel Branch_1edb5a
	octave 4
	note F#, 8
	note F#, 7
	note G_, 16
	note F#, 8
	note F#, 7
	note E_, 8
	note E_, 8
	note D_, 8
	note D_, 15
	note D_, 8
	dec_octave
	note B_, 8
	note B_, 15
	note B_, 8
	inc_octave
	note D#, 2
	note E_, 13
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
	note E_, 16
	note E_, 15
.Loop1
	note D#, 6
	note D#, 16
	note __, 9
	loopchannel 2, .Loop1
	loopchannel 0, .MainLoop

Branch_1ed865:
	octave 4
	note D#, 16
	note C#, 15
	note D#, 16
	note G#, 8
	note G#, 15
	note G#, 8
	dec_octave
	note B_, 8
	note B_, 15
	note B_, 8
	inc_octave
	note D_, 2
	note D#, 6
	note D#, 7
	note D#, 16
	note C#, 8
	note C#, 7
	note C#, 16
	note C#, 8
	note C#, 7
	note C#, 16
	note D#, 15
	note E_, 16
	note F#, 8
	note F#, 7
	note D#, 16
	note C#, 15
	note D#, 16
	note G#, 8
	note G#, 15
	note G#, 8
	dec_octave
	note B_, 8
	note B_, 15
	note B_, 8
	inc_octave
	note C_, 2
	note C#, 13
	note C#, 16
	note C#, 15
	note C#, 16
	note C#, 15
	endchannel

Branch_1ed8a8:
	octave 4
	note G_, 16
	note F#, 15
	note G_, 16
	note B_, 8
	note B_, 15
	note B_, 8
	note G_, 8
	note G_, 15
	note G_, 8
	note G#, 3
	note A_, 12
	note A_, 16
	note A_, 15
	note A_, 16
	note F#, 15
	note F#, 16
	note F#, 15
	note F#, 16
	note F#, 8
	note F#, 7
	endchannel


Music_TCG2Fort1_Ch1: 
	notetype1 10
	notetype0 1
	dutycycle 0
	notetype1 9
	vibrato 18, $33
	octave 2
	note __, 9
	note A_, 6
	note A_, 16
	note __, 9
	inc_octave
	note C#, 6
	note C#, 10
	note __, 8
	note __, 7
.MainLoop
	octave 3
.Loop1
	note __, 16
	note __, 15
	note D#, 6
	note D#, 10
	note __, 15
	loopchannel 2, .Loop1
.Loop2
	note __, 16
	note __, 15
	note C#, 6
	note C#, 10
	note __, 15
	loopchannel 2, .Loop2
.Loop3
	note __, 16
	note __, 15
	note D#, 6
	note D#, 10
	note __, 15
	loopchannel 2, .Loop3
	note __, 16
	note __, 15
	note C#, 6
	note C#, 10
	note __, 15
	notetype1 8
	note D#, 3
	note E_, 13
	note E_, 15
	note D#, 16
	note D#, 15
	dec_octave
	note B_, 16
	note B_, 15
	octave 3
	note D#, 6
	note D#, 10
	note __, 15
	note __, 16
	note __, 15
	note D#, 6
	note D#, 10
	note __, 15
.Loop4
	note __, 16
	note __, 15
	note C#, 6
	note C#, 10
	note __, 15
	loopchannel 2, .Loop4
.Loop5
	note __, 16
	note __, 15
	note D#, 6
	note D#, 10
	note __, 15
	loopchannel 2, .Loop5
	note __, 16
	note __, 15
	note C#, 6
	note C#, 10
	note __, 8
	octave 4
	note D_, 3
	note D#, 4
	note E_, 16
	dec_octave
	note B_, 15
	inc_octave
	note C#, 16
	note D#, 15
	note E_, 16
	note D_, 15
	callchannel Branch_1edb4e
	octave 4
	note G_, 8
	note G_, 15
	note G_, 8
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note F#, 15
	note F#, 16
	note F#, 15
	callchannel Branch_1edb4e
	inc_octave
	note D_, 15
	note D_, 16
	note D_, 15
	callchannel Branch_1edb4e
	octave 4
	note D_, 8
	note D_, 7
	note E_, 16
	note D_, 15
	callchannel Branch_1edb4e
	note B_, 8
	note B_, 15
	note B_, 8
	note G_, 8
	note G_, 7
	callchannel Branch_1edb4e
	octave 4
	note C_, 15
	note C_, 16
	note C_, 15
	callchannel Branch_1edb4e
	octave 4
	note __, 15
	note C_, 16
	note C_, 15
	note D_, 16
	note D_, 15
	note E_, 16
	note D_, 15
	callchannel Branch_1edb4e
	octave 4
	note G_, 8
	note G_, 15
	note G_, 8
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note F#, 15
	note F#, 16
	note F#, 15
	callchannel Branch_1edb4e
	octave 4
	note D_, 15
	note D_, 16
	note D_, 15
	callchannel Branch_1edb4e
	octave 4
	note D_, 8
	note D_, 7
	note E_, 16
	note D_, 15
	note C_, 16
	dec_octave
	note B_, 8
	note B_, 15
	note B_, 8
	octave 3
	note D_, 6
	note D_, 9
	inc_octave
	note C_, 16
	note C_, 15
	note C_, 16
	dec_octave
	note G_, 8
	note G_, 7
	note A_, 16
	note A_, 15
	note A_, 16
	note B_, 8
	note B_, 7
	inc_octave
	note C_, 16
	note C_, 15
	dec_octave
	note D_, 4
	note E_, 4
	note F_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	inc_octave
	note C_, 4
	note D_, 3
	dec_octave
	note A_, 6
	note A_, 16
	note __, 9
	note A_, 6
	note A_, 16
	note __, 9
	inc_octave
	note D#, 16
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note G#, 8
	note G#, 15
	note G#, 8
	dec_octave
	note B_, 8
	note B_, 7
	callchannel Branch_1edb4e
	octave 4
	note D#, 8
	note D#, 7
	note D#, 16
	note C#, 8
	note C#, 7
	callchannel Branch_1edb4e
	note __, 8
	note __, 7
	octave 4
	note C#, 16
	dec_octave
	note B_, 15
	callchannel Branch_1edb4e
	octave 4
	note D#, 8
	note D#, 7
	note D#, 16
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note G#, 8
	note G#, 15
	note G#, 8
	dec_octave
	note B_, 8
	note B_, 7
	callchannel Branch_1edb4e
	octave 4
	note C#, 15
	note C#, 16
	note C#, 15
	callchannel Branch_1edb4e
	octave 3
	note A_, 15
	note A_, 8
	note A_, 8
	note A_, 15
	callchannel Branch_1edb4e
	octave 4
	note D#, 8
	note D#, 7
	note D#, 16
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note G#, 8
	note G#, 15
	note G#, 8
	dec_octave
	note B_, 8
	note B_, 7
	callchannel Branch_1edb4e
	octave 4
	note D#, 8
	note D#, 7
	note D#, 16
	note C#, 8
	note C#, 7
	callchannel Branch_1edb4e
	note __, 8
	note __, 7
	octave 4
	note C#, 16
	dec_octave
	note B_, 15
	callchannel Branch_1edb4e
	octave 4
	note D#, 8
	note D#, 7
	note D#, 16
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note G#, 8
	note G#, 15
	note G#, 8
	dec_octave
	note B_, 8
	note B_, 7
	callchannel Branch_1edb4e
	octave 4
	note C#, 15
	note C#, 16
	note C#, 15
	callchannel Branch_1edb4e
	octave 3
	note A_, 15
	note A_, 8
	note A_, 8
	note A_, 15
	callchannel Branch_1edb4e
	octave 3
	note A_, 15
	inc_octave
	note D_, 16
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note G_, 8
	note G_, 15
	note G_, 8
	note E_, 8
	note E_, 7
	callchannel Branch_1edb4e
	octave 4
	note F#, 15
	note F#, 16
	note F#, 15
	callchannel Branch_1edb4e
	octave 4
	note D_, 15
	note D_, 16
	note D_, 15
	callchannel Branch_1edb4e
	octave 4
	note D_, 8
	note D_, 7
	note E_, 16
	note D_, 8
	note D_, 7
	callchannel Branch_1edb4e
	octave 3
	note B_, 8
	note B_, 15
	note B_, 8
	note G_, 8
	note G_, 7
	callchannel Branch_1edb4e
	octave 4
	note C_, 15
	note C_, 16
	note C_, 15
	note C_, 16
	dec_octave
	note G_, 8
	note G_, 7
	note A_, 16
	note A_, 15
	note A_, 16
	note B_, 8
	note B_, 7
	inc_octave
	note C_, 16
	note C_, 15
	dec_octave
	note D_, 4
	note E_, 4
	note F_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	inc_octave
	note C_, 4
	note D_, 3
	dec_octave
.Loop6
	note A_, 6
	note A_, 16
	note __, 9
	loopchannel 2, .Loop6
	loopchannel 0, .MainLoop

Branch_1edb4e:
	octave 3
	note E_, 6
	note E_, 10
	endchannel

Branch_1edb5a:
	octave 3
	note E_, 6
	note E_, 10
	endchannel


Music_TCG2Fort1_Ch3: 
	notetype1 10
	notetype0 1
	notetype2 14
	notetype1 1
	octave 2
	note __, 9
	note F#, 6
	note F#, 16
	note __, 9
	note B_, 6
	note B_, 16
	note __, 9
.MainLoop
	octave 2
	note E_, 16
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note B_, 15
	inc_octave
	note E_, 16
	dec_octave
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note E_, 15
	note A_, 16
	note A_, 15
	inc_octave
	note G#, 16
	note A_, 15
	note __, 16
	note E_, 15
	note G#, 16
	dec_octave
	note A_, 15
	note E_, 16
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note B_, 15
	inc_octave
	note E_, 16
	dec_octave
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note E_, 15
	note A_, 16
	note A_, 15
	inc_octave
	note G#, 16
	note A_, 15
	dec_octave
	note A_, 16
	note A_, 15
	note B_, 16
	note B_, 15
	note E_, 16
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note B_, 15
	inc_octave
	note E_, 16
	dec_octave
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note E_, 15
	note A_, 16
	note A_, 15
	inc_octave
	note G#, 16
	note A_, 15
	note __, 16
	note E_, 15
	note G#, 16
	dec_octave
	note A_, 15
	note E_, 16
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note B_, 15
	inc_octave
	note E_, 16
	dec_octave
	note E_, 15
	inc_octave
	note G#, 16
	dec_octave
	note E_, 15
	note A_, 16
	note A_, 15
	inc_octave
	note G#, 16
	note A_, 15
	dec_octave
	note A_, 16
	note A_, 15
	note B_, 16
	note B_, 15
	inc_octave
	note C_, 16
	note C_, 15
	note B_, 16
	dec_octave
	note G_, 15
	inc_octave
	note C_, 16
	dec_octave
	note G_, 15
	inc_octave
	note B_, 16
	dec_octave
	note B_, 15
	note B_, 8
	note __, 8
	note B_, 15
	inc_octave
	note A_, 16
	note B_, 15
	note __, 16
	note F#, 15
	note A_, 16
	dec_octave
	note B_, 15
	note A_, 8
	note __, 8
	note A_, 15
	inc_octave
	note G_, 16
	dec_octave
	note A_, 15
	note B_, 8
	note __, 8
	note B_, 15
	inc_octave
	note A_, 16
	dec_octave
	note B_, 4
	inc_octave
	note C_, 11
	note C_, 16
	note C_, 15
	note B_, 16
	dec_octave
	note G_, 15
	inc_octave
	note C_, 16
	note C_, 15
	dec_octave
	note B_, 16
	note B_, 15
	note A_, 16
	note A_, 15
	inc_octave
	inc_octave
	note C_, 16
	dec_octave
	dec_octave
	note E_, 15
	note A_, 16
	note E_, 15
	inc_octave
	inc_octave
	note C_, 16
	dec_octave
	dec_octave
	note B_, 15
	note B_, 8
	note __, 8
	note B_, 15
	inc_octave
	note A_, 16
	note B_, 15
	note __, 16
	note F#, 15
	note A_, 16
	dec_octave
	note B_, 15
	inc_octave
	note C_, 8
	note __, 8
	note G_, 8
	note __, 7
	inc_octave
	note G_, 16
	dec_octave
	dec_octave
	note B_, 8
	note __, 7
	inc_octave
	note F#, 8
	note __, 8
	note F#, 8
	note __, 7
	dec_octave
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	inc_octave
	note C_, 16
	dec_octave
	note F_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	inc_octave
	note C_, 16
	dec_octave
	note F_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	inc_octave
	note C_, 16
	note F_, 8
	note __, 7
	dec_octave
	note B_, 10
	note __, 16
	note __, 5
	note B_, 10
	note __, 16
	note __, 5
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note A_, 8
	note __, 8
	note A_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note A_, 8
	note __, 8
	note A_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note A_, 8
	note __, 8
	note A_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note B_, 8
	note __, 8
	note B_, 7
	note __, 8
	inc_octave
	note A_, 16
	note F#, 8
	note __, 7
	dec_octave
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note A_, 8
	note __, 8
	note A_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note A_, 8
	note __, 8
	note A_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note E_, 8
	note __, 8
	note E_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note A_, 8
	note __, 8
	note A_, 7
	note __, 8
	inc_octave
	note G#, 16
	note E_, 8
	note __, 7
	dec_octave
	note B_, 8
	note __, 8
	note B_, 7
	note __, 8
	inc_octave
	note A_, 16
	note F#, 8
	note __, 7
	note C_, 8
	note __, 8
	note C_, 7
	note __, 8
	note G_, 16
	note G_, 8
	note __, 7
	note C_, 8
	note __, 8
	note C_, 7
	note __, 8
	note G_, 16
	note G_, 8
	note __, 7
	dec_octave
	note G_, 8
	note __, 8
	note G_, 7
	note __, 8
	inc_octave
	note B_, 16
	note D_, 8
	note __, 7
	dec_octave
	note G_, 8
	note __, 8
	note G_, 7
	note __, 8
	inc_octave
	note B_, 16
	note D_, 8
	note __, 7
	dec_octave
	note A_, 8
	note __, 8
	inc_octave
	note E_, 8
	note __, 7
	note G_, 16
	dec_octave
	note B_, 15
	note B_, 16
	inc_octave
	note A_, 15
	note F#, 8
	note __, 8
	dec_octave
	note B_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
	note F_, 8
	note __, 8
	note F_, 8
	note __, 7
.Loop1
	note B_, 7
	note B_, 16
	note __, 8
	loopchannel 2, .Loop1
	loopchannel 0, .MainLoop


Music_TCG2Fort1_Ch4: 
	togglenoise $06
	notetype 1
	note __, 1
	octave 1
	note __, 9
	note F#, 16
	note __, 15
	note F#, 16
	note __, 15
.MainLoop
.Loop1
	callchannel Branch_1edebb
	callchannel Branch_1edec8
	loopchannel 3, .Loop1
	callchannel Branch_1edebb
	callchannel Branch_1eded5
	callchannel Branch_1edebb
	callchannel Branch_1edec8
	callchannel Branch_1edebb
	callchannel Branch_1eded5
	callchannel Branch_1edebb
	callchannel Branch_1edec8
	note C_, 16
	note D#, 15
	note F#, 16
	note C_, 15
	note D#, 16
	note F#, 15
	note C_, 16
	note D#, 15
	note C_, 16
	note D#, 8
	note D#, 7
	note C_, 16
	note D#, 15
	note C_, 16
	note D#, 15
	note C_, 16
	note D#, 15
	note C_, 16
	note D_, 5
	note D_, 5
	note D_, 5
	note D_, 16
	note D#, 5
	note D#, 5
	note D#, 5
	note D_, 16
	note __, 15
.Loop2
	callchannel Branch_1edee2
	callchannel Branch_1edeef
	loopchannel 3, .Loop2
	callchannel Branch_1edee2
	note C_, 16
	note D#, 15
	note D_, 16
	note D#, 8
	note D#, 7
	note C_, 16
	note D#, 8
	note D_, 7
	note D_, 8
	note D_, 8
	note D_, 15
	callchannel Branch_1edee2
	callchannel Branch_1edee2
	note C_, 16
	note E_, 15
	note D_, 16
	note D_, 15
	note C_, 16
	note D_, 5
	note D_, 5
	note D_, 5
	note D_, 16
	note D#, 15
	note D_, 16
	note D#, 15
	note D_, 16
	note D#, 8
	note D#, 7
	note D_, 16
	note D#, 15
	note D_, 16
	note D#, 15
	note D_, 16
	note D#, 15
	note D_, 16
	note D_, 5
	note D_, 5
	note D_, 5
	note D_, 16
	note D#, 5
	note D#, 5
	note D#, 5
	note D_, 16
	note __, 15
	loopchannel 0, .MainLoop

Branch_1edebb:
	octave 1
	notetype 1
	note C_, 16
	note D#, 15
	note F#, 16
	note D#, 8
	note D#, 7
	note C_, 16
	note D#, 15
	note F#, 16
	note D#, 15
	endchannel

Branch_1edec8:
	octave 1
	notetype 1
	note C_, 16
	note D#, 15
	note F#, 16
	note D#, 8
	note D#, 7
	note C_, 16
	note D#, 15
	note F#, 16
	note E_, 15
	endchannel

Branch_1eded5:
	octave 1
	notetype 1
	note C_, 16
	note D#, 15
	note F#, 16
	note D#, 8
	note D#, 7
	note F#, 16
	note C_, 15
	note F#, 16
	note C_, 15
	endchannel

Branch_1edee2:
	octave 1
	notetype 1
	note C_, 16
	note D#, 15
	note D_, 16
	note D#, 8
	note D#, 7
	note C_, 16
	note D#, 15
	note D_, 16
	note D#, 15
	endchannel

Branch_1edeef:
	octave 1
	notetype 1
	note C_, 16
	note D#, 15
	note D_, 16
	note D#, 8
	note D#, 7
	note C_, 16
	note D#, 15
	note D_, 16
	note E_, 15
	endchannel

