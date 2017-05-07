Music_TCG2Fort2:
	db $C0
	dw Music_TCG2Fort2_Ch1
	db $01
	dw Music_TCG2Fort2_Ch2
	db $02
	dw Music_TCG2Fort2_Ch3
	db $03
	dw Music_TCG2Fort2_Ch4

Music_TCG2Fort2_Ch2: 
	notetype1 10
	notetype0 1
.MainLoop
	octave 3
.Loop1
	note __, 8
	callchannel Branch_1ee109
	note __, 4
	note G_, 3
	note __, 4
	note __, 8
	callchannel Branch_1ee109
	note G_, 4
	note F#, 3
	note G_, 4
	loopchannel 4, .Loop1
	vibrato 30, $33
	octave 2
	note B_, 15
	inc_octave
	note D_, 8
	note D_, 7
	note F#, 15
	note E_, 8
	note E_, 7
	note G#, 2
	note A_, 15
	note A_, 6
	note G_, 7
	note G_, 15
	note C#, 15
	note C#, 10
	note C#, 15
	note C#, 15
	note C#, 5
	note C#, 15
	note C#, 4
	note C#, 11
	note D_, 4
	note D_, 11
	note C#, 5
	note D_, 5
	note C#, 5
	dec_octave
	note A_, 8
	note A_, 7
	note A#, 3
	note B_, 5
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 10
	note B_, 15
	note __, 8
	note A_, 3
	note A#, 4
	note B_, 15
	inc_octave
	note D_, 8
	note D_, 7
	note F#, 15
	note E_, 8
	note E_, 7
	note G#, 2
	note A_, 15
	note A_, 6
	note G_, 7
	note G_, 15
	note C_, 15
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 10
	dec_octave
	note B_, 5
	inc_octave
	note C_, 5
	dec_octave
	note B_, 5
	note G_, 8
	note G_, 7
	note G#, 2
	note A_, 16
	note A_, 5
	inc_octave
	note D_, 1
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 10
	note D_, 8
	octave 3
	note D#, 15
	vibrato 30, $33
	octave 2
	note A_, 3
	note A#, 4
	note B_, 15
	inc_octave
	note D_, 8
	note D_, 7
	note F#, 15
	note E_, 8
	note E_, 7
	note G#, 2
	note A_, 15
	note A_, 6
	note G_, 7
	note G_, 15
	note C#, 15
	note C#, 8
	note C#, 16
	note C#, 16
	note C#, 5
	note C#, 15
	note C#, 4
	note C#, 11
	note D_, 4
	note D_, 11
	note C#, 5
	note D_, 5
	note C#, 5
	dec_octave
	note A_, 8
	note A_, 7
	note A#, 3
	note B_, 5
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 15
	note B_, 15
	note B_, 15
	note B_, 8
	inc_octave
	note E_, 3
	note F_, 4
	note F#, 15
	note G_, 8
	note G_, 7
	note A_, 15
	note B_, 8
	note B_, 7
	note F_, 2
	note F#, 16
	note F#, 5
	note E_, 16
	note E_, 16
	note E_, 5
	note E_, 15
	note E_, 15
	note G#, 2
	note A_, 16
	note A_, 5
	note G#, 3
	note G_, 4
	note F#, 15
	note F#, 15
	note F#, 15
	note F#, 15
	note F#, 4
	note F#, 11
	note G_, 4
	note G_, 11
	note F#, 5
	note G_, 5
	note F#, 5
	note D_, 8
	note D_, 7
	note F_, 3
	note F#, 16
	note F#, 16
	note F#, 16
	note F#, 16
	note F#, 16
	note F#, 16
	note F#, 16
	note F#, 5
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 10
	note E_, 15
	note E_, 15
