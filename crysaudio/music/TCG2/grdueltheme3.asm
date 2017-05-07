Music_TCG2GRDuelTheme3:
	db $C0
	dw Music_TCG2GRDuelTheme3_Ch1
	db $01
	dw Music_TCG2GRDuelTheme3_Ch2
	db $02
	dw Music_TCG2GRDuelTheme3_Ch3
	db $03
	dw Music_TCG2GRDuelTheme3_Ch4

Music_TCG2GRDuelTheme3_Ch2: 
	notetype1 10
.MainLoop
	notetype0 1
.Loop1
	octave 3
	note D_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	inc_octave
	inc_octave
	note E_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	loopchannel 7, .Loop1
	octave 3
	note D_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	inc_octave
	inc_octave
	note E_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	callchannel Branch_1f672f
	note B_, 13
.Loop2
	octave 3
	note D_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	octave 4
	note D_, 3
	note D_, 4
	dec_octave
	note __, 7
	octave 1
	note B_, 3
	note __, 3
	inc_octave
	inc_octave
	note E_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	loopchannel 7, .Loop2
	octave 3
	note D_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	octave 4
	note D_, 3
	note D_, 4
	dec_octave
	note __, 7
	octave 1
	note B_, 3
	note __, 3
	inc_octave
	inc_octave
	note E_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	callchannel Branch_1f672f
	octave 3
	vibrato 58, $33
	note E_, 4
	note F#, 3
	note G_, 3
	note A_, 3
	note A#, 3
	note B_, 4
	note B_, 14
	inc_octave
	note C_, 6
	note C_, 14
	dec_octave
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note D#, 3
	note E_, 4
	note E_, 14
	note F#, 6
	note F#, 14
	note G_, 7
	note G_, 6
	note G#, 3
	note A_, 4
	note A_, 14
	note G_, 6
	note G_, 14
	vibrato 27, $33
	note F#, 7
	note F#, 6
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	dec_octave
	note B_, 14
	note B_, 7
	inc_octave
	note C_, 6
	note C_, 14
	vibrato 52, $33
	note F#, 3
	note G_, 10
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note E_, 7
	note E_, 6
	note A#, 3
	note B_, 11
	note B_, 7
	note A_, 6
	note A_, 14
	note G_, 7
	note G_, 6
	note G#, 3
	note A_, 4
	note A_, 14
	inc_octave
	note D_, 6
	note D_, 14
	dec_octave
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note G_, 7
	note F#, 6
	note E_, 14
	note E_, 7
	note C_, 6
	note C_, 14
	note F#, 3
	note G_, 10
	note E_, 14
	note E_, 7
	note A#, 3
	note B_, 3
	note B_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 7
	note A_, 6
	note A#, 3
	note B_, 4
	note B_, 14
	inc_octave
	note D_, 6
	note D_, 14
	note C_, 13
	dec_octave
	note B_, 14
	note B_, 7
	note E_, 6
	note E_, 14
	note G#, 3
	note A_, 10
	note A_, 14
	note A_, 13
	note A_, 14
	note A_, 13
	note A_, 14
	note G_, 7
	note G_, 13
	note A_, 7
	note A_, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 3
	note G_, 11
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note F#, 14
	note G_, 7
	note G_, 6
	note A_, 7
	note A_, 7
	note B_, 7
	note B_, 6
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 3
	note G_, 11
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	note G_, 14
	note G_, 13
	loopchannel 0, .MainLoop

