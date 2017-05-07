Music_TCGDuelTheme2:
	db $C0
	dw Music_TCGDuelTheme2_Ch1
	db $01
	dw Music_TCGDuelTheme2_Ch2
	db $02
	dw Music_TCGDuelTheme2_Ch3
	db $03
	dw Music_TCGDuelTheme2_Ch4

Music_TCGDuelTheme2_Ch1: 
	notetype0 9
	vibrato 20, $33
	notetype2 8
	octave 1
	dutycycle 1
	notetype1 9
.Loop1
	note D_, 2
	note D_, 1
	loopchannel 8, .Loop1
.MainLoop
	octave 1
.Loop2
	note D_, 2
	note D_, 1
	loopchannel 23, .Loop2
	dutycycle 1
	notetype1 10
	inc_octave
	inc_octave
	notetype0 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	notetype0 9
	callchannel Branch_f5f3d
	note C_, 6
	notetype0 1
	note C_, 12
	notetype1 3
	note C_, 6
	notetype1 10
	dec_octave
	note B_, 12
	notetype1 3
	note B_, 6
	notetype1 10
	note G_, 12
	notetype1 3
	note G_, 6
	notetype0 9
	notetype1 10
	notetype2 8
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	notetype2 6
	note D_, 1
	notetype2 8
	note D_, 9
	note D_, 9
	notetype1 4
	note D_, 3
	dutycycle 2
	notetype2 8
	notetype1 3
	note E_, 4
	notetype1 6
	note E_, 7
	notetype1 2
	note E_, 1
	notetype1 6
	note G_, 4
	notetype1 8
	notetype0 1
	note G_, 12
	notetype1 2
	note G_, 6
	inc_octave
	notetype0 9
	notetype1 8
	notetype2 8
	note C_, 3
	dutycycle 1
	notetype1 10
	dec_octave
	notetype0 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	notetype0 9
	callchannel Branch_f5f3d
	notetype2 8
	note C_, 4
	notetype0 1
	note C_, 4
	note E_, 5
	note F_, 4
	note F#, 5
	note G_, 12
	notetype1 3
	note G_, 6
	notetype1 10
	note E_, 12
	notetype1 3
	note E_, 6
	notetype0 9
	notetype1 10
	notetype2 8
	note C_, 1
	notetype1 3
	note C_, 1
	notetype1 10
	note D_, 1
	notetype1 3
	note D_, 1
	dec_octave
	notetype1 10
	notetype2 6
	note A_, 1
	inc_octave
	notetype2 8
	note D_, 9
	note D_, 10
	notetype1 3
	note D_, 1
	notetype1 10
	notetype0 1
	notetype2 8
	note D_, 4
	note D#, 5
	notetype0 9
	note E_, 11
	notetype1 3
	note E_, 1
	notetype1 10
	note G_, 5
	notetype1 3
	note G_, 1
	notetype1 10
	inc_octave
	notetype2 8
	note C_, 3
	dec_octave
	notetype0 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	callchannel Branch_f5f90
	note D_, 1
	notetype1 3
	note D_, 1
	dutycycle 1
	notetype1 9
	octave 1
	note D_, 1
.Loop3
	note D_, 2
	note D_, 1
	loopchannel 3, .Loop3
	dutycycle 2
	notetype1 7
	inc_octave
	inc_octave
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	note G_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	dutycycle 1
	notetype1 10
	callchannel Branch_f5f62
	octave 4
	notetype1 4
	note F#, 12
	notetype1 10
	note C#, 9
	notetype1 4
	note C#, 1
	notetype1 10
	note C#, 1
	note D_, 1
	note E_, 3
	note D_, 3
	note C#, 3
	dec_octave
	notetype2 6
	note B_, 3
	notetype2 8
	note B_, 4
	notetype1 4
	note B_, 1
	inc_octave
	notetype1 10
	notetype0 1
	note C#, 4
	dec_octave
	note B_, 5
	notetype0 9
	note A_, 6
	notetype1 4
	note A_, 1
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 2
	note D_, 2
	note __, 2
	note C#, 2
	dutycycle 1
	notetype1 10
	notetype2 8
	callchannel Branch_f5f62
	octave 4
	notetype1 4
	note F#, 6
	dec_octave
	notetype1 10
	note B_, 2
	inc_octave
	note C#, 2
	note D_, 1
	notetype1 4
	note D_, 1
	notetype1 10
	note D_, 9
	notetype1 4
	note D_, 1
	notetype1 10
	notetype2 7
	note C#, 1
	note D_, 1
	notetype2 8
	note E_, 3
	note D_, 3
	note C#, 3
	dec_octave
	notetype2 6
	note A_, 3
	inc_octave
	notetype2 8
	note F_, 10
	notetype2 7
	note E_, 1
	note F_, 1
	notetype2 8
	note G_, 3
	note F_, 3
	note E_, 3
	notetype0 1
	note C_, 2
	note C_, 16
	notetype1 4
	note C_, 9
	notetype0 9
	notetype1 10
	notetype2 8
	note A_, 10
	notetype2 7
	note G_, 1
	note F_, 1
	notetype2 8
	note G_, 6
	inc_octave
	note C_, 3
	dec_octave
	notetype0 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	callchannel Branch_f5f90
	note D_, 1
	notetype1 3
	note D_, 1
	dutycycle 1
	notetype1 9
	octave 1
	note D_, 1
