Music_TCGRonald:
	db $C0
	dw Music_TCGRonald_Ch1
	db $01
	dw Music_TCGRonald_Ch2
	db $02
	dw Music_TCGRonald_Ch3
	db $03
	dw Music_TCGRonald_Ch4

Music_TCGRonald_Ch1: 
	vibrato 12, $33
	notetype2 8
	dutycycle 0
.MainLoop
	octave 3
	notetype0 13
.Loop1
	notetype1 9
	notetype2 3
	note D_, 1
	note D_, 1
	notetype2 4
	note F_, 1
	note __, 2
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	notetype1 9
	notetype2 8
	note E_, 2
	note __, 1
	dec_octave
	notetype1 9
	notetype2 3
	note G_, 1
	inc_octave
	note D_, 1
	notetype2 4
	note F_, 1
	note __, 2
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype2 8
	notetype1 9
	note G_, 2
	note __, 1
	loopchannel 2, .Loop1
.Loop2
	vibrato 20, $33
	callchannel Branch_fa9aa
	notetype0 1
	octave 4
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 2
	vibrato 12, $33
	callchannel Branch_fa9ec
	loopchannel 2, .Loop2
.Loop3
	vibrato 20, $33
	callchannel Branch_fa9cb
	notetype0 1
	octave 4
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 2
	vibrato 12, $33
	callchannel Branch_fa9ec
	loopchannel 2, .Loop3
	callchannel Branch_fa9aa
	vibrato 20, $33
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	note __, 7
	dutycycle 2
	notetype1 9
	note __, 6
	dec_octave
	notetype2 4
	note G_, 7
	inc_octave
	note F_, 6
	dec_octave
	note G_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G_, 7
	inc_octave
	note D_, 6
	dec_octave
	note G_, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	notetype2 4
	note A#, 6
	inc_octave
	note C_, 7
	dec_octave
	note A#, 6
	note G_, 7
	note F_, 6
	note F#, 7
	notetype2 8
	note G_, 6
	notetype2 4
	note C#, 7
	note C_, 6
	dec_octave
	note A#, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 6
	inc_octave
	notetype2 4
	note C_, 7
	dec_octave
	note A#, 6
	note G_, 7
	note F_, 6
	note F#, 7
	note G_, 6
	notetype2 8
	note A#, 7
	inc_octave
	note C_, 6
	note D_, 7
	notetype0 13
	callchannel Branch_fa9aa
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	note __, 7
	dutycycle 2
	notetype1 9
	note __, 6
	dec_octave
	notetype2 4
	note G_, 7
	inc_octave
	note F_, 6
	dec_octave
	note G_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G_, 7
	inc_octave
	note D_, 6
	dec_octave
	note G_, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	notetype2 4
	note A#, 6
	inc_octave
	note C_, 7
	dec_octave
	note A#, 6
	note G_, 7
	note F_, 6
	note F#, 7
	note G_, 6
	notetype2 8
	note A#, 7
	inc_octave
	notetype2 4
	note C_, 6
	dec_octave
	note A#, 7
	inc_octave
	notetype2 8
	note C#, 4
	note C_, 4
	dec_octave
	note A#, 5
	notetype2 4
	note G_, 6
	note F_, 7
	note G_, 6
	note C#, 7
	note C_, 6
	dec_octave
	note A#, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	notetype2 4
	note A#, 6
	note G_, 7
	notetype2 8
	callchannel Branch_fa9cb
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	note __, 7
	dutycycle 2
	notetype1 9
	note __, 13
	notetype2 4
	note F_, 6
	note __, 7
	notetype2 8
	note E_, 4
	note F_, 4
	note E_, 5
	notetype2 4
	note D_, 6
	note __, 7
	notetype2 8
	note E_, 6
	notetype2 4
	note C_, 7
	dec_octave
	note G_, 6
	inc_octave
	note C_, 7
	note C#, 6
	note D_, 7
	dec_octave
	notetype2 8
	note A#, 6
	notetype2 4
	note G_, 7
	note __, 6
	note F_, 7
	notetype2 8
	note F#, 6
	notetype2 4
	note G_, 7
	notetype2 8
	note A#, 6
	notetype2 4
	note G_, 7
	note A#, 6
	inc_octave
	note C_, 7
	notetype2 8
	note C#, 6
	notetype2 4
	note D_, 7
	note F_, 6
	note D_, 7
	notetype2 8
	note F_, 6
	dec_octave
	notetype2 4
	note G_, 7
	dec_octave
	note G_, 6
	inc_octave
	note D_, 7
	dutycycle 1
	notetype1 10
	notetype2 8
	callchannel Branch_fa9cb
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	note __, 7
	note __, 13
	dec_octave
	note G_, 3
	note G#, 10
	note G_, 3
	note __, 10
	notetype0 13
	note F_, 4
	vibrato 12, $33
	notetype0 1
	notetype1 9
	note C_, 6
	note __, 7
	note __, 13
	note F_, 6
	note __, 7
	note __, 13
	note A_, 6
	note __, 7
	note __, 13
	notetype0 13
	notetype1 9
	note G_, 2
	note __, 1
	vibrato 20, $33
	notetype0 1
	notetype1 10
	note F#, 3
	note G_, 10
	note A#, 3
	note __, 10
	note G_, 3
	note __, 10
	inc_octave
	note D_, 13
	note __, 13
	dec_octave
	note A#, 6
	note __, 7
	note __, 13
	note A#, 3
	inc_octave
	note C_, 10
	note __, 13
	dec_octave
	note A#, 3
	note __, 10
	inc_octave
	note C_, 13
	dec_octave
	note A#, 3
	note __, 10
	inc_octave
	note C#, 4
	note C_, 4
	dec_octave
	note A#, 5
	note G_, 3
	note __, 10
	note B_, 3
	inc_octave
	note C_, 10
	dec_octave
	note A#, 3
	note __, 10
	note __, 13
	inc_octave
	note G_, 3
	note __, 10
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 3
	note __, 10
	inc_octave
	note C_, 13
	dec_octave
	note A#, 3
	note __, 10
	note G_, 3
	note __, 10
	inc_octave
	note E_, 3
	note F_, 10
	note __, 13
	note D#, 13
	note __, 13
	note D_, 6
	note __, 7
	note __, 13
	note C_, 6
	note __, 7
	note __, 13
	note C#, 3
	note __, 10
	note C#, 3
	note D_, 10
	dec_octave
	note A#, 3
	note __, 10
	note G_, 3
	note __, 10
	notetype0 13
	note A#, 3
	note __, 4
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 16
	note __, 7
	note E_, 3
	note F_, 10
	note __, 6
	note D_, 7
	note __, 13
	note C_, 6
	note __, 7
	note C#, 3
	note D_, 10
	notetype0 13
	note D_, 5
	note __, 1
	dec_octave
	note D_, 8
	note __, 1
	dutycycle 0
	vibrato 12, $33
	loopchannel 0, .MainLoop

