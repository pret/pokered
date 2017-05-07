Music_TCGDuelTheme1:
	db $C0
	dw Music_TCGDuelTheme1_Ch1
	db $01
	dw Music_TCGDuelTheme1_Ch2
	db $02
	dw Music_TCGDuelTheme1_Ch3
	db $03
	dw Music_TCGDuelTheme1_Ch4

Music_TCGDuelTheme1_Ch1: 
	notetype0 7
	vibrato 20, $33
	notetype2 8
	dutycycle 2
.MainLoop
	octave 2
.Loop1
	note __, 16
	loopchannel 7, .Loop1
	note __, 9
.Loop2
	note __, 3
	callchannel Branch_f54f9
	notetype1 10
	notetype0 1
	note F_, 4
	note F#, 3
	notetype0 7
	note F#, 1
	notetype1 3
	note F#, 1
	dec_octave
	notetype1 10
	note A_, 1
	note __, 2
	inc_octave
	notetype1 10
	note D_, 10
	notetype1 3
	note D_, 12
	callchannel Branch_f54f9
	notetype1 10
	note F#, 2
	notetype1 3
	note F#, 1
	notetype1 10
	note A_, 13
	notetype1 3
	note A_, 10
	notetype1 10
	note F#, 1
	notetype1 3
	note F#, 1
	notetype1 10
	note F#, 1
	note G_, 1
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 15
	notetype1 3
	note B_, 4
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 3
	note A_, 3
	notetype1 3
	note A_, 1
	notetype1 10
	note G_, 2
	notetype1 3
	note G_, 2
	notetype1 10
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 15
	notetype1 3
	note A_, 4
	notetype1 10
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 3
	note G_, 4
	note F#, 2
	notetype1 3
	note F#, 2
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 15
	notetype1 3
	note G_, 4
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 3
	note F#, 4
	note E_, 3
	notetype1 3
	note E_, 1
	notetype1 10
	notetype0 1
	note D#, 4
	note E_, 3
	notetype0 7
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 10
	note D_, 13
	notetype1 3
	note D_, 9
	dec_octave
	loopchannel 2, .Loop2
	inc_octave
	dutycycle 1
	notetype1 10
	notetype0 1
	note C#, 4
	note D_, 3
	notetype0 7
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel Branch_f5538
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note F#, 5
	notetype1 3
	note F#, 1
	dec_octave
	notetype1 10
	note A_, 1
	inc_octave
	notetype0 1
	note D_, 4
	notetype1 3
	note D_, 3
	notetype1 10
	note F#, 4
	notetype1 3
	note F#, 3
	notetype1 10
	note A_, 4
	notetype1 3
	note A_, 3
	notetype0 7
	note __, 3
	dec_octave
	dutycycle 1
	notetype1 10
	notetype2 8
.Loop3
	note A_, 1
	note __, 2
	loopchannel 3, .Loop3
	inc_octave
	notetype0 1
	note C#, 4
	note D_, 3
	notetype0 7
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel Branch_f5538
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 5
	note A_, 10
	note A_, 6
	notetype1 3
	note A_, 2
	inc_octave
	notetype1 10
	notetype0 1
	note C#, 4
	note D_, 3
	notetype0 7
	note D_, 2
	note C#, 1
	notetype1 3
	note C#, 2
	dec_octave
	notetype1 10
	note B_, 1
	notetype1 3
	note B_, 1
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 1
	notetype1 3
	note B_, 1
	notetype1 10
	note A_, 13
	note A_, 6
	notetype1 3
	note A_, 2
	dec_octave
	notetype1 8
	notetype0 1
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	dec_octave
	note C#, 5
	note E_, 5
	note A_, 4
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 4
	dec_octave
	callchannel Branch_f5580
	notetype1 10
	note A_, 2
	note A_, 8
	note A_, 8
	note A_, 6
	dutycycle 1
	notetype1 10
	notetype0 1
	dec_octave
	note B_, 4
	inc_octave
	note C_, 3
	notetype0 7
	note C#, 1
	note __, 1
	note C#, 1
	note D_, 2
	note E_, 2
	note G_, 2
	dutycycle 2
	callchannel Branch_f5580
	notetype1 10
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 5
	note G_, 2
	note F#, 2
	notetype1 3
	note F#, 2
	notetype1 10
	note E_, 2
	notetype1 3
	note E_, 2
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 5
	note F#, 2
	note E_, 2
	notetype1 3
	note E_, 2
	notetype1 10
	note D_, 2
	notetype1 3
	note D_, 2
	notetype1 10
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 8
	notetype1 3
	note D_, 2
	notetype1 10
	note D_, 12
	notetype1 3
	note D_, 2
	notetype1 10
	note D_, 6
	note D_, 8
	note __, 4
	loopchannel 0, .MainLoop

