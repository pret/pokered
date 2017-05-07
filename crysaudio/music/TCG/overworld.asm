Music_TCGOverworld:
	db $C0
	dw Music_TCGOverworld_Ch1
	db $01
	dw Music_TCGOverworld_Ch2
	db $02
	dw Music_TCGOverworld_Ch3
	db $03
	dw Music_TCGOverworld_Ch4

Music_TCGOverworld_Ch1: 
	notetype0 7
	dutycycle 0
	vibrato 25, $33
	notetype1 10
	notetype2 7
	octave 3
	note __, 3
	callchannel Branch_f72ba
	note __, 3
.MainLoop
	callchannel Branch_f72ba
	dutycycle 1
	notetype2 8
	octave 3
	notetype1 10
	note A_, 5
	notetype1 3
	note A_, 1
	inc_octave
	notetype1 10
	note C_, 5
	notetype1 3
	note C_, 1
	notetype1 10
	note F_, 3
	notetype0 1
	note E_, 11
	notetype1 3
	note E_, 10
	notetype1 10
	notetype0 7
	note G_, 3
	notetype0 1
	note F_, 11
	notetype1 3
	note F_, 10
	notetype0 7
	notetype1 10
	note C_, 12
	notetype1 3
	note C_, 2
	dutycycle 0
	notetype1 9
	notetype2 7
	octave 3
	note E_, 4
	note E_, 3
	note E_, 3
	dutycycle 1
	notetype1 10
	notetype2 8
	callchannel Branch_f72fb
	note C_, 6
	notetype1 3
	note C_, 6
	notetype1 10
	note C_, 3
	note D_, 3
	note E_, 3
	note G_, 6
	notetype1 3
	note G_, 3
	notetype1 10
	note F_, 4
	notetype1 3
	note F_, 2
	notetype1 10
	note C_, 3
	dec_octave
	note A_, 6
	note A#, 9
	notetype1 3
	note A#, 6
	notetype1 10
	note A#, 3
	inc_octave
	note D_, 3
	note F_, 3
	note A_, 3
	notetype1 3
	note A_, 6
	notetype1 10
	note G_, 3
	notetype1 3
	note G_, 3
	notetype1 10
	note E_, 3
	note D_, 3
	notetype1 3
	note D_, 3
	notetype1 10
	note E_, 2
	notetype1 3
	note E_, 1
	notetype1 10
	notetype2 8
	note C_, 9
	notetype1 3
	note C_, 3
	notetype1 10
	dec_octave
	note A_, 3
	inc_octave
	notetype0 1
	note C_, 11
	notetype1 4
	note C_, 10
	notetype0 7
	notetype1 10
	note G_, 3
	notetype0 1
	note F_, 11
	notetype1 4
	note F_, 10
	notetype0 7
	notetype1 10
	note C_, 12
	notetype1 3
	note C_, 6
	dutycycle 2
	notetype2 8
	notetype1 6
	octave 4
	note G_, 1
	note E_, 1
	note C_, 1
	dec_octave
	note G_, 1
	note E_, 1
	note C_, 1
	dutycycle 1
	notetype1 10
	notetype2 8
	callchannel Branch_f72fb
	note C_, 6
	notetype1 3
	note C_, 6
	notetype1 10
	note C_, 3
	note D_, 3
	note E_, 3
	note F_, 9
	notetype1 3
	note F_, 12
	notetype1 10
	note F_, 2
	note G_, 1
	note A_, 1
	notetype1 3
	note A_, 2
	notetype1 10
	note A_, 12
	notetype1 3
	note A_, 3
	notetype1 10
	note D_, 3
	note A_, 3
	note A#, 9
	notetype1 3
	note A#, 6
	notetype1 10
	note A_, 5
	notetype1 3
	note A_, 1
	notetype1 10
	note G_, 5
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	notetype1 3
	note F_, 3
	dutycycle 0
	notetype1 10
	notetype2 7
	loopchannel 0, .MainLoop

Branch_f72ba:
	octave 3
	note F_, 3
	note F_, 2
	note A_, 1
	inc_octave
	notetype1 10
	notetype2 4
	note C_, 1
	note __, 1
	dec_octave
	notetype1 9
	notetype2 7
	note A#, 3
	note A#, 1
	inc_octave
	notetype1 10
	notetype2 4
	note D_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note G_, 3
	note A#, 3
	note __, 3
	note A_, 3
	note A_, 2
	inc_octave
	note C_, 1
	notetype1 10
	notetype2 4
	note C_, 1
	note __, 1
	dec_octave
	notetype1 9
	notetype2 7
	note A#, 3
	note A#, 1
	inc_octave
	notetype1 10
	notetype2 4
	note D_, 1
	note __, 2
	notetype1 9
	notetype2 7
	note C_, 3
	dec_octave
	note A#, 3
	endchannel