Branch_fa9aa:
	octave 4
	dutycycle 1
	notetype1 10
	note __, 2
	notetype0 1
	note G#, 3
	note A_, 3
	note __, 7
	note __, 13
	note F_, 13
	note D_, 3
	note __, 10
	note __, 13
	note E_, 6
	note __, 7
	notetype0 13
	note __, 1
	note F_, 1
	notetype0 1
	note G_, 3
	note __, 10
	note E_, 6
	note __, 7
	note __, 13
	note C_, 6
	note __, 7
	note __, 13
	endchannel

Branch_fa9cb:
	octave 4
	dutycycle 1
	notetype1 10
	notetype0 1
	note D#, 3
	note E_, 10
	note F_, 3
	note __, 10
	note G_, 3
	note __, 10
	note E_, 6
	note __, 7
	note __, 13
	note C_, 6
	note __, 7
	note __, 13
	note D_, 6
	note __, 7
	note __, 13
	note D#, 3
	note E_, 10
	note F_, 3
	note __, 10
	note G_, 3
	note __, 10
	note E_, 13
	note C_, 6
	note __, 7
	note __, 13
	endchannel

Branch_fa9ec:
	octave 3
	dutycycle 0
	notetype1 9
	notetype0 1
	note F_, 6
	note __, 7
	notetype0 13
	note __, 2
	notetype0 1
	note F_, 6
	note __, 7
	notetype0 13
	note __, 3
	notetype0 1
	note F_, 6
	note __, 7
	note __, 13
	note A_, 6
	note __, 7
	note __, 13
	notetype0 13
	notetype1 9
	note G_, 2
	note __, 1
	endchannel


