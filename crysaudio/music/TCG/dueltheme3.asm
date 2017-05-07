Music_TCGDuelTheme3:
	db $C0
	dw Music_TCGDuelTheme3_Ch1
	db $01
	dw Music_TCGDuelTheme3_Ch2
	db $02
	dw Music_TCGDuelTheme3_Ch3
	db $03
	dw Music_TCGDuelTheme3_Ch4

Music_TCGDuelTheme3_Ch1: 
	notetype0 11
	vibrato 20, $33
	notetype2 8
.MainLoop
	octave 2
	dutycycle 0
.Loop1
	rept 4
	notetype1 9
	note F#, 2
	note __, 1
	endr
	notetype1 9
	note E_, 2
	notetype1 9
	note F_, 2
	loopchannel 4, .Loop1
.Loop2
	callchannel Branch_f67b2
	loopchannel 4, .Loop2
	dutycycle 1
	notetype1 10
.Loop3
	octave 3
	note C#, 1
	note F#, 1
	notetype0 1
	note G#, 5
	notetype1 3
	note G#, 6
	callchannel Branch_f65a7
	octave 3
	note D_, 1
	note F#, 1
	notetype0 1
	note B_, 5
	notetype1 3
	note B_, 6
	callchannel Branch_f65a7
	loopchannel 2, .Loop3
	dutycycle 0
	notetype1 10
	dec_octave
	note __, 2
	notetype0 1
	note E_, 5
	notetype1 2
	note E_, 6
	callchannel Branch_f65cf
	note F#, 5
	notetype1 2
	note F#, 6
	notetype0 11
	note __, 1
	dec_octave
	dutycycle 0
	notetype1 10
	notetype0 1
	note E_, 5
	notetype1 2
	note E_, 6
	callchannel Branch_f65cf
	notetype0 11
	dutycycle 1
	notetype1 10
.Loop4
	octave 3
	note C#, 1
	note F#, 1
	notetype0 1
	note G#, 5
	notetype1 3
	note G#, 6
	callchannel Branch_f65a7
	octave 3
	note D_, 1
	note F#, 1
	notetype0 1
	note B_, 5
	notetype1 3
	note B_, 6
	notetype1 10
	callchannel Branch_f65a7
	loopchannel 2, .Loop4
	vibrato 10, $33
	dutycycle 0
.Loop5
	octave 2
	note __, 4
	notetype1 9
	note F#, 2
	notetype1 2
	note F#, 2
	note __, 2
	notetype1 9
	note E_, 2
	notetype1 2
	note E_, 4
	notetype1 9
	note D#, 2
	notetype1 2
	note D#, 4
	notetype1 9
	note D_, 2
	note C#, 2
	loopchannel 2, .Loop5
	vibrato 20, $33
	dutycycle 2
	notetype2 6
.Loop6
	callchannel Branch_f661d
	loopchannel 4, .Loop6
	octave 4
	notetype1 7
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 7
	note F#, 5
	notetype1 2
	note F#, 6
.Loop7
	callchannel Branch_f661d
	loopchannel 3, .Loop7
	octave 4
	notetype1 7
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 7
	note F#, 5
	notetype1 2
	note F#, 6
	inc_octave
	notetype1 7
	note C#, 5
	notetype1 2
	note C#, 6
	dec_octave
	notetype1 7
	note F#, 5
	notetype1 2
	note F#, 6
	dec_octave
	notetype0 11
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 2
	note C#, 2
	dec_octave
	note F#, 3
	inc_octave
	notetype0 1
	note D_, 3
	note D#, 2
	note E_, 3
	note F_, 3
	notetype0 11
	note F#, 4
	dec_octave
	note G#, 3
	inc_octave
	notetype0 1
	note E_, 3
	note F_, 2
	note F#, 3
	note G_, 3
	notetype0 11
	note G#, 4
	dutycycle 0
	octave 2
