Music_TCG2HereComesGR:
	db $C0
	dw Music_TCG2HereComesGR_Ch1
	db $01
	dw Music_TCG2HereComesGR_Ch2
	db $02
	dw Music_TCG2HereComesGR_Ch3
	db $03
	dw Music_TCG2HereComesGR_Ch4

Music_TCG2HereComesGR_Ch2: 
	notetype1 10
.MainLoop
	notetype0 1
	octave 2
	callchannel Branch_1ea5ed
	note __, 10
	note __, 11
	note __, 10
	note __, 16
	note __, 16
	note __, 10
	note C_, 6
	note C#, 5
	note D_, 10
	note F_, 16
	note F_, 5
	callchannel Branch_1ea5ed
	note __, 10
	note __, 11
	note __, 10
	note B_, 6
	inc_octave
	note C_, 5
	note C#, 16
	note C#, 15
	note C_, 16
	note C_, 16
	dec_octave
	note B_, 5
	note A#, 5
	octave 2
	callchannel Branch_1ea5ed
	note __, 10
	note __, 11
	note __, 10
	note __, 16
	note __, 16
	note __, 10
	note C_, 6
	note C#, 5
	note D_, 10
	note F_, 16
	note F_, 5
	callchannel Branch_1ea5ed
	note __, 10
	note __, 11
	note __, 10
	note G_, 11
	inc_octave
	note G_, 5
	note G_, 5
	note C#, 11
	note C_, 5
	note C#, 5
	note C_, 10
	dec_octave
	note A#, 10
	note F_, 11
	note G#, 10
	octave 2
	callchannel Branch_1ea5ed
	octave 4
	notetype2 4
	note D_, 10
	note D_, 11
	note __, 10
	note __, 11
	note C_, 10
	octave 1
	notetype2 8
.Loop1
	note G_, 3
	note __, 1
	note G_, 2
	note __, 1
	loopchannel 3, .Loop1
	inc_octave
	note C#, 6
	note D_, 5
	note D_, 10
	note F_, 16
	note F_, 5
	octave 2
	callchannel Branch_1ea5ed
	octave 4
	notetype2 4
	note D_, 10
	note D_, 11
	note __, 10
	octave 2
	notetype2 8
	note B_, 6
	inc_octave
	note C_, 5
	note C#, 16
	note C#, 15
	note C_, 16
	note C_, 16
	dec_octave
	note B_, 5
	note A#, 5
	octave 2
	callchannel Branch_1ea5ed
	octave 4
	notetype2 4
	note D_, 10
	note D_, 11
	note __, 10
	note __, 11
	note C_, 10
	octave 1
	notetype2 8
