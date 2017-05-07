Music_TCG2GROverworld:
	db $C0
	dw Music_TCG2GROverworld_Ch1
	db $01
	dw Music_TCG2GROverworld_Ch2
	db $02
	dw Music_TCG2GROverworld_Ch3
	db $03
	dw Music_TCG2GROverworld_Ch4

Music_TCG2GROverworld_Ch2: 
	notetype1 10
.MainLoop
	callchannel Branch_1eae1e
	note A#, 16
	note A#, 9
	note A#, 8
	inc_octave
	note D_, 16
	note D_, 9
	note D_, 8
	note C_, 16
	note C_, 6
	dec_octave
	note A_, 16
	note A_, 6
	note F_, 16
	note F_, 6
	notetype0 11
	note G_, 12
	notetype0 1
	octave 2
	note B_, 9
	note B_, 16
	note __, 8
	note __, 9
	note __, 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	note __, 16
	note __, 1
	callchannel Branch_1eae1e
	note A#, 16
	note A#, 9
	note A#, 8
	inc_octave
	note D_, 16
	note D_, 9
	note D_, 8
	note C_, 16
	note C_, 6
	dec_octave
	note G_, 16
	note G_, 6
	inc_octave
	note C_, 16
	note C_, 6
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 12
	note D_, 8
	note D_, 16
	octave 3
	note D_, 4
	note D_, 4
	note F_, 5
	note F_, 3
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 3
	note G_, 16
	note A_, 7
	note G_, 8
	note A_, 8
	note __, 2
	note A#, 5
	note A#, 3
	note A_, 8
	note A_, 1
	note A#, 7
	note A#, 1
	note A_, 5
	note A#, 3
	note F_, 5
	note A_, 3
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 3
	note D_, 16
	note C_, 7
	note D_, 8
	note C_, 8
	note __, 2
	dec_octave
	note A#, 5
	note A#, 3
	inc_octave
	note C_, 7
	dec_octave
	note A#, 8
	inc_octave
	note C_, 8
	note __, 2
	note F_, 5
	note F_, 3
	note F_, 16
	note F_, 16
	note F_, 16
	note D#, 8
	note D#, 8
	dec_octave
	note A#, 9
	note A#, 8
	inc_octave
	note D#, 8
	note D#, 8
	note D_, 8
	note D_, 1
	note D#, 7
	note D#, 1
	note D_, 5
	note D#, 3
	note C_, 5
	note D_, 3
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 3
	note D_, 16
	note D#, 16
	note D#, 1
	note F_, 15
	note F_, 1
	note G_, 7
	note F_, 8
	note G_, 8
	inc_octave
	note __, 2
	note D_, 5
	note D_, 3
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 3
	note D_, 16
	note C_, 9
	note D_, 8
	note D_, 8
	note C_, 8
	note F_, 6
	note D_, 5
	note C_, 11
	note D_, 11
	dec_octave
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 2
	note A_, 16
	note G_, 5
	note A_, 3
	note F_, 5
	note G_, 3
	note G_, 16
	note G_, 16
	note G_, 2
	note G_, 16
	note D_, 8
	note D_, 8
	note G_, 16
	note G_, 6
	note A_, 16
	note A_, 6
	note A#, 16
	note A#, 6
	notetype0 11
	note A#, 6
	note A_, 6
	note G_, 6
	notetype0 1
	notetype0 11
	note F_, 3
	notetype0 1
	note F_, 1
	note F_, 16
	loopchannel 0, .MainLoop