.Loop8
	rept 4
	notetype1 9
	note F#, 1
	notetype1 3
	note F#, 1
	note __, 1
	endr
	notetype1 9
	note F#, 1
	notetype1 3
	note F#, 1
	notetype1 9
	note F#, 1
	notetype1 3
	note F#, 1
	rept 4
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	note __, 1
	endr
	notetype1 9
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	loopchannel 2, .Loop8
	dutycycle 1
	notetype1 10
	octave 3
	note C#, 1
	note F#, 1
	notetype0 1
	note G#, 5
	notetype1 3
	note G#, 6
	callchannel Branch_f65a7
	octave 3
	note C#, 1
	note F#, 1
	notetype0 1
	note G#, 5
	notetype1 3
	note G#, 6
	inc_octave
	notetype1 10
	notetype0 11
	note C#, 9
	notetype1 3
	note C#, 2
	dec_octave
	notetype1 10
	note B_, 1
	inc_octave
	note C#, 1
	note F#, 1
	note C#, 1
	dec_octave
	notetype0 1
	note B_, 5
	notetype1 3
	note B_, 6
	notetype0 11
	notetype1 10
	note F#, 9
	notetype1 3
	note F#, 4
	notetype1 10
	note G#, 1
	note A_, 1
	notetype0 1
	note G#, 5
	notetype1 3
	note G#, 6
	notetype1 10
	notetype0 11
	note B_, 8
	notetype1 3
	note B_, 1
	notetype1 10
	note A_, 2
	note B_, 1
	notetype0 1
	note B_, 5
	notetype1 3
	note B_, 6
	notetype0 11
	inc_octave
	notetype1 10
	note C#, 1
	note D_, 1
	notetype0 1
	note C#, 5
	notetype1 3
	note C#, 6
	notetype1 10
	notetype0 11
	note E_, 10
	notetype1 3
	note E_, 1
	notetype1 10
	note D_, 1
	notetype0 1
	note C#, 8
	notetype1 3
	note C#, 3
	dec_octave
	notetype1 10
	notetype0 11
	note B_, 1
	inc_octave
	note C#, 1
	dec_octave
	notetype0 1
	note B_, 5
	notetype1 3
	note B_, 6
	notetype0 11
	notetype1 10
	note E_, 10
	notetype1 3
	note E_, 3
	notetype1 2
	note A_, 3
	notetype1 6
	note A_, 5
	inc_octave
	notetype1 4
	note E_, 3
	notetype1 8
	note E_, 3
	notetype1 10
	note E_, 2
	dutycycle 1
.Loop9
	rept 4
	notetype1 9
	note G#, 1
	notetype1 3
	note G#, 1
	note __, 1
	endr
	notetype1 9
	note G#, 1
	notetype1 3
	note G#, 1
	notetype1 9
	note G#, 1
	notetype1 3
	note G#, 1
	rept 4
	notetype1 9
	note A_, 1
	notetype1 3
	note A_, 1
	note __, 1
	endr
	notetype1 9
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 9
	note A_, 1
	notetype1 3
	note A_, 1
	loopchannel 4, .Loop9
	loopchannel 0, .MainLoop

Branch_f65a7:
	notetype0 11
	octave 4
	notetype1 10
	note C#, 5
	note C#, 4
	notetype1 3
	note C#, 2
	dec_octave
	notetype1 10
	note B_, 1
	inc_octave
	note C#, 1
	note F#, 1
	note C#, 1
	dec_octave
	notetype0 1
	note B_, 5
	notetype1 3
	note B_, 6
	notetype0 11
	notetype1 10
	inc_octave
	note C#, 5
	note C#, 4
	notetype1 3
	note C#, 4
	notetype1 10
	endchannel

Branch_f65cf:
	octave 3
.Loop10
	notetype0 11
	note __, 2
	notetype0 1
	notetype1 10
	note E_, 5
	notetype1 2
	note E_, 6
	loopchannel 3, .Loop10
	dutycycle 2
	notetype1 8
	note D_, 5
	note G_, 6
	note B_, 5
	inc_octave
	note D_, 6
	dec_octave
	note G_, 5
	note B_, 6
	inc_octave
	note D_, 5
	note G_, 6
	note F#, 5
	notetype1 2
	note F#, 6
	dutycycle 0
	notetype1 10
	notetype0 11
	note __, 1
	dec_octave
	notetype0 1
	note E_, 5
	notetype1 2
	note E_, 6
.Loop11
	notetype0 11
	note __, 2
	notetype0 1
	notetype1 10
	note E_, 5
	notetype1 2
	note E_, 6
	loopchannel 3, .Loop11
	dec_octave
	dutycycle 2
	notetype1 8
	note B_, 5
	inc_octave
	note E_, 6
	note G_, 5
	note B_, 6
	note E_, 5
	note G_, 6
	note B_, 5
	inc_octave
	note E_, 6
	endchannel