.Loop2
	note G_, 3
	note __, 1
	note G_, 2
	note __, 1
	loopchannel 3, .Loop2
	inc_octave
	note C#, 6
	note D_, 5
	note D_, 10
	note F_, 16
	note F_, 5
	octave 2
	callchannel Branch_1ea5ed
	notetype2 4
	notetype2 4
	octave 4
	note G_, 10
	note G_, 11
	notetype2 8
	octave 3
	note G_, 10
	note G_, 11
	note C_, 5
	note C#, 5
	note D_, 6
	note D_, 5
	note F_, 5
	note F_, 5
	note C_, 6
	note C#, 5
	note C_, 10
	callchannel Branch_1ea90c
	callchannel Branch_1ea66f
	octave 2
	callchannel Branch_1ea5ed
	octave 4
	note D_, 4
	note D_, 6
	octave 2
	notetype2 8
	note D_, 11
	octave 3
	notetype2 8
	note C#, 10
	note D_, 6
	note D_, 5
	note F_, 5
	note F_, 5
	note C_, 4
	note C#, 3
	note C_, 4
	dec_octave
	note A#, 5
	note A#, 5
	inc_octave
	note C_, 11
	dec_octave
	note A#, 3
	inc_octave
	note C_, 3
	dec_octave
	note A#, 4
	callchannel Branch_1ea90c
	callchannel Branch_1ea66f
	octave 2
	callchannel Branch_1ea5ed
	octave 4
	notetype2 6
	note F_, 10
	note __, 11
	note G_, 10
	note __, 11
	notetype2 8
	octave 3
	note C#, 10
	note D_, 6
	note D_, 5
	note F_, 5
	note F_, 5
	note C_, 3
	note C#, 4
	note C_, 4
	dec_octave
	note A#, 5
	note A#, 5
	callchannel Branch_1ea90c
	callchannel Branch_1ea66f
	octave 2
	callchannel Branch_1ea5ed
	octave 4
	note D_, 4
	note D_, 6
	octave 2
	notetype2 8
	note D_, 11
	octave 3
	notetype2 8
	note C#, 10
	note D_, 6
	note D_, 5
	note F_, 5
	note D_, 5
	note C_, 4
	note C#, 3
	note C_, 4
	dec_octave
	note A#, 5
	note A#, 5
	inc_octave
	note C_, 11
	dec_octave
	note A#, 3
	inc_octave
	note C_, 3
	dec_octave
	note A#, 4
	callchannel Branch_1ea90c
	note C_, 11
	dec_octave
	note B_, 2
	note B_, 2
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note G#, 1
	note G#, 1
	notetype2 8
	octave 2
	note A#, 16
	note A#, 5
	notetype2 8
	octave 1
	note A_, 3
	note B_, 3
	inc_octave
	note C_, 3
	note E_, 3
	note G_, 3
	inc_octave
	note C_, 2
	note F_, 2
	note A_, 2
	callchannel Branch_1ea603
	octave 3
	note C_, 8
	note C_, 3
	note C_, 10
	dec_octave
	note A#, 11
	inc_octave
	note C_, 10
	note C_, 11
	octave 4
	note C_, 4
	note C_, 6
	octave 1
	notetype2 8
	note G_, 5
	note __, 6
	note G_, 5
	note __, 5
	octave 3
	notetype2 4
	note __, 11
	note F_, 10
	note F_, 11
	notetype2 8
	note C_, 2
	note __, 1
	note C_, 1
	note __, 2
	note C_, 2
	note __, 1
	note C_, 1
	notetype2 8
	octave 2
	note B_, 6
	inc_octave
	note C_, 5
	note C#, 16
	note C#, 5
	note C#, 10
	callchannel Branch_1ea603
	octave 3
	note C_, 11
	notetype2 8
	inc_octave
	note F_, 4
	note F_, 6
	dec_octave
	note C_, 5
	note C_, 6
	dec_octave
	note B_, 10
	inc_octave
	inc_octave
	notetype2 8
	note E_, 4
	note E_, 7
	dec_octave
	dec_octave
	notetype2 8
	note B_, 5
	note B_, 5
	note A#, 11
	inc_octave
	inc_octave
	notetype2 8
	note D#, 4
	note D#, 6
	dec_octave
	dec_octave
	octave 2
	notetype2 8
	note A#, 5
	note A#, 6
	note G#, 10
	inc_octave
	inc_octave
	notetype2 8
	note C#, 4
	note C#, 7
	dec_octave
	dec_octave
	notetype2 8
	note G#, 5
	note G#, 5
	note F_, 16
	note F_, 5
	note F#, 16
	note F#, 5
	loopchannel 0, .MainLoop

Branch_1ea5ed:
	note G_, 8
	note G_, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note G_, 11
	endchannel

Branch_1ea5f8:
	note D_, 8
	note D_, 3
	note D_, 10
	note C_, 11
	note D_, 10
	note D_, 11
	endchannel

Branch_1ea603:
	octave 3
	note C_, 8
	note C_, 3
	note C_, 10
	dec_octave
	note A#, 11
	inc_octave
	note C_, 10
	note C_, 11
	octave 4
	notetype2 8
	note C_, 4
	note C_, 6
	octave 1
	notetype2 8
	note G_, 5
	note __, 6
	note G_, 5
	note __, 5
	octave 3
	notetype2 4
	note __, 11
	note F_, 10
	note F_, 11
	notetype2 8
	note C_, 2
	note __, 1
	note C_, 1
	note __, 2
	note C_, 2
	note __, 1
	note C_, 1
	octave 2
	note A#, 16
	note A#, 5
	note B_, 16
	note B_, 5
	endchannel