Branch_1eae1e:
	octave 3
	notetype0 1
	vibrato 33, $33
	octave 3
	note D_, 5
	note D_, 3
	note E_, 5
	note E_, 3
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 3
	note F_, 16
	note E_, 5
	note E_, 4
	note D_, 5
	note E_, 3
	note C_, 5
	note D_, 3
	note E_, 5
	note D_, 3
	note D_, 7
	note E_, 8
	note D_, 8
	note __, 2
	dec_octave
	note G_, 5
	note G_, 3
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 3
	note G_, 16
	note G_, 5
	note G_, 3
	note G_, 5
	note G_, 3
	note F_, 16
	note F_, 9
	note F_, 8
	note A_, 16
	note A_, 9
	note A_, 8
	inc_octave
	note C_, 16
	note C_, 9
	note C_, 8
	note E_, 16
	note E_, 9
	note E_, 8
	note D_, 7
	note D_, 8
	note __, 8
	note __, 2
	dec_octave
	note G_, 5
	inc_octave
	note D_, 3
	dec_octave
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 3
	note G_, 16
	inc_octave
	note D_, 5
	note D_, 3
	note E_, 5
	note D_, 3
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 16
	note F_, 3
	note F_, 16
	note E_, 5
	note E_, 4
	note D_, 5
	note E_, 3
	note C_, 5
	note D_, 3
	note E_, 5
	note D_, 3
	note D_, 7
	note E_, 8
	note D_, 8
	note __, 2
	dec_octave
	note G_, 5
	note G_, 3
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 3
	note G_, 5
	note G_, 3
	note A_, 5
	note G_, 3
	endchannel


Music_TCG2GROverworld_Ch1: 
	notetype1 10
	notetype0 1
	note __, 16