.Loop4
	note D_, 2
	note D_, 1
	loopchannel 3, .Loop4
	dutycycle 1
	notetype1 10
	notetype2 8
	octave 5
	note D_, 1
	note C_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C_, 1
	dec_octave
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note D_, 12
	note D_, 12
	dutycycle 1
	notetype1 9
	loopchannel 0, .MainLoop

Branch_f5f3d:
	notetype2 8
	note D_, 12
	note D_, 4
	notetype0 1
	note D_, 7
	notetype1 4
	note D_, 2
	notetype0 9
	note D_, 1
	dec_octave
	notetype1 10
	note A_, 4
	notetype0 1
	note A_, 7
	notetype1 4
	note A_, 2
	notetype0 9
	note A_, 1
	inc_octave
	notetype1 10
	note C_, 12
	endchannel

Branch_f5f62:
	octave 3
	notetype0 1
	note C#, 3
	note D_, 4
	note E_, 3
	note F#, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C#, 3
	notetype0 9
	note D_, 2
	note C#, 2
	dec_octave
	note A_, 2
	note F#, 5
	notetype1 4
	note F#, 1
	inc_octave
	notetype1 10
	note D_, 2
	note C#, 2
	dec_octave
	note A_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 1
	notetype1 4
	note B_, 1
	notetype1 10
	inc_octave
	notetype2 6
	note F#, 1
	notetype2 8
	note F#, 9
	endchannel

Branch_f5f90:
	octave 5
	notetype0 9
.Loop5
	note D_, 1
	notetype1 3
	note D_, 1
	dutycycle 1
	notetype1 9
	octave 1
	note D_, 1
	rept 5
	note D_, 2
	note D_, 1
	endr
	note D_, 2
	dutycycle 1
	notetype1 10
	octave 5
	note C_, 4
	loopchannel 3, .Loop5
	endchannel


Music_TCGDuelTheme2_Ch2: 
	notetype0 9
	vibrato 15, $33
	notetype2 8
	octave 2
	dutycycle 1
	notetype1 7
.Loop1
	note D_, 2
	note D_, 1
	loopchannel 8, .Loop1
.MainLoop
.Loop2
	note D_, 2
	note D_, 1
	loopchannel 24, .Loop2
	dutycycle 2
	notetype1 7
.Loop3
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	loopchannel 12, .Loop3
.Loop4
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	loopchannel 10, .Loop4
	inc_octave
	note C_, 1
	note G_, 1
	inc_octave
	note C_, 1
	note G_, 1
	dutycycle 1
	notetype1 7
	dec_octave
	note D_, 1
	note __, 1
	dec_octave
	notetype2 6
	note A_, 1
	notetype2 8
	note A_, 9
	dutycycle 2
	notetype1 7
.Loop5
	note A_, 1
	note D_, 1
	note A_, 1
	loopchannel 4, .Loop5
	dutycycle 2
	inc_octave
	notetype2 8
	notetype1 3
	note C_, 4
	notetype1 6
	note C_, 7
	note __, 1
	notetype1 6
	note E_, 4
	notetype0 1
	notetype1 8
	note E_, 12
	note __, 6
	notetype0 9
	notetype1 8
	note G_, 3
	dec_octave
	dutycycle 1
	notetype1 7
	notetype0 1
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note G_, 3
	notetype0 9
	dutycycle 2
	notetype1 7
.Loop6
	note A_, 1
	note D_, 1
	loopchannel 9, .Loop6
.Loop7
	note D_, 1
	dec_octave
	note A_, 1
	inc_octave
	loopchannel 3, .Loop7
