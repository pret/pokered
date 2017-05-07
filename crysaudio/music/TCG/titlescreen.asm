Music_TCGTitleScreen:
	db $C0
	dw Music_TCGTitleScreen_Ch1
	db $01
	dw Music_TCGTitleScreen_Ch2
	db $02
	dw Music_TCGTitleScreen_Ch3
	db $03
	dw Music_TCGTitleScreen_Ch4

Music_TCGTitleScreen_Ch1: 
	notetype0 7
	dutycycle 0
	vibrato 20, $33
	notetype1 10
	notetype2 8
	octave 3
	note G_, 1
	notetype1 3
	note G_, 1
	note __, 1
	notetype1 10
	notetype2 6
	note F_, 1
	notetype2 8
	note E_, 3
	notetype1 3
	note E_, 1
	notetype1 10
	note G_, 3
	notetype1 3
	note G_, 1
	inc_octave
	notetype1 10
	note D_, 5
	notetype1 3
	note D_, 1
	notetype1 13
	notetype2 6
	note C_, 2
	dec_octave
	notetype2 8
	note G_, 10
	notetype1 3
	note G_, 2
	notetype1 13
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	notetype1 10
	notetype2 6
	note G_, 1
	notetype2 8
	note G_, 5
	notetype1 3
	note G_, 1
	notetype1 10
	notetype2 6
	note F_, 2
	notetype2 8
	note F_, 2
	notetype0 1
	note E_, 5
	note F_, 4
	note E_, 5
	notetype0 7
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 10
	note C_, 1
	notetype1 3
	note C_, 1
	notetype1 10
	notetype2 8
	note D_, 11
	notetype1 3
	note D_, 1
	notetype1 13
	note G_, 1
	notetype1 3
	note G_, 1
	note __, 1
	notetype1 10
	notetype2 6
	note F_, 1
	notetype2 8
	note E_, 3
	notetype1 3
	note E_, 1
	notetype1 10
	note G_, 3
	notetype1 3
	note G_, 1
	inc_octave
	notetype1 10
	note D_, 5
	notetype1 3
	note D_, 1
	notetype1 13
	notetype2 6
	note E_, 2
	dec_octave
	notetype2 8
	note G_, 8
	notetype1 3
	note G_, 2
	notetype1 13
	note E_, 2
	note F_, 2
	note G_, 2
	note G#, 3
	notetype1 3
	note G#, 1
	notetype1 13
	inc_octave
	note C_, 3
	notetype1 3
	note C_, 1
	notetype1 10
	note D_, 5
	notetype1 3
	note D_, 1
	notetype1 13
	notetype2 6
	note C_, 2
	notetype2 8
	note G_, 9
	notetype1 3
	note G_, 1
	notetype1 13
	note F_, 2
	note C_, 2
	note D_, 2
.Loop1
	note E_, 10
	notetype1 3
	note E_, 2
	notetype1 10
	note E_, 1
	notetype1 3
	note E_, 1
	note __, 1
	notetype1 10
	notetype2 6
	note E_, 1
	notetype2 8
	loopchannel 2, .Loop1
	note E_, 12
	notetype1 3
	note E_, 2
	notetype1 10
	note D_, 1
	note C_, 1
	note D_, 1
	notetype1 3
	note D_, 1
	note __, 1
	notetype1 10
	notetype2 6
	note G_, 1
	notetype2 8
	note G_, 8
	notetype1 3
	note G_, 2
	notetype1 10
	notetype0 1
	notetype2 7
	note G_, 5
	note G_, 4
	note G_, 5
	notetype2 8
	notetype0 7
	note G_, 9
	notetype1 3
	note G_, 1
	notetype1 10
	note F_, 2
	note C_, 2
	note D_, 2
	note E_, 10
	notetype1 3
	note E_, 2
	notetype1 10
	note C_, 1
	notetype1 3
	note C_, 1
	note __, 1
	notetype2 6
	notetype1 10
	note E_, 1
	notetype2 8
	note E_, 6
	notetype1 3
	note E_, 2
	notetype1 10
	note D_, 3
	notetype1 3
	note D_, 1
	notetype1 10
	note C_, 3
	notetype1 3
	note C_, 1
	notetype1 10
	note C_, 6
	notetype1 3
	note C_, 2
	dec_octave
	notetype1 10
	note B_, 5
	notetype1 3
	note B_, 2
	notetype1 10
	inc_octave
	notetype2 6
	note C_, 1
	notetype2 8
	note C_, 8
	note C_, 8
	note C_, 8
	notetype1 3
	note C_, 8
	endchannel


