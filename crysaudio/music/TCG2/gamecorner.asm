Music_TCG2GameCorner:
	db $C0
	dw Music_TCG2GameCorner_Ch1
	db $01
	dw Music_TCG2GameCorner_Ch2
	db $02
	dw Music_TCG2GameCorner_Ch3
	db $03
	dw Music_TCG2GameCorner_Ch4

Music_TCG2GameCorner_Ch2: 
	notetype1 10
.MainLoop
	octave 1
	vibrato 1, $33
	notetype0 1
.Loop1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note __, 12
	note __, 3
	loopchannel 14, .Loop1
	note __, 16
	note __, 11
	callchannel Branch_1e75c7
	octave 4
	note A_, 7
	note __, 6
.Loop2
	note __, 14
	octave 2
	note A_, 7
	note A_, 6
	loopchannel 14, .Loop2
	note A_, 7
	note A_, 7
	note __, 13
	callchannel Branch_1e75c7
	octave 4
	note A_, 7
	octave 4
	vibrato 1, $33
	note C_, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	dec_octave
	note A_, 7
	note A_, 7
	note F#, 7
	note F#, 6
	note F_, 7
	note F_, 7
	inc_octave
	note D_, 7
	note D_, 6
	note C#, 14
	note C#, 7
	note C_, 6
	note C#, 7
	note C#, 7
	dec_octave
	note A_, 7
	note A_, 6
	note G#, 7
	note G#, 7
	note A_, 7
	note A_, 6
	note E_, 14
	note E_, 13
	note E_, 7
	note A_, 7
	note B_, 7
	inc_octave
	note C_, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	dec_octave
	note A_, 7
	note A_, 7
	note F#, 7
	note F#, 6
	note F_, 7
	note F_, 7
	inc_octave
	note D_, 7
	note D_, 6
	note C#, 14
	note C#, 7
	note C_, 6
	note C#, 14
	note C#, 13
	note C#, 14
	note C#, 13
	note C#, 14
	note C#, 7
	note C#, 13
	note C#, 7
	note D_, 7
	note D#, 6
	note E_, 7
	note E_, 7
	note E_, 7
	note E_, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note E_, 6
	note E_, 7
	note E_, 7
	note G_, 7
	note G_, 6
	note F#, 14
	note F#, 7
	note E_, 4
	note E_, 2
	note E_, 7
	note E_, 7
	note D_, 7
	note D_, 6
	note C#, 7
	note C#, 7
	note D_, 7
	note D_, 6
	note F_, 14
	note F_, 13
	note E_, 7
	note E_, 7
	note D_, 7
	note D_, 6
	note C#, 7
	note C#, 7
	dec_octave
	note A_, 7
	note A_, 6
	note E_, 14
	note E_, 7
	inc_octave
	note C#, 6
	dec_octave
	note B_, 7
	note B_, 7
	note G#, 7
	note G#, 6
	note E_, 7
	note E_, 7
	note B_, 7
	note B_, 6
	note A_, 12
	note A_, 2
	octave 3
	note A_, 7
	note C_, 6
	note C#, 7
	note E_, 7
	note F#, 7
	note __, 6
	note A_, 6
	note __, 8
	dec_octave
	note A_, 7
	inc_octave
	note E_, 6
	inc_octave
	note A_, 7
	note __, 7
	note __, 13
	loopchannel 0, .MainLoop

Branch_1e75c7:
	vibrato 1, $33
	octave 4
	note __, 7
	note C#, 7
	note D_, 7
	note D#, 6
.Loop3
	note E_, 7
	note E_, 7
	note E_, 7
	note E_, 6
	note F#, 7
	note E_, 7
	note D#, 7
	note F#, 6
	loopchannel 2, .Loop3
	note E_, 7
	note E_, 7
	note A_, 7
	note A_, 6
	note G#, 14
	note G#, 7
	note F#, 6
	note D_, 14
	note D_, 13
	note D_, 14
	dec_octave
	note B_, 7
	inc_octave
	note C#, 6
.Loop4
	note D_, 7
	note D_, 7
	note D_, 7
	note D_, 6
	note E_, 7
	note D_, 7
	note C#, 7
	note E_, 6
	loopchannel 2, .Loop4
	note D_, 7
	note D_, 7
	note G#, 7
	note G#, 6
	note F#, 14
	note F#, 7
	note E_, 6
	note C#, 14
	note C#, 13
	note C#, 7
	note C#, 7
	note D_, 7
	note D#, 6
