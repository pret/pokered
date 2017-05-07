Music_TCGCardPop:
	db $C0
	dw Music_TCGCardPop_Ch1
	db $01
	dw Music_TCGCardPop_Ch2
	db $02
	dw Music_TCGCardPop_Ch3
	db $03
	dw Music_TCGCardPop_Ch4

Music_TCGCardPop_Ch1: 
	notetype0 4
	notetype2 8
	dutycycle 2
	notetype1 9
.MainLoop
.Loop1
	note __, 16
	loopchannel 7, .Loop1
	note __, 14
.Loop2
	octave 5
	notetype2 8
	note F#, 1
	note G_, 1
	notetype2 6
	note F#, 1
	notetype1 3
	note F#, 1
	notetype1 9
	note D_, 1
	notetype1 3
	note F#, 1
	dec_octave
	notetype1 9
	note A_, 1
	inc_octave
	notetype1 3
	note D_, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note A_, 1
	notetype1 9
	note F#, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note D_, 1
	notetype1 3
	note G_, 1
	dec_octave
	notetype1 9
	note A_, 1
	notetype1 3
	inc_octave
	note D_, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note A_, 1
	notetype1 9
	note F#, 1
	notetype1 3
	note G_, 1
	note __, 1
	note F#, 1
	note __, 12
	note __, 16
	note __, 14
	octave 5
	notetype1 9
	notetype2 8
	note E_, 1
	note F_, 1
	notetype2 6
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 9
	note C_, 1
	notetype1 3
	note E_, 1
	dec_octave
	notetype1 9
	note G_, 1
	inc_octave
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 9
	note F_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note E_, 1
	notetype1 3
	note F_, 1
	notetype1 9
	note C_, 1
	notetype1 3
	note E_, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	inc_octave
	note C_, 1
	dec_octave
	notetype1 9
	note F_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note E_, 1
	notetype1 3
	note F_, 1
	note __, 1
	note E_, 1
	note __, 12
	note __, 16
	notetype1 9
	note __, 14
	loopchannel 2, .Loop2
	note __, 2
	loopchannel 0, .MainLoop


Music_TCGCardPop_Ch2: 
	notetype0 4
	notetype2 8
	dutycycle 2
	notetype1 6
	notetype2 3
.Loop1
	octave 2
	note A_, 2
	inc_octave
	note A_, 2
	inc_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	inc_octave
	note A_, 2
	dec_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	inc_octave
	note A_, 2
	dec_octave
	dec_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	note A_, 2
	inc_octave
	note A_, 2
	inc_octave
	note A_, 2
	dec_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	inc_octave
	note A_, 2
	loopchannel 2, .Loop1
.Loop2
	octave 2
	note G_, 2
	inc_octave
	note G_, 2
	inc_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	inc_octave
	note G_, 2
	dec_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	inc_octave
	note G_, 2
	dec_octave
	dec_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	note G_, 2
	inc_octave
	note G_, 2
	inc_octave
	note G_, 2
	dec_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	inc_octave
	note G_, 2
	loopchannel 2, .Loop2
	loopchannel 0, Music_TCGCardPop_Ch2


Music_TCGCardPop_Ch3: 
	notetype0 4
	notetype2 11
	notetype1 1
	callchannel Branch_f715b
	note C_, 2
	note C#, 2
	callchannel Branch_f715b
	note D_, 2
	note C#, 2
	callchannel Branch_f716c
	note D_, 2
	note C#, 2
	callchannel Branch_f716c
	note C_, 2
	note C#, 2
	loopchannel 0, Music_TCGCardPop_Ch3

Branch_f715b:
	octave 2
	note D_, 2
	note __, 2
	note D_, 4
	inc_octave
	note D_, 2
	dec_octave
	note D_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	note G#, 2
	note __, 2
	note A_, 2
	endchannel

Branch_f716c:
	octave 2
	note C_, 2
	note __, 2
	note C_, 4
	inc_octave
	note C_, 2
	dec_octave
	note C_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
	endchannel


Music_TCGCardPop_Ch4: 
	togglenoise $06
.MainLoop
	notetype 4
	octave 1
.Loop1
	callchannel Branch_f7196
	note E_, 4
	note C#, 2
	note D#, 2
	note E_, 2
	note C#, 2
	loopchannel 11, .Loop1
	callchannel Branch_f7196
	note E_, 2
	note D_, 1
	note D_, 1
.Loop2
	note C#, 2
	loopchannel 4, .Loop2
	loopchannel 0, .MainLoop

Branch_f7196:
	note C_, 2
	note D#, 2
	note E_, 4
	note C#, 2
	note D#, 2
	note E_, 2
	note C#, 2
	note C_, 2
	note C#, 2
	endchannel

