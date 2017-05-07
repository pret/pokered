Music_TCGHallOfHonor:
	db $80
	dw Music_TCGHallOfHonor_Ch1
	db $01
	dw Music_TCGHallOfHonor_Ch2
	db $02
	dw Music_TCGHallOfHonor_Ch3

Music_TCGHallOfHonor_Ch1: 
	notetype0 7
	notetype2 8
	dutycycle 2
.Loop1
	callchannel Branch_fb016
	loopchannel 4, .Loop1
.MainLoop
.Loop2
	callchannel Branch_fb016
	loopchannel 8, .Loop2
	octave 4
	notetype1 5
	note C_, 1
	notetype1 2
	note C_, 1
	callchannel Branch_fb044
.Loop3
	notetype1 5
	note C_, 1
	notetype1 2
	note G_, 1
	callchannel Branch_fb044
	loopchannel 23, .Loop3
	loopchannel 0, .MainLoop

Branch_fb016:
	octave 4
	notetype1 6
	note C_, 1
	notetype1 2
	note C_, 1
	notetype1 6
	note F_, 1
	notetype1 2
	note F_, 1
	notetype1 6
	note G_, 1
	notetype1 2
	note G_, 1
	notetype1 6
	note F_, 1
	notetype1 2
	note F_, 1
	inc_octave
	notetype1 6
	note C_, 1
	notetype1 2
	note C_, 1
	dec_octave
	notetype1 6
	note F_, 1
	notetype1 2
	note F_, 1
	notetype1 6
	note G_, 1
	notetype1 2
	note G_, 1
	endchannel

Branch_fb044:
	octave 4
	notetype1 5
	note F_, 1
	notetype1 2
	note C_, 1
	notetype1 5
	note G_, 1
	notetype1 2
	note F_, 1
	notetype1 5
	note F_, 1
	notetype1 2
	note G_, 1
	inc_octave
	notetype1 5
	note C_, 1
	dec_octave
	notetype1 2
	note F_, 1
	notetype1 5
	note F_, 1
	inc_octave
	notetype1 2
	note C_, 1
	dec_octave
	notetype1 5
	note G_, 1
	notetype1 2
	note F_, 1
	endchannel


Music_TCGHallOfHonor_Ch2: 
	notetype0 7
	notetype2 8
	dutycycle 2
	note __, 2
	notetype0 1
	note __, 4
	notetype0 7
	notetype1 1
.Loop1
	callchannel Branch_fb1ec
	loopchannel 3, .Loop1
	octave 4
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
	note F_, 1
	notetype0 1
	note __, 3
	notetype0 7
.MainLoop
	octave 1
	dutycycle 1
.Loop2
	callchannel Branch_fb0bb
	octave 1
	notetype1 7
	note E_, 5
	notetype1 13
	note E_, 11
	note E_, 12
	loopchannel 3, .Loop2
	callchannel Branch_fb0bb
	octave 1
	notetype1 7
	note G_, 5
	notetype1 13
	note G_, 11
	note G_, 12
	loopchannel 0, .MainLoop

Branch_fb0bb:
	octave 1
	notetype1 7
	note F_, 5
	notetype1 13
	note F_, 11
	note F_, 12
	notetype1 7
	note E_, 5
	notetype1 13
	note E_, 11
	note E_, 12
	notetype1 7
	note D_, 5
	notetype1 13
	note D_, 11
	note D_, 12
	endchannel


Music_TCGHallOfHonor_Ch3: 
	notetype0 7
	notetype1 2
	notetype2 12
	vibrato 35, $24
	note __, 3
	notetype1 3
.Loop1
	note __, 14
	loopchannel 4, .Loop1
.MainLoop
	octave 6
.Loop2
	callchannel Branch_fb1ec
	loopchannel 7, .Loop2
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
	note F_, 1
	notetype1 1
	octave 5
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 4
	notetype0 7
	note C_, 15
	note C_, 8
	dec_octave
	note B_, 2
	note A_, 2
	note G_, 6
	note C_, 10
	note C_, 12
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 4
	notetype0 7
	note C_, 15
	note C_, 6
	dec_octave
	note B_, 2
	inc_octave
	note C_, 2
	note D_, 2
	dec_octave
	notetype0 1
	note F#, 3
	note G_, 4
	notetype0 7
	note G_, 15
	note G_, 6
	note G_, 2
	note A_, 2
	note B_, 2
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 4
	notetype0 7
	note C_, 15
	note C_, 8
	dec_octave
	note B_, 2
	note A_, 2
	note G_, 6
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 4
	notetype0 7
	note C_, 9
	note C_, 6
	dec_octave
	note G_, 2
	inc_octave
	note C_, 2
	note E_, 2
	notetype0 1
	note E_, 3
	note F_, 4
	notetype0 7
	note F_, 1
	note E_, 2
	note C_, 2
	note C_, 10
	note C_, 10
	note E_, 2
	notetype0 1
	note E_, 3
	note F_, 4
	notetype0 7
	note F_, 1
	note E_, 2
	note C_, 2
	note C_, 10
	note C_, 12
	notetype0 1
	note F#, 3
	note G_, 4
	notetype0 7
	note G_, 15
	note G_, 8
	note F_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	dec_octave
	note G_, 10
	note G_, 10
	note E_, 2
	note F_, 2
	inc_octave
	note C_, 2
	note C_, 12
	note C_, 10
	dec_octave
	note E_, 2
	note F_, 2
	inc_octave
	note C_, 2
	note C_, 12
	note C_, 12
	note __, 3
	notetype1 3
	loopchannel 0, .MainLoop

Branch_fb1ec:
	octave 5
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	inc_octave
	note C_, 1
	note __, 1
	dec_octave
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	endchannel