Branch_f72fb:
	octave 4
	notetype1 10
	note D_, 5
	notetype1 3
	note D_, 1
	notetype1 10
	note F_, 5
	notetype1 3
	note F_, 1
	notetype1 10
	note A_, 3
	notetype0 1
	note G_, 11
	notetype1 3
	note G_, 10
	notetype0 7
	inc_octave
	notetype1 10
	note C_, 3
	dec_octave
	notetype0 1
	note A#, 11
	notetype1 3
	note A#, 10
	notetype0 7
	notetype1 10
	note C#, 12
	notetype1 3
	note C#, 6
	notetype1 10
	note D#, 3
	notetype0 1
	note C#, 11
	notetype1 3
	note C#, 10
	notetype1 10
	notetype0 7
	endchannel


Music_TCGOverworld_Ch2: 
	notetype0 7
	dutycycle 0
	vibrato 30, $33
	notetype2 7
	octave 3
	callchannel Branch_f7535
.MainLoop
	callchannel Branch_f7535
	notetype1 9
	notetype2 7
	note __, 3
	note C_, 5
	note C_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note C_, 4
	note C_, 3
	note C_, 3
	note __, 3
	note C_, 5
	note C_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note G_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note D_, 4
	note D_, 3
	note C_, 3
	note __, 3
	dec_octave
	note A#, 5
	inc_octave
	note D_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note C_, 4
	note C_, 3
	dec_octave
	note A#, 3
	note __, 3
	note A#, 5
	inc_octave
	note C#, 3
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note C#, 4
	dec_octave
	note F_, 3
	note A#, 3
	note __, 3
	inc_octave
	note C_, 3
	note E_, 2
	note C_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note G_, 1
	notetype2 7
	notetype1 6
	notetype2 8
	octave 3
	note E_, 3
	note F_, 3
	note G_, 3
	notetype2 7
	note A#, 6
	notetype1 9
	notetype2 7
	octave 3
	note D_, 3
	notetype1 6
	notetype2 8
	octave 3
	note A_, 3
	notetype1 9
	notetype2 7
	octave 2
	note A_, 2
	inc_octave
	inc_octave
	notetype1 9
	notetype2 4
	note F_, 1
	dec_octave
	note __, 2
	notetype1 9
	notetype2 7
	note D_, 4
	note D_, 3
	dec_octave
	note A_, 3
	note __, 3
	note A#, 3
	inc_octave
	note D_, 2
	dec_octave
	note A#, 3
	notetype1 9
	notetype2 4
	inc_octave
	inc_octave
	note F_, 1
	note __, 2
	dec_octave
	dec_octave
	notetype1 9
	notetype2 7
	note A#, 4
	note A#, 3
	note A#, 3
	note __, 3
	note A#, 3
	inc_octave
	note D_, 2
	dec_octave
	note A#, 3
	notetype1 9
	notetype2 4
	inc_octave
	note A_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note A#, 6
	inc_octave
	note D_, 1
	dec_octave
	note A#, 3
	note __, 3
	inc_octave
	note C_, 5
	note C_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 2
	notetype1 9
	notetype2 7
	dec_octave
	note C_, 4
	note C_, 3
	note C_, 3
	note __, 3
	note C_, 5
	note C_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note G_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note D_, 4
	dutycycle 2
	notetype1 6
	notetype2 8
	octave 4
	note C_, 1
	dec_octave
	note G_, 1
	note E_, 1
	note C_, 1
	dec_octave
	note G_, 1
	note E_, 1
	dutycycle 0
	notetype1 9
	notetype2 7
	octave 2
	note __, 3
	note A#, 5
	inc_octave
	note D_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note C_, 4
	note C_, 3
	dec_octave
	note A#, 3
	note __, 3
	note A#, 5
	inc_octave
	note C#, 3
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note C#, 4
	note C#, 3
	note C#, 3
	note __, 3
	note C_, 3
	dec_octave
	note A_, 2
	inc_octave
	note C_, 3
	notetype1 9
	notetype2 4
	inc_octave
	note G_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note C_, 4
	note E_, 3
	note C_, 3
	note __, 3
	note D_, 6
	dec_octave
	note B_, 2
	inc_octave
	inc_octave
	notetype1 9
	notetype2 4
	note F_, 1
	note __, 2
	dec_octave
	notetype1 9
	notetype2 7
	note D_, 4
	notetype1 6
	notetype2 8
	octave 4
	note D_, 2
	note E_, 1
	note F_, 1
	notetype1 2
	note F_, 2
	notetype1 6
	note F_, 11
	notetype1 9
	notetype2 7
	octave 4
	notetype1 9
	notetype2 4
	note F_, 1
	note __, 2
	dec_octave
	dec_octave
	notetype1 9
	notetype2 7
	note A#, 1
	notetype1 6
	notetype2 8
	octave 3
	note A#, 3
	inc_octave
	note F_, 3
	note G_, 9
	notetype1 9
	notetype2 7
	octave 3
	note D_, 2
	dec_octave
	note A#, 3
	inc_octave
	inc_octave
	notetype1 9
	notetype2 4
	note F_, 1
	notetype2 8
	notetype1 6
	octave 4
	note C_, 5
	notetype1 2
	note C_, 1
	dec_octave
	notetype1 9
	note A#, 5
	notetype1 2
	note A#, 1
	notetype1 9
	notetype2 7
	octave 3
	note __, 3
	note F_, 3
	note C_, 2
	note F_, 1
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 1
	dec_octave
	notetype1 9
	notetype2 7
	note G_, 3
	note G_, 3
	notetype0 1
	notetype1 9
	notetype2 8
	inc_octave
	note F_, 4
	note C_, 3
	notetype0 7
	dec_octave
	notetype1 9
	notetype2 7
	note E_, 3
	note G_, 2
	inc_octave
	notetype1 9
	notetype2 4
	note F_, 1
	notetype1 9
	notetype2 7
	dec_octave
	note __, 3
	note A_, 3
	note F_, 2
	note A_, 1
	inc_octave
	notetype1 9
	notetype2 4
	note F_, 1
	note __, 1
	dec_octave
	notetype1 9
	notetype2 7
	note G_, 3
	note G_, 3
	notetype0 1
	notetype1 9
	notetype2 8
	inc_octave
	note F_, 4
	note C_, 3
	dec_octave
	notetype0 7
	notetype1 9
	notetype2 7
	note A_, 3
	note G_, 2
	inc_octave
	notetype1 9
	notetype2 4
	note F_, 1
	loopchannel 0, .MainLoop