Music_TCGRonald_Ch2: 
	vibrato 12, $33
	notetype2 8
	dutycycle 0
.MainLoop
	octave 2
.Loop1
	notetype0 1
	notetype1 9
	note G_, 3
	note __, 3
	note G_, 3
	note __, 4
	note A#, 3
	note __, 10
	inc_octave
	note D_, 6
	dec_octave
	note G_, 3
	note __, 4
	note A#, 3
	note __, 3
	note __, 13
	note G_, 3
	note D_, 4
	note A#, 6
	note __, 7
	note D_, 3
	note __, 3
	note G_, 3
	note __, 4
	note G_, 6
	note __, 7
	note __, 13
	note A#, 6
	note __, 13
	note G_, 3
	note A#, 4
	inc_octave
	note D_, 6
	note __, 7
	note __, 13
	notetype0 13
	notetype1 9
	note C_, 2
	note __, 1
	dec_octave
	notetype0 1
	notetype1 9
	note D_, 3
	note __, 3
	note G_, 3
	note __, 4
	note A#, 3
	note __, 10
	inc_octave
	note D_, 6
	dec_octave
	note G_, 3
	note __, 4
	note A#, 3
	note __, 3
	note __, 13
	note G_, 3
	note A#, 4
	inc_octave
	note D_, 6
	note __, 7
	dec_octave
	note D_, 3
	note __, 3
	note G_, 3
	note __, 4
	note G_, 6
	note __, 7
	note __, 13
	inc_octave
	note D_, 6
	note __, 13
	dec_octave
	note A#, 3
	inc_octave
	note D_, 4
	note F_, 6
	note __, 7
	note __, 13
	notetype0 13
	notetype1 9
	note E_, 2
	note __, 1
	dec_octave
	loopchannel 2, .Loop1
.Loop2
	callchannel Branch_fab76
	notetype2 8
	notetype1 8
	note C_, 2
	note __, 1
	callchannel Branch_fab76
	notetype2 8
	notetype1 8
	note E_, 2
	note __, 1
	loopchannel 4, .Loop2
.Loop3
	vibrato 20, $33
	notetype1 8
	notetype0 13
	dutycycle 1
	octave 4
	note __, 2
	notetype2 4
	note F_, 1
	note __, 1
	notetype2 8
	note D_, 1
	dec_octave
	dec_octave
	notetype2 4
	dutycycle 0
	notetype1 9
	note A#, 1
	note __, 1
	inc_octave
	inc_octave
	dutycycle 1
	notetype1 8
	note C_, 1
	note __, 1
	notetype2 8
	note D_, 1
	notetype2 3
	note E_, 1
	notetype2 4
	note C_, 1
	note __, 1
	dec_octave
	note A_, 1
	note __, 1
	note A#, 1
	note __, 2
	vibrato 12, $33
	dutycycle 0
	notetype1 9
	note F_, 1
	note __, 2
	note F_, 1
	note __, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype2 8
	notetype1 9
	note G_, 2
	note __, 1
	loopchannel 2, .Loop3
	vibrato 20, $33
	callchannel Branch_fab8a
	octave 3
	note __, 2
	vibrato 12, $33
	dutycycle 0
	notetype1 9
	notetype2 4
	note F_, 1
	note __, 2
	note F_, 1
	note __, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype2 8
	notetype1 9
	note G_, 2
	note __, 1
	vibrato 20, $33
	callchannel Branch_fab8a
	octave 3
	note __, 1
	notetype0 1
	notetype2 8
	note E_, 3
	note F_, 10
	note E_, 3
	note __, 10
	notetype0 13
	note D_, 4
	dec_octave
	vibrato 12, $33
	dutycycle 0
	notetype1 9
	notetype2 4
	note G_, 1
	note __, 1
	inc_octave
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype2 8
	notetype1 9
	note E_, 2
	note __, 1
	callchannel Branch_fabb1
	note __, 1
	notetype2 4
	octave 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	inc_octave
	notetype2 8
	notetype1 9
	note C_, 2
	note __, 1
	notetype1 9
	note __, 2
	notetype2 4
	note F_, 1
	note __, 2
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype2 8
	notetype1 9
	note F_, 2
	note __, 1
	callchannel Branch_fabb1
	note __, 1
	octave 2
	notetype2 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	inc_octave
	notetype2 8
	notetype1 9
	note C_, 2
	note __, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 4
	note G_, 1
	note __, 2
	note G_, 1
	note __, 1
	vibrato 20, $33
	notetype2 8
	dutycycle 1
	notetype1 7
	note F#, 8
	note __, 1
	dutycycle 0
	vibrato 12, $33
	loopchannel 0, .MainLoop

