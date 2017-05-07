Music_TCG2GRBlimp:
	db $C0
	dw Music_TCG2GRBlimp_Ch1
	db $01
	dw Music_TCG2GRBlimp_Ch2
	db $02
	dw Music_TCG2GRBlimp_Ch3
	db $03
	dw Music_TCG2GRBlimp_Ch4

Music_TCG2GRBlimp_Ch2: 
	notetype1 10
	vibrato 28, $33
	notetype2 8
	octave 4
	dutycycle 2
	notetype1 7
	vibrato 28, $33
	callchannel Branch_1e7cf5
	note G#, 16
	note G#, 5
	note G#, 7
	inc_octave
	note C_, 16
	note C_, 5
	dec_octave
	note A#, 4
	inc_octave
	note C_, 3
	dec_octave
	note A#, 14
	note A#, 5
	note G_, 14
	note A#, 5
	note D#, 14
	note G_, 4
	notetype0 6
	note F_, 14
	notetype0 1
	note F_, 14
	callchannel Branch_1e7cf5
	note G#, 16
	note G#, 5
	note G#, 7
	inc_octave
	note C_, 16
	note C_, 5
	dec_octave
	note A#, 4
	inc_octave
	note C_, 3
	dec_octave
	note A#, 14
	note A#, 5
	note F_, 14
	note F_, 5
	note A#, 14
	note A#, 4
	inc_octave
	notetype0 6
	note C_, 14
	notetype0 1
	note C_, 14
	notetype0 1
	note C_, 5
	note C#, 5
	note D#, 4
	note F_, 16
	note F_, 12
	note F_, 16
	note F_, 12
	note F_, 14
	note F_, 14
	note D#, 14
	note D#, 7
	note C#, 7
	note C_, 7
	note C#, 7
	note __, 7
	dec_octave
	note G#, 5
	inc_octave
	note C#, 2
	dec_octave
	vibrato 14, $33
	note A#, 14
	note A#, 16
	note A#, 16
	note A#, 10
	note A#, 14
	note A#, 5
	inc_octave
	note C_, 5
	note C#, 4
	vibrato 28, $33
	note D#, 16
	note D#, 12
	note D#, 16
	note D#, 12
	note D#, 14
	note D#, 14
	note C#, 14
	note D#, 7
	dec_octave
	note B_, 7
	note A#, 7
	note B_, 7
	note __, 7
	note F#, 4
	note B_, 3
	vibrato 14, $33
	note G#, 14
	note G#, 16
	note G#, 16
	note G#, 10
	note G#, 14
	note G#, 5
	note A#, 5
	note B_, 4
	inc_octave
	vibrato 28, $33
	note C#, 16
	note C#, 12
	note C#, 16
	note C#, 16
	note C#, 10
	dec_octave
	note B_, 7
	inc_octave
	note C#, 7
	dec_octave
	note F#, 14
	note B_, 7
	note F#, 7
	inc_octave
	note C#, 16
	note C#, 12
	note C#, 16
	note C#, 16
	note C#, 10
	note C#, 14
	note C#, 5
	note C#, 5
	note D#, 4
	note C#, 5
	note E_, 5
	note D#, 4
	note D#, 16
	note D#, 12
	note D#, 14
	note C#, 5
	note D#, 5
	note C#, 4
	note C_, 14
	note C_, 5
	dec_octave
	note G#, 14
	inc_octave
	note C_, 5
	note C_, 14
	dec_octave
	note G#, 4
	inc_octave
	vibrato 28, $33
	notetype0 7
	note D_, 16
	note D_, 2
	endchannel

Branch_1e7cf5:
	octave 4
	notetype0 1
	note C_, 4
	note C_, 3
	note D_, 4
	note C_, 3
	notetype0 7
	note D#, 10
	note D#, 2
	notetype0 1
	note D_, 4
	note D_, 3
	note C_, 4
	note D_, 3
	dec_octave
	note A#, 4
	inc_octave
	note C_, 3
	note D_, 4
	dec_octave
	note A#, 3
	notetype0 7
	inc_octave
	note C_, 12
	note C_, 2
	dec_octave
	notetype0 1
	note A_, 4
	note A_, 3
	note A_, 4
	note A_, 3
	note A#, 16
	note A#, 5
	note A#, 7
	note G_, 16
	note G_, 5
	note G_, 7
	note D#, 14
	note D#, 5
	inc_octave
	note D_, 14
	note D#, 5
	dec_octave
	note A#, 14
	note A#, 4
	inc_octave
	note C_, 7
	dec_octave
	note A#, 14
	note F_, 4
	inc_octave
	note C_, 3
	dec_octave
	note F_, 16
	note F_, 12
	note F_, 16
	note F_, 12
	note F_, 14
	inc_octave
	note C_, 4
	note C_, 3
	note D_, 4
	note C_, 3
	notetype0 7
	note D#, 10
	note D#, 2
	notetype0 1
	note D_, 4
	note D_, 3
	note C_, 4
	note D_, 3
	dec_octave
	note A#, 4
	inc_octave
	note C_, 3
	note D_, 4
	dec_octave
	note A#, 3
	inc_octave
	note C_, 7
	note D_, 7
	dec_octave
	note __, 7
	note F_, 4
	inc_octave
	note C_, 3
	dec_octave
	note F_, 16
	note F_, 12
	note F_, 16
	note F_, 12
	note F_, 14
	note F_, 4
	note F_, 3
	note G_, 4
	note F_, 3
	endchannel


