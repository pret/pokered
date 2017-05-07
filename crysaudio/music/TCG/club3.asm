Music_TCGClub3:
	db $C0
	dw Music_TCGClub3_Ch1
	db $01
	dw Music_TCGClub3_Ch2
	db $02
	dw Music_TCGClub3_Ch3
	db $03
	dw Music_TCGClub3_Ch4

Music_TCGClub3_Ch1: 
	notetype0 9
	vibrato 20, $33
	notetype2 8
.MainLoop
	dutycycle 0
.Loop1
	octave 2
	notetype1 9
	note __, 4
	note G_, 2
	notetype1 3
	note G_, 1
	inc_octave
	notetype1 9
	note C_, 1
	notetype1 3
	note C_, 2
	dec_octave
	notetype1 9
	note A#, 6
	note A#, 12
	notetype1 3
	note A#, 4
	note __, 4
	notetype1 9
	note G_, 2
	notetype1 3
	note G_, 1
	inc_octave
	notetype1 9
	notetype0 1
	note C_, 5
	note C#, 4
	notetype0 9
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 9
	note A#, 6
	note A#, 12
	notetype1 3
	note A#, 4
	loopchannel 2, .Loop1
	dutycycle 1
	notetype1 9
	notetype2 7
	callchannel Branch_fa330
	callchannel Branch_fa403
	note A#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note D_, 1
	note D#, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	inc_octave
	notetype2 8
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 4
	notetype0 9
	notetype1 8
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	notetype1 9
	notetype2 7
	callchannel Branch_fa330
	callchannel Branch_fa403
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note C#, 1
	note D_, 1
	inc_octave
	note F#, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	octave 4
	dutycycle 2
	notetype1 7
	notetype0 1
	notetype2 8
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	dutycycle 1
	notetype2 7
	notetype0 9
	callchannel Branch_fa370
	callchannel Branch_fa403
	note A#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note D_, 1
	note D#, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	inc_octave
	notetype2 8
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 4
	notetype0 9
	notetype1 8
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	callchannel Branch_fa370
	callchannel Branch_fa403
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note C_, 1
	note C#, 1
	inc_octave
	note F#, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	inc_octave
	dutycycle 2
	notetype0 1
	notetype2 8
	notetype1 7
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	notetype0 9
	notetype2 8
	loopchannel 0, .MainLoop

Branch_fa330:
	octave 2
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note C#, 1
	note C_, 1
	dec_octave
	note D_, 1
	note A#, 1
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	note A#, 1
	dec_octave
	notetype0 1
	notetype2 8
	note F_, 5
	note F#, 4
	notetype0 9
	notetype2 7
	note G_, 1
	inc_octave
	note E_, 1
	dec_octave
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	note E_, 1
	dec_octave
	note D_, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	note A#, 1
	inc_octave
	note C_, 1
	dec_octave
	note F_, 1
	note F#, 1
	endchannel

Branch_fa370:
	octave 2
	notetype1 9
	notetype2 7
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note C#, 1
	note C_, 1
	dec_octave
	note D_, 1
	note A#, 1
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	note A#, 1
	dec_octave
	notetype0 1
	notetype2 8
	note F_, 5
	note F#, 4
	octave 4
	dutycycle 2
	notetype1 7
	note G_, 3
	notetype1 1
	note G_, 2
	inc_octave
	notetype1 7
	note D_, 2
	notetype1 1
	dec_octave
	note G_, 2
	inc_octave
	notetype1 7
	note G_, 3
	notetype1 1
	note D_, 2
	notetype1 7
	note D_, 2
	notetype1 1
	note G_, 2
	dec_octave
	notetype1 7
	note G_, 3
	notetype1 1
	inc_octave
	note D_, 2
	notetype1 7
	note D_, 2
	notetype1 1
	dec_octave
	note G_, 2
	inc_octave
	notetype1 7
	note G_, 3
	notetype1 1
	note D_, 2
	notetype1 7
	note D_, 2
	notetype1 1
	note G_, 2
	notetype0 9
	dutycycle 1
	notetype2 7
	notetype1 9
	octave 2
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	note E_, 1
	dec_octave
	note D_, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	octave 5
	dutycycle 2
	notetype0 1
	notetype2 8
	notetype1 7
	octave 5
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	notetype0 9
	dutycycle 1
	notetype2 7
	notetype1 9
	endchannel