Branch_1f672f:
	octave 3
	note E_, 3
	note F_, 3
	vibrato 40, $33
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F_, 3
	note F#, 11
	note F#, 7
	note D_, 6
	note D_, 14
	dec_octave
	note B_, 13
	inc_octave
	note D#, 3
	note E_, 11
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note F_, 3
	note F#, 11
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 7
	note G_, 13
	note G_, 7
	note A_, 7
	note A_, 6
	note F_, 3
	note F#, 11
	note F#, 13
	note F#, 14
	vibrato 28, $33
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note D#, 3
	note E_, 11
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note F#, 13
	note F#, 7
	note G_, 14
	note G_, 6
	note G#, 3
	note A_, 11
	note A_, 7
	note G_, 6
	note G_, 14
	note F#, 7
	note F#, 6
	note E_, 14
	note E_, 7
	note F#, 6
	note F#, 14
	dec_octave
	note B_, 7
	note B_, 6
	inc_octave
	note D_, 14
	note D_, 13
	note D_, 14
	note F_, 3
	note F#, 10
	note F#, 14
	note F#, 13
	dec_octave
	note B_, 14
	note B_, 13
	note B_, 14
	note B_, 13
	note B_, 14
	note B_, 13
	note B_, 14
	note B_, 13
	note B_, 14
	note B_, 13
	inc_octave
	note D#, 3
	vibrato 11, $33
	note E_, 11
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note F#, 13
	note F#, 7
	note G_, 14
	note G_, 6
	note G#, 3
	note A_, 11
	note A_, 13
	note A_, 14
	note A#, 3
	note B_, 10
	note B_, 14
	note B_, 13
	note G_, 14
	note G_, 13
	note G#, 3
	note A_, 11
	note A_, 13
	note A_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note G_, 14
	note G_, 13
	note G#, 3
	note A_, 11
	note A_, 13
	note A_, 14
	note A_, 13
	note B_, 14
	note B_, 13
	note B_, 14
	endchannel


Music_TCG2GRDuelTheme3_Ch1: 
	notetype1 10
.MainLoop
	notetype0 1
.Loop1
	octave 2
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	note __, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	note __, 3
	note __, 3
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	note __, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note __, 3
	note __, 3
	loopchannel 7, .Loop1
	octave 2
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	note __, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	note __, 3
	note __, 3
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	note __, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	octave 1
	note G_, 3
	note __, 3
.Loop2
	octave 3
	note D_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	inc_octave
	inc_octave
	note E_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	loopchannel 2, .Loop2
.Loop3
	octave 3
	note C#, 3
	note __, 4
	dec_octave
	note C#, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C#, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note C#, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C#, 3
	note __, 3
	loopchannel 2, .Loop3
.Loop4
	octave 3
	note D_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	inc_octave
	inc_octave
	note E_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	loopchannel 2, .Loop4
.Loop5
	octave 3
	note C#, 3
	note __, 4
	dec_octave
	note C#, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C#, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note C#, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C#, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C#, 3
	note __, 3
	loopchannel 2, .Loop5
.Loop6
	octave 3
	note C_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C_, 3
	note __, 3
	loopchannel 2, .Loop6
.Loop7
	octave 3
	note D_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	inc_octave
	inc_octave
	note E_, 3
	note __, 4
	dec_octave
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	dec_octave
	note B_, 3
	note __, 3
	loopchannel 2, .Loop7
	octave 3
	note C_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C_, 3
	note __, 3
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note D#, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note D#, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note D#, 3
	note __, 4
	note C_, 3
	note __, 3
	inc_octave
	note D#, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note D#, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note D#, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note D#, 3
	note __, 4
	note C_, 3
	note __, 3
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C_, 3
	note __, 3
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note C_, 3
	note __, 4
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 3
	dec_octave
	note E_, 3
	note __, 4
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note E_, 3
	note __, 4
	note C_, 3
	note __, 3
	note B_, 3
	note __, 4
	note B_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	note B_, 3
	note __, 4
	note G_, 3
	note __, 4
	note A_, 3
	note __, 4
	note F#, 3
	note __, 3