Music_TCG2GRBlimp_Ch1: 
	notetype1 10
	vibrato 28, $33
	notetype2 8
	notetype0 7
	octave 3
	callchannel Branch_1e7e8a
	note C#, 14
	note C#, 7
	note C#, 7
	note F_, 14
	note F_, 7
	note F_, 7
	note G_, 14
	note G_, 5
	note D#, 14
	note D#, 5
	dec_octave
	note A#, 14
	inc_octave
	note D#, 4
	dec_octave
	note A#, 14
	note A#, 14
	note A#, 14
	note A_, 4
	note A#, 3
	note G_, 4
	note A_, 3
	note A_, 14
	note A_, 14
	note A_, 14
	callchannel Branch_1e7e8a
	note D#, 16
	note D#, 5
	note D#, 7
	note G#, 16
	note G#, 5
	note G#, 7
	note F_, 14
	note F_, 5
	note C#, 14
	note C#, 5
	note F_, 14
	note F_, 4
	note F_, 16
	note F_, 12
	note F_, 16
	note E_, 4
	note F_, 3
	note E_, 4
	note D_, 3
	note E_, 16
	note E_, 12
	dec_octave
	note D_, 4
	note E_, 3
	note G_, 4
	note A#, 3
	inc_octave
	note D_, 4
	note F_, 3
	note G_, 4
	inc_octave
	note C_, 3
	vibrato 28, $33
	note C#, 14
	dec_octave
	note C#, 3
	inc_octave
	note C#, 4
	dec_octave
	note C#, 3
	note C#, 4
	note F_, 5
	note C#, 5
	note C#, 4
	note F_, 5
	note F_, 5
	note C#, 4
	vibrato 7, $33
	note G#, 7
	note G#, 14
	note G#, 7
	inc_octave
	note C_, 7
	dec_octave
	note G#, 7
	note __, 7
	note A#, 4
	note A#, 3
	note G#, 7
	note A#, 7
	dec_octave
	note A#, 3
	inc_octave
	note G#, 4
	dec_octave
	note A#, 3
	note A#, 4
	inc_octave
	note C#, 5
	dec_octave
	note A#, 5
	note A#, 4
	inc_octave
	note C#, 5
	note C#, 5
	dec_octave
	note A#, 4
	inc_octave
	note F#, 7
	note F#, 16
	note F#, 5
	note F#, 14
	note F#, 7
	note F#, 7
	vibrato 28, $33
	note B_, 14
	dec_octave
	note B_, 3
	inc_octave
	note B_, 4
	dec_octave
	note B_, 3
	note B_, 4
	inc_octave
	note D#, 5
	dec_octave
	note B_, 5
	note B_, 4
	inc_octave
	note D#, 5
	note D#, 5
	dec_octave
	note B_, 4
	inc_octave
	vibrato 7, $33
	note F#, 7
	note F#, 14
	note F#, 7
	note A#, 7
	note F#, 7
	note __, 7
	note G#, 4
	note G#, 3
	note F#, 7
	note F#, 7
	dec_octave
	note G#, 3
	inc_octave
	note F#, 4
	dec_octave
	note G#, 3
	note G#, 4
	note B_, 5
	note G#, 5
	note G#, 4
	note B_, 5
	note B_, 5
	note G#, 4
	inc_octave
	note E_, 7
	note E_, 16
	note E_, 4
	note E_, 14
	dec_octave
	note B_, 7
	note B_, 7
	vibrato 28, $33
	inc_octave
	note E_, 14
	note C#, 3
	note E_, 4
	note C#, 3
	note C#, 4
	note E_, 5
	note C#, 5
	note C#, 4
	note E_, 5
	note E_, 5
	note C#, 4
	note A_, 14
	note G#, 7
	note A_, 7
	note D#, 14
	note G#, 7
	note D#, 7
	note A_, 14
	note C#, 3
	note A_, 4
	note C#, 3
	note C#, 4
	note E_, 5
	note C#, 5
	note C#, 4
	note E_, 5
	note E_, 5
	note C#, 4
	note A_, 7
	note A_, 14
	note A_, 7
	note A_, 5
	note A_, 4
	note B_, 4
	note A_, 5
	inc_octave
	note C#, 5
	dec_octave
	note A_, 4
	vibrato 14, $33
	note A#, 14
	note A#, 16
	note A#, 5
	note A#, 7
	note A#, 7
	note A#, 7
	note G#, 14
	note G#, 5
	note D#, 14
	note G#, 5
	note G#, 14
	note D#, 4
	vibrato 28, $33
	notetype0 7
	note A#, 16
	note A#, 2
	endchannel