Branch_f7535:
	octave 3
	notetype1 9
	notetype2 7
	note __, 3
	note C_, 3
	note C_, 2
	note F_, 1
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 1
	dec_octave
	notetype1 9
	notetype2 7
	note G_, 3
	note G_, 1
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 1
	dec_octave
	notetype2 8
	notetype0 1
	inc_octave
	note F_, 4
	note C_, 3
	notetype0 7
	notetype1 9
	notetype2 7
	dec_octave
	note E_, 3
	note G_, 2
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	dec_octave
	note __, 3
	notetype1 9
	notetype2 8
	note F_, 3
	note F_, 2
	note A_, 1
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 1
	dec_octave
	notetype1 9
	notetype2 7
	note G_, 3
	note G_, 1
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	note __, 1
	dec_octave
	notetype2 8
	notetype0 1
	inc_octave
	note F_, 4
	note C_, 3
	notetype0 7
	notetype1 9
	notetype2 7
	dec_octave
	note A_, 3
	note G_, 2
	notetype1 9
	notetype2 4
	inc_octave
	note F_, 1
	dec_octave
	endchannel


Music_TCGOverworld_Ch3: 
	notetype0 7
	notetype1 1
	notetype2 11
	octave 2
	callchannel Branch_f77f8
	note F_, 2
	inc_octave
	note C_, 1