.Loop2
	octave 2
	note A#, 8
	inc_octave
	note C_, 7
	note F_, 8
	note A#, 5
	note A#, 10
	note A_, 5
	note A_, 10
	note F_, 5
	note F_, 10
	note G_, 5
	note G_, 10
	note C_, 3
	note C_, 4
	vibrato 8, $33
	note C_, 8
	note C_, 15
	note C_, 7
	vibrato 0, $33
	dec_octave
	note A#, 8
	inc_octave
	note C_, 7
	note F_, 8
	note A#, 5
	note A#, 10
	note A_, 5
	note A_, 10
	note F_, 5
	note F_, 10
	note G_, 5
	note G_, 10
	inc_octave
	note C_, 3
	note C_, 4
	vibrato 8, $33
	note C_, 8
	note C_, 15
	note C_, 7
	vibrato 0, $33
	loopchannel 2, .Loop2
	octave 3
	note C#, 8
	note D#, 7
	note G#, 8
	inc_octave
	note C#, 5
	note C#, 10
	note C_, 5
	note C_, 10
	dec_octave
	note G#, 5
	note G#, 10
	note A#, 5
	note A#, 10
	note D#, 3
	note D#, 4
	vibrato 8, $33
	note D#, 8
	note D#, 15
	note D#, 7
	vibrato 0, $33
	note C#, 8
	note D#, 7
	note G#, 8
	inc_octave
	note C#, 5
	note C#, 10
	note C_, 5
	note C_, 10
	dec_octave
	note G#, 5
	note G#, 10
	note A#, 5
	note A#, 10
	inc_octave
	note D#, 3
	note D#, 4
	vibrato 8, $33
	note D#, 8
	note D#, 15
	note D#, 7
	vibrato 0, $33
	octave 3
	note C#, 8
	note D#, 7
	note G#, 8
	inc_octave
	note C#, 5
	note C#, 10
	note C_, 5
	note C_, 10
	dec_octave
	note G#, 5
	note G#, 10
	note A#, 5
	note A#, 10
	note D#, 3
	note D#, 4
	vibrato 8, $33
	note D#, 8
	note D#, 15
	note D#, 7
	vibrato 0, $33
	note C#, 8
	note D#, 7
	note G#, 8
	inc_octave
	note C#, 5
	note C#, 10
	note C_, 5
	note C_, 10
	dec_octave
	note G#, 3
	note G#, 4
	note G_, 2
	note G#, 13
	note G#, 8
	note A#, 15
	note A#, 7
	vibrato 15, $33
	note B_, 15
	note B_, 15
	note B_, 15
	note B_, 15
	note A#, 2
	vibrato 2, $33
	note B_, 13
	note B_, 15
	note B_, 15
	loopchannel 0, .MainLoop

Branch_1ee109:
	octave 2
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note F#, 4
	note __, 4
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	note A_, 3
	note __, 12
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note G_, 4
	note __, 4
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note F#, 4
	endchannel


Music_TCG2Fort2_Ch1: 
	notetype1 10
	notetype0 1
.MainLoop
	octave 3
	note E_, 4
	note E_, 4
	inc_octave
	note E_, 3
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	note E_, 4
	note E_, 3
	inc_octave
	note E_, 4
	inc_octave
	note E_, 4
	dec_octave
	dec_octave
	note E_, 4
	dec_octave
	note E_, 3
	inc_octave
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	dec_octave
	note E_, 4
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 3
	dec_octave
	note E_, 4
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	note E_, 3
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	note E_, 4
	note E_, 3
	inc_octave
	note E_, 4
	inc_octave
	note E_, 4
	dec_octave
	dec_octave
	note E_, 4
	dec_octave
	note E_, 3
	inc_octave
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	dec_octave
	note E_, 4
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 3
	dec_octave
	note E_, 4
.Loop1
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	note E_, 3
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	note E_, 4
	note E_, 3
	inc_octave
	note E_, 4
	inc_octave
	note E_, 4
	dec_octave
	dec_octave
	note E_, 4
	dec_octave
	note E_, 3
	inc_octave
	inc_octave
	inc_octave
	note E_, 4
	dec_octave
	dec_octave
	note E_, 4
	dec_octave
	note E_, 4
	inc_octave
	inc_octave
	note E_, 3
	dec_octave
	note E_, 4
	loopchannel 14, .Loop1
.Loop2
	note __, 8
	callchannel Branch_1ee109
	note __, 4
	note G_, 3
	note __, 4
	note __, 8
	callchannel Branch_1ee109
	note G_, 4
	note F#, 3
	note G_, 4
	loopchannel 2, .Loop2
	note __, 8
	callchannel Branch_1ee109
	note __, 4
	note G_, 3
	note __, 4
	note __, 8
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note C_, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note C_, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note C_, 4
	note __, 4
	note E_, 3
	note __, 12
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note C_, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note C_, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note C_, 4
	note E_, 4
	note D#, 3
	note E_, 4
	note __, 8
	callchannel Branch_1ee109
	note __, 4
	note G_, 3
	note __, 4
	note __, 8
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	note G_, 3
	note __, 12
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note B_, 3
	note __, 4
	inc_octave
	note D_, 4
	octave 3
	note F#, 4
	note G_, 7
	note G_, 8
	note G_, 3
	note __, 4