Branch_1e7e8a:
	octave 3
	notetype0 1
	note A_, 4
	note A_, 3
	note A_, 4
	note A_, 3
	notetype0 7
	note A#, 10
	note A#, 2
	notetype0 1
	note A#, 4
	note A#, 3
	note A#, 4
	note A#, 3
	note G_, 4
	note A#, 3
	note A#, 4
	note G_, 3
	notetype0 7
	note A_, 12
	note A_, 2
	notetype0 1
	note F_, 4
	note F_, 3
	note F_, 4
	note F_, 3
	note G_, 16
	note G_, 5
	note G_, 7
	note D#, 16
	note D#, 5
	note D#, 7
	dec_octave
	note A#, 14
	note A#, 5
	inc_octave
	note G_, 14
	note G_, 5
	note D#, 14
	note D#, 4
	note F_, 7
	note D#, 14
	note C_, 4
	note F_, 3
	note C_, 16
	note C_, 12
	note C_, 16
	note C_, 12
	note C_, 14
	note A_, 4
	note A_, 3
	note A_, 4
	note A_, 3
	notetype0 7
	note A#, 10
	note A#, 2
	notetype0 1
	note A#, 4
	note A#, 3
	note A#, 4
	note A#, 3
	note G_, 4
	note A#, 3
	note A#, 4
	note G_, 3
	note A_, 7
	note A#, 14
	note C_, 4
	note F_, 3
	note C_, 16
	note C_, 12
	note C_, 16
	note C_, 12
	note C_, 14
	note C_, 4
	note C_, 3
	note D_, 4
	note C_, 3
	endchannel


Music_TCG2GRBlimp_Ch3: 
	notetype1 10
	notetype2 11
	notetype1 1
	octave 2
	notetype0 1
	note __, 14
	notetype0 7
.Loop1
	note F_, 4
	note C_, 4
	loopchannel 11, .Loop1
	note F_, 4
	note D#, 4
	note C#, 4
	note C#, 4
	note C_, 4
	note C_, 4
.Loop2
	note F_, 4
	note C_, 4
	loopchannel 13, .Loop2
	note F_, 4
	note G_, 4
	note G#, 4
	note G#, 4
	note C#, 4
	note C#, 4
	note C_, 4
	note G_, 4
	inc_octave
	note C_, 4
	dec_octave
	note C_, 4
	note C#, 4
	note G#, 4
	inc_octave
	note C#, 4
	dec_octave
	note G#, 4
	note F#, 4
	note C#, 4
	note F#, 4
	note C#, 4
	note B_, 4
	note F#, 4
	note B_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note E_, 4
	note B_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	note G#, 4
	note F#, 4
	note C#, 4
	note F#, 4
	note E_, 4
	note D#, 4
	note A#, 4
	notetype0 1
	note G#, 10
	note G#, 9
	note D#, 10
	note D#, 9
	note G#, 10
	note G#, 8
	note G#, 4
	note A_, 4
	note A#, 6
	notetype0 7
	note A#, 14
	note A#, 2
	endchannel


Music_TCG2GRBlimp_Ch4: 
	togglenoise $06
	notetype 9
	octave 1
	notetype 1
	note __, 14
.Loop1
	note C#, 14
	note C#, 14
	note D_, 3
	note D_, 4
	note D_, 3
	note D_, 4
	note C#, 7
	note C#, 7
	note C#, 14
	note C#, 14
	note D_, 3
	note D_, 4
	rept 3
	note D_, 3
	note D_, 4
	endr
	note C#, 14
	note C#, 14
	note C#, 7
	note C#, 14
	note C#, 7
	note C#, 14
	note C#, 14
	note D_, 3
	note D_, 4
	rept 3
	note D_, 3
	note D_, 4
	endr
	loopchannel 11, .Loop1
	note C#, 14
	note C#, 14
	note D_, 3
	note D_, 4
	note D_, 3
	note D_, 4
	note C#, 7
	note C#, 7
	note D_, 3
	note D_, 4
	note D_, 3
	note D_, 4
	note C#, 5
	note C#, 16
	note __, 3
	note C#, 16
	note __, 2
	note D_, 3
	note D_, 4
.Loop2
	note D_, 3
	note D_, 4
	loopchannel 5, .Loop2
.Loop3
	note D_, 3
	note D_, 4
	loopchannel 5, .Loop3
.Loop4
	note D_, 3
	note D_, 4
	loopchannel 5, .Loop4
	note D_, 14
	endchannel

