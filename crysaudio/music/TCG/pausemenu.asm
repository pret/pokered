Music_TCGPauseMenu:
	db $C0
	dw Music_TCGPauseMenu_Ch1
	db $01
	dw Music_TCGPauseMenu_Ch2
	db $02
	dw Music_TCGPauseMenu_Ch3
	db $03
	dw Music_TCGPauseMenu_Ch4

Music_TCGPauseMenu_Ch2: 
	notetype0 7
	notetype2 8
	dutycycle 2
.MainLoop
	notetype1 7
.Loop1
	note __, 16
	loopchannel 4, .Loop1
	notetype0 1
	octave 6
	note C_, 4
	dec_octave
	note __, 3
	note B_, 4
	inc_octave
	notetype1 3
	note C_, 3
	dec_octave
	notetype1 7
	note G_, 4
	notetype1 3
	note B_, 3
	notetype1 7
	note D_, 4
	notetype1 3
	note G_, 3
	callchannel Branch_f6c24
	callchannel Branch_f6c60
	notetype1 7
	octave 6
	note C_, 4
	dec_octave
	notetype1 3
	note E_, 3
	notetype1 7
	note B_, 4
	inc_octave
	notetype1 3
	note C_, 3
	dec_octave
	notetype1 7
	note G_, 4
	notetype1 3
	note B_, 3
	notetype1 7
	note D_, 4
	notetype1 3
	note G_, 3
	callchannel Branch_f6c24
	callchannel Branch_f6c60
	octave 6
	notetype1 6
	note C_, 4
	dec_octave
	notetype1 3
	note E_, 3
	callchannel Branch_f6ce9
	callchannel Branch_f6c80
.Loop2
	octave 6
	notetype2 4
	note C_, 1
	callchannel Branch_f6ce9
	callchannel Branch_f6c80
	loopchannel 3, .Loop2
	notetype2 8
	loopchannel 0, .MainLoop

Branch_f6c24:
.Loop3
	octave 6
	notetype1 7
	note C_, 4
	dec_octave
	notetype1 3
	note D_, 3
	notetype1 7
	note B_, 4
	inc_octave
	notetype1 3
	note C_, 3
	dec_octave
	notetype1 7
	note G_, 4
	notetype1 3
	note B_, 3
	notetype1 7
	note D_, 4
	notetype1 3
	note G_, 3
	loopchannel 3, .Loop3
	inc_octave
	notetype1 7
	note C_, 4
	dec_octave
	notetype1 3
	note D_, 3
	notetype1 7
	note B_, 4
	inc_octave
	notetype1 3
	note C_, 3
	dec_octave
	notetype1 7
	note G_, 4
	notetype1 3
	note B_, 3
	notetype1 7
	note E_, 4
	notetype1 3
	note G_, 3
	endchannel

Branch_f6c60:
.Loop4
	octave 6
	notetype1 7
	note C_, 4
	dec_octave
	notetype1 3
	note E_, 3
	notetype1 7
	note B_, 4
	inc_octave
	notetype1 3
	note C_, 3
	dec_octave
	notetype1 7
	note G_, 4
	notetype1 3
	note B_, 3
	notetype1 7
	note E_, 4
	notetype1 3
	note G_, 3
	loopchannel 3, .Loop4
	endchannel