Branch_f661d:
	octave 4
	notetype0 1
	notetype1 7
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 7
	note F#, 5
	notetype1 2
	note F#, 6
	inc_octave
	notetype1 7
	note C#, 5
	notetype1 2
	note C#, 6
	dec_octave
	notetype1 7
	note F#, 5
	notetype1 2
	note F#, 6
	inc_octave
	notetype1 7
	note C#, 5
	notetype1 2
	note C#, 6
	dec_octave
	notetype1 7
	note F#, 5
	notetype1 2
	note F#, 6
	endchannel


Music_TCGDuelTheme3_Ch2: 
	notetype0 11
	vibrato 20, $33
	notetype2 8
.MainLoop
	octave 2
	dutycycle 0
.Loop1
	rept 4
	notetype1 8
	note F#, 2
	note __, 1
	endr
	notetype1 8
	note E_, 2
	notetype1 8
	note F_, 2
	loopchannel 4, .Loop1
	octave 3
.Loop2
	note __, 6
	notetype1 10
	note E_, 1
	notetype1 2
	note E_, 1
	note __, 8
	loopchannel 4, .Loop2
.Loop3
	rept 2
	callchannel Branch_f67b2
	endr
	rept 2
	callchannel Branch_f680a
	endr
	loopchannel 2, .Loop3
	octave 2
	notetype1 10
	notetype0 11
	note __, 1
	notetype0 1
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 10
	note A_, 5
	notetype1 2
	note A_, 6
	callchannel Branch_f6866
	octave 4
	note C#, 5
	notetype1 2
	note C#, 6
	dec_octave
	dec_octave
	dutycycle 0
	notetype1 10
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 10
	note A_, 5
	notetype1 2
	note A_, 6
	callchannel Branch_f6866
	dutycycle 0
	notetype1 9
.Loop4
	rept 2
	callchannel Branch_f67b2
	endr
	rept 2
	callchannel Branch_f680a
	endr
	loopchannel 2, .Loop4
	vibrato 10, $33
.Loop5
	notetype1 10
	notetype2 6
	note F#, 1
	note F#, 1
	notetype2 8
	notetype0 1
	note F#, 5
	notetype1 2
	note F#, 6
	notetype1 10
	notetype2 6
	notetype0 11
	note F#, 1
	inc_octave
	notetype1 9
	notetype2 8
	note C#, 2
	dec_octave
	notetype1 10
	notetype2 6
	note F#, 1
	note F#, 1
	notetype0 1
	notetype2 8
	note F#, 5
	notetype1 2
	note F#, 6
	notetype1 10
	notetype2 6
	notetype0 11
	note F#, 1
	notetype1 9
	notetype2 8
	note B_, 2
	notetype1 10
	notetype2 6
	note F#, 1
	note F#, 1
	notetype2 8
	notetype0 1
	note F#, 5
	notetype1 2
	note F#, 6
	notetype1 10
	notetype2 6
	notetype0 11
	note F#, 1
	notetype1 9
	notetype2 8
	note B_, 2
	notetype1 10
	notetype2 6
	note F#, 1
	note F#, 1
	notetype0 1
	notetype2 8
	note F#, 5
	notetype1 2
	note F#, 6
	notetype1 10
	notetype2 6
	notetype0 11
	note F#, 1
	notetype2 8
	notetype1 9
	note A_, 2
	note G#, 2
	loopchannel 4, .Loop5
	vibrato 20, $33
	note D_, 3
	notetype0 1
	note A#, 3
	note B_, 2
	inc_octave
	note C_, 3
	note C#, 3
	notetype0 11
	note D_, 4
	dec_octave
	note E_, 3
	inc_octave
	notetype0 1
	note C_, 3
	note C#, 2
	note D_, 3
	note D#, 3
	notetype0 11
	note E_, 4
	octave 3
.Loop6
	rept 4
	notetype1 9
	note C#, 1
	notetype1 3
	note C#, 1
	note __, 1
	endr
	notetype1 9
	note C#, 1
	notetype1 3
	note C#, 1
	notetype1 9
	note C#, 1
	notetype1 3
	note C#, 1
	rept 4
	notetype1 9
	note D_, 1
	notetype1 3
	note D_, 1
	note __, 1
	endr
	notetype1 9
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 9
	note D_, 1
	notetype1 3
	note D_, 1
	loopchannel 6, .Loop6
	dutycycle 1
	inc_octave