Branch_f54f9:
	octave 2
	notetype1 10
	note A_, 1
	note B_, 1
	inc_octave
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 10
	notetype0 1
	note F_, 4
	note F#, 3
	notetype0 7
	note F#, 10
	notetype1 3
	note F#, 1
	notetype1 10
	note D_, 3
	notetype1 3
	note D_, 1
	notetype1 10
	notetype0 1
	note D#, 4
	note E_, 3
	notetype0 7
	note E_, 5
	notetype1 3
	note E_, 2
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 2
	note F#, 1
	notetype1 3
	note F#, 2
	notetype1 10
	note E_, 1
	notetype1 3
	note E_, 1
	endchannel

Branch_f5538:
	note C_, 1
	note __, 2
	dec_octave
	note G_, 1
	note __, 2
	note G_, 1
	note __, 2
	dutycycle 2
	notetype1 10
	note G_, 1
	inc_octave
	notetype0 1
	note C_, 4
	notetype1 3
	note C_, 3
	notetype1 10
	note E_, 4
	notetype1 3
	note E_, 3
	notetype1 10
	note G_, 4
	notetype1 3
	note G_, 3
	notetype0 7
	note __, 3
	dutycycle 1
	notetype1 10
	notetype2 8
	dec_octave
.Loop4
	note G_, 1
	note __, 2
	loopchannel 3, .Loop4
	inc_octave
	dutycycle 2
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 2
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 10
	endchannel

Branch_f5580:
	notetype0 1
	notetype1 10
	note F_, 4
	note F#, 3
	notetype0 7
	note F#, 9
	notetype1 3
	note F#, 2
	notetype1 10
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 10
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note B_, 2
	notetype1 3
	note B_, 2
	inc_octave
	notetype1 10
	notetype0 1
	note F_, 4
	note F#, 3
	notetype0 7
	note F#, 7
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 10
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 10
	note C#, 2
	notetype1 3
	note C#, 1
	dec_octave
	notetype1 10
	note A_, 9
	note F#, 1
	notetype1 3
	note F#, 1
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 8
	notetype1 3
	note B_, 1
	notetype1 10
	note A_, 4
	note G_, 4
	note F#, 10
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 10
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note D_, 10
	note E_, 2
	note F#, 2
	notetype1 3
	note F#, 2
	endchannel


Music_TCGDuelTheme1_Ch2: 
	notetype0 7
	vibrato 20, $33
	notetype2 8
.MainLoop
	dutycycle 1
	notetype1 9
	octave 2
.Loop1
	rept 3
	note D_, 1
	note __, 2
	endr
	note __, 1
	dec_octave
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	inc_octave
	loopchannel 4, .Loop1
.Loop2
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	callchannel Branch_f59f9
	loopchannel 4, .Loop2
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	callchannel Branch_f59f9
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note C_, 2
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 10
	notetype2 6
	note G_, 1
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	note __, 2
	inc_octave