.MainLoop
	callchannel Branch_f77f8
	note F_, 3
	callchannel Branch_f7826
	octave 2
	note F_, 1
	note A#, 2
	note __, 1
	octave 4
	note C#, 2
	dec_octave
	note F_, 1
	note A#, 1
	note __, 1
	inc_octave
	note F_, 2
	note __, 1
	inc_octave
	note C#, 1
	octave 2
	note A#, 1
	note __, 1
	octave 4
	note G_, 1
	octave 2
	note A#, 1
	note __, 1
	note F_, 1
	inc_octave
	note A#, 2
	dec_octave
	note A#, 1
	octave 4
	note C#, 2
	octave 2
	note F_, 1
	note A_, 2
	note __, 1
	octave 4
	note E_, 2
	octave 2
	note A_, 1
	octave 4
	note G_, 2
	note E_, 1
	dec_octave
	note E_, 1
	note __, 1
	inc_octave
	inc_octave
	note E_, 1
	octave 2
	note A_, 1
	note __, 1
	inc_octave
	note A_, 1
	note __, 2
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	note E_, 1
	note C_, 1
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	note A_, 1
	dec_octave
	note D_, 2
	note __, 1
	octave 4
	note F_, 2
	octave 2
	note A_, 1
	inc_octave
	note D_, 2
	dec_octave
	note A_, 1
	octave 4
	note D_, 2
	inc_octave
	note C_, 1
	octave 2
	note D_, 2
	octave 4
	note F_, 2
	note __, 1
	octave 2
	note A_, 1
	octave 4
	note F_, 2
	octave 2
	note D_, 1
	octave 4
	note D_, 2
	octave 2
	note A_, 1
	note G_, 2
	note __, 1
	octave 4
	note D_, 2
	octave 2
	note G_, 1
	octave 4
	note F_, 2
	note D_, 1
	dec_octave
	note D_, 1
	note __, 1
	inc_octave
	note A#, 1
	octave 2
	note G_, 1
	note __, 1
	octave 4
	note D_, 2
	note __, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 2
	octave 2
	note G_, 1
	octave 4
	note D_, 2
	dec_octave
	note D_, 1
	note C_, 2
	note __, 1
	inc_octave
	note D_, 2
	octave 2
	note G_, 1
	octave 4
	note F_, 2
	note D_, 1
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note F_, 1
	dec_octave
	note C_, 1
	note __, 1
	inc_octave
	note D_, 2
	note __, 1
	octave 2
	note E_, 1
	inc_octave
	note C_, 1
	note __, 1
	inc_octave
	note F_, 1
	note E_, 2
	octave 2
	note E_, 1
	callchannel Branch_f7826
	octave 3
	note C_, 1
	note C#, 2
	note __, 1
	inc_octave
	note C#, 2
	octave 2
	note G#, 1
	inc_octave
	note C#, 1
	note __, 1
	inc_octave
	note F_, 2
	note __, 1
	inc_octave
	note C#, 1
	octave 3
	note C#, 1
	note __, 1
	inc_octave
	note G_, 1
	dec_octave
	note C#, 1
	note __, 1
	dec_octave
	note G#, 1
	octave 4
	note G_, 2
	dec_octave
	note C#, 1
	inc_octave
	note F_, 2
	octave 2
	note G#, 1
	inc_octave
	note C_, 2
	note __, 1
	inc_octave
	note E_, 2
	dec_octave
	note G_, 1
	inc_octave
	note C_, 2
	note E_, 1
	dec_octave
	note E_, 1
	note __, 1
	octave 5
	note E_, 1
	octave 3
	note C_, 1
	note __, 1
	inc_octave
	note E_, 2
	note __, 1
	octave 2
	note G_, 1
	octave 4
	note G_, 2
	dec_octave
	note C_, 1
	inc_octave
	note E_, 2
	octave 2
	note G_, 1
	note B_, 2
	note __, 1
	octave 4
	note F_, 2
	dec_octave
	note F_, 1
	note B_, 2
	note F_, 1
	inc_octave
	note D_, 2
	inc_octave
	note D_, 1
	octave 2
	note B_, 2
	octave 4
	note F_, 2
	note __, 1
	dec_octave
	note F_, 1
	note B_, 2
	note F_, 1
	dec_octave
	note B_, 2
	note __, 1
	note A#, 2
	note __, 1
	octave 4
	note D_, 2
	dec_octave
	note F_, 1
	note A#, 2
	note F_, 1
	inc_octave
	note F_, 2
	inc_octave
	note D_, 1
	octave 2
	note A#, 1
	note __, 1
	octave 4
	note D_, 1
	octave 2
	note A#, 1
	note __, 2
	note A#, 2
	inc_octave
	note F_, 1
	note A#, 1
	note __, 2
	note C_, 2
	note __, 1
	inc_octave
	note D_, 2
	octave 2
	note G_, 1
	octave 4
	note F_, 2
	note D_, 1
	octave 2
	note C_, 1
	note __, 1
	octave 5
	note D_, 1
	octave 3
	note C_, 1
	note __, 1
	inc_octave
	note D_, 2
	note __, 1
	octave 2
	note E_, 1
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	note E_, 1
	note C_, 1
	note __, 1
	note E_, 1
	note F_, 3
	octave 4
	note A_, 2
	dec_octave
	note C_, 1
	inc_octave
	note F_, 2
	note A_, 1
	inc_octave
	note C_, 1
	dec_octave
	note __, 1
	note A#, 2
	note __, 1
	note A#, 1
	inc_octave
	note D_, 1
	dec_octave
	note __, 2
	note G_, 2
	dec_octave
	note C_, 1
	inc_octave
	note A#, 2
	inc_octave
	note C_, 1
	octave 2
	note F_, 3
	octave 5
	note C_, 2
	octave 3
	note C_, 1
	inc_octave
	note A_, 2
	inc_octave
	note C_, 1
	note C_, 1
	note __, 1
	dec_octave
	note A#, 2
	note __, 1
	note A#, 1
	inc_octave
	note D_, 1
	note __, 2
	note C_, 2
	octave 3
	note C_, 1
	inc_octave
	note A#, 2
	dec_octave
	note C_, 1
	loopchannel 0, .MainLoop