Branch_fab76:
	octave 2
	notetype1 9
	notetype0 13
	note __, 2
	notetype2 4
	note A#, 1
	note __, 2
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	inc_octave
	note D_, 1
	note __, 1
	endchannel

Branch_fab8a:
	octave 4
	dutycycle 1
	notetype1 8
	notetype0 13
	note C_, 1
	notetype2 3
	note D_, 1
	note E_, 1
	notetype2 4
	note C_, 1
	note __, 1
	dec_octave
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	inc_octave
	notetype2 8
	note C_, 1
	notetype2 3
	note D_, 1
	note E_, 1
	notetype2 8
	note C_, 1
	dec_octave
	notetype2 4
	note A_, 1
	note __, 1
	note A#, 1
	endchannel

Branch_fabb1:
	octave 2
	notetype1 9
	notetype0 13
	note __, 2
	notetype2 4
	note A#, 1
	note __, 2
	note A#, 1
	note __, 1
	inc_octave
	note C_, 1
	endchannel


Music_TCGRonald_Ch3: 
	notetype0 1
	notetype1 1
	notetype2 11
.MainLoop
	octave 2
.Loop1
	note G_, 13
	note G_, 2
	note __, 4
	note G_, 5
	note __, 2
	inc_octave
	note A#, 6
	dec_octave
	note F_, 2
	note __, 5
	note F_, 6
	note F#, 3
	note __, 4
	note G_, 2
	note __, 4
	note G_, 3
	note __, 10
	note F_, 7
	note G_, 6
	note __, 7
	inc_octave
	note C_, 13
	note __, 6
	inc_octave
	note C_, 2
	note __, 11
	dec_octave
	note C_, 2
	note __, 5
	dec_octave
	note E_, 13
	note __, 6
	note F_, 7
	note __, 6
	note F_, 7
	note F#, 13
	note G_, 13
	inc_octave
	note C_, 6
	note __, 7
	dec_octave
	loopchannel 4, .Loop1
.Loop2
	callchannel Branch_fac94
	octave 3
	note A#, 6
	callchannel Branch_facbb
	callchannel Branch_fac94
	octave 4
	note F_, 6
	callchannel Branch_facbb
	loopchannel 8, .Loop2
	callchannel Branch_facc5
	octave 2
	note D_, 13
	note __, 6
	inc_octave
	note D_, 2
	note __, 5
	inc_octave
	note D_, 6
	octave 2
	note D_, 2
	note __, 5
	note D_, 13
	octave 4
	note D_, 6
	octave 2
	note A_, 7
	note __, 6
	inc_octave
	note C_, 7
	note C_, 13
	note C#, 13
	note D_, 6
	note __, 7
	dec_octave
	note C_, 13
	note C_, 2
	note __, 4
	note C_, 5
	note __, 2
	octave 4
	note D_, 6
	octave 2
	note G_, 2
	note __, 5
	note G_, 6
	inc_octave
	note C_, 3
	note __, 4
	dec_octave
	note C_, 2
	note __, 4
	note C_, 3
	note __, 4
	octave 4
	note D_, 6
	octave 2
	note G_, 7
	note C_, 6
	note __, 7
	note D_, 13
	note __, 6
	inc_octave
	note D_, 2
	note __, 5
	inc_octave
	note D_, 6
	octave 2
	note D_, 2
	note __, 5
	note D_, 13
	octave 4
	note F_, 6
	octave 2
	note A_, 7
	note __, 6
	inc_octave
	note D_, 7
	note D_, 13
	dec_octave
	note A_, 13
	note D_, 6
	note __, 7
	callchannel Branch_facc5
	octave 2
	note G#, 13
	note __, 6
	inc_octave
	note G#, 2
	note __, 5
	inc_octave
	note D_, 6
	octave 2
	note G#, 2
	note __, 5
	note G#, 13
	octave 4
	note D_, 6
	dec_octave
	note D#, 7
	note __, 6
	note G#, 7
	note G#, 13
	dec_octave
	note G#, 13
	inc_octave
	note D#, 6
	note __, 7
	dec_octave
	note A_, 13
	note A_, 2
	note __, 4
	note A_, 5
	note __, 2
	octave 4
	note D_, 6
	dec_octave
	note E_, 2
	note __, 5
	note E_, 6
	note E_, 3
	note __, 4
	dec_octave
	note A_, 2
	note __, 4
	note A_, 3
	note __, 4
	octave 4
	note D_, 6
	dec_octave
	note E_, 7
	dec_octave
	note A_, 6
	note __, 7
	notetype0 13
	note G#, 8
	note __, 1
	notetype0 1
	loopchannel 0, .MainLoop