.Loop3
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	callchannel Branch_f59f9
	loopchannel 3, .Loop3
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note C_, 2
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 10
	notetype2 6
	note G_, 1
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	note __, 2
	inc_octave
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	callchannel Branch_f59f9
	octave 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note F#, 1
	note __, 1
.Loop4
	note G_, 1
	note __, 2
	note G_, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note G_, 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note G_, 1
	note __, 3
	note D_, 1
	note __, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note G_, 1
	dutycycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	note __, 2
	loopchannel 2, .Loop4
	note F#, 1
	note __, 2
	note F#, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	inc_octave
	note C#, 2
	callchannel Branch_f5a17
	octave 2
	note F#, 1
	note __, 2
	note F#, 1
	inc_octave
	dutycycle 2
	notetype1 10
	notetype2 6
	note E_, 2
	callchannel Branch_f5a17
	note E_, 1
	note __, 2
	note E_, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note G_, 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note B_, 1
	dutycycle 1
	notetype1 9
	notetype2 8
	note G_, 1
	note __, 2
	note A_, 1
	note __, 2
	note A_, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note G_, 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note A_, 1
	note __, 3
	note E_, 1
	note __, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	dutycycle 1
	notetype1 9
	notetype2 8
	note A_, 1
	note __, 2
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	note __, 2
	inc_octave
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 7
	note E_, 1
	note F#, 1
	note A_, 1
	note __, 1
	notetype1 7
	callchannel Branch_f594d
	notetype1 7
	octave 3
	notetype0 1
	note C#, 4
	note D_, 3
	notetype0 7
	note D_, 1
	note __, 1
	dec_octave
	note F#, 1
	notetype1 10
	notetype2 6
	note F#, 2
	notetype1 7
	notetype2 8
	note A_, 10
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	inc_octave
	note D_, 2
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 7
	note E_, 1
	note F#, 1
	note A_, 1
	note __, 1
	callchannel Branch_f594d
	notetype1 7
	octave 3
	note D_, 2
	note __, 1
	note F#, 13
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 2
	note D_, 1
	dutycycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	inc_octave
	dutycycle 2
	notetype1 7
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note __, 1
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 15
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note G_, 1
	note __, 2
	note G_, 1
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 2
	note __, 1
	note F#, 3
	note __, 1
	dec_octave
	notetype1 10
	notetype2 6
	note G_, 1
	dutycycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	note __, 2
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note E_, 4
	note F#, 3
	notetype0 7
	note F#, 15
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note F#, 1
	note __, 2
	note F#, 1
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note E_, 4
	note F#, 3
	notetype0 7
	note F#, 2
	note __, 1
	note E_, 3
	note __, 1
	dec_octave
	notetype1 10
	notetype2 6
	note A_, 1
	dutycycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	note __, 2
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note D#, 4
	note E_, 3
	notetype0 7
	note E_, 15
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note A_, 1
	note __, 2
	note A_, 1
	dutycycle 2
	notetype1 7
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 2
	note __, 1
	note A_, 3
	note __, 1
	note G_, 3
	note __, 1
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 1
	note __, 1
	note F#, 13
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	dutycycle 2
	notetype1 10
	notetype2 6
	note D_, 2
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 2
	callchannel Branch_f59b4
	octave 3
	notetype0 1
	notetype1 7
	note F_, 4
	note F#, 3
	notetype0 7
	note F#, 1
	note __, 1
	note D_, 5
	note __, 1
	dec_octave
	note F#, 1
	notetype0 1
	note A_, 4
	note __, 3
	inc_octave
	note D_, 4
	note __, 3
	note F#, 4
	note __, 3
	notetype0 7
	note __, 3
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
.Loop5
	note D_, 1
	note __, 2
	loopchannel 3, .Loop5
	callchannel Branch_f59b4
	notetype1 8
	octave 3
	note D_, 16
	note D_, 6
	note __, 2
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 2
	note A_, 1
	note __, 2
	note A_, 1
	note __, 1
	note D_, 2
	note __, 1
	note D_, 13
	note C#, 6
	note __, 2
	dec_octave
	notetype1 8
	notetype0 1
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 4
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 4
	dec_octave
	dec_octave
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	dec_octave
	notetype0 7
	callchannel Branch_f598c
	note D_, 8
	note D_, 8
	note C#, 6
	dec_octave
	dutycycle 1
	notetype1 7
	notetype0 1
	note G_, 4
	note G#, 3
	notetype0 7
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 2
	inc_octave
	note C#, 2
	note E_, 2
	dutycycle 2
	callchannel Branch_f598c
	note D_, 4
	note E_, 2
	note D_, 2
	note __, 2
	note C#, 2
	note __, 2
	note E_, 6
	note D_, 2
	note C#, 2
	note __, 2
	dec_octave
	note A_, 2
	note __, 2
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note __, 2
	note G_, 12
	note __, 2
	note G_, 14
	note __, 4
	loopchannel 0, .MainLoop