Branch_1ea64e:
	notetype2 8
	octave 3
	note G#, 16
	note G#, 16
	note G#, 10
	note G#, 2
	note __, 4
	note G#, 1
	note __, 4
	note G#, 2
	note __, 4
	note G#, 1
	note __, 3
	note G_, 16
	note G_, 5
	note G_, 11
	note F#, 5
	note F_, 5
	dec_octave
	endchannel

Branch_1ea66f:
	notetype2 8
	octave 2
	note E_, 16
	note E_, 5
	note F_, 16
	note F_, 5
	note F#, 16
	note F#, 5
	endchannel
	endchannel


Music_TCG2HereComesGR_Ch1: 
	notetype1 10
.MainLoop
	notetype0 1
	octave 2
	octave 2
	callchannel Branch_1ea5f8
	note __, 10
	note __, 11
	note __, 10
	note __, 16
	note __, 16
	note __, 10
	note __, 6
	note __, 5
	note __, 10
	note __, 16
	note __, 5
	callchannel Branch_1ea5f8
	note __, 10
	note __, 11
	note __, 10
	note F#, 6
	note G_, 5
	note G#, 16
	note G#, 15
	note G_, 16
	note G_, 16
	note F#, 5
	note F_, 5
	octave 2
	callchannel Branch_1ea5f8
	note __, 10
	note __, 11
	note __, 10
	note __, 16
	note __, 16
	note __, 10
	note __, 6
	note __, 5
	note __, 10
	note __, 16
	note __, 5
	callchannel Branch_1ea5f8
	note __, 10
	note __, 11
	note __, 10
	note G_, 11
	inc_octave
	note C_, 5
	note __, 5
	dec_octave
	note A#, 11
	note A_, 5
	note A#, 5
	note G#, 10
	note F_, 10
	note C_, 11
	note C#, 10
	octave 2
	callchannel Branch_1ea5f8
	octave 4
	notetype2 4
	note C_, 10
	note C_, 11
	note __, 10
	note __, 11
	dec_octave
	notetype2 4
	note A#, 10
	octave 1
	notetype2 8
.Loop1
	note D_, 2
	note __, 1
	note D_, 2
	note __, 2
	loopchannel 3, .Loop1
	note __, 11
	note __, 10
	note __, 11
	note __, 10
	octave 2
	callchannel Branch_1ea5f8
	octave 4
	notetype2 4
	note C_, 10
	note C_, 11
	note __, 10
	octave 2
	notetype2 8
	note F#, 6
	note G_, 5
	note G#, 16
	note G#, 15
	note G_, 16
	note G_, 16
	note F#, 5
	note F_, 5
	octave 2
	callchannel Branch_1ea5f8
	octave 4
	notetype2 4
	note C_, 10
	note C_, 11
	note __, 10
	note __, 11
	dec_octave
	note A#, 10
	octave 1
	notetype2 8