.Loop5
	note E_, 7
	note E_, 7
	note E_, 7
	note E_, 6
	note F#, 7
	note E_, 7
	note D#, 7
	note F#, 6
	loopchannel 2, .Loop5
	note E_, 7
	note E_, 7
	note A_, 7
	note A_, 6
	note B_, 14
	note B_, 7
	note A_, 6
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 7
	note G#, 6
	note A_, 7
	note A_, 7
	note A_, 7
	note A_, 6
	note G#, 7
	note G#, 7
	note F#, 7
	note F#, 6
	note E_, 7
	note E_, 7
	note C#, 7
	note C#, 6
	dec_octave
	note A_, 7
	note A_, 7
	inc_octave
	note D_, 7
	note D_, 6
	note C#, 7
	note C#, 7
	dec_octave
	note A_, 7
	note A_, 6
	note B_, 7
	note B_, 7
	note G#, 7
	note G#, 6
	note A_, 14
	note A_, 13
	note A_, 14
	endchannel


Music_TCG2GameCorner_Ch1: 
	notetype1 10
.MainLoop
	notetype1 12
	dutycycle 2
	vibrato 0, $33
	notetype0 1
.Loop1
	octave 4
	note __, 16
	note __, 11
	note __, 7
	note __, 7
	note __, 7
	note D_, 6
	note D_, 7
	note D_, 7
	note D_, 7
	dec_octave
	note G_, 6
	inc_octave
	note C_, 14
	dec_octave
	note D_, 13
	loopchannel 3, .Loop1
	note __, 16
	note __, 11
	note __, 16
	note __, 11
	note __, 16
	note __, 11
	note __, 16
	note __, 11
	callchannel Branch_1e778f
	octave 3
	note D#, 7
	dec_octave
	note A_, 7
	inc_octave
	note D#, 7
	note F#, 6
	note D_, 7
	dec_octave
	note B_, 7
	inc_octave
	note D_, 7
	note G#, 6
	note A_, 7
	note E_, 7
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	inc_octave
	note E_, 7
	note __, 6
.Loop2
	note __, 14
	octave 2
	note E_, 7
	note __, 6
	loopchannel 14, .Loop2
	note E_, 7
	note E_, 7
	note E_, 7
	note E_, 6
	note F#, 7
	note F#, 7
	note G#, 7
	note G#, 6
	callchannel Branch_1e778f
	octave 3
	note D#, 7
	octave 2
	note A_, 7
	octave 3
	note D#, 7
	note F#, 6
	note D_, 7
	octave 2
	note B_, 7
	octave 3
	note D_, 7
	note G#, 6
	note A_, 7
	note E_, 7
	note C#, 7
	note E_, 6
	octave 2
	note A_, 7
	octave 4
	note C#, 3
	note E_, 4
	note E_, 7
	note __, 6
	dec_octave
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note F#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note C#, 6
	dec_octave
	note G#, 6
	note __, 8
	note B_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G#, 7
	inc_octave
	note G#, 7
	note E_, 7
	dec_octave
	note B_, 6
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note D#, 7
	note F#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note D#, 6
	dec_octave
	note G#, 6
	note __, 8
	note B_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G#, 7
	inc_octave
	note G#, 7
	note E_, 7
	dec_octave
	note B_, 6
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note E_, 6
	note C#, 7
	dec_octave
	note A_, 7
	note G_, 7
	note A_, 6
	note A#, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A#, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A#, 7
	inc_octave
	note G_, 7
	note F#, 7
	note C#, 6
	dec_octave
	note A#, 7
	inc_octave
	note C#, 7
	note F#, 7
	note C#, 6
	dec_octave
	note B_, 6
	note __, 8
	inc_octave
	note D_, 7
	note F#, 6
	dec_octave
	note B_, 7
	inc_octave
	note F#, 7
	note D_, 7
	dec_octave
	note B_, 6
	inc_octave
	note D_, 6
	note __, 8
	note F_, 7
	note A_, 6
	note D_, 7
	note B_, 7
	note A_, 7
	note F_, 6
	dec_octave
	note E_, 6
	note __, 8
	note E_, 7
	inc_octave
	note C_, 6
	dec_octave
	note E_, 7
	inc_octave
	note E_, 7
	note A_, 7
	note __, 6
	dec_octave
	note E_, 6
	note __, 8
	note E_, 7
	note G_, 6
	note E_, 7
	note B_, 7
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note E_, 7
	note __, 6
	note __, 7
	note __, 7
	note __, 7
	note __, 6
	note E_, 6
	note __, 8
	note __, 3
	octave 3
	note C#, 7
	note A_, 3
	octave 4
	note E_, 7
	note __, 7
	note __, 7
	note __, 6
	loopchannel 0, .MainLoop