Branch_f6c80:
	octave 6
	notetype2 4
	note C_, 1
	octave 3
	notetype1 7
	notetype2 8
	notetype0 1
	note C_, 4
	notetype1 2
	note C_, 3
	notetype1 6
	notetype0 7
	octave 5
	notetype2 4
	note G_, 1
	note E_, 1
	octave 3
	notetype2 8
	notetype1 7
	notetype0 1
	note E_, 4
	notetype1 2
	note E_, 3
	notetype0 7
	notetype1 6
	octave 5
	notetype2 4
	note B_, 1
	note G_, 1
	dec_octave
	notetype1 7
	notetype2 8
	notetype0 1
	note C_, 4
	notetype1 2
	note C_, 3
	notetype1 6
	notetype0 7
	octave 6
	notetype2 4
	note C_, 1
	octave 3
	notetype2 8
	notetype1 7
	notetype0 1
	note C_, 4
	notetype1 2
	note C_, 3
	notetype0 7
	octave 5
	notetype1 6
	notetype2 4
	note G_, 1
	note E_, 1
	notetype1 7
	octave 3
	notetype2 8
	notetype0 1
	note E_, 4
	notetype1 2
	note E_, 3
	notetype0 7
	notetype1 6
	octave 5
	notetype2 4
	note B_, 1
	note G_, 1
	note E_, 1
	endchannel

Branch_f6ce9:
	octave 2
	notetype0 1
	notetype2 8
	notetype1 7
	note B_, 4
	notetype1 2
	note B_, 3
	notetype0 7
	notetype1 6
	octave 5
	notetype2 4
	note G_, 1
	note D_, 1
	octave 3
	notetype1 7
	notetype2 8
	notetype0 1
	note D_, 4
	notetype1 2
	note D_, 3
	notetype0 7
	notetype1 6
	octave 5
	notetype2 4
	note B_, 1
	note G_, 1
	notetype1 7
	octave 3
	notetype2 8
	notetype0 1
	note B_, 4
	notetype1 2
	note B_, 3
	notetype1 6
	notetype0 7
	octave 6
	notetype2 4
	note C_, 1
	notetype1 7
	octave 2
	notetype2 8
	notetype0 1
	note B_, 4
	notetype1 2
	note B_, 3
	notetype0 7
	notetype1 6
	octave 5
	notetype2 4
	note G_, 1
	note D_, 1
	notetype1 7
	octave 3
	notetype2 8
	notetype0 1
	note D_, 4
	notetype1 2
	note D_, 3
	notetype0 7
	notetype1 6
	octave 5
	notetype2 4
	note B_, 1
	note G_, 1
	note D_, 1
	endchannel


Music_TCGPauseMenu_Ch1: 
	notetype0 7
	notetype2 8
	dutycycle 2
.MainLoop
	notetype1 8
.Loop1
	note __, 16
	loopchannel 7, .Loop1
	octave 5
	note __, 8
	notetype0 1
.Loop2
	note B_, 4
	note G_, 3
	note E_, 4
	note C_, 3
	dec_octave
	loopchannel 4, .Loop2
	notetype0 7
.Loop3
	octave 1
	notetype1 13
	note G_, 1
	octave 3
	notetype1 7
	notetype0 1
	note D_, 4
	notetype1 2
	note D_, 3
	notetype1 13
	notetype0 7
	octave 1
	notetype2 6
	note G_, 1
	notetype2 4
	note G_, 1
	octave 3
	notetype2 8
	notetype1 7
	notetype0 1
	note F#, 4
	notetype1 2
	note F#, 3
	dec_octave
	notetype1 13
	notetype0 7
	note D_, 1
	note G_, 1
	octave 4
	notetype1 7
	notetype0 1
	note F#, 4
	notetype1 2
	note F#, 3
	notetype0 7
	octave 1
	notetype1 13
	notetype2 8
	note G_, 1
	octave 3
	notetype1 7
	notetype0 1
	note D_, 4
	notetype1 2
	note D_, 3
	notetype0 7
	notetype1 13
	octave 1
	notetype2 6
	note G_, 1
	notetype2 4
	note G_, 1
	octave 3
	notetype2 8
	notetype0 1
	note F#, 4
	notetype1 2
	note F#, 3
	notetype0 7
	octave 1
	notetype1 13
	note B_, 1
	inc_octave
	note C_, 1
	note C#, 1
	dec_octave
	note D_, 1
	octave 3
	notetype1 7
	notetype0 1
	note E_, 4
	notetype1 2
	note E_, 3
	notetype1 13
	notetype0 7
	octave 1
	notetype2 6
	note D_, 1
	notetype2 4
	note D_, 1
	octave 3
	notetype2 8
	notetype0 1
	note G_, 4
	notetype1 2
	note G_, 3
	notetype0 7
	dec_octave
	notetype1 13
	note C_, 1
	note D_, 1
	octave 4
	notetype1 7
	notetype0 1
	note G_, 4
	notetype1 2
	note G_, 3
	notetype0 7
	octave 1
	notetype1 13
	notetype2 8
	note D_, 1
	octave 3
	notetype1 7
	notetype0 1
	note E_, 4
	notetype1 2
	note E_, 3
	notetype0 7
	notetype1 13
	notetype2 6
	octave 1
	note D_, 1
	notetype2 4
	note D_, 1
	octave 3
	notetype2 8
	notetype0 1
	note G_, 4
	notetype1 2
	note G_, 3
	notetype0 7
	octave 1
	notetype1 13
	note C_, 1
	note C#, 1
	inc_octave
	note D_, 1
	loopchannel 4, .Loop3
	loopchannel 0, .MainLoop