.Loop8
	octave 2
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	note __, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	octave 3
	note B_, 3
	note B_, 4
	note __, 13
	octave 2
	note B_, 3
	note __, 4
	inc_octave
	note E_, 3
	note __, 4
	note __, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	note __, 3
	note __, 3
	loopchannel 7, .Loop8
	octave 2
	note A_, 3
	note __, 4
	inc_octave
	note D_, 3
	note __, 4
	note __, 3
	note __, 4
	dec_octave
	note A_, 3
	note __, 3
	inc_octave
	note D_, 3
	note __, 4
	dec_octave
	octave 3
	note B_, 3
	note B_, 4
	note __, 13
	octave 2
	note B_, 3
	note __, 4
	octave 2
	note A_, 7
	note A#, 4
	note A#, 3
	note B_, 4
	note B_, 2
	inc_octave
	note D_, 7
	dec_octave
	note B_, 4
	note B_, 3
	note A_, 4
	note A_, 3
	octave 1
	note B_, 3
	note __, 3
	octave 3
	vibrato 0, $33
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 12
	note D_, 14
	note D_, 13
	note D_, 14
	note __, 13
	note D_, 14
	note D_, 4
	note __, 3
	dec_octave
	note B_, 6
	note __, 14
	note G_, 13
	inc_octave
	note C#, 16
	note C#, 16
	note C#, 16
	note C#, 16
	note C#, 16
	note C#, 16
	note C#, 12
	note C#, 14
	note C#, 13
	note C#, 14
	note C#, 13
	note __, 7
	callchannel Branch_1f6dd9
	octave 3
	vibrato 0, $33
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 12
	note D_, 14
	note D_, 13
	note D_, 14
	note __, 13
	note D_, 14
	note D_, 4
	note __, 3
	note D_, 6
	note D_, 11
	note __, 3
	note D_, 13
	note C#, 14
	note C#, 13
	note __, 14
	note C#, 13
	note C#, 14
	note C#, 13
	note C#, 14
	note C#, 13
	note C#, 14
	note C#, 13
	note C#, 14
	note C#, 13
	note __, 7
	callchannel Branch_1f6dd9
	octave 3
	note C_, 14
	note C_, 13
	note C_, 14
	note C_, 14
	note __, 14
	note C_, 13
	note __, 7
	note C_, 14
	note __, 6
	note C_, 14
	note __, 7
	note C_, 6
	note C_, 11
	note __, 3
	note C_, 7
	note __, 6
	note C_, 14
	note __, 7
	note C_, 16
	note __, 4
	dec_octave
	note G_, 7
	note __, 6
	note B_, 14
	note B_, 13
	note __, 14
	inc_octave
	note D_, 13
	note D_, 14
	note __, 13
	dec_octave
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note __, 7
	callchannel Branch_1f6df4
	octave 3
	note C_, 14
	note C_, 13
	note C_, 14
	note C_, 13
	note __, 14
	note D_, 13
	note __, 7
	note E_, 13
	note __, 6
	note D#, 14
	note D#, 13
	note __, 14
	note G_, 13
	note G_, 14
	note G_, 12
	note __, 1
	note D#, 14
	note __, 13
	note E_, 14
	note E_, 13
	note __, 14
	dec_octave
	note B_, 13
	note B_, 14
	note B_, 13
	inc_octave
	note E_, 14
	note __, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note __, 13
	note D#, 7
	octave 2
	note A_, 3
	note __, 4
	inc_octave
	note C_, 4
	note __, 3
	note D#, 3
	note __, 3
	note F#, 4
	note __, 3
	note A_, 4
	note __, 3
	inc_octave
	note C_, 4
	note __, 3
	note D#, 3
	note __, 3
	octave 3
	note G_, 14
	note G_, 7
	note A_, 6
	octave 2
	note B_, 4
	note __, 3
	callchannel Branch_1f6dbf
	octave 3
	note C_, 7
	octave 2
	note B_, 4
	note __, 3
	note __, 13
	octave 3
	note C#, 3
	note D_, 11
	dec_octave
	note B_, 13
	octave 3
	note C_, 14
	note C_, 13
	octave 2
	note B_, 4
	note __, 3
	callchannel Branch_1f6dbf
	octave 3
	note C_, 7
	octave 2
	note B_, 4
	note __, 3
	note __, 7
	octave 3
	note D_, 6
	octave 2
	note A_, 14
	note B_, 13
	octave 3
	note F#, 14
	note F#, 7
	note E_, 6
	octave 3
	note F#, 4
	note __, 3
	callchannel Branch_1f6dbf
	octave 3
	dec_octave
	note A_, 7
	octave 3
	note F#, 4
	note __, 3
	note __, 13
	octave 3
	note F#, 3
	note G_, 11
	note F#, 13
	octave 3
	dec_octave
	note A_, 14
	note A_, 13
	octave 3
	note F#, 4
	note __, 3
	callchannel Branch_1f6dbf
	note __, 7
	octave 3
	note F#, 4
	note __, 3
	note __, 13
	octave 3
	note F#, 4
	note G_, 5
	note F#, 5
	note D_, 13
	octave 3
	dec_octave
	note G_, 14
	note G_, 7
	note A_, 6
	octave 2
	note B_, 4
	note __, 3
	callchannel Branch_1f6dbf
	octave 3
	note E_, 7
	octave 2
	note B_, 4
	note __, 3
	note __, 13
	octave 3
	note C#, 3
	note D_, 11
	dec_octave
	note B_, 13
	octave 3
	note E_, 14
	note E_, 13
	octave 2
	note B_, 4
	note __, 3
	callchannel Branch_1f6dbf
	octave 3
	note G_, 7
	octave 2
	note B_, 4
	note __, 3
	note __, 7
	octave 3
	note F#, 6
	octave 2
	note A_, 14
	note B_, 13
	octave 3
	note D_, 14
	note D_, 7
	note C_, 6
	octave 3
	note F#, 4
	note __, 3
	callchannel Branch_1f6dbf
	octave 3
	note C_, 7
	octave 3
	note F#, 4
	note __, 3
	note __, 13
	octave 3
	note F#, 3
	note G_, 11
	note F#, 13
	octave 3
	note D_, 14
	note D_, 13
	octave 3
	note F#, 4
	note __, 3
	callchannel Branch_1f6dbf
	note __, 7
	octave 3
	note F#, 4
	note __, 3
	note __, 13
	octave 3
	note F#, 4
	note G_, 5
	note F#, 5
	octave 3
	note E_, 7
	note D#, 6
	octave 3
	note C_, 14
	note C_, 7
	dec_octave
	note A_, 6
	octave 3
	note C_, 4
	note __, 3
	note __, 7
	octave 3
	note E_, 13
	note C_, 7
	octave 3
	note C_, 4
	note __, 3
	note __, 7
	octave 3
	note G_, 6
	octave 2
	note B_, 3
	inc_octave
	note C_, 11
	dec_octave
	note A_, 13
	octave 3
	note E_, 14
	note E_, 13
	octave 3
	note E_, 4
	note __, 10
	note __, 13
	note __, 7
	octave 3
	note E_, 4
	note __, 3
	note __, 13
	octave 2
	note B_, 3
	inc_octave
	note C_, 11
	dec_octave
	note A_, 13
	octave 3
	note G_, 14
	note G_, 7
	note A_, 6
	octave 3
	note G_, 4
	note __, 3
	note __, 7
	octave 3
	note A_, 13
	note G_, 7
	octave 3
	note G_, 4
	note __, 3
	note __, 7
	octave 3
	note C_, 6
	octave 2
	note B_, 3
	inc_octave
	note C_, 11
	dec_octave
	note A_, 13
	octave 3
	note F#, 14
	note F#, 13
	octave 2
	note F#, 4
	note __, 10
	note __, 13
	note __, 7
	octave 3
	note F#, 4
	note __, 3
	octave 3
	note E_, 7
	note __, 6
	note __, 7
	note F#, 7
	note __, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note D_, 14
	note E_, 7
	note E_, 6
	note F#, 7
	note F#, 7
	note G_, 7
	note G_, 6
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	loopchannel 0, .MainLoop