Branch_fa403:
	octave 2
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note C#, 1
	note C_, 1
	dec_octave
	note D_, 1
	note A#, 1
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	note A#, 1
	dec_octave
	notetype0 1
	notetype2 8
	note F_, 5
	note F#, 4
	notetype0 9
	notetype2 7
	note G_, 1
	endchannel


Music_TCGClub3_Ch2: 
	notetype0 9
	vibrato 20, $33
	notetype2 8
.MainLoop
	dutycycle 0
.Loop1
	octave 2
	notetype1 7
	note __, 4
	note D_, 2
	notetype1 3
	note D_, 1
	notetype1 7
	note F_, 1
	notetype1 3
	note F_, 2
	notetype1 7
	note E_, 6
	note E_, 12
	notetype1 3
	note E_, 4
	note __, 4
	notetype1 7
	note D_, 2
	notetype1 3
	note D_, 1
	notetype1 7
	notetype0 1
	note F_, 5
	note F#, 4
	notetype0 9
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 7
	note E_, 6
	note E_, 12
	notetype1 3
	note E_, 4
	loopchannel 2, .Loop1
	dutycycle 1
.Loop2
	callchannel Branch_fa5a6
	notetype0 9
	note __, 1
	inc_octave
	notetype1 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 1
	notetype1 3
	note F_, 2
	dec_octave
	notetype1 9
	note D_, 1
	inc_octave
	inc_octave
	notetype1 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype1 9
	notetype0 9
	note __, 1
	dec_octave
	notetype0 1
	notetype2 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	notetype1 3
	note A#, 4
	inc_octave
	inc_octave
	notetype1 9
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 8
	note __, 1
	dec_octave
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note A#, 1
	notetype1 3
	note A#, 2
	inc_octave
	notetype1 9
	note C#, 1
	notetype1 3
	note C#, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	dec_octave
	notetype0 1
	notetype1 8
	note A#, 5
	notetype1 3
	note C_, 4
	notetype0 9
	note __, 1
	dec_octave
	notetype1 8
	notetype2 8
	note A#, 1
	note B_, 1
	inc_octave
	note C_, 1
	callchannel Branch_fa5a6
	notetype0 9
	note __, 1
	inc_octave
	notetype0 1
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 1
	notetype1 3
	note F_, 2
	notetype1 9
	note D_, 1
	inc_octave
	notetype1 8
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 4
	notetype0 9
	note __, 1
	dec_octave
	dec_octave
	notetype0 1
	notetype1 8
	note G_, 5
	notetype1 3
	note G_, 4
	inc_octave
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	note __, 1
	note __, 1
	notetype0 1
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note C#, 1
	notetype1 3
	note C#, 2
	notetype1 9
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 8
	notetype0 1
	note F_, 5
	notetype1 3
	note F_, 4
	notetype1 8
	notetype0 9
	note __, 1
	dec_octave
	notetype2 8
	note D_, 1
	note D#, 1
	note E_, 1
	loopchannel 2, .Loop2
	loopchannel 0, .MainLoop