.Loop8
	note G_, 1
	note C_, 1
	loopchannel 8, .Loop8
	notetype0 1
	note G_, 4
	dutycycle 1
	notetype1 7
	inc_octave
	note C_, 5
	note D_, 4
	note D#, 5
	notetype0 1
	note E_, 12
	note __, 6
	note C_, 12
	note __, 6
	notetype0 9
	dec_octave
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype2 6
	note D_, 1
	notetype2 8
	note A_, 9
	dutycycle 2
	notetype1 7
.Loop9
	note A_, 1
	note D_, 1
	loopchannel 5, .Loop9
	note A_, 1
	dutycycle 1
	notetype1 7
	notetype0 1
	note A#, 4
	note B_, 5
	notetype0 9
	inc_octave
	note C_, 11
	note __, 1
	note E_, 5
	note __, 1
	note G_, 3
	dec_octave
	notetype0 1
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note G_, 3
	callchannel Branch_f618f
	note A_, 1
	note __, 1
	dutycycle 1
	notetype1 7
	dec_octave
	dec_octave
	note D_, 1
.Loop10
	note D_, 2
	note D_, 1
	loopchannel 3, .Loop10
	dutycycle 2
	notetype1 7
	inc_octave
	note E_, 1
	note __, 1
	note E_, 1
	note F#, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 1
	note G_, 1
	inc_octave
	note C#, 1
	dec_octave
	note E_, 1
	inc_octave
	note C#, 1
	dutycycle 2
	notetype1 7
	callchannel Branch_f6173
	octave 4
.Loop11
	note D_, 1
	dec_octave
	note G_, 1
	note B_, 1
	note D_, 1
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	inc_octave
	loopchannel 4, .Loop11
.Loop12
	note C#, 1
	dec_octave
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	loopchannel 2, .Loop12
	dutycycle 1
	notetype1 9
	octave 2
	note __, 1
	notetype2 8
	note B_, 2
	note B_, 2
	note __, 2
	note A_, 2
	inc_octave
	notetype2 8
	note C#, 1
	note D_, 1
	note E_, 1
	dutycycle 2
	notetype1 7
	callchannel Branch_f6173
	octave 3
.Loop13
	note B_, 1
	note D_, 1
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	loopchannel 2, .Loop13
.Loop14
	inc_octave
	note C#, 1
	dec_octave
	note E_, 1
	note A_, 1
	note C#, 1
	note E_, 1
	dec_octave
	note A_, 1
	inc_octave
	loopchannel 2, .Loop14
.Loop15
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	loopchannel 2, .Loop15
.Loop16
	inc_octave
	note E_, 1
	dec_octave
	note G_, 1
	inc_octave
	note C_, 1
	dec_octave
	note E_, 1
	note G_, 1
	note C_, 1
	loopchannel 2, .Loop16
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	note C_, 1
	dec_octave
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	note E_, 1
	dec_octave
	note G_, 1
	inc_octave
	note C_, 1
	dec_octave
	note E_, 1
	note G_, 1
	note C_, 1
	inc_octave
	note E_, 1
	dec_octave
	note G_, 1
	inc_octave
	note C_, 1
	dutycycle 1
	notetype1 7
	dec_octave
	notetype0 1
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note G_, 3
	callchannel Branch_f618f
	note A_, 1
	note __, 1
	dutycycle 1
	notetype1 7
	dec_octave
	dec_octave
	note D_, 1
.Loop17
	note D_, 2
	note D_, 1
	loopchannel 3, .Loop17
	note __, 12
	dutycycle 1
	notetype1 7
	inc_octave
	note A_, 12
	note A_, 12
	dec_octave
	dutycycle 1
	notetype1 7
	loopchannel 0, .MainLoop

Branch_f6173:
	octave 4
.Loop18
	note C#, 1
	dec_octave
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	loopchannel 4, .Loop18
.Loop19
	note D_, 1
	dec_octave
	note G_, 1
	note B_, 1
	note D_, 1
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	inc_octave
	loopchannel 4, .Loop19
	endchannel

Branch_f618f:
	octave 4
	notetype0 9
.Loop20
	note A_, 1
	note __, 1
	notetype1 7
	dec_octave
	dec_octave
	note D_, 1
	rept 5
	note D_, 2
	note D_, 1
	endr
	note D_, 2
	notetype1 7
	inc_octave
	inc_octave
	note G_, 4
	loopchannel 3, .Loop20
	endchannel


Music_TCGDuelTheme2_Ch3: 
	notetype0 9
	notetype1 1
	notetype2 11
	octave 2
.Loop1
	callchannel Branch_f62e5
	loopchannel 4, .Loop1