Branch_1f6dbf:
	octave 3
	note G_, 4
	note G_, 3
	inc_octave
	note G_, 4
	note G_, 3
	dec_octave
	note G_, 3
	note G_, 3
	endchannel

Branch_1f6dd9:
	octave 2
	note C#, 4
	note __, 3
	note E_, 4
	note __, 3
	inc_octave
	note C#, 4
	note __, 2
	dec_octave
	note E_, 4
	note __, 3
	inc_octave
	note C#, 4
	note __, 3
	dec_octave
	note E_, 4
	note __, 3
	note C#, 3
	note __, 3
	endchannel

Branch_1f6df4:
	octave 1
	note B_, 4
	note __, 3
	inc_octave
	note E_, 4
	note __, 3
	inc_octave
	note D_, 4
	note __, 2
	dec_octave
	note E_, 4
	note __, 3
	inc_octave
	note D_, 4
	note __, 3
	dec_octave
	note E_, 4
	note __, 3
	dec_octave
	note B_, 3
	note __, 3
	endchannel


Music_TCG2GRDuelTheme3_Ch3: 
	notetype1 10
	notetype2 11
	notetype0 1
	notetype1 1
.MainLoop
	octave 3
	vibrato 48, $33
.Loop1
	note D_, 14
	note D_, 7
	note E_, 6
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 7
	notetype1 3
	note E_, 6
	notetype1 1
	loopchannel 3, .Loop1
	note D_, 14
	note D_, 7
	note E_, 6
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	notetype1 3
	note E_, 7
	notetype1 1
	inc_octave
	note D_, 7
	note E_, 7
	dec_octave
	note B_, 6
	inc_octave
	note D_, 7
	dec_octave
	note A_, 7
	note B_, 7
	note G_, 6