Branch_f594d:
	octave 3
	notetype0 1
	note C#, 4
	note D_, 3
	notetype0 7
	note D_, 9
	dec_octave
	dutycycle 1
	notetype1 9
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 7
	note A_, 3
	note __, 1
	inc_octave
	note C_, 6
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note D#, 4
	note E_, 3
	notetype0 7
	note E_, 2
	note D_, 1
	dec_octave
	notetype1 10
	notetype2 6
	note G_, 2
	inc_octave
	notetype1 7
	notetype2 8
	note C_, 1
	note __, 1
	endchannel

Branch_f598c:
	notetype1 8
	note D_, 10
	note __, 2
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 2
	note __, 2
	inc_octave
	note D_, 8
	note C#, 1
	note __, 1
	dec_octave
	note B_, 1
	note __, 1
	note A_, 2
	note __, 1
	note F#, 9
	note D_, 1
	note __, 1
	note G_, 9
	note __, 1
	note F#, 4
	note E_, 4
	note D_, 10
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	dec_octave
	note B_, 10
	inc_octave
	note C#, 2
	note D_, 2
	note __, 2
	note D_, 2
	endchannel

Branch_f59b4:
	octave 2
	notetype1 8
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 2
	note C_, 1
	note __, 2
	note C_, 1
	note __, 2
	dutycycle 2
	notetype1 7
	note E_, 1
	notetype0 1
	note G_, 4
	note __, 3
	inc_octave
	note C_, 4
	note __, 3
	note E_, 4
	note __, 3
	notetype0 7
	note __, 3
	notetype2 8
	dec_octave
	dutycycle 1
	notetype1 8
.Loop6
	note C_, 1
	note __, 2
	loopchannel 3, .Loop6
	inc_octave
	dutycycle 2
	notetype1 7
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 2
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	endchannel

Branch_f59f9:
	octave 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	note __, 3
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	dec_octave
	dutycycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	note __, 2
	endchannel

Branch_f5a17:
	octave 2
	dutycycle 1
	notetype1 9
	notetype2 8
	note F#, 1
	note __, 3
	note C#, 1
	note __, 1
	dutycycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	dutycycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	note __, 2
	endchannel


Music_TCGDuelTheme1_Ch3: 
	notetype0 7
	notetype1 1
	notetype2 14
	octave 2
.MainLoop
.Loop1
	rept 3
	note D_, 1
	note __, 2
	endr
	note __, 1
	callchannel Branch_f5c47
	loopchannel 4, .Loop1