Branch_f77f8:
	octave 2
	note F_, 3
	octave 4
	note A_, 2
	dec_octave
	note C_, 1
	note F_, 2
	note C_, 1
	note __, 2
	note F_, 1
	note __, 2
	note F_, 1
	note __, 2
	note C_, 1
	note F_, 2
	note C_, 1
	dec_octave
	note F_, 2
	inc_octave
	note C_, 1
	dec_octave
	note F_, 3
	octave 5
	note C_, 2
	octave 3
	note C_, 1
	note F_, 2
	note C_, 1
	note __, 2
	note F_, 1
	note __, 2
	note F_, 1
	note __, 2
	note C_, 1
	note F_, 2
	note C_, 1
	dec_octave
	endchannel

Branch_f7826:
	octave 2
	note F_, 2
	note __, 1
	octave 4
	note F_, 2
	dec_octave
	note C_, 1
	note F_, 1
	note __, 1
	inc_octave
	note F_, 2
	note __, 1
	inc_octave
	note C_, 1
	octave 2
	note F_, 1
	note __, 1
	octave 4
	note G_, 1
	octave 2
	note F_, 1
	note __, 1
	note C_, 1
	octave 4
	note G_, 2
	octave 2
	note F_, 1
	octave 4
	note F_, 2
	octave 2
	note G_, 1
	note A_, 2
	note __, 1
	octave 4
	note E_, 2
	dec_octave
	note E_, 1
	note A_, 1
	note __, 1
	inc_octave
	note E_, 2
	note __, 1
	inc_octave
	note C_, 1
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	octave 2
.Loop1
	note A_, 1
	note __, 1
	note E_, 1
	loopchannel 2, .Loop1
	note A_, 2
	note __, 1
	note A#, 2
	note __, 1
	octave 4
	note D_, 2
	dec_octave
	note F_, 1
	note A#, 1
	note __, 1
	inc_octave
	note F_, 2
	note __, 1
	inc_octave
	note D_, 1
	octave 2
	note A#, 1
	note __, 1
	octave 4
	note D_, 1
	octave 2
	note A#, 1
	note __, 1
	note F_, 1
	octave 4
	note D_, 2
	octave 2
	note A#, 1
	octave 4
	note D_, 2
	endchannel


Music_TCGOverworld_Ch4: 
	togglenoise $06
	notetype 7
	octave 1
	callchannel Branch_f78ee
	callchannel Branch_f78fb
.MainLoop
	callchannel Branch_f78ee
	note C_, 3
	note D#, 2
	note C_, 1
	note C#, 3
	note D#, 2
	note E_, 1
	note C_, 2
	note D#, 1
	note D#, 3
	note C#, 1
	note D#, 1
	note D#, 1
	note C#, 3
.Loop1
	callchannel Branch_f78ee
	callchannel Branch_f78fb
	loopchannel 3, .Loop1
	callchannel Branch_f78ee
	callchannel Branch_f790a
.Loop2
	callchannel Branch_f78ee
	callchannel Branch_f78fb
	loopchannel 3, .Loop2
	callchannel Branch_f78ee
	callchannel Branch_f790a
	callchannel Branch_f78ee
	callchannel Branch_f78fb
	loopchannel 0, .MainLoop

Branch_f78ee:
	note C_, 3
	note D#, 2
	note C_, 1
	note C#, 3
	note D#, 2
	note E_, 1
	note C_, 2
	note D#, 1
	note D#, 3
	note C#, 3
	note D#, 2
	note E_, 1
	endchannel

Branch_f78fb:
	note C_, 3
	note D#, 2
	note C_, 1
	note C#, 3
	note D#, 2
	note E_, 1
	note C_, 2
	note D#, 1
	note D#, 3
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 2
	note E_, 1
	endchannel

Branch_f790a:
	note C_, 3
	note D#, 2
	note C_, 1
	note C#, 3
	note D#, 2
	note E_, 1
	note C_, 2
	note D#, 1
	note D#, 3
	note C#, 1
	note D#, 1
	note D#, 1
	note C#, 2
	note C#, 1
	endchannel

