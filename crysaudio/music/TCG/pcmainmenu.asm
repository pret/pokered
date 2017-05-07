Music_TCGPCMainMenu:
	db $C0
	dw Music_TCGPCMainMenu_Ch1
	db $01
	dw Music_TCGPCMainMenu_Ch2
	db $02
	dw Music_TCGPCMainMenu_Ch3
	db $03
	dw Music_TCGPCMainMenu_Ch4

Music_TCGPCMainMenu_Ch1: 
	notetype0 7
	notetype2 8
	octave 3
	dutycycle 2
.MainLoop
	callchannel Branch_f90c2
	note __, 4
	dec_octave
	dutycycle 1
	notetype2 5
	notetype1 6
	note F_, 1
	note __, 1
	dutycycle 2
	notetype2 8
	notetype1 12
	note A_, 1
	notetype1 3
	note A_, 1
	note __, 2
	inc_octave
	notetype1 12
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	dutycycle 1
	notetype2 5
	notetype1 6
	note F_, 1
	note __, 1
	dutycycle 2
	notetype2 8
	notetype1 12
	note B_, 1
	notetype1 3
	note B_, 1
	callchannel Branch_f90c2
	note __, 4
	dec_octave
	dutycycle 1
	notetype2 5
	notetype1 6
	note F_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype2 8
	notetype1 12
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 2
	notetype1 12
	note C_, 1
	notetype1 3
	note C_, 1
	dutycycle 1
	notetype2 5
	notetype1 6
	dec_octave
	note F_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype2 8
	notetype1 12
	note D_, 1
	notetype1 3
	note D_, 1
	loopchannel 0, .MainLoop

Branch_f90c2:
	octave 3
	note __, 4
	dutycycle 1
	notetype1 6
	notetype2 5
	note G_, 1
	note __, 3
	notetype2 8
	dutycycle 2
	notetype1 12
	note B_, 2
	inc_octave
	note D_, 1
	notetype1 2
	note D_, 1
	dec_octave
	dutycycle 1
	notetype1 6
	notetype2 5
	note G_, 1
	note __, 1
	inc_octave
	dutycycle 2
	notetype2 8
	notetype1 12
	note C_, 1
	notetype1 3
	note C_, 1
	endchannel


Music_TCGPCMainMenu_Ch2: 
	notetype0 7
	notetype2 8
	octave 3
	dutycycle 2
.MainLoop
	callchannel Branch_f915e
	note __, 4
	inc_octave
	dutycycle 1
	notetype2 5
	notetype1 6
	note C_, 1
	note __, 1
	dec_octave
	dutycycle 2
	notetype2 8
	notetype1 8
	note F_, 1
	notetype1 2
	note F_, 1
	note __, 2
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	dutycycle 1
	notetype2 5
	notetype1 6
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
	dutycycle 2
	notetype2 8
	notetype1 8
	note G_, 1
	notetype1 2
	note G_, 1
	callchannel Branch_f915e
	note __, 4
	inc_octave
	dutycycle 1
	notetype2 5
	notetype1 6
	note C_, 1
	note __, 1
	dutycycle 2
	notetype2 8
	notetype1 8
	note C_, 1
	notetype1 2
	note C_, 1
	note __, 2
	dec_octave
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	dutycycle 1
	inc_octave
	notetype1 6
	notetype2 5
	note C_, 1
	note __, 1
	dec_octave
	dutycycle 2
	notetype2 8
	notetype1 8
	note B_, 1
	notetype1 2
	note B_, 1
	loopchannel 0, .MainLoop

Branch_f915e:
	octave 4
	note __, 4
	dutycycle 1
	notetype2 5
	notetype1 6
	note D_, 1
	note __, 3
	dutycycle 2
	notetype2 8
	dec_octave
	notetype1 8
	note G_, 2
	note B_, 1
	notetype1 2
	note B_, 1
	inc_octave
	dutycycle 1
	notetype2 5
	notetype1 6
	note D_, 1
	note __, 1
	dec_octave
	dutycycle 2
	notetype2 8
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	endchannel


Music_TCGPCMainMenu_Ch3: 
	notetype0 7
	notetype1 1
	notetype2 11
.MainLoop
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	note C_, 1
	note C#, 2
	note D_, 2
	dec_octave
	note G_, 1
	note F#, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	notetype0 1
	note G#, 4
	note A_, 3
	notetype0 7
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note B_, 2
	inc_octave
	note C_, 2
	dec_octave
	note F_, 1
	note F#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype0 1
	note A#, 4
	note B_, 3
	notetype0 7
	note B_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	note C_, 1
	note C#, 2
	note D_, 2
	dec_octave
	note G_, 1
	note F#, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	notetype0 1
	note B_, 4
	inc_octave
	note C_, 3
	notetype0 7
	note C_, 1
	note __, 1
	notetype0 1
	note F#, 4
	note G_, 3
	notetype0 7
	note G_, 1
	note F_, 1
	note C_, 2
	note F_, 2
	notetype0 1
	note C_, 3
	dec_octave
	note B_, 3
	note A#, 3
	note A_, 3
	note G#, 2
	notetype0 7
	loopchannel 0, .MainLoop


Music_TCGPCMainMenu_Ch4: 
	togglenoise $06
	notetype 7
	octave 1
.MainLoop
.Loop1
	callchannel Branch_f9248
	note D#, 1
	note C_, 1
	note C#, 2
	note D#, 1
	note E_, 1
	loopchannel 7, .Loop1
	callchannel Branch_f9248
	note E_, 1
	notetype 1
	note D_, 4
	note D_, 3
	notetype 7
	note C#, 2
	note C#, 1
	note C#, 1
	loopchannel 0, .MainLoop

Branch_f9248:
	note C_, 2
	note D#, 1
	note D#, 1
	note C#, 2
	note D#, 1
	note E_, 1
	note C_, 1
	note D_, 1
	endchannel