Branch_fac94:
	octave 2
	note G_, 13
	note G_, 2
	note __, 4
	note G_, 5
	note __, 2
	octave 4
	note D_, 6
	dec_octave
	note D_, 2
	note __, 5
	note D_, 6
	note G_, 3
	note __, 4
	dec_octave
	note G_, 2
	note __, 4
	note G_, 3
	note __, 4
	octave 4
	note D_, 6
	octave 2
	note F_, 7
	note G_, 6
	note __, 7
	inc_octave
	note C_, 13
	note __, 6
	inc_octave
	note C_, 2
	note __, 5
	note D_, 6
	dec_octave
	note C_, 2
	note __, 5
	dec_octave
	note E_, 13
	inc_octave
	endchannel

Branch_facbb:
	octave 2
	note F_, 7
	note __, 6
	note F_, 7
	note F#, 13
	note G_, 13
	inc_octave
	note C_, 6
	note __, 7
	endchannel

Branch_facc5:
	octave 2
	note D#, 13
	note D#, 2
	note __, 4
	note D#, 5
	note __, 2
	octave 4
	note D_, 6
	octave 2
	note A#, 2
	note __, 5
	note A#, 6
	inc_octave
	note D#, 3
	note __, 4
	dec_octave
	note D#, 2
	note __, 4
	note D#, 3
	note __, 4
	octave 4
	note D_, 6
	octave 2
	note A#, 7
	note D#, 6
	note __, 7
	endchannel


Music_TCGRonald_Ch4: 
	togglenoise $06
	notetype 1
	octave 1
.MainLoop
.Loop1
	callchannel Branch_fad46
	note D#, 13
	callchannel Branch_fad4f
	note D_, 7
	note C_, 6
	note D_, 7
	note E_, 6
	note C_, 7
	note C#, 13
	note D#, 6
	note D_, 7
	loopchannel 3, .Loop1
	callchannel Branch_fad46
	note D#, 13
	callchannel Branch_fad4f
	note D_, 7
	note C_, 13
	note E_, 6
	note D_, 3
	note D_, 4
.Loop2
	note C#, 6
	note C#, 7
	loopchannel 2, .Loop2
.Loop3
	rept 7
	callchannel Branch_fad46
	note D#, 13
	callchannel Branch_fad4f
	note D_, 7
	note C_, 6
	note D_, 7
	note E_, 6
	note C_, 7
	note C#, 13
	note D#, 6
	note D_, 7
	endr
	callchannel Branch_fad46
	note D#, 13
	callchannel Branch_fad4f
	note D_, 3
	note D_, 4
	rept 4
	note C#, 6
	note C#, 7
	endr
	loopchannel 2, .Loop3
.Loop4
	callchannel Branch_fad46
	note D#, 13
	loopchannel 6, .Loop4
	callchannel Branch_fad46
	notetype 13
	note F_, 4
	notetype 1
	note __, 6
	note D_, 3
	note D_, 4
	note C#, 6
	note C#, 7
.Loop5
	note D_, 6
	note C#, 7
	loopchannel 2, .Loop5
	note C#, 6
	note D_, 7
	loopchannel 0, .MainLoop

Branch_fad46:
	note C_, 13
	note E_, 6
	note C_, 7
	note C#, 13
	note C_, 6
	note D_, 7
	note C_, 13
	note E_, 6
	note C_, 7
	note C#, 13
	endchannel

Branch_fad4f:
	note C_, 13
	note E_, 6
	note C_, 7
	note C#, 13
	note C_, 6
	endchannel