.MainLoop
	notetype0 1
	octave 3
	note C_, 9
	note C_, 16
	note __, 8
	note __, 9
	note __, 8
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 11
	note C_, 10
	note C_, 6
	note __, 16
	note __, 1
	note __, 16
	dec_octave
	note B_, 9
	note B_, 16
	note __, 8
	note __, 9
	note __, 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	note __, 16
	note __, 1
	note __, 16
	note A_, 9
	note A_, 16
	note __, 8
	note __, 9
	note __, 8
	note F_, 6
	note F_, 2
	note F_, 6
	note F_, 2
	note A_, 6
	note A_, 11
	note A_, 10
	note A_, 6
	note __, 16
	note __, 1
	note __, 16
	note B_, 9
	note B_, 16
	note __, 8
	note __, 9
	note __, 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	note __, 16
	note __, 1
	note __, 16
	inc_octave
	note C_, 9
	note C_, 16
	note __, 8
	note __, 9
	note __, 8
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 11
	note C_, 10
	note C_, 6
	note __, 16
	note __, 1
	note __, 16
	dec_octave
	note B_, 9
	note B_, 16
	note __, 8
	note __, 9
	note __, 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	note __, 16
	note __, 1
	note __, 16
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 6
	note G_, 2
	note G_, 6
	note G_, 2
	note A_, 6
	note A_, 11
	note F_, 10
	note F_, 6
	note __, 16
	note __, 1
	note __, 16
	inc_octave
	note C_, 9
	note C_, 16
	note __, 8
	note __, 9
	note __, 8
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 11
	note C_, 10
	note C_, 6
	note __, 16
	note __, 1
	note __, 16
	dec_octave
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 6
	note G_, 2
	note G_, 6
	note G_, 2
	note G_, 6
	note G_, 11
	note G_, 10
	note G_, 6
	note __, 16
	note __, 1
	octave 2
	notetype2 8
	note B_, 5
	note B_, 3
	inc_octave
	note C_, 5
	note C_, 3
	notetype0 1
	octave 3
	note C_, 8
	note C_, 1
	octave 5
	note C_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	note C_, 4
	note F_, 4
	inc_octave
	note C_, 5
	dec_octave
	note C_, 4
	note C_, 4
	inc_octave
	note C_, 4
	octave 3
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 8
	note C_, 1
	octave 5
	note C_, 4
	note C_, 4
	octave 3
	note C_, 7
	note C_, 1
	octave 5
	note C_, 4
	note C_, 4
	inc_octave
	note C_, 4
	dec_octave
	note C_, 5
	note C_, 4
	inc_octave
	note C_, 4
	octave 2
	notetype2 8
	note A_, 5
	note A_, 3
	inc_octave
	note C_, 5
	note C_, 3
	notetype0 1
	octave 2
	note B_, 8
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note D_, 4
	note G_, 4
	note B_, 5
	note D_, 4
	note D_, 4
	note B_, 4
	octave 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 8
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	octave 2
	note B_, 7
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	note B_, 4
	note D_, 5
	note D_, 4
	note B_, 4
	octave 2
	notetype2 8
	note B_, 5
	note B_, 3
	inc_octave
	note D_, 5
	note D_, 3
	notetype0 1
	octave 3
	note C_, 8
	note C_, 1
	octave 5
	note C_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	note C_, 4
	note F_, 4
	inc_octave
	note C_, 5
	dec_octave
	note C_, 4
	note C_, 4
	inc_octave
	note C_, 4
	octave 2
	note F_, 6
	note F_, 2
	note F_, 6
	note F_, 2
	note A_, 8
	note A_, 1
	octave 5
	note C_, 4
	note C_, 4
	octave 2
	note A_, 7
	note A_, 1
	octave 5
	note C_, 4
	note C_, 4
	inc_octave
	note C_, 4
	dec_octave
	note C_, 5
	note C_, 4
	inc_octave
	note C_, 4
	octave 3
	notetype2 8
	note C_, 8
	note C_, 8
	notetype0 1
	octave 2
	note B_, 8
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note D_, 4
	note G_, 4
	note B_, 5
	note D_, 4
	note D_, 4
	note D_, 4
	octave 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 8
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	octave 2
	note B_, 7
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	note B_, 4
	note D_, 5
	note D_, 4
	note B_, 4
	octave 2
	notetype2 8
	note B_, 5
	note B_, 3
	inc_octave
	note C_, 5
	note C_, 3
	notetype0 1
	octave 3
	note C_, 8
	note C_, 1
	octave 5
	note C_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	note C_, 4
	note F_, 4
	inc_octave
	note C_, 5
	dec_octave
	note C_, 4
	note C_, 4
	inc_octave
	note C_, 4
	octave 3
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 8
	note C_, 1
	octave 5
	note C_, 4
	note C_, 4
	octave 3
	note C_, 7
	note C_, 1
	octave 5
	note C_, 4
	note C_, 4
	inc_octave
	note C_, 4
	dec_octave
	note C_, 5
	note C_, 4
	inc_octave
	note C_, 4
	octave 2
	notetype2 8
	note A_, 5
	note A_, 3
	inc_octave
	note C_, 5
	note C_, 3
	notetype0 1
	octave 2
	note B_, 8
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note D_, 4
	note G_, 4
	note B_, 5
	note D_, 4
	note D_, 4
	note B_, 4
	octave 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 8
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	octave 2
	note B_, 7
	note B_, 1
	octave 5
	note D_, 4
	note D_, 4
	note B_, 4
	note D_, 5
	note D_, 4
	note B_, 4
	octave 2
	notetype2 8
	note B_, 5
	note B_, 3
	inc_octave
	note C_, 5
	note C_, 3
	note D_, 16
	note D_, 9
	note D_, 8
	note F_, 16
	note F_, 9
	note F_, 8
	note E_, 16
	note E_, 6
	note C_, 16
	note C_, 6
	note E_, 16
	note E_, 6
	notetype0 11
	note G_, 6
	note F#, 3
	notetype0 1
	octave 2
	note D_, 6
	note D#, 6
	note F_, 5
	note G_, 6
	note A_, 5
	note A#, 5
	notetype0 1
	octave 3
	note D_, 8
	note D_, 1
	octave 2
	note G_, 4
	note __, 4
	inc_octave
	note D_, 4
	dec_octave
	note G_, 4
	note G_, 4
	inc_octave
	note D_, 4
	note G_, 5
	dec_octave
	note G_, 4
	inc_octave
	note D_, 4
	note G_, 4
	octave 3
	note D_, 6
	note D_, 2
	octave 3
	note G_, 4
	note __, 4
	inc_octave
	note D_, 5
	dec_octave
	note G_, 4
	note G_, 4
	inc_octave
	note D_, 4
	octave 3
	note D_, 7
	note D_, 1
	octave 3
	note D_, 4
	note __, 4
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 4
	inc_octave
	note G_, 4
	note D_, 4
	dec_octave
	note A#, 4
	note G_, 4
	inc_octave
	note D_, 4
	notetype0 1
	octave 3
	note F_, 8
	note F_, 1
	octave 3
	note D_, 4
	note __, 4
	note A_, 4
	note D_, 4
	note D_, 4
	note A_, 4
	inc_octave
	note D_, 5
	dec_octave
	note D_, 4
	note A_, 4
	inc_octave
	note D_, 4
	octave 3
	note D_, 6
	note D_, 2
	octave 4
	note D_, 4
	note __, 4
	note A_, 5
	note D_, 4
	note D_, 4
	note A_, 4
	octave 2
	note A_, 7
	note A_, 1
	octave 3
	note A_, 4
	note __, 4
	inc_octave
	note D_, 5
	dec_octave
	note A_, 4
	note F_, 4
	inc_octave
	note D_, 4
	dec_octave
	note A_, 4
	note F_, 4
	note D_, 4
	note A_, 4
	notetype0 1
	octave 2
	note G#, 8
	note G#, 1
	octave 2
	note F_, 4
	note __, 4
	inc_octave
	note C_, 4
	dec_octave
	note F_, 4
	note F_, 4
	inc_octave
	note C_, 4
	note F_, 5
	dec_octave
	note F_, 4
	inc_octave
	note C_, 4
	note F_, 4
	octave 3
	note C_, 6
	note C_, 2
	octave 3
	note F_, 4
	note __, 4
	inc_octave
	note C_, 5
	dec_octave
	note F_, 4
	note F_, 4
	inc_octave
	note C_, 4
	octave 3
	note F_, 7
	note F_, 1
	octave 3
	note C_, 4
	note __, 4
	note F_, 5
	note C_, 4
	dec_octave
	note G#, 4
	inc_octave
	note F_, 4
	note C_, 4
	dec_octave
	note G#, 4
	note F_, 4
	inc_octave
	note C_, 4
	notetype0 1
	octave 2
	note A#, 8
	note A#, 1
	octave 2
	note A#, 4
	note __, 4
	inc_octave
	note D_, 4
	dec_octave
	note A#, 4
	note A#, 4
	inc_octave
	note D_, 4
	note F_, 5
	dec_octave
	note A#, 4
	inc_octave
	note D_, 4
	note F_, 4
	octave 2
	note A#, 6
	note A#, 2
	octave 3
	note F_, 4
	note __, 4
	inc_octave
	note D_, 5
	dec_octave
	note F_, 4
	note F_, 4
	inc_octave
	note D_, 4
	octave 2
	note A#, 7
	note A#, 1
	octave 3
	note D_, 4
	note __, 4
	note F_, 5
	note D_, 4
	dec_octave
	note A#, 4
	inc_octave
	note F_, 4
	note D_, 4
	dec_octave
	note A#, 4
	note F_, 4
	inc_octave
	note D_, 4
	notetype0 1
	octave 3
	note C_, 8
	note C_, 1
	octave 3
	note C_, 4
	note __, 4
	note G_, 4
	note C_, 4
	note C_, 4
	note G_, 4
	inc_octave
	note C_, 5
	dec_octave
	note C_, 4
	note G_, 4
	inc_octave
	note C_, 4
	octave 3
	note G_, 6
	note G_, 2
	octave 4
	note C_, 4
	note __, 4
	note G_, 5
	note C_, 4
	note C_, 4
	note G_, 4
	octave 3
	note G_, 7
	note G_, 1
	octave 3
	note G_, 4
	note __, 4
	inc_octave
	note C_, 5
	dec_octave
	note G_, 4
	note D#, 4
	inc_octave
	note C_, 4
	dec_octave
	note G_, 4
	note D#, 4
	note C_, 4
	note G_, 4
	notetype0 1
	octave 4
	note C_, 8
	note C_, 1
	octave 3
	note C_, 4
	note __, 4
	note F_, 4
	note C_, 4
	note C_, 4
	note F_, 4
	note A_, 5
	note C_, 4
	note F_, 4
	note A_, 4
	octave 3
	note F_, 6
	note F_, 2
	octave 3
	note A_, 4
	note __, 4
	inc_octave
	note F_, 5
	dec_octave
	note A_, 4
	note A_, 4
	inc_octave
	note F_, 4
	octave 3
	note C_, 7
	note C_, 1
	octave 3
	note F_, 4
	note __, 4
	note A_, 5
	note F_, 4
	note C_, 4
	note A_, 4
	note F_, 4
	note C_, 4
	dec_octave
	note A_, 4
	inc_octave
	note F_, 4
	notetype0 1
	octave 3
	note D#, 8
	note D#, 1
	octave 2
	note G_, 4
	note __, 4
	inc_octave
	note D_, 4
	dec_octave
	note G_, 4
	note G_, 4
	inc_octave
	note D_, 4
	note G_, 5
	dec_octave
	note G_, 4
	inc_octave
	note D_, 4
	note G_, 4
	octave 2
	note A#, 6
	note A#, 2
	octave 3
	note G_, 4
	note __, 4
	inc_octave
	note D_, 5
	dec_octave
	note G_, 4
	note G_, 4
	inc_octave
	note D_, 4
	octave 3
	note D#, 7
	note D#, 1
	octave 3
	note D_, 4
	note __, 4
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 4
	inc_octave
	note G_, 4
	note D_, 4
	dec_octave
	note A#, 4
	note G_, 4
	inc_octave
	note D_, 4
	octave 3
	notetype0 11
	note F_, 12
	note D#, 6
	notetype0 11
	note C_, 3
	notetype0 1
	note C_, 1
	note C_, 16
	note __, 16
	loopchannel 0, .MainLoop