Music_TCGPauseMenu_Ch3: 
	notetype0 1
	notetype2 13
	notetype1 2
	octave 5
	note G_, 7
	note F#, 4
	notetype1 3
	note G_, 3
	notetype1 2
	note D_, 4
	notetype1 3
	note F#, 3
	dec_octave
	notetype1 2
	note B_, 4
	inc_octave
	notetype1 3
	note D_, 3
.MainLoop
	octave 5
.Loop1
	notetype1 2
	note G_, 4
	dec_octave
	notetype1 3
	note B_, 3
	inc_octave
	notetype1 2
	note F#, 4
	notetype1 3
	note G_, 3
	notetype1 2
	note D_, 4
	notetype1 3
	note F#, 3
	dec_octave
	notetype1 2
	note B_, 4
	inc_octave
	notetype1 3
	note D_, 3
	loopchannel 3, .Loop1
	notetype1 2
	note G_, 4
	dec_octave
	notetype1 3
	note B_, 3
	inc_octave
	notetype1 2
	note E_, 4
	notetype1 3
	note G_, 3
	notetype1 2
	note C_, 4
	notetype1 3
	note E_, 3
	dec_octave
	notetype1 2
	note A_, 4
	inc_octave
	notetype1 3
	note C_, 3
.Loop2
	notetype1 2
	note G_, 4
	dec_octave
	notetype1 3
	note A_, 3
	inc_octave
	notetype1 2
	note E_, 4
	notetype1 3
	note G_, 3
	notetype1 2
	note C_, 4
	notetype1 3
	note E_, 3
	dec_octave
	notetype1 2
	note A_, 4
	inc_octave
	notetype1 3
	note C_, 3
	loopchannel 3, .Loop2
	notetype1 2
	note G_, 4
	dec_octave
	notetype1 3
	note A_, 3
	inc_octave
	notetype1 2
	note F#, 4
	notetype1 3
	note G_, 3
	notetype1 2
	note D_, 4
	notetype1 3
	note F#, 3
	dec_octave
	notetype1 2
	note B_, 4
	inc_octave
	notetype1 3
	note D_, 3
	loopchannel 0, .MainLoop


Music_TCGPauseMenu_Ch4: 
	togglenoise $06
	notetype 7
	octave 1
.MainLoop
.Loop1
	rept 7
	note C_, 1
	note D#, 1
	note E_, 2
	note C#, 1
	note D#, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note D#, 1
	note E_, 2
	note C#, 1
	note D#, 1
	note E_, 1
	note C#, 1
	endr
	note C_, 1
	note D#, 1
	note E_, 2
	note C#, 1
	note D#, 1
	note E_, 1
	notetype 1
	note D_, 4
	note D_, 3
	notetype 7
	rept 8
	note C#, 1
	endr
	loopchannel 2, .Loop1
	loopchannel 0, .MainLoop

