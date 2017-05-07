Music_TCGDeckMachine:
	db $C0
	dw Music_TCGDeckMachine_Ch1
	db $01
	dw Music_TCGDeckMachine_Ch2
	db $02
	dw Music_TCGDeckMachine_Ch3
	db $03
	dw Music_TCGDeckMachine_Ch4

Music_TCGDeckMachine_Ch1: 
	notetype2 8
	dutycycle 3
.MainLoop
	octave 5
	notetype0 1
.Loop1
	notetype2 6
	notetype1 9
	note C_, 7
	notetype1 3
	note C_, 8
	notetype1 4
	note C_, 8
	notetype1 9
	note G_, 7
	notetype1 3
	note G_, 8
	notetype1 4
	note C_, 7
	notetype1 9
	note E_, 7
	notetype1 3
	note E_, 8
	notetype1 4
	note E_, 8
	notetype1 9
	note C_, 7
	notetype1 3
	note C_, 8
	notetype1 4
	note C_, 7
	notetype1 9
	note G_, 7
	notetype1 3
	note G_, 8
	notetype1 9
	notetype2 4
	note F_, 7
	notetype2 5
	notetype1 4
	note G_, 8
	loopchannel 9, .Loop1
	notetype1 9
	note C_, 7
	notetype1 3
	note C_, 8
	notetype1 4
	note C_, 15
	notetype0 10
	note __, 9
	loopchannel 0, .MainLoop


Music_TCGDeckMachine_Ch2: 
	notetype2 8
	dutycycle 1
	notetype2 7
.MainLoop
	octave 3
	notetype0 1
.Loop1
	note __, 15
	notetype1 11
	note __, 7
	note C_, 8
	notetype1 2
	note C_, 8
	note __, 7
	notetype1 11
	note C_, 7
	notetype1 2
	note C_, 8
	note __, 7
	notetype1 11
	dec_octave
	note A_, 8
	notetype1 2
	note A_, 8
	note __, 7
	inc_octave
	notetype1 11
	note C_, 7
	notetype1 2
	note C_, 8
	note __, 15
	loopchannel 9, .Loop1
	notetype1 11
	note E_, 7
	notetype1 2
	note E_, 8
	note __, 15
	notetype0 10
	note __, 9
	loopchannel 0, .MainLoop


Music_TCGDeckMachine_Ch3: 
	notetype1 1
	notetype2 11
.MainLoop
	octave 3
	notetype0 1
.Loop1
	note C_, 7
	note __, 8
	note G_, 7
	inc_octave
	note G_, 8
	note __, 7
	dec_octave
	note C_, 8
	inc_octave
	note E_, 7
	dec_octave
	note C_, 8
	note D_, 7
	inc_octave
	note C_, 8
	dec_octave
	note __, 7
	note A_, 8
	inc_octave
	note G_, 7
	dec_octave
	dec_octave
	note A_, 8
	inc_octave
	note D_, 7
	note __, 8
	note E_, 7
	note __, 8
	note G_, 7
	inc_octave
	note G_, 8
	note __, 7
	dec_octave
	note E_, 8
	inc_octave
	note E_, 7
	dec_octave
	note C_, 8
	note F_, 7
	inc_octave
	note C_, 8
	note __, 7
	dec_octave
	note F_, 8
	inc_octave
	note G_, 7
	dec_octave
	note E_, 8
	note D_, 7
	note __, 8
	loopchannel 4, .Loop1
	note C_, 7
	note __, 8
	note G_, 7
	inc_octave
	note G_, 8
	note __, 7
	dec_octave
	note C_, 8
	inc_octave
	note E_, 7
	dec_octave
	dec_octave
	note G_, 8
	inc_octave
	note C_, 7
	inc_octave
	note C_, 8
	note __, 7
	dec_octave
	note F_, 8
	inc_octave
	note G_, 7
	dec_octave
	note E_, 8
	note D_, 7
	note __, 8
	note C_, 15
	note __, 15
	notetype0 10
	note __, 3
	notetype0 1
	note __, 7
	dec_octave
	note G_, 15
	note __, 8
	note A_, 7
	note __, 8
	note B_, 7
	note __, 8
	loopchannel 0, .MainLoop


Music_TCGDeckMachine_Ch4: 
	togglenoise $06
	notetype 1
	octave 1
.MainLoop
.Loop1
	callchannel Branch_f7031
	note E_, 15
	note C#, 7
	note D#, 8
	note E_, 15
	loopchannel 9, .Loop1
	callchannel Branch_f7031
	note E_, 7
	note D_, 4
	note D_, 4
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	loopchannel 0, .MainLoop

Branch_f7031:
	note C_, 7
	note D#, 8
	note E_, 15
	note C#, 7
	note D#, 8
	note E_, 15
	note C_, 7
	note D#, 8
	endchannel