Music_TCG2GROverworld_Ch3: 
	notetype1 10
	notetype2 11
	notetype1 1
	notetype0 1
	note __, 16
.MainLoop
.Loop1
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 16
	note __, 16
	note __, 1
	note __, 16
	loopchannel 3, .Loop1
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 16
	note __, 16
	note __, 1
	note D_, 8
	note D_, 8
.Loop2
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 16
	note __, 16
	note __, 1
	note __, 16
	loopchannel 2, .Loop2
	octave 2
	note D#, 9
	note D#, 16
	note __, 8
	note __, 9
	note __, 8
	note D#, 8
	note D#, 8
	note F_, 6
	note F_, 11
	note F_, 16
	note __, 16
	note __, 1
	note F_, 8
	note F_, 8
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 8
	note G_, 8
	note __, 16
	note __, 1
	note __, 16
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 8
	note G_, 8
	note __, 16
	note __, 1
	note D_, 8
	note D_, 8
.Loop3
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 16
	note __, 16
	note __, 1
	note __, 16
	loopchannel 3, .Loop3
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 16
	note __, 16
	note __, 1
	note D_, 8
	note D_, 8
.Loop4
	octave 2
	note G_, 9
	note G_, 16
	note __, 8
	note __, 9
	note __, 8
	note G_, 8
	note G_, 8
	note G_, 6
	note G_, 11
	note G_, 16
	note __, 16
	note __, 1
	note __, 16
	loopchannel 2, .Loop4
	octave 2
	note A#, 9
	note A#, 16
	note __, 8
	note __, 9
	note __, 8
	note A#, 8
	note A#, 8
	inc_octave
	note C_, 6
	note C_, 11
	note C_, 16
	note __, 16
	note __, 1
	note C_, 8
	note C_, 8
	notetype0 1
	note D_, 16
	note D_, 16
	note D_, 9
	note D_, 8
	note D_, 9
	dec_octave
	note A_, 8
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 2
	octave 2
	note D#, 9
	note D#, 16
	note __, 8
	note __, 9
	note __, 8
	note D#, 5
	note D#, 11
	note __, 16
	note __, 1
	note D#, 5
	note D#, 11
	note D#, 16
	note D#, 1
	note A_, 8
	note A_, 8
	octave 2
	note A#, 9
	note A#, 16
	note __, 8
	note __, 9
	note __, 8
	note A#, 5
	note A#, 11
	note __, 16
	note __, 1
	note A#, 5
	note A#, 11
	note A#, 16
	note A#, 1
	note A#, 8
	note A#, 8
	octave 2
	note C#, 9
	note C#, 16
	note __, 8
	note __, 9
	note __, 8
	note C#, 5
	note C#, 11
	note __, 16
	note __, 1
	note C#, 5
	note C#, 11
	note C#, 16
	note C#, 1
	note C#, 8
	note C#, 8
	octave 2
	note C_, 9
	note C_, 16
	note __, 8
	note __, 9
	note __, 8
	note C_, 5
	note C_, 11
	note __, 9
	inc_octave
	note G_, 8
	inc_octave
	note C_, 8
	dec_octave
	note G_, 8
	dec_octave
	note A#, 9
	inc_octave
	note F_, 8
	note A#, 8
	note F_, 8
	octave 2
	note G#, 9
	note G#, 16
	note __, 8
	note __, 9
	note __, 8
	note G#, 5
	note G#, 11
	note __, 16
	note __, 1
	note G#, 5
	note G#, 11
	note G#, 16
	note G#, 1
	note G#, 8
	note G#, 8
	octave 2
	note D_, 9
	note D_, 16
	note __, 8
	note __, 9
	note __, 8
	note D_, 5
	note D_, 11
	note __, 16
	note __, 1
	note D_, 5
	note D_, 11
	note D_, 16
	note D_, 1
	note D_, 8
	note D_, 8
	octave 2
	note D#, 9
	note D#, 16
	note __, 8
	note __, 9
	note __, 8
	note D#, 5
	note D#, 11
	note __, 16
	note __, 1
	note D#, 5
	note D#, 11
	note D#, 16
	note D#, 1
	note D#, 8
	note D#, 8
	vibrato 32, $33
	notetype0 11
	note F_, 3
	note F_, 3
	note F_, 3
	notetype0 1
	note F_, 16
	note A#, 4
	note B_, 4
	inc_octave
	note C_, 9
	notetype0 11
	note F_, 3
	note F_, 3
	note F_, 3
	notetype0 1
	note F_, 16
	note __, 16
	note __, 1
	loopchannel 0, .MainLoop
	endchannel