.MainLoop
.Loop2
	callchannel Branch_f62e5
	loopchannel 44, .Loop2
.Loop3
	rept 3
	callchannel Branch_f62e5
	endr
	octave 2
	note D_, 2
	note C_, 3
	note E_, 1
	loopchannel 3, .Loop3
.Loop4
	callchannel Branch_f62e5
	loopchannel 2, .Loop4
	octave 2
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	note F#, 1
	inc_octave
	note F#, 1
	dec_octave
	note F#, 1
	note G_, 1
	inc_octave
	note G_, 1
	dec_octave
	note G_, 1
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
.Loop5
	callchannel Branch_f62e5
	loopchannel 4, .Loop5
	octave 2
.Loop6
	note E_, 2
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	loopchannel 4, .Loop6
.Loop7
	note A_, 2
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	loopchannel 4, .Loop7
.Loop8
	callchannel Branch_f62e5
	loopchannel 2, .Loop8
	octave 2
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note A_, 1
	inc_octave
	note E_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
.Loop9
	callchannel Branch_f62e5
	loopchannel 4, .Loop9
	octave 2
.Loop10
	note E_, 2
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	loopchannel 4, .Loop10
.Loop11
	note G_, 2
	note G_, 1
	inc_octave
	note G_, 1
	dec_octave
	note G_, 1
	inc_octave
	note G_, 1
	dec_octave
	loopchannel 2, .Loop11
.Loop12
	note A_, 2
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	loopchannel 2, .Loop12
.Loop13
	note A#, 2
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	loopchannel 2, .Loop13
	inc_octave
.Loop14
	note C_, 2
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	loopchannel 2, .Loop14
	dec_octave
.Loop15
	note A#, 2
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	loopchannel 2, .Loop15
	inc_octave
.Loop16
	note C_, 2
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	loopchannel 2, .Loop16
.Loop17
	rept 3
	callchannel Branch_f62e5
	endr
	octave 2
	note D_, 2
	note C_, 3
	note E_, 1
	loopchannel 3, .Loop17
.Loop18
	callchannel Branch_f62e5
	loopchannel 2, .Loop18
	octave 3
	note D_, 1
	note C_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C_, 1
	dec_octave
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 1
.Loop19
	callchannel Branch_f62e5
	loopchannel 4, .Loop19
	loopchannel 0, .MainLoop

Branch_f62e5:
	octave 2
	note D_, 2
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note D_, 1
	endchannel


Music_TCGDuelTheme2_Ch4: 
	togglenoise $06
	notetype 9
.Loop1
	note __, 12
	loopchannel 2, .Loop1
.MainLoop
	note __, 12
	note __, 6
.Loop2
	note C#, 1
	loopchannel 6, .Loop2
.Loop3
	callchannel Branch_f637c
	loopchannel 3, .Loop3
	note C_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note E_, 1
.Loop4
	note C#, 1
	loopchannel 6, .Loop4
.Loop5
	callchannel Branch_f637c
	loopchannel 15, .Loop5
	callchannel Branch_f6396
.Loop6
	callchannel Branch_f637c
	rept 6
	note C#, 1
	endr
	note C#, 2
	note F_, 3
	note C#, 1
	loopchannel 3, .Loop6
	note C_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	notetype 1
	note D#, 4
	note D_, 5
	notetype 9
	note C#, 3
.Loop7
	note C#, 1
	loopchannel 12, .Loop7
.Loop8
	callchannel Branch_f637c
	callchannel Branch_f6389
	loopchannel 3, .Loop8
	callchannel Branch_f637c
	note C_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	note C#, 1
	notetype 1
	note D_, 4
	note D_, 5
	notetype 9
	note C#, 1
	note C#, 1
	note C#, 1
.Loop9
	callchannel Branch_f637c
	callchannel Branch_f6389
	loopchannel 4, .Loop9
	callchannel Branch_f637c
	callchannel Branch_f6396
.Loop10
	callchannel Branch_f637c
	rept 6
	note C#, 1
	endr
	note C#, 2
	note F_, 3
	note C#, 1
	loopchannel 3, .Loop10
	callchannel Branch_f637c
.Loop11
	note C#, 1
	loopchannel 12, .Loop11
	note F_, 12
	note __, 12
	loopchannel 0, .MainLoop

Branch_f637c:
	note C_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note E_, 1
	endchannel

Branch_f6389:
	note C_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	endchannel

Branch_f6396:
	note C_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note D#, 1
.Loop12
	note C#, 1
	loopchannel 6, .Loop12
	endchannel