.Loop2
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	inc_octave
	note D_, 2
	dec_octave
	dec_octave
	note D_, 1
	note __, 3
	callchannel Branch_f5c47
	loopchannel 4, .Loop2
	callchannel Branch_f5b8d
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note F#, 2
	dec_octave
	note D_, 1
	note __, 3
	callchannel Branch_f5c47
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	inc_octave
	note D_, 2
	dec_octave
	dec_octave
	note D_, 1
	note __, 3
	callchannel Branch_f5c47
	callchannel Branch_f5b8d
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note A_, 2
	dec_octave
	note D_, 1
	note __, 3
	callchannel Branch_f5c47
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note A_, 2
	dec_octave
	note D_, 1
	note __, 2
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel Branch_f5c7e
	octave 3
	note C_, 3
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
.Loop3
	note D_, 1
	note __, 2
	loopchannel 3, .Loop3
	inc_octave
	note D_, 1
	notetype0 1
	note F#, 4
	note __, 3
	note A_, 4
	note __, 3
	inc_octave
	note D_, 4
	note __, 3
	notetype0 7
	note __, 3
	dec_octave
	dec_octave
.Loop4
	note D_, 1
	note __, 2
	loopchannel 3, .Loop4
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel Branch_f5c7e
	octave 2
	note C_, 3
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	callchannel Branch_f5c60
	octave 2
	note E_, 1
	note __, 1
	note E_, 2
	note B_, 2
	callchannel Branch_f5c60
	octave 2
	note F#, 2
	note G_, 2
	note G#, 2
	callchannel Branch_f5c6f
	octave 2
	note A_, 1
	note __, 1
	note A_, 2
	note E_, 2
	callchannel Branch_f5c6f
	octave 2
	note B_, 2
	inc_octave
	note C_, 2
	note C#, 2
	dec_octave
.Loop5
	callchannel Branch_f5c4d
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 2
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note __, 1
	note E_, 2
	callchannel Branch_f5c4d
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 2
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note F#, 1
	note __, 1
	note F_, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note F#, 2
	note G_, 2
	note G#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note A_, 2
	note E_, 2
	note C#, 2
	loopchannel 2, .Loop5
.Loop6
	callchannel Branch_f5c4d
	loopchannel 2, .Loop6
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note A_, 14
	note __, 4
	loopchannel 0, .MainLoop

Branch_f5b8d:
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note A_, 2
	dec_octave
	note D_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note G_, 2
	dec_octave
	note D_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
.Loop7
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note A_, 2
	dec_octave
	note D_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	loopchannel 3, .Loop7
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note G_, 2
	dec_octave
	note D_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note A_, 2
	dec_octave
	note D_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	note D_, 1
	note __, 2
	note D_, 1
	inc_octave
	note A_, 2
	dec_octave
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note E_, 2
	note F#, 1
	note __, 1
.Loop8
	note G_, 1
	note __, 2
	note G_, 1
	inc_octave
	note B_, 2
	dec_octave
	note G_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note __, 2
	loopchannel 2, .Loop8
	note F#, 1
	note __, 2
	note F#, 1
	inc_octave
	note A_, 2
	dec_octave
	note F#, 1
	note __, 3
	note C#, 1
	note __, 1
	note C#, 1
	note E_, 1
	note __, 2
	note F#, 1
	note __, 2
	note F#, 1
	inc_octave
	inc_octave
	note C#, 2
	dec_octave
	dec_octave
	note F#, 1
	note __, 3
	note C#, 1
	note __, 1
	note C#, 1
	note E_, 1
	note __, 2
	note E_, 1
	note __, 2
	note E_, 1
	inc_octave
	note B_, 2
	dec_octave
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 2
	note A_, 1
	note __, 2
	note A_, 1
	inc_octave
	note B_, 2
	dec_octave
	note A_, 1
	note __, 3
	note E_, 1
	note __, 1
	note F#, 1
	note A_, 1
	note __, 2
	endchannel

Branch_f5c47:
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 2
	endchannel

Branch_f5c4d:
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 2
	endchannel

Branch_f5c60:
	octave 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	endchannel

Branch_f5c6f:
	octave 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	endchannel

Branch_f5c7e:
	octave 2