.Loop2
	note D_, 2
	note __, 1
	note D_, 2
	note __, 2
	loopchannel 3, .Loop2
	note __, 11
	note __, 10
	note __, 11
	note __, 10
	octave 2
	callchannel Branch_1ea5f8
	octave 4
	notetype2 4
	note C_, 10
	note C_, 11
	octave 3
	notetype2 8
	note C_, 10
	dec_octave
	note __, 11
	note G_, 5
	note G#, 5
	note A_, 6
	note A_, 5
	inc_octave
	note C_, 5
	note C_, 5
	dec_octave
	note G_, 6
	note G#, 5
	note G_, 10
	notetype2 8
	octave 2
	note A#, 11
	note G_, 10
	callchannel Branch_1ea64e
	note __, 11
	note __, 10
	note __, 11
	note __, 10
	note __, 11
	note __, 10
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	octave 4
	note __, 11
	notetype2 4
	note C_, 10
	note __, 11
	dec_octave
	octave 2
	notetype2 8
	note F_, 10
	callchannel Branch_1ea5ed
	note __, 10
	octave 2
	notetype2 8
	note G_, 16
	note G_, 5
	callchannel Branch_1ea64e
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	note __, 11
	notetype2 6
	octave 3
	note A#, 10
	note __, 11
	inc_octave
	note C_, 10
	note __, 11
	notetype2 8
	octave 2
	note G_, 10
	note F_, 11
	note G_, 10
	note G_, 11
	note D_, 10
	octave 2
	notetype2 8
	note G_, 11
	note G_, 10
	callchannel Branch_1ea64e
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	note __, 16
	note __, 5
	octave 4
	note __, 11
	notetype2 4
	note C_, 10
	note __, 11
	dec_octave
	octave 2
	notetype2 8
	note F_, 10
	note G_, 8
	note G_, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note G_, 11
	note __, 10
	octave 2
	notetype2 8
	note G_, 16
	note G_, 5
	octave 3
	note G#, 16
	note G#, 16
	note G#, 10
	note G#, 2
	note __, 4
	note G#, 1
	note __, 4
	note G#, 2
	note __, 4
	note G#, 1
	note __, 3
	note G_, 16
	note G_, 5
	note G_, 16
	note G_, 5
	dec_octave
	note F_, 6
	note F#, 5
	note G_, 10
	octave 3
	note G_, 3
	note G_, 3
	inc_octave
	note C_, 3
	dec_octave
	note G_, 2
	note F_, 3
	inc_octave
	note C_, 2
	dec_octave
	note A#, 3
	note F_, 2
	inc_octave
	note D#, 3
	dec_octave
	note A#, 3
	inc_octave
	note G#, 3
	note D#, 2
	inc_octave
	note C#, 3
	dec_octave
	note G#, 2
	inc_octave
	note F#, 3
	note C#, 2
	callchannel Branch_1ea8d3
	octave 2
	callchannel Branch_1ea5ed
	notetype2 4
	octave 3
	note A#, 10
	note A#, 11
	octave 1
	notetype2 8
	note __, 10
	octave 2
	notetype2 4
	note __, 11
	note A#, 10
	note A#, 11
	notetype2 8
	note C_, 2
	note __, 1
	note C_, 2
	note __, 1
	note C_, 2
	note __, 1
	note C_, 1
	notetype2 8
	octave 2
	note F#, 6
	note G_, 5
	note G#, 16
	note G#, 5
	note G#, 10
	callchannel Branch_1ea8d3
	octave 2
	note G_, 11
	notetype2 8
	inc_octave
	inc_octave
	note C_, 4
	note C_, 6
	dec_octave
	dec_octave
	note G_, 5
	note G_, 6
	note F#, 10
	inc_octave
	notetype2 8
	note B_, 4
	note B_, 7
	dec_octave
	notetype2 8
	note F#, 5
	note F#, 5
	note F_, 11
	inc_octave
	notetype2 8
	note A#, 4
	note A#, 6
	dec_octave
	octave 2
	notetype2 8
	note F_, 5
	note F_, 6
	note D#, 10
	inc_octave
	notetype2 8
	note G#, 4
	note G#, 7
	dec_octave
	notetype2 8
	note D#, 5
	note D#, 5
	note C_, 16
	note C_, 5
	note C#, 16
	note C#, 5
	loopchannel 0, .MainLoop

Branch_1ea8d3:
	octave 2
	note G_, 8
	note G_, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note G_, 11
	octave 3
	notetype2 4
	note A#, 10
	note A#, 11
	note __, 10
	octave 2
	notetype2 4
	note __, 11
	note A#, 10
	note __, 11
	notetype2 8
	note G_, 2
	note __, 1
	note G_, 2
	note __, 1
	note G_, 2
	note __, 1
	note G_, 1
	octave 2
	note F_, 16
	note F_, 5
	note F#, 16
	note F#, 5
	endchannel

Branch_1ea90c:
	vibrato 11, $33
	octave 1
	note A_, 4
	note B_, 3
	inc_octave
	note D_, 3
	note G_, 3
	note B_, 2
	inc_octave
	note D_, 2
	note F_, 2
	note G_, 2
	note A#, 10
	note A#, 16
	note A#, 16
	dec_octave
	note C_, 4
	note D_, 3
	note F_, 2
	note A_, 2
	note B_, 2
	inc_octave
	note D_, 2
	note F_, 2
	note A_, 2
	note B_, 2
	inc_octave
	note C_, 11
	note C_, 10
	note C_, 11
	note C_, 10
	endchannel


Music_TCG2HereComesGR_Ch3: 
	notetype1 10
	notetype0 1
	notetype2 11
	notetype1 1