.Loop7
	rept 4
	notetype1 8
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	endr
	notetype1 8
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 8
	note E_, 1
	notetype1 3
	note E_, 1
	rept 4
	notetype1 8
	note D_, 1
	notetype1 3
	note D_, 1
	note __, 1
	endr
	notetype1 8
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 8
	note D_, 1
	notetype1 3
	note D_, 1
	loopchannel 4, .Loop7
	loopchannel 0, .MainLoop

Branch_f67b2:
	octave 2
	notetype1 10
	notetype0 11
	note __, 1
	notetype0 1
	note F#, 5
	notetype1 2
	note F#, 6
	notetype1 10
	note A_, 5
	notetype1 2
	note A_, 6
	notetype1 10
	note F#, 5
	notetype1 2
	note F#, 6
	notetype1 10
	notetype0 11
	note __, 1
	notetype0 1
	note F#, 5
	notetype1 3
	note F#, 6
	inc_octave
	notetype1 10
	notetype0 11
	note C_, 1
	dec_octave
	notetype0 1
	note B_, 5
	notetype1 2
	note B_, 6
	notetype0 11
	note __, 1
	notetype0 1
	notetype1 10
	note A_, 5
	notetype1 2
	note A_, 6
	notetype0 11
	note __, 1
	notetype0 1
	notetype1 10
	note B_, 5
	notetype1 2
	note B_, 6
	notetype1 10
	note A_, 4
	note B_, 4
	note A_, 3
	note F#, 5
	notetype1 2
	note F#, 6
	notetype0 11
	notetype1 9
	note E_, 1
	notetype1 10
	note F_, 1
	endchannel

Branch_f680a:
	octave 2
	notetype1 10
	notetype0 11
	note __, 1
	notetype0 1
	note G_, 5
	notetype1 2
	note G_, 6
	notetype1 10
	note B_, 5
	notetype1 2
	note B_, 6
	notetype1 10
	note G_, 5
	notetype1 2
	note G_, 6
	notetype0 11
	note __, 1
	notetype0 1
	notetype1 10
	note G_, 5
	notetype1 2
	note G_, 6
	inc_octave
	notetype1 10
	notetype0 11
	note C#, 1
	notetype0 1
	note C_, 5
	notetype1 2
	note C_, 6
	notetype1 10
	notetype0 11
	note __, 1
	dec_octave
	notetype0 1
	note B_, 5
	notetype1 2
	note B_, 6
	notetype0 11
	note __, 1
	inc_octave
	notetype0 1
	notetype1 10
	note C#, 5
	notetype1 2
	note C#, 6
	dec_octave
	notetype1 10
	note B_, 4
	inc_octave
	note C#, 4
	dec_octave
	note B_, 3
	note G_, 5
	notetype1 2
	note G_, 6
	notetype0 11
	notetype1 9
	note B_, 1
	notetype1 10
	note G_, 1
	endchannel

Branch_f6866:
	octave 2
.Loop8
	notetype0 11
	note __, 1
	notetype0 1
	notetype1 10
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 10
	note A_, 5
	notetype1 2
	note A_, 6
	loopchannel 3, .Loop8
	dutycycle 2
	notetype1 7
	note B_, 5
	inc_octave
	note D_, 6
	note G_, 5
	note B_, 6
	note D_, 5
	note G_, 6
	note B_, 5
	inc_octave
	note D_, 6
	note C#, 5
	notetype1 2
	note C#, 6
	dec_octave
	dec_octave
	dutycycle 0
	notetype1 10
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 10
	note A_, 5
	notetype1 2
	note A_, 6
.Loop9
	notetype0 11
	note __, 1
	notetype0 1
	notetype1 10
	note C#, 5
	notetype1 2
	note C#, 6
	notetype1 10
	note A_, 5
	notetype1 2
	note A_, 6
	loopchannel 3, .Loop9
	dutycycle 2
	notetype1 7
	note G_, 5
	note B_, 6
	inc_octave
	note E_, 5
	note G_, 6
	dec_octave
	note B_, 5
	inc_octave
	note E_, 6
	note G_, 5
	note B_, 6
	inc_octave
	endchannel


Music_TCGDuelTheme3_Ch3: 
	notetype0 11
	notetype1 1
	notetype2 11
	vibrato 0, $33
.MainLoop
	octave 2
.Loop1
	rept 4
	note F#, 2
	note __, 1
	endr
	note E_, 2
	note F_, 2
	loopchannel 4, .Loop1
.Loop2
	callchannel Branch_f6973
	loopchannel 4, .Loop2
.Loop3
	callchannel Branch_f6973
	callchannel Branch_f6992
	loopchannel 2, .Loop3
	octave 2