Branch_1e778f:
	octave 2
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note B_, 6
	note __, 8
	inc_octave
	note F#, 7
	note D_, 6
	dec_octave
	note B_, 7
	inc_octave
	note G#, 7
	note F#, 7
	note D_, 6
	dec_octave
	note E_, 6
	note __, 8
	note G#, 7
	note B_, 6
	note E_, 7
	inc_octave
	note C#, 7
	dec_octave
	note B_, 7
	note G#, 6
	note E_, 6
	note __, 8
	note G#, 7
	note B_, 6
	note E_, 7
	inc_octave
	note C#, 7
	dec_octave
	note B_, 7
	note G#, 6
	note E_, 6
	note __, 8
	note G#, 7
	note B_, 6
	note E_, 7
	inc_octave
	note C#, 7
	dec_octave
	note B_, 7
	note G#, 6
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	note A_, 7
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note G_, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	note __, 8
	inc_octave
	note D_, 7
	note F#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note D_, 6
	note D_, 7
	dec_octave
	note A_, 7
	inc_octave
	note D_, 7
	note F#, 6
	note D#, 7
	dec_octave
	note A_, 7
	inc_octave
	note D#, 7
	note F#, 6
	note E_, 7
	note C#, 7
	note E_, 7
	note A_, 6
	note F#, 7
	note C#, 7
	note F#, 7
	note A_, 6
	endchannel


Music_TCG2GameCorner_Ch3: 
	notetype1 10
	notetype2 11
	notetype1 1
	notetype0 1
.MainLoop
	octave 2
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 4
	note __, 3
	note E_, 16
	note E_, 4
	note F#, 7
	note __, 7
	note G#, 7
	note __, 6
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note B_, 11
	note __, 3
	inc_octave
	note B_, 7
	note __, 6
	dec_octave
	note F#, 11
	note __, 3
	inc_octave
	note B_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note B_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note B_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note G#, 11
	note __, 2
	note A_, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note G#, 11
	note __, 2
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	note C#, 11
	note __, 3
	note A_, 7
	note __, 6
	note D_, 11
	note __, 3
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note D_, 11
	note __, 3
	note D_, 11
	note __, 2
	note D#, 11
	note __, 3
	note D#, 11
	note __, 2
	note E_, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note F#, 11
	note __, 2
	note B_, 11
	note __, 3
	note B_, 11
	note __, 2
	note E_, 11
	note __, 3
	note E_, 11
	note __, 2
	note A_, 11
	note __, 3
	note E_, 11
	note __, 2
	note A_, 11
	note __, 3
	inc_octave
	note A_, 5
	note __, 8
	dec_octave
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 14
	note E_, 13
	note F#, 14
	note G#, 13
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 11
	note __, 16
	note E_, 11
	note __, 16
	note A_, 4
	note __, 3
	note E_, 16
	note E_, 4
	note F#, 7
	note __, 7
	note G#, 7
	note __, 6
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note B_, 11
	note __, 3
	inc_octave
	note B_, 7
	note __, 6
	dec_octave
	note F#, 11
	note __, 3
	inc_octave
	note B_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note B_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note B_, 11
	note __, 3
	inc_octave
	note E_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note G#, 11
	note __, 2
	note A_, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note G#, 11
	note __, 2
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note E_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	note C#, 11
	note __, 3
	note A_, 7
	note __, 6
	note D_, 11
	note __, 3
	note A_, 7
	note __, 6
	dec_octave
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	dec_octave
	note D_, 11
	note __, 3
	note D_, 11
	note __, 2
	note D#, 11
	note __, 3
	note D#, 11
	note __, 2
	note E_, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note F#, 11
	note __, 2
	note B_, 11
	note __, 3
	note B_, 11
	note __, 2
	note E_, 11
	note __, 3
	note E_, 11
	note __, 2
	note A_, 11
	note __, 3
	note E_, 11
	note __, 2
	note A_, 11
	note __, 3
	inc_octave
	note A_, 7
	note __, 6
	note D_, 11
	note __, 3
	dec_octave
	note A_, 11
	note __, 2
	note F#, 11
	note __, 3
	note D_, 11
	note __, 2
	note E_, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note G#, 11
	note __, 2
	note A_, 11
	note __, 3
	inc_octave
	note C#, 11
	note __, 2
	note E_, 11
	note __, 3
	note F#, 11
	note __, 2
	note A_, 11
	note __, 3
	note F#, 11
	note __, 2
	note E_, 11
	note __, 3
	note C#, 11
	note __, 2
	dec_octave
	note B_, 11
	note __, 3
	inc_octave
	note C#, 11
	note __, 2
	note D_, 11
	note __, 3
	note D#, 11
	note __, 2
	note E_, 11
	note __, 3
	dec_octave
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	note G#, 11
	note __, 2
	note A_, 11
	note __, 3
	inc_octave
	note C#, 11
	note __, 2
	note E_, 11
	note __, 3
	note F#, 11
	note __, 2
	note A_, 11
	note __, 3
	dec_octave
	note A_, 11
	note __, 2
	note G_, 11
	note __, 3
	note F_, 11
	note __, 2
	note F#, 11
	note __, 3
	note A#, 11
	note __, 2
	inc_octave
	note C#, 11
	note __, 3
	note E_, 11
	note __, 2
	note F#, 11
	note __, 3
	dec_octave
	note F#, 11
	note __, 2
	note G#, 11
	note __, 3
	note A#, 11
	note __, 2
	note B_, 11
	note __, 3
	inc_octave
	note F#, 11
	note __, 2
	note B_, 11
	note __, 3
	note F#, 11
	note __, 2
	dec_octave
	note B_, 11
	note __, 3
	note A_, 11
	note __, 2
	note G#, 11
	note __, 3
	note F#, 11
	note __, 2
	note E_, 11
	note __, 3
	note E_, 11
	note __, 16
	note __, 14
	note E_, 11
	note __, 2
	note E_, 11
	note __, 16
	note __, 13
	note A_, 14
	note __, 7
	inc_octave
	note C_, 6
	note C#, 7
	note E_, 7
	note F#, 7
	note __, 6
	note A_, 7
	note __, 7
	dec_octave
	note E_, 7
	note __, 6
	note A_, 7
	note __, 7
	note __, 7
	note __, 6
	loopchannel 0, .MainLoop