Music_TCG2GROverworld_Ch4: 
	togglenoise $06
	notetype 1
	note __, 16
.MainLoop
	octave 1
	notetype 1
.Loop1
	note C#, 9
	note C#, 8
	note D_, 6
	note D_, 5
	note D_, 5
	note C#, 16
	note __, 1
	note C#, 16
	note D_, 6
	note D_, 6
	note D_, 5
	note C#, 16
	note C#, 16
	note __, 1
	note C#, 16
	loopchannel 16, .Loop1
	note C#, 9
	note C#, 8
	note D_, 6
	note D_, 5
	note D_, 5
	note C#, 16
	note __, 1
	note C#, 16
	note C#, 9
	note C#, 8
	note C#, 16
	note D_, 6
	note D_, 6
	note D_, 5
	note D_, 6
	note D_, 5
	note D_, 5
.Loop2
	note C#, 9
	note C#, 8
	note D_, 6
	note D_, 5
	note D_, 5
	rept 2
	note C#, 16
	note __, 1
	note C#, 16
	endr
	note C#, 16
	note __, 1
	note D_, 6
	note D_, 5
	note D_, 5
	loopchannel 7, .Loop2
	notetype 11
	note F_, 12
	note __, 12
	loopchannel 0, .MainLoop
	notetype 4
	notetype2 8
	dutycycle 2
	notetype1 11
	octave 4
	note C_, 4
	endchannel
	notetype 4
	notetype2 8
	dutycycle 2
	notetype1 11
	octave 3
	note D_, 4
	endchannel
	notetype 4
	notetype2 11
	notetype1 2
	notetype2 8
	octave 1
	note C_, 4
	endchannel
	notetype 4
	note F_, 4
	endchannel