.MainLoop
	octave 5
	octave 2
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 16
	note __, 16
	note __, 10
	note __, 16
	note __, 16
	note __, 10
	note C_, 5
	note C#, 6
	note D_, 10
	note F_, 16
	note F_, 5
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 16
	note __, 16
	note __, 10
	note G#, 6
	note A_, 5
	note A#, 16
	note A#, 15
	note A_, 16
	note A_, 16
	note A_, 10
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 16
	note __, 16
	note __, 10
	note __, 16
	note __, 16
	note __, 10
	note C_, 5
	note C#, 6
	note D_, 10
	note F_, 16
	note F_, 5
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 16
	note __, 15
	inc_octave
	note C#, 10
	note D_, 11
	inc_octave
	notetype1 2
	note C_, 10
	notetype1 1
	dec_octave
	note C#, 11
	note C_, 10
	dec_octave
	note A#, 11
	inc_octave
	note C_, 10
	dec_octave
	note F_, 11
	note G#, 10
	notetype1 1
	octave 2
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 11
	octave 5
	note G_, 10
	notetype1 3
	note G_, 11
	octave 2
	notetype1 2
	note F_, 10
	note G_, 11
	octave 5
	note F_, 10
	octave 2
	notetype1 1
	note __, 10
	note __, 11
	note C_, 5
	note C#, 6
	note D_, 10
	note F_, 16
	note F_, 5
	notetype1 1
	octave 2
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 11
	octave 5
	note G_, 10
	notetype1 3
	note G_, 11
	notetype1 1
	octave 2
	note __, 10
	note G#, 6
	note A_, 5
	note A#, 16
	note A#, 15
	note A_, 16
	note A_, 16
	note A_, 10
	notetype1 1
	octave 2
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 11
	octave 5
	note G_, 10
	notetype1 3
	note G_, 11
	octave 2
	notetype1 2
	note F_, 10
	note G_, 11
	octave 5
	note F_, 10
	notetype1 1
	octave 2
	note __, 10
	note __, 11
	note C_, 5
	note C#, 6
	note D_, 10
	note F_, 16
	note F_, 5
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 8
	note __, 2
	note G_, 5
	note __, 6
	inc_octave
	note F_, 10
	note __, 11
	note G_, 10
	octave 3
	note __, 11
	note C#, 10
	note D_, 11
	note F_, 10
	dec_octave
	note A#, 11
	note F_, 10
	note G_, 11
	note A_, 10
	callchannel Branch_1eaaf6
	note __, 11
	octave 2
	note G_, 5
	note __, 5
	note E_, 16
	note E_, 5
	note F_, 16
	note F_, 5
	note F#, 16
	note F#, 5
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 8
	note __, 13
	inc_octave
	note F_, 8
	note __, 13
	note G_, 8
	note __, 2
	note __, 16
	note __, 16
	note __, 16
	note __, 5
	dec_octave
	note D_, 10
	note F_, 11
	note G_, 10
	callchannel Branch_1eaaf6
	note __, 11
	octave 2
	note G#, 5
	note A_, 5
	inc_octave
	note C_, 11
	note D_, 5
	note __, 5
	note F#, 6
	note G_, 5
	note A#, 10
	inc_octave
	note C_, 6
	note C_, 5
	dec_octave
	note B_, 5
	note A#, 5
	octave 2
	note D_, 16
	note D_, 16
	inc_octave
	note D_, 8
	note __, 2
	note __, 11
	inc_octave
	inc_octave
	note F_, 10
	notetype1 3
	note F_, 11
	dec_octave
	dec_octave
	notetype1 2
	dec_octave
	note C_, 10
	note D_, 8
	note __, 13
	inc_octave
	note G_, 3
	note __, 8
	dec_octave
	note G_, 3
	note __, 7
	notetype1 1
	note C_, 16
	note C_, 5
	note C#, 16
	note C#, 5
	octave 2
	note D_, 16
	note D_, 16
	inc_octave
	note D_, 8
	note __, 2
	note __, 11
	inc_octave
	inc_octave
	note F_, 10
	notetype1 3
	note F_, 11
	dec_octave
	dec_octave
	notetype1 2
	dec_octave
	note C_, 10
	note D_, 8
	note __, 13
	inc_octave
	note G_, 3
	note __, 8
	dec_octave
	note G_, 3
	note __, 7
	notetype1 1
	note C#, 6
	note D_, 5
	note D#, 16
	note D#, 15
	octave 2
	note D_, 16
	note D_, 16
	inc_octave
	note D_, 8
	note __, 2
	note __, 11
	inc_octave
	inc_octave
	note F_, 10
	notetype1 3
	note F_, 11
	dec_octave
	dec_octave
	notetype1 2
	dec_octave
	note C_, 10
	note D_, 8
	note __, 13
	inc_octave
	note G_, 3
	note __, 8
	dec_octave
	note G_, 3
	note __, 7
	notetype1 1
	note C_, 16
	note C_, 5
	note C#, 16
	note C#, 5
	note D_, 16
	note D_, 5
	note D_, 2
	note __, 9
	note C#, 16
	note C#, 5
	note C#, 2
	note __, 8
	note C_, 16
	note C_, 5
	note __, 11
	note G#, 2
	note A_, 3
	note A#, 16
	note A#, 10
	note F_, 16
	note F_, 5
	note F#, 16
	note F#, 5
	loopchannel 0, .MainLoop