.Loop3
	octave 2
	note __, 8
	callchannel Branch_1ee109
	note __, 4
	note G_, 3
	note __, 4
	note __, 8
	callchannel Branch_1ee109
	note G_, 4
	note F#, 3
	note G_, 4
	loopchannel 2, .Loop3
	note __, 8
	callchannel Branch_1ee109
	note __, 4
	note G_, 3
	note __, 4
	note __, 8
	octave 2
	note A_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note F#, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	note A_, 3
	note __, 12
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note G_, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	inc_octave
	note F#, 4
	note __, 4
	dec_octave
	note A_, 3
	note __, 4
	note __, 8
	callchannel Branch_1ee109
	note __, 4
	note G_, 3
	note __, 4
	note __, 8
	callchannel Branch_1ee109
	note G_, 4
	note F#, 3
	note G_, 4
.Loop4
	note F_, 4
	note F_, 4
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note C_, 3
	note C_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 4
	note G_, 11
	note G_, 4
	note G_, 11
	note G_, 4
	note F_, 4
	note F_, 4
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note C_, 3
	note C_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 4
	vibrato 8, $33
	note G_, 14
	note G_, 16
	vibrato 0, $33
	loopchannel 2, .Loop4
	note F_, 4
	note F_, 4
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note C_, 3
	note C_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 4
	note G_, 11
	note G_, 4
	note G_, 11
	note G_, 4
	note F_, 4
	note F_, 4
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note C_, 3
	note C_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 4
	vibrato 8, $33
	note G_, 14
	note G_, 16
	vibrato 0, $33
	note F_, 4
	note F_, 4
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note C_, 3
	note C_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 4
	note G_, 11
	note G_, 4
	note G_, 11
	note G_, 4
	note F_, 4
	note F_, 4
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note F_, 3
	note F_, 12
	note C_, 3
	note C_, 4
	note C_, 2
	note C#, 13
	note C#, 8
	note D#, 15
	note D#, 7
	note E_, 15
	note E_, 8
	note A_, 5
	note A_, 2
	note D_, 4
	note D_, 4
	note D#, 3
	note D#, 4
	note E_, 4
	note E_, 4
	dec_octave
	note B_, 3
	note B_, 12
	inc_octave
	note G_, 5
	note G_, 2
	dec_octave
	note A_, 4
	note A_, 4
	note A#, 3
	note A#, 4
	note B_, 4
	note B_, 4
	inc_octave
	inc_octave
	note G_, 5
	note G_, 2
	loopchannel 0, .MainLoop


Music_TCG2Fort2_Ch3: 
	notetype1 10
	notetype2 15
	notetype1 2
	octave 4
	octave 3
	notetype0 1
	note __, 15
	note __, 15
	octave 4
	note D_, 4
	note __, 4
	note __, 15
	note F#, 3
	note __, 4
	note __, 15
	note __, 15
	note D_, 4
	note __, 4
	note __, 7
	note D_, 4
	note __, 4
	note __, 7
.MainLoop
.Loop1
	note __, 15
	note __, 15
	octave 4
	note D_, 4
	note __, 4
	note __, 15
	note F#, 3
	note __, 4
	note __, 15
	note __, 15
	note D_, 4
	note __, 4
	note __, 7
	note D_, 4
	note __, 4
	note __, 7
	loopchannel 2, .Loop1
	note __, 15
	note __, 15
	octave 4
	note D_, 4
	note __, 4
	note __, 15
	note F#, 3
	note __, 4
	note __, 15
	note __, 15
	note D_, 4
	note __, 4
	note __, 7
	notetype1 1
	octave 2
	note A_, 2
	note A#, 2
	note B_, 11