Music_TCG2GameCorner_Ch4: 
	togglenoise $06
.MainLoop
	octave 1
	notetype 1
.Loop1
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	loopchannel 13, .Loop1
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 14
	note __, 13
	note __, 14
	note __, 13
.Loop2
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 14
	note C#, 13
	note C_, 14
	note C#, 7
	note C#, 6
	loopchannel 3, .Loop2
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C#, 14
	note C#, 7
	note C#, 6
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 14
	note C#, 13
	note C_, 14
	note C#, 7
	note C#, 6
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
.Loop3
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	loopchannel 5, .Loop3
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 3
	note C#, 3
	note C#, 14
	note C#, 13
	note C#, 14
	note F_, 13
.Loop4
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	loopchannel 14, .Loop4
	note C_, 7
	note C#, 3
	note C#, 4
	note C#, 7
	note C#, 6
	note C#, 14
	note C#, 7
	note C#, 6
.Loop5
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 14
	note C#, 13
	note C_, 14
	note C#, 7
	note C#, 6
	loopchannel 3, .Loop5
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C#, 14
	note C#, 7
	note C#, 6
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 14
	note C#, 13
	note C_, 14
	note C#, 7
	note C#, 6
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
.Loop6
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	loopchannel 5, .Loop6
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 3
	note C#, 3
	note C#, 14
	note C#, 13
	note C#, 14
	note A_, 13
.Loop7
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	loopchannel 3, .Loop7
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 4
	note C#, 5
	note C#, 5
	note C#, 4
	note C#, 4
	note C#, 5
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C_, 14
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 13
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 14
	note C#, 7
	note C#, 3
	note C#, 3
	note C#, 7
	note C#, 7
	note A#, 7
	note C_, 6
	note C#, 14
	note C#, 7
	note C#, 3
	note C#, 3
	note C#, 7
	note C#, 7
	note E_, 13
	note C#, 14
	note C#, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 7
	note C#, 3
	note C#, 4
	note C#, 13
	note C#, 14
	note A_, 13
	loopchannel 0, .MainLoop