Branch_1eaaf6:
	vibrato 11, $33
	octave 2
	note A#, 11
	note A#, 7
	note __, 3
	note A#, 2
	note __, 9
	inc_octave
	note A#, 5
	note __, 5
	dec_octave
	note A#, 5
	note __, 6
	note G#, 5
	note __, 5
	note G#, 6
	note A_, 5
	note A_, 10
	note __, 11
	inc_octave
	note A_, 5
	note __, 5
	dec_octave
	note A_, 11
	note E_, 10
	note F_, 16
	note F_, 5
	note F#, 16
	note F#, 5
	notetype1 1
	octave 2
	note G_, 8
	note __, 3
	note G_, 10
	note F_, 11
	note G_, 10
	note __, 11
	octave 5
	note G_, 10
	notetype1 3
	note G_, 11
	octave 2
	notetype1 1
	note __, 10
	note __, 16
	note __, 16
	note __, 16
	note __, 5
	note D_, 10
	note F_, 11
	note G_, 10
	note A#, 11
	note A#, 7
	note __, 3
	note A#, 2
	note __, 9
	inc_octave
	note A#, 5
	note __, 5
	dec_octave
	note A#, 5
	note __, 6
	note B_, 5
	note __, 5
	note A#, 6
	note B_, 5
	inc_octave
	note C_, 10
	endchannel


Music_TCG2HereComesGR_Ch4: 
	togglenoise $06