.Loop2
	octave 2
	note E_, 15
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 2
	note E_, 4
	note __, 4
	note E_, 7
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	loopchannel 3, .Loop2
	octave 2
	note E_, 15
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 2
	note E_, 4
	note __, 4
	note E_, 7
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note D_, 7
	octave 2
	note C_, 15
	note __, 8
	note C_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note C_, 7
	note B_, 8
	inc_octave
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note C_, 8
	dec_octave
	note C_, 7
	note C_, 1
	note __, 7
	note C_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note C_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note C_, 7
	octave 2
	note F_, 4
	note __, 4
	note F_, 7
	note __, 8
	note F_, 7
	octave 4
	note C_, 4
	note __, 4
	dec_octave
	dec_octave
	note F_, 7
	inc_octave
	note E_, 8
	inc_octave
	note C_, 3
	note __, 4
	octave 3
	note F_, 8
	dec_octave
	note F_, 7
	note F_, 1
	note __, 7
	note F_, 7
	octave 4
	note C_, 4
	note __, 4
	octave 3
	note F_, 7
	octave 4
	note C_, 4
	note __, 4
	octave 3
	note F_, 7
	octave 2
	note F#, 15
	note __, 8
	note F#, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note F#, 7
	inc_octave
	note E_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note F#, 8
	dec_octave
	note F#, 7
	note F#, 1
	note __, 7
	note F#, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note F#, 7
	octave 4
	note D_, 4
	note __, 4
	octave 2
	note A#, 7
	note B_, 4
	note __, 4
	note B_, 7
	note __, 8
	note B_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note B_, 7
	inc_octave
	note A_, 8
	inc_octave
	note D_, 3
	note __, 4
	octave 3
	note B_, 8
	dec_octave
	note B_, 7
	note B_, 1
	note __, 7
	note B_, 7
	note __, 8
	octave 2
	note E_, 2
	note F_, 13
	note F#, 4
	note __, 3
	octave 2
	note E_, 15
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 2
	note E_, 4
	note __, 4
	note E_, 7
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 2
	note E_, 15
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 2
	note E_, 4
	note __, 4
	note E_, 7
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note D_, 7
	octave 2
	note C_, 15
	note __, 8
	note C_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note C_, 7
	note B_, 8
	inc_octave
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note C_, 8
	dec_octave
	note C_, 7
	note C_, 1
	note __, 7
	note C_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note C_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note C_, 7
	octave 2
	note D_, 15
	note __, 8
	note D_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note D_, 7
	note A_, 8
	inc_octave
	inc_octave
	note F#, 3
	note __, 4
	octave 2
	note B_, 8
	note B_, 7
	note B_, 1
	note __, 7
	note B_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note B_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note B_, 7
	octave 2
	note E_, 15
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 2
	note E_, 4
	note __, 4
	note E_, 7
	note __, 8
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	dec_octave
	dec_octave
	note E_, 7
	inc_octave
	note D_, 8
	inc_octave
	note F#, 3
	note __, 4
	octave 3
	note E_, 8
	dec_octave
	note E_, 7
	note E_, 1
	note __, 7
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 4
	note D_, 4
	note __, 4
	octave 3
	note E_, 7
	octave 2