.Loop2
	note D_, 14
	note D_, 7
	note E_, 6
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 7
	notetype1 3
	note E_, 6
	notetype1 1
	note D_, 14
	note D_, 7
	note E_, 6
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	notetype1 3
	note E_, 7
	notetype1 1
	note B_, 7
	inc_octave
	note D_, 7
	dec_octave
	note A_, 6
	note B_, 7
	note G_, 7
	note A_, 7
	note F#, 3
	note __, 3
	loopchannel 3, .Loop2
	note D_, 14
	note D_, 7
	note E_, 6
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	note E_, 14
	note E_, 13
	vibrato 0, $33
	note F_, 14
	note F_, 13
	note F_, 14
	note F_, 13
	note F_, 14
	note F_, 13
	note F_, 14
	note F_, 7
	notetype1 3
	note F_, 6
	notetype1 1
	vibrato 48, $33
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note F#, 14
	note F#, 13
	note B_, 14
	note B_, 13
	note B_, 14
	note B_, 13
	notetype1 3
	note B_, 7
	notetype1 1
	note B_, 7
	inc_octave
	note D_, 7
	dec_octave
	note A_, 6
	note B_, 7
	note G_, 7
	note A_, 7
	note F#, 3
	note __, 3
.Loop3
	note D_, 14
	note D_, 7
	note E_, 6
	note E_, 3
	note __, 4
	inc_octave
	inc_octave
	inc_octave
	note E_, 7
	dec_octave
	dec_octave
	note D_, 5
	note __, 2
	note D_, 2
	note __, 4
	note E_, 4
	note __, 3
	note E_, 2
	note __, 5
	dec_octave
	note B_, 4
	note __, 3
	note B_, 1
	note __, 5
	inc_octave
	note D_, 7
	note E_, 7
	dec_octave
	note D_, 4
	note __, 3
	note E_, 3
	note __, 3
	note D_, 14
	note D_, 7
	note E_, 6
	note E_, 3
	note __, 4
	inc_octave
	inc_octave
	inc_octave
	note E_, 7
	dec_octave
	dec_octave
	note D_, 5
	note __, 2
	note D_, 2
	note __, 4
	note E_, 4
	note __, 3
	note E_, 2
	note __, 5
	dec_octave
	note B_, 4
	note __, 3
	note B_, 1
	note __, 5
	inc_octave
	note D_, 7
	dec_octave
	note B_, 4
	note __, 3
	note A_, 4
	note __, 3
	note G_, 3
	note __, 3
	loopchannel 4, .Loop3
	note D_, 14
	note D_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D#, 13
	note E_, 14
	note E_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D#, 13
	note E_, 14
	note E_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note B_, 7
	inc_octave
	note D_, 4
	note __, 3
	dec_octave
	note A_, 4
	note __, 2
	note B_, 7
	note G_, 4
	note __, 3
	note A_, 4
	note __, 3
	note F#, 4
	note __, 2
	note D_, 14
	note D_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D#, 13
	note E_, 14
	note E_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D#, 13
	note E_, 14
	note __, 7
	note E_, 6
	note __, 7
	note B_, 7
	inc_octave
	note D_, 7
	note E_, 6
	note __, 7
	dec_octave
	note B_, 7
	inc_octave
	note D_, 7
	dec_octave
	note A_, 6
	note B_, 7
	note G_, 7
	note A_, 7
	note F#, 3
	note __, 3
	note D_, 14
	note D_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D#, 13
	note E_, 14
	note E_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note D#, 13
	note E_, 14
	note E_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 4
	note B_, 7
	inc_octave
	note D_, 4
	note __, 3
	dec_octave
	note A_, 4
	note __, 2
	note B_, 7
	note G_, 4
	note __, 3
	note A_, 4
	note __, 3
	note F#, 4
	note __, 2
	note D_, 14
	note D_, 7
	note E_, 6
	inc_octave
	note E_, 2
	note __, 12
	dec_octave
	note B_, 4
	note __, 3
	note E_, 3
	note __, 3
	note E_, 4
	note __, 3
	note E_, 4
	note __, 3
	dec_octave
	note B_, 13
	inc_octave
	note D_, 14
	note E_, 13
	note F_, 14
	note F_, 7
	note F_, 6
	inc_octave
	note F_, 2
	note __, 12
	note C_, 4
	note __, 3
	dec_octave
	note F_, 3
	note __, 3
	note F_, 4
	note __, 3
	note F_, 4
	note __, 3
	note C_, 13
	note D#, 14
	note F_, 13
	note F#, 14
	note F#, 7
	note F#, 6
	inc_octave
	note F#, 2
	note __, 12
	note C#, 4
	note __, 3
	dec_octave
	note F#, 3
	note __, 3
	note F#, 4
	note __, 3
	note F#, 4
	note __, 3
	note C#, 13
	note E_, 14
	note C#, 13
	note B_, 14
	note B_, 7
	note B_, 6
	inc_octave
	note B_, 1
	note __, 13
	note F#, 4
	note __, 3
	dec_octave
	note B_, 3
	note __, 3
	note B_, 4
	note __, 3
	inc_octave
	note F#, 7
	note A_, 7
	inc_octave
	note C_, 6
	note D#, 7
	note F#, 7
	note A_, 7
	inc_octave
	note C_, 6
	octave 3
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	note G_, 7
	dec_octave
	note G_, 4
	note __, 3
	note B_, 7
	note G_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	note G_, 7
	dec_octave
	note G_, 7
	note C_, 3
	note __, 3
	inc_octave
	note C_, 14
	dec_octave
	note G_, 13
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	note G_, 7
	dec_octave
	note G_, 4
	note __, 3
	note B_, 7
	note G_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	note G_, 7
	dec_octave
	note G_, 7
	note C_, 3
	note __, 3
	inc_octave
	note C_, 14
	dec_octave
	note G_, 13
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 7
	note C_, 3
	note __, 3
	note B_, 14
	note A_, 13
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 7
	note C_, 3
	note __, 3
	note G_, 14
	note A_, 13
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	note G_, 7
	dec_octave
	note G_, 4
	note __, 3
	note B_, 7
	note G_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	note G_, 7
	dec_octave
	note G_, 7
	note C_, 3
	note __, 3
	inc_octave
	note C_, 14
	dec_octave
	note G_, 13
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	note G_, 7
	dec_octave
	note G_, 4
	note __, 3
	note B_, 6
	note G_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	note G_, 7
	dec_octave
	note G_, 7
	note C_, 3
	note __, 3
	inc_octave
	note C_, 14
	dec_octave
	note G_, 13
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 7
	note C_, 3
	note __, 3
	note B_, 14
	note A_, 13
	note C_, 14
	note C_, 2
	note __, 5
	note C_, 6
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note C_, 3
	note __, 4
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 7
	note C_, 3
	note __, 3
	note G_, 14
	note A_, 13
	note D_, 14
	note D_, 2
	note __, 5
	note D_, 6
	inc_octave
	note A_, 7
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note D_, 3
	note __, 4
	inc_octave
	note A_, 7
	dec_octave
	note A_, 7
	note F_, 3
	note __, 3
	note C_, 14
	note C#, 13
	note D_, 14
	note D_, 2
	note __, 5
	note D_, 6
	inc_octave
	inc_octave
	note C_, 7
	dec_octave
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note D_, 3
	note __, 4
	inc_octave
	inc_octave
	note C_, 7
	dec_octave
	dec_octave
	note A_, 7
	note F_, 3
	note __, 3
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 2
	note __, 5
	note D_, 6
	inc_octave
	inc_octave
	note C_, 7
	dec_octave
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note D_, 3
	note __, 4
	inc_octave
	inc_octave
	note C_, 7
	dec_octave
	dec_octave
	note A_, 7
	note F_, 3
	note __, 3
	note C_, 14
	note C#, 13
	note D_, 14
	note D_, 2
	note __, 5
	note D_, 6
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 4
	note __, 3
	inc_octave
	note C_, 7
	dec_octave
	note A_, 4
	note __, 2
	note D_, 3
	note __, 4
	inc_octave
	inc_octave
	note D_, 7
	dec_octave
	dec_octave
	note A_, 7
	note F_, 3
	note __, 3
	note D_, 14
	note D_, 13
	callchannel Branch_1f72b7
	note D_, 14
	note D_, 7
	note D_, 6
	note D_, 7
	inc_octave
	note D_, 7
	note C_, 7
	note D_, 6
	dec_octave
	note A_, 7
	note E_, 7
	note C_, 7
	note C#, 6
	note D_, 14
	note A_, 13
	inc_octave
	note C_, 14
	note D_, 13
	callchannel Branch_1f72b7
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	note D_, 14
	note D_, 13
	loopchannel 0, .MainLoop