.MainLoop
	notetype 1
	octave 1
	callchannel Branch_1eacf7
	callchannel Branch_1ead02
	callchannel Branch_1eacf7
	note D#, 11
	note C#, 10
	note E_, 11
	note C_, 10
	note C#, 11
	note C#, 10
	note D#, 11
	note C#, 3
	note C#, 3
	note C#, 4
	callchannel Branch_1eacf7
	note D#, 11
	note C_, 10
	note E_, 7
	note C_, 7
	note C_, 7
	note C#, 16
	note __, 5
	note D#, 11
	note C#, 10
	callchannel Branch_1eacf7
	note C_, 11
	note C#, 10
	note E_, 11
	note C#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note C#, 10
	callchannel Branch_1eacf7
	note D#, 11
	note C_, 10
	note E_, 7
	note C_, 4
	note C_, 4
	note C_, 3
	note C_, 3
	note C#, 11
	note C_, 10
	note D#, 11
	note C_, 4
	note C#, 3
	note C#, 3
	note C_, 16
	note __, 5
	note D#, 11
	note C_, 10
	note C#, 16
	note __, 5
	note D#, 11
	note C_, 5
	note C_, 5
	note D#, 11
	note C#, 10
	note E_, 11
	note C#, 4
	note C#, 3
	note C#, 3
	note C#, 11
	note C#, 10
	note D#, 11
	note C#, 5
	note C#, 5
	callchannel Branch_1eacf7
	note D#, 11
	note C_, 10
	note E_, 7
	note C_, 4
	note C_, 4
	note C_, 3
	note C_, 3
	note C#, 11
	note C_, 10
	note D#, 11
	note C_, 4
	note C#, 3
	note C#, 3
	note C_, 11
	note C_, 10
	note D#, 11
	note C_, 5
	note C_, 5
	note C#, 11
	note C_, 10
	note D#, 11
	note C_, 10
	note D#, 11
	note C#, 10
	note E_, 11
	note C#, 5
	note C#, 5
	note C#, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C#, 11
	note C_, 10
	note E_, 16
	note __, 5
	note D#, 11
	note C#, 10
	note E_, 11
	note C#, 10
	note C#, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note C_, 10
	note D#, 11
	note C_, 10
	note C#, 11
	note E_, 10
	note C_, 11
	note C#, 4
	note C#, 3
	note C#, 3
	note C_, 11
	note C#, 10
	note E_, 11
	note C#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note C#, 4
	note C#, 3
	note C#, 3
	note C_, 11
	note D#, 10
	note E_, 11
	note C_, 5
	note C#, 5
	note C#, 11
	note C_, 10
	note C#, 16
	note __, 5
	note D#, 11
	note C#, 10
	note E_, 11
	note C_, 10
	note C#, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 16
	note __, 5
	note D#, 11
	note C_, 10
	note C#, 11
	note C_, 10
	note __, 11
	note C_, 10
	note __, 11
	note C#, 10
	note E_, 11
	note C_, 10
	note C#, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C#, 11
	note C_, 10
	note E_, 16
	note __, 5
	note D#, 11
	note C#, 10
	note E_, 11
	note C#, 10
	note C#, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note C_, 10
	note D#, 11
	note C_, 10
	note C#, 11
	note E_, 10
	note C_, 11
	note C#, 4
	note C#, 3
	note C#, 3
	note C_, 11
	note C#, 10
	note E_, 11
	note C#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note C#, 4
	note C#, 3
	note C#, 3
	note C_, 11
	note D#, 10
	note E_, 11
	note C_, 5
	note C#, 5
	note C#, 11
	note C_, 10
	note C#, 16
	note __, 5
	note D#, 11
	note C#, 10
	note C#, 11
	note C#, 5
	note C#, 5
	note C#, 11
	note C#, 5
	note C#, 5
	note C#, 11
	note C#, 5
	note C#, 5
	note C_, 16
	note __, 5
	note D#, 11
	note C_, 4
	note D#, 3
	note D#, 3
	note E_, 11
	note C#, 10
	note D#, 11
	note C_, 10
	note D#, 11
	note C_, 10
	note E_, 11
	note C#, 4
	note C#, 3
	note C#, 3
	note C#, 11
	note C#, 10
	note D#, 11
	note C#, 5
	note C#, 5
	note C_, 16
	note __, 5
	note D#, 11
	note C_, 4
	note D#, 3
	note D#, 3
	note E_, 11
	note C#, 10
	note D#, 11
	note C_, 10
	note D#, 11
	note C#, 10
	note E_, 11
	note C_, 5
	note C_, 5
	notetype 2
	note G_, 15
	notetype 1
	note __, 1
	note C#, 4
	note C#, 3
	note C#, 3
	note C_, 16
	note __, 5
	note D#, 11
	note C_, 4
	note D#, 3
	note D#, 3
	note E_, 11
	note C#, 10
	note D#, 11
	note C_, 10
	note D#, 11
	note C_, 10
	note E_, 11
	note C#, 4
	note C#, 3
	note C#, 3
	note C#, 11
	note D#, 5
	note C#, 5
	note C#, 11
	note C#, 10
	note C_, 11
	note D#, 10
	note C#, 11
	note C_, 10
	note D#, 11
	note C#, 10
	note C_, 11
	note D#, 10
	note C#, 11
	note C_, 10
	note D#, 11
	note C#, 10
	note C#, 11
	note D#, 5
	note C#, 5
	note C#, 4
	note C#, 4
	note C#, 3
	note C#, 4
	note C#, 3
	note C#, 3
	loopchannel 0, .MainLoop

Branch_1eacf7:
	note C_, 16
	note __, 5
	note D#, 11
	note C_, 10
	note C#, 16
	note __, 5
	note D#, 11
	note C_, 10
	endchannel

Branch_1ead02:
	note D#, 11
	note C_, 10
	note E_, 11
	note C_, 5
	note C_, 5
	note C#, 16
	note __, 5
	note D#, 11
	note C#, 10
	endchannel