.Loop9
	note C_, 1
	note __, 2
	loopchannel 3, .Loop9
	inc_octave
	note C_, 1
	notetype0 1
	note E_, 4
	note __, 3
	note G_, 4
	note __, 3
	inc_octave
	note C_, 4
	note __, 3
	notetype0 7
	note __, 3
	dec_octave
	dec_octave
.Loop10
	note C_, 1
	note __, 2
	loopchannel 3, .Loop10
	endchannel


Music_TCGDuelTheme1_Ch4: 
	togglenoise $06
	notetype 7
	octave 1
.MainLoop
.Loop1
	note C_, 2
	note D#, 1
	note E_, 1
	note D#, 1
	note C_, 1
	note D_, 2
	note D#, 1
	note C_, 1
	note E_, 2
	note C#, 1
	note E_, 1
	note __, 1
	note D#, 1
	loopchannel 3, .Loop1
	note C_, 2
	note D#, 1
	note E_, 1
	note D#, 1
	note C_, 1
	note D_, 2
	note D#, 1
	note C#, 1
	note E_, 1
	notetype 1
	note D_, 4
	note D_, 3
	notetype 7
	note C#, 1
	note C#, 1
	note C#, 2
.Loop2
	callchannel Branch_f5d39
	loopchannel 3, .Loop2
	callchannel Branch_f5d46
.Loop3
	callchannel Branch_f5d39
	loopchannel 15, .Loop3
	callchannel Branch_f5d46
.Loop4
	callchannel Branch_f5d39
	loopchannel 15, .Loop4
	note C_, 2
	note D#, 1
	note E_, 1
	note C#, 2
	note E_, 2
	note D#, 1
	note C#, 1
	note E_, 1
	notetype 1
	note D_, 4
	note D_, 3
	notetype 7
.Loop5
	note C#, 1
	loopchannel 4, .Loop5
.Loop6
	note C_, 1
	note D#, 1
	note E_, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note E_, 2
	note D#, 1
	note C_, 1
	note D#, 2
	note C#, 2
	note E_, 2
	loopchannel 5, .Loop6
	note C_, 2
	note D#, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note E_, 2
	note D#, 1
	note C_, 1
	note E_, 1
	notetype 1
	note D_, 4
	note D_, 3
	notetype 7
.Loop7
	note C#, 1
	loopchannel 4, .Loop7
.Loop8
	callchannel Branch_f5d39
	loopchannel 3, .Loop8
	callchannel Branch_f5d58
.Loop9
	callchannel Branch_f5d39
	loopchannel 7, .Loop9
	callchannel Branch_f5d46
.Loop10
	callchannel Branch_f5d39
	loopchannel 7, .Loop10
	callchannel Branch_f5d58
.Loop11
	callchannel Branch_f5d39
	loopchannel 2, .Loop11
	note C_, 2
	note D#, 1
	note E_, 1
	note C#, 2
	note E_, 2
	note C_, 1
	note D#, 1
	note E_, 2
	note C#, 2
	note F_, 14
	note C#, 4
	loopchannel 0, .MainLoop

Branch_f5d39:
	note C_, 2
	note D#, 1
	note E_, 1
	note C#, 2
	note E_, 2
	note C_, 1
	note D#, 1
	note E_, 2
	note C#, 1
	note E_, 1
	note __, 1
	note D#, 1
	endchannel

Branch_f5d46:
	note C_, 2
	note D#, 1
	note E_, 1
	note C#, 2
	note E_, 2
	note D#, 1
	note C#, 1
	note E_, 1
	notetype 1
	note D_, 4
	note D_, 3
	notetype 7
	note C#, 1
	note C#, 1
	note C#, 2
	endchannel

Branch_f5d58:
	note C_, 2
	note D#, 1
	note E_, 1
	note C#, 2
	note E_, 1
	notetype 1
	note D_, 4
	note D_, 3
	notetype 7
.Loop12
	note C#, 1
	loopchannel 8, .Loop12
	endchannel