.Loop3
	note C_, 15
	note __, 8
	note C_, 4
	note __, 3
	inc_octave
	note C_, 8
	dec_octave
	note C_, 4
	note __, 11
	note C_, 4
	note __, 11
	inc_octave
	note C_, 4
	note __, 3
	dec_octave
	note C_, 8
	note C_, 4
	note __, 3
	note D_, 15
	note D_, 15
	note C_, 15
	note __, 8
	note C_, 4
	note __, 3
	inc_octave
	note C_, 8
	dec_octave
	note C_, 4
	note __, 11
	note C_, 4
	note __, 11
	inc_octave
	note C_, 4
	note __, 3
	dec_octave
	note C_, 8
	note C_, 4
	note __, 3
	note D_, 15
	note D_, 15
	loopchannel 2, .Loop3
	octave 2
	note D#, 15
	note __, 8
	note D#, 4
	note __, 3
	inc_octave
	note D#, 8
	dec_octave
	note D#, 4
	note __, 11
	note D#, 4
	note __, 11
	inc_octave
	note D#, 4
	note __, 3
	dec_octave
	note D#, 8
	note D#, 4
	note __, 3
	note F_, 15
	note F_, 15
	note D#, 15
	note __, 8
	note D#, 4
	note __, 3
	inc_octave
	note D#, 8
	dec_octave
	note D#, 4
	note __, 11
	note D#, 4
	note __, 11
	inc_octave
	note D#, 4
	note __, 3
	dec_octave
	note D#, 8
	note D#, 4
	note __, 3
	note F_, 15
	note F_, 15
	note D#, 15
	note __, 8
	note D#, 4
	note __, 3
	inc_octave
	note D#, 8
	dec_octave
	note D#, 4
	note __, 11
	note D#, 4
	note __, 11
	inc_octave
	note D#, 4
	note __, 3
	dec_octave
	note D#, 8
	note D#, 4
	note __, 3
	note F_, 15
	note F_, 15
	note D#, 15
	note __, 8
	note D#, 4
	note __, 3
	inc_octave
	note D#, 8
	dec_octave
	note D#, 4
	note __, 11
	note D#, 4
	note __, 3
	note D#, 15
	note __, 8
	note F_, 15
	note F_, 7
	note F#, 15
	note F#, 8
	octave 4
	notetype1 2
	note E_, 7
	notetype1 1
	octave 3
	note E_, 8
	note F_, 7
	note F#, 8
	dec_octave
	note F#, 7
	note B_, 8
	octave 4
	notetype1 2
	note D_, 7
	octave 3
	notetype1 2
	note A_, 8
	note A#, 7
	note B_, 8
	notetype1 2
	octave 5
	note D_, 7
	notetype1 1
	octave 2
	note E_, 8
	note __, 7
	note __, 15
	octave 4
	note D_, 4
	note __, 4
	note __, 15
	note F#, 3
	note __, 4
	note __, 15
	note __, 15
	note D_, 4
	note __, 4
	note __, 7
	note D_, 4
	note __, 4
	note __, 7
	loopchannel 0, .MainLoop


Music_TCG2Fort2_Ch4: 
	togglenoise $06
	notetype 1
	octave 1
.MainLoop
.Loop1
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note E_, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	loopchannel 3, .Loop1
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note E_, 7
	note C_, 8
	note D#, 7
	note E_, 8
	note C#, 3
	note C#, 4
	note C#, 8
	note C#, 7
	note C_, 8
	note C#, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note E_, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note C#, 7
	callchannel Branch_1ee771
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note E_, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note C#, 3
	note C#, 4
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
.Loop2
	callchannel Branch_1ee771
	loopchannel 7, .Loop2
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note C#, 3
	note C#, 4
	note C#, 8
	note C#, 7
	note C_, 8
	note C#, 7
	note C#, 8
	note E_, 15
	note C#, 7
.Loop3
	callchannel Branch_1ee771
	loopchannel 6, .Loop3
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note E_, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note C#, 3
	note C#, 4
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	callchannel Branch_1ee785
	note C_, 8
	note D#, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note E_, 7
	note D#, 8
	note C_, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note C_, 7
	note C#, 15
	note D#, 4
	note D#, 4
	note D#, 3
	note D#, 4
	callchannel Branch_1ee785
	note C_, 8
	note D#, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note E_, 7
	note D#, 8
	note C_, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 3
	note C#, 4
	note C#, 8
	note C#, 7
	callchannel Branch_1ee785
	note C_, 8
	note D#, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note E_, 7
	note D#, 8
	note C_, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note C_, 7
	note C#, 15
	note D#, 4
	note D#, 4
	note D#, 3
	note D#, 4
	callchannel Branch_1ee785
	note C_, 8
	note D#, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note E_, 7
	note D#, 8
	note C_, 7
	note E_, 15
	note C#, 8
	note E_, 15
	note C#, 7
	note E_, 15
	note D#, 8
	note C#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note C#, 7
	note D#, 8
	note C#, 7
	note E_, 8
	note C#, 4
	note C#, 3
	note C#, 8
	note C#, 3
	note __, 4
	loopchannel 0, .MainLoop

Branch_1ee771:
	octave 1
	notetype 1
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note E_, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note C#, 7
	endchannel

Branch_1ee785:
	octave 1
	notetype 1
	note C_, 8
	note D#, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note E_, 7
	note D#, 8
	note C_, 7
	note D#, 8
	note C#, 7
	note D#, 8
	note C_, 7
	note C#, 15
	note C#, 15
	endchannel