.Loop4
	rept 4
	note F#, 1
	note __, 2
	endr
	note G_, 2
	note G_, 2
	rept 4
	note F#, 1
	note __, 2
	endr
	note E_, 2
	note F_, 2
	loopchannel 2, .Loop4
.Loop5
	callchannel Branch_f6973
	callchannel Branch_f6992
	loopchannel 2, .Loop5
	vibrato 10, $33
	octave 2
.Loop6
	callchannel Branch_f69f0
	notetype0 11
	octave 4
	note D_, 2
	note C#, 2
	dec_octave
	dec_octave
	loopchannel 3, .Loop6
	callchannel Branch_f69f0
	octave 2
	note F#, 2
	note E_, 2
	vibrato 0, $33
	note D_, 3
	notetype0 1
	note A#, 3
	note B_, 2
	inc_octave
	note C_, 3
	note C#, 3
	notetype0 11
	note D_, 4
	dec_octave
	note E_, 3
	inc_octave
	notetype0 1
	note C_, 3
	note C#, 2
	note D_, 3
	note D#, 3
	notetype0 11
	note E_, 4
	dec_octave
.Loop7
	rept 4
	note F#, 1
	note __, 2
	endr
	note F#, 2
	note F_, 2
	rept 4
	note E_, 1
	note __, 2
	endr
	note E_, 2
	note F_, 2
	loopchannel 6, .Loop7
.Loop8
	inc_octave
	rept 4
	note F#, 1
	dec_octave
	note F#, 1
	note F#, 1
	inc_octave
	endr
	note F#, 1
	dec_octave
	note F#, 1
	inc_octave
	note F#, 1
	dec_octave
	note F#, 1
	inc_octave
	rept 4
	note E_, 1
	dec_octave
	note E_, 1
	note E_, 1
	inc_octave
	endr
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	loopchannel 4, .Loop8
	loopchannel 0, .MainLoop

Branch_f6973:
	octave 2
	note F#, 1
	note __, 1
	inc_octave
	inc_octave
	note E_, 1
	dec_octave
	dec_octave
	note F#, 1
	note __, 2
	note F#, 1
	note __, 1
	note __, 1
	note F#, 1
	note __, 1
	inc_octave
	inc_octave
	note E_, 1
	dec_octave
	dec_octave
	note E_, 2
	note F_, 2
	endchannel

Branch_f6992:
	octave 2
	note F#, 1
	note __, 1
	inc_octave
	inc_octave
	note E_, 1
	dec_octave
	dec_octave
	note F#, 1
	note __, 2
	note F#, 1
	note __, 1
	note __, 1
	note F#, 1
	note __, 1
	inc_octave
	inc_octave
	note E_, 1
	dec_octave
	dec_octave
	note F#, 1
	note __, 1
	note F#, 2
	note G_, 1
	note __, 1
	inc_octave
	inc_octave
	note F#, 1
	dec_octave
	dec_octave
	note G_, 1
	note __, 2
	note G_, 1
	note __, 1
	note __, 1
	note G_, 1
	note __, 1
	inc_octave
	inc_octave
	note F#, 1
	dec_octave
	dec_octave
	note F_, 2
	note F#, 2
	note G_, 1
	note __, 1
	inc_octave
	inc_octave
	note F#, 1
	dec_octave
	dec_octave
	note G_, 1
	note __, 2
	note G_, 1
	note __, 1
	note __, 1
	note G_, 1
	note __, 1
	inc_octave
	inc_octave
	note F#, 1
	dec_octave
	dec_octave
	note G_, 1
	note __, 1
	note F_, 2
	endchannel

Branch_f69f0:
	octave 2
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	note C#, 1
	dec_octave
	dec_octave
	note F#, 1
	inc_octave
	inc_octave
	note F#, 2
	dec_octave
	dec_octave
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	note C#, 1
	dec_octave
	dec_octave
	note F#, 1
	inc_octave
	inc_octave
	note E_, 2
	dec_octave
	dec_octave
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	note C#, 1
	dec_octave
	dec_octave
	note F#, 1
	inc_octave
	inc_octave
	note D#, 2
	dec_octave
	dec_octave
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	note C#, 1
	dec_octave
	dec_octave
	note F#, 1
	endchannel


Music_TCGDuelTheme3_Ch4: 
	togglenoise $06
	notetype 11