Branch_1f72b7:
	octave 3
	note E_, 7
	inc_octave
	note E_, 7
	note D_, 7
	note E_, 6
	dec_octave
	note B_, 7
	note D_, 7
	note E_, 7
	inc_octave
	note E_, 6
	note D_, 7
	note E_, 7
	dec_octave
	note B_, 7
	note E_, 6
	endchannel


Music_TCG2GRDuelTheme3_Ch4: 
	togglenoise $06
.MainLoop
	notetype 1
	octave 1
	note D#, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note D#, 6
	note D#, 7
	note E_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note D#, 6
	note D#, 7
	note E_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note D#, 6
	note D#, 7
	note E_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note D#, 6
	note D#, 7
	note E_, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note D#, 7
	note E_, 7
	note D#, 6
	note C_, 7
	note E_, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note D#, 7
	note E_, 7
	note D#, 6
	note C_, 7
	note E_, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note D#, 7
	note E_, 7
	note D#, 6
	note C_, 7
	note E_, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note D#, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note D#, 7
	note C#, 7
	note E_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C_, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 3
	note C#, 3
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note D#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 3
	note C#, 3
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 3
	note C#, 3
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 3
	note C#, 3
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C_, 7
	note D#, 7
	note D#, 6
	note D#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note E_, 6
	note D#, 7
	note C#, 4
	note C#, 3
	note C#, 7
	note C#, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note C#, 7
	note E_, 7
	note C#, 3
	note C#, 3
	note C#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note E_, 7
	note C#, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note C_, 7
	note D#, 6
	note C#, 7
	note C_, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note E_, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note D#, 7
	note C#, 3
	note C#, 3
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note E_, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note C#, 6
	note E_, 7
	note C_, 7
	note C#, 7
	note D#, 6
	note C_, 7
	note C#, 7
	note E_, 7
	note C_, 6
	note C_, 7
	note D#, 7
	note D#, 7
	note C#, 6
	note C#, 7
	note C#, 7
	note D#, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note E_, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C#, 7
	note C#, 6
	note C_, 7
	note C#, 7
	note E_, 7
	note C_, 6
	note C#, 7
	note D#, 7
	note C_, 7
	note C#, 6
	note E_, 7
	note C_, 7
	note C#, 7
	note D#, 6
	notetype 9
	note F_, 9
	notetype 1
	note C_, 7
	note C#, 7
	note C#, 7
	note C#, 6
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	loopchannel 0, .MainLoop