Music_TCGTitleScreen_Ch2: 
	notetype0 7
	dutycycle 0
	vibrato 20, $33
	notetype1 8
	notetype2 8
	octave 2
	note B_, 1
	notetype1 2
	note B_, 1
	note __, 1
	inc_octave
	notetype1 8
	notetype2 6
	note D_, 1
	notetype2 8
	note C_, 3
	notetype1 2
	note C_, 1
	notetype1 8
	note E_, 3
	note __, 1
	note G_, 5
	note __, 1
	notetype2 6
	note G_, 2
	notetype2 8
	note E_, 10
	note __, 2
	note C_, 1
	note __, 2
	notetype2 6
	note E_, 1
	notetype2 8
	note F_, 5
	note __, 1
	notetype2 6
	note C_, 2
	notetype2 7
	note C_, 2
	notetype2 8
	note C_, 2
	dec_octave
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 4
	note A_, 1
	note __, 2
	inc_octave
	notetype2 6
	note C_, 1
	dec_octave
	notetype2 8
	note B_, 3
	note __, 1
	note B_, 1
	note __, 2
	inc_octave
	notetype2 6
	note D_, 1
	notetype2 8
	note C_, 3
	notetype1 2
	note C_, 1
	notetype1 8
	note E_, 3
	note __, 1
	note G_, 5
	note __, 1
	notetype2 6
	note G_, 2
	notetype2 8
	note E_, 8
	note __, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 3
	note __, 1
	note G#, 3
	note __, 1
	note G#, 5
	note __, 1
	notetype2 6
	note F_, 2
	notetype2 8
	note G#, 9
	note __, 1
	note G#, 2
	note F_, 2
	note G#, 2
	inc_octave
	note C_, 10
	note __, 2
	dec_octave
	note A_, 1
	notetype1 2
	note A_, 1
	note __, 1
	notetype1 8
	inc_octave
	notetype2 6
	note C_, 1
	notetype2 8
	dec_octave
	note B_, 10
	note __, 2
	note G_, 1
	notetype1 2
	note G_, 1
	note __, 1
	notetype1 8
	notetype2 6
	note B_, 1
	notetype2 8
	note A_, 12
	notetype1 2
	note A_, 2
	notetype1 8
	note B_, 1
	note A_, 1
	note B_, 1
	notetype1 2
	note B_, 1
	note __, 1
	notetype1 8
	inc_octave
	notetype2 6
	note D_, 1
	notetype2 8
	note D_, 8
	note __, 2
	notetype0 1
	notetype2 7
	note D_, 5
	note D_, 4
	note D_, 5
	notetype0 7
	notetype2 8
	note C_, 9
	note __, 1
	note C_, 2
	dec_octave
	notetype2 7
	note G#, 2
	notetype2 8
	note G#, 2
	note G_, 10
	note __, 2
	note G_, 1
	note __, 2
	notetype2 6
	note G_, 1
	notetype2 8
	note A_, 6
	note __, 2
	note F#, 3
	note __, 1
	note A_, 3
	note __, 1
	note F_, 6
	note __, 2
	note F_, 5
	note __, 2
	notetype2 6
	note F_, 1
	notetype2 8
	note F_, 7
	note __, 1
	notetype0 1
	notetype2 8
	note F_, 14
	note __, 5
	note D_, 13
	note __, 5
	note F_, 14
	note __, 5
	notetype0 7
	note E_, 8
	notetype1 2
	note E_, 8
	endchannel


Music_TCGTitleScreen_Ch3: 
	notetype0 7
	notetype2 14
	notetype1 1
	octave 3
	note __, 4
	callchannel Branch_f52f0
	note F_, 4
	note F_, 4
	note E_, 4
	note E_, 4
	note D_, 4
	note D_, 4
	note G_, 4
	note G_, 4
	inc_octave
	callchannel Branch_f52f0
.Loop1
	note F_, 4
	loopchannel 4, .Loop1
.Loop2
	note A#, 4
	loopchannel 4, .Loop2
.Loop3
	note A_, 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	loopchannel 2, .Loop3
.Loop4
	note G_, 2
	note G_, 2
	note __, 2
	note G_, 1
	note G_, 1
	loopchannel 2, .Loop4
.Loop5
	note F_, 2
	note F_, 2
	note __, 2
	note F_, 1
	note F_, 1
	loopchannel 2, .Loop5
.Loop6
	note E_, 2
	note E_, 2
	note __, 2
	note E_, 1
	note E_, 1
	loopchannel 2, .Loop6
.Loop7
	note G#, 4
	loopchannel 4, .Loop7
.Loop8
	note G_, 4
	loopchannel 4, .Loop8
.Loop9
	note F#, 4
	loopchannel 4, .Loop9
.Loop10
	note G_, 4
	loopchannel 4, .Loop10
	inc_octave
	note C_, 4
	note C_, 4
	notetype0 1
	note C_, 9
	note C_, 10
	dec_octave
	note G_, 9
	note G_, 9
	note G_, 9
	note G_, 10
	notetype0 7
	note C_, 8
	endchannel

Branch_f52f0:
	note C_, 4
	note C_, 4
	dec_octave
	note B_, 4
	note B_, 4
	note A_, 4
	note A_, 4
	note G_, 4
	note G_, 4
	endchannel


Music_TCGTitleScreen_Ch4: 
	togglenoise $06
	notetype 7
	octave 1
	note __, 4
.Loop1
	callchannel Branch_f5312
	loopchannel 16, .Loop1
.Loop2
	callchannel Branch_f531e
	loopchannel 8, .Loop2
.Loop3
	callchannel Branch_f5312
	loopchannel 10, .Loop3
	note C#, 8
	endchannel

Branch_f5312:
	notetype 7
	note C#, 2
	note D_, 2
	note C#, 2
	notetype 1
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 3
	endchannel

Branch_f531e:
	notetype 7
	note C#, 2
	note C#, 2
	note __, 2
	notetype 1
	note C#, 4
	note D_, 3
	note D_, 4
	note D_, 3
	endchannel