.MainLoop
.Loop1
	rept 4
	note E_, 1
	note D#, 1
	note D#, 1
	endr
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	loopchannel 2, .Loop1
.Loop2
	note C#, 1
	note C_, 1
	note C_, 1
	loopchannel 4, .Loop2
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
.Loop3
	note C#, 1
	note C_, 1
	note C_, 1
	loopchannel 4, .Loop3
	note C#, 1
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 1
	note C#, 1
.Loop4
	callchannel Branch_f6b40
	loopchannel 3, .Loop4
	note C_, 2
	note D#, 1
	note C_, 1
	note C#, 2
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note E_, 2
	note C#, 1
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 1
	note C#, 1
.Loop5
	callchannel Branch_f6b40
	loopchannel 7, .Loop5
	note C_, 2
	note D#, 1
	note C_, 1
	note C#, 2
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note E_, 2
	note C#, 1
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 1
	note C#, 1
	callchannel Branch_f6b7e
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 1
	note C_, 1
	callchannel Branch_f6b7e
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 2
.Loop6
	callchannel Branch_f6b40
	loopchannel 7, .Loop6
	note C_, 2
	note D#, 1
	note C_, 1
	note C#, 2
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note E_, 2
	note C#, 1
	notetype 1
	note D#, 5
	note D_, 6
	note C#, 5
	note C#, 6
	note C#, 5
	note C#, 6
	notetype 11
	callchannel Branch_f6b4d
	note D#, 1
	note C#, 1
	note C_, 1
	callchannel Branch_f6b4d
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 1
	note C_, 1
	callchannel Branch_f6b4d
	note D#, 1
	note C#, 1
	note C_, 1
	callchannel Branch_f6b4d
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 2
	note F_, 8
	note __, 4
	notetype 1
	note D_, 3
	note D_, 2
	note C#, 6
	note C#, 5
	note C#, 6
	note C#, 5
	note C#, 6
	notetype 11
	note C#, 1
.Loop7
	callchannel Branch_f6b65
	notetype 1
	note C_, 6
	loopchannel 7, .Loop7
	callchannel Branch_f6b65
	notetype 1
	note C#, 6
.Loop8
	callchannel Branch_f6b65
	notetype 1
	note C_, 6
	loopchannel 15, .Loop8
	notetype 11
	note C_, 1
	notetype 1
	note D#, 5
	note C_, 6
	notetype 11
	note C#, 1
	notetype 1
	note D#, 5
	note E_, 6
	note D#, 5
	note D_, 6
	note D#, 5
	note C_, 6
	note C#, 5
	note C#, 6
	note C#, 5
	note C#, 6
	callchannel Branch_f6b9a
	note C_, 1
	notetype 1
	note D#, 5
	note D_, 6
	note C#, 5
	note C#, 6
	note C#, 5
	note C#, 6
	callchannel Branch_f6b9a
	notetype 1
	note C_, 5
	note D_, 6
	note C#, 5
	note C#, 6
	note C#, 5
	note C#, 6
	note C#, 5
	note C#, 6
	notetype 11
	loopchannel 0, .MainLoop

Branch_f6b40:
	note C_, 2
	note D#, 1
	note C_, 1
	note C#, 2
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note E_, 2
	note C#, 2
	note D#, 1
	note C#, 1
	endchannel

Branch_f6b4d:
	note C_, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note C#, 1
	note E_, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note C#, 1
	note E_, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note C#, 1
	note E_, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note C#, 1
	endchannel

Branch_f6b65:
	notetype 11
	note C_, 1
	notetype 1
	note D#, 5
	note C_, 6
	notetype 11
	note C#, 1
	notetype 1
	note D#, 5
	note E_, 6
	note D#, 5
	note D_, 6
	note D#, 5
	note C_, 6
	notetype 11
	note C#, 1
	notetype 1
	note D#, 5
	endchannel

Branch_f6b7e:
	note C_, 2
	note D#, 1
	note C#, 1
	note D#, 1
	note E_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note E_, 1
	note C_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	note C_, 2
	note D#, 1
	note C#, 1
	note D#, 1
	note E_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note E_, 1
	note C_, 1
	note C#, 1
	note C#, 1
	endchannel

Branch_f6b9a:
	notetype 11
.Loop9
	rept 5
	note C_, 1
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 1
	endr
	note C_, 1
	loopchannel 3, .Loop9
.Loop10
	note C_, 1
	notetype 1
	note D#, 5
	note D_, 6
	notetype 11
	note C#, 1
	loopchannel 4, .Loop10
	endchannel