Branch_fa5a6:
	octave 3
	note __, 1
	notetype1 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype1 8
	notetype2 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype2 7
	notetype1 9
	note G_, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 1
	notetype1 3
	note F_, 2
	notetype1 9
	note E_, 1
	inc_octave
	notetype1 8
	notetype2 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype1 8
	notetype0 9
	note __, 1
	dec_octave
	notetype0 1
	notetype2 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	notetype1 3
	note A#, 4
	notetype1 8
	inc_octave
	inc_octave
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	note __, 1
	dec_octave
	notetype0 1
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype1 8
	notetype2 8
	note F_, 5
	note F#, 4
	notetype0 9
	inc_octave
	notetype1 9
	notetype2 7
	note A#, 1
	notetype1 3
	note A#, 2
	inc_octave
	notetype1 9
	note C#, 1
	notetype1 3
	note C#, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	dec_octave
	notetype1 9
	note A#, 1
	notetype1 3
	note A#, 1
	notetype2 8
	notetype1 8
	note A#, 1
	notetype1 3
	note A#, 2
	endchannel


Music_TCGClub3_Ch3: 
	notetype0 9
	notetype1 1
	notetype2 11
.Loop1
	octave 2
	note G_, 1
	note __, 1
	note G_, 14
	note __, 1
	inc_octave
	note F_, 1
	note __, 2
	note G_, 1
	note __, 2
	dec_octave
	note G_, 1
	note __, 1
	note E_, 3
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	loopchannel 4, .Loop1
.Loop2
	octave 2
	note G_, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	inc_octave
	note F_, 1
	note G_, 1
	note __, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	octave 2
	note E_, 1
	note F_, 1
	octave 5
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	inc_octave
	note F_, 1
	note G_, 1
	note __, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note G_, 1
	note __, 1
	inc_octave
	note F_, 1
	note __, 1
	note E_, 1
	octave 2
	note F_, 1
	note F#, 1
	note D#, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note D#, 1
	inc_octave
	note D_, 1
	note D#, 1
	note __, 1
	dec_octave
	note D#, 1
	note __, 1
	inc_octave
	note D#, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	octave 2
	note C_, 1
	note C#, 1
	octave 5
	note G_, 1
	octave 2
	note D#, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note D#, 1
	inc_octave
	note D_, 1
	note D#, 1
	note __, 1
	dec_octave
	note D#, 1
	note __, 1
	inc_octave
	note D#, 1
	note __, 1
	inc_octave
	note F_, 1
	note __, 1
	dec_octave
	note D_, 1
	note D#, 1
	note E_, 1
	dec_octave
	note C_, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note C_, 1
	note A#, 1
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
	note C_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	octave 2
	note A_, 1
	note A#, 1
	octave 5
	note G_, 1
	octave 2
	note C_, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note C_, 1
	note A#, 1
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
	note C_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	inc_octave
	note F_, 1
	note __, 1
	note E_, 1
	octave 2
	note A#, 1
	note B_, 1
	note D_, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note D_, 1
	inc_octave
	note C_, 1
	note D_, 1
	note __, 1
	dec_octave
	note D_, 1
	note __, 1
	inc_octave
	note D_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 3
	note A#, 1
	dec_octave
	note C_, 1
	note C#, 1
	note D_, 1
	octave 4
	note G_, 1
	note __, 1
	octave 2
	note D_, 1
	inc_octave
	note C_, 1
	note D_, 1
	note __, 1
	dec_octave
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	inc_octave
	note A#, 1
	note __, 1
	dec_octave
	note A#, 1
	note B_, 1
	inc_octave
	note C_, 1
	loopchannel 2, .Loop2
	loopchannel 0, Music_TCGClub3_Ch3


Music_TCGClub3_Ch4: 
	togglenoise $06
	notetype 9
	octave 1
.MainLoop
.Loop1
	callchannel Branch_fa796
	note C#, 2
	note E_, 2
	callchannel Branch_fa796
	note C#, 2
	note D#, 1
	note C#, 1
	loopchannel 3, .Loop1
	callchannel Branch_fa796
	note C#, 2
	note E_, 2
	callchannel Branch_fa796
	note C#, 1
	notetype 1
	note D#, 5
	note C#, 4
	notetype 9
	note C#, 1
	note C#, 1
	loopchannel 0, .MainLoop

Branch_fa796:
	note C_, 2
	note D#, 2
	note C#, 2
	note D#, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note E_, 1
	note C_, 1
	endchannel

