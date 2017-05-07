Music_TCG2Ishihara:
	db $C0
	dw Music_TCG2Ishihara_Ch1
	db $01
	dw Music_TCG2Ishihara_Ch2
	db $02
	dw Music_TCG2Ishihara_Ch3
	db $03
	dw Music_TCG2Ishihara_Ch4

Music_TCG2Ishihara_Ch2: 
	notetype1 10
	notetype0 1
	note __, 13
	note __, 14
	note __, 13
.MainLoop
	octave 2
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	note A_, 5
	note __, 9
	note A_, 5
	note __, 8
	note D#, 5
	note __, 9
	note D#, 5
	note __, 8
	note G_, 5
	note __, 9
	note G_, 5
	note __, 8
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	note A_, 5
	note __, 9
	note A_, 5
	note __, 8
	note D#, 5
	note __, 9
	note D#, 5
	note __, 8
	note G_, 16
	note G_, 11
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	note A_, 5
	note __, 9
	note A_, 5
	note __, 8
	note D#, 5
	note __, 9
	note D#, 5
	note __, 8
	note G_, 5
	note __, 9
	note G_, 5
	note __, 8
	note F_, 5
	note __, 2
	note F_, 5
	note __, 2
	octave 4
	note G#, 13
	note A_, 5
	note __, 2
	note A_, 7
	dec_octave
	note B_, 13
	inc_octave
	note C_, 5
	note __, 2
	note C_, 7
	dec_octave
	note G#, 13
	note A_, 2
	note __, 5
	note A_, 7
	note E_, 13
	note F_, 5
	note __, 2
	note F_, 7
	octave 2
	note C_, 5
	note __, 8
	note A_, 5
	note __, 9
	note A_, 5
	note __, 8
	note D#, 5
	note __, 9
	note D#, 5
	note __, 8
	note G_, 5
	note __, 9
	note G_, 5
	note __, 8
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	note A_, 5
	note __, 9
	note A_, 5
	note __, 8
	note D#, 5
	note __, 9
	note D#, 5
	note __, 8
	note G_, 16
	note G_, 11
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	note A_, 5
	note __, 9
	note A_, 5
	note __, 8
	note D#, 5
	note __, 9
	note D#, 5
	note __, 8
	note G_, 5
	note __, 9
	note G_, 5
	note __, 8
	note F_, 5
	note __, 2
	note F_, 5
	note __, 2
	note __, 13
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	callchannel Branch_1dd880
	note C#, 14
	note F_, 7
	note C#, 6
	note G#, 7
	note F_, 7
	note B_, 4
	inc_octave
	note C_, 9
	note C_, 14
	dec_octave
	note A#, 4
	inc_octave
	note C_, 4
	dec_octave
	note A#, 5
	note A_, 7
	note G#, 7
	note G_, 7
	note A_, 6
	callchannel Branch_1dd880
	note C#, 14
	note F_, 7
	note C#, 6
	note G#, 7
	note F_, 7
	note B_, 4
	inc_octave
	note C_, 9
	note C_, 14
	dec_octave
	note A#, 4
	inc_octave
	note C_, 4
	dec_octave
	note A#, 5
	note G#, 7
	note A#, 7
	note G_, 7
	note G#, 6
	callchannel Branch_1dd809
	octave 2
	note A_, 13
	callchannel Branch_1ddc41
	callchannel Branch_1dd849
	note F_, 13
	note F_, 14
	note F_, 13
	note F_, 14
	note F_, 13
	note F_, 14
	octave 2
	note A_, 13
	callchannel Branch_1ddc41
	callchannel Branch_1ddc4e
	callchannel Branch_1dd809
	octave 2
	note A_, 13
	callchannel Branch_1ddc41
	callchannel Branch_1dd849
	note E_, 3
	note F_, 10
	note F_, 14
	octave 3
	note F_, 13
	note A_, 5
	note A_, 9
	inc_octave
	note C_, 5
	note C_, 8
	note F_, 5
	note F_, 9
	note F_, 4
	note A_, 4
	inc_octave
	note C_, 5
	note F_, 5
	note F_, 9
	note __, 13
	loopchannel 0, .MainLoop

Branch_1dd809:
	octave 4
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	note F_, 14
	note G_, 7
	note F_, 6
	note G#, 7
	note G_, 7
	note A_, 3
	note A#, 10
	note A#, 14
	note G_, 7
	note A_, 6
	note F_, 7
	note G_, 7
	note D#, 13
	note D#, 14
	note D#, 13
	note D#, 14
	note C_, 7
	note C_, 6
	note C#, 7
	note C_, 7
	note C#, 7
	note __, 6
	note F_, 14
	note D#, 7
	note F_, 6
	note D#, 7
	note __, 7
	note C#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C_, 13
	note C_, 14
	note C_, 13
	note C_, 14
	note C_, 13
	note C_, 14
	endchannel

Branch_1dd849:
	octave 4
	note C_, 7
	note C_, 6
	note C_, 14
	note C#, 7
	note C_, 6
	note F_, 7
	note C#, 7
	note G_, 3
	note G#, 10
	note G#, 14
	note G_, 7
	note G#, 6
	note F_, 7
	note G_, 7
	note F#, 3
	note G_, 10
	note G_, 14
	note A#, 7
	note G_, 6
	note F_, 7
	note A#, 7
	note D#, 13
	note D#, 14
	note D#, 13
	note D#, 14
	note D#, 7
	note D#, 6
	note F_, 14
	note G_, 7
	note F_, 6
	note G#, 7
	note G_, 7
	note G_, 13
	note G_, 7
	note G_, 7
	note D#, 13
	note G_, 7
	note D#, 7
	endchannel

Branch_1dd880:
	octave 4
	note E_, 4
	note F_, 3
	note __, 7
	note E_, 4
	note F_, 3
	note __, 6
	note A_, 7
	note __, 7
	note A_, 7
	note __, 6
	note D#, 14
	note F_, 7
	note D#, 6
	note G_, 7
	note F_, 7
	note F_, 7
	note G_, 6
	note F_, 7
	note __, 7
	note C_, 7
	note __, 6
	note C_, 7
	note __, 7
	note D_, 3
	note D#, 10
	note D#, 14
	note D_, 7
	note D#, 6
	dec_octave
	note A#, 7
	inc_octave
	note D_, 7
	note D_, 7
	dec_octave
	note A#, 6
	inc_octave
	note C_, 7
	note D_, 7
	note C_, 7
	note __, 6
	dec_octave
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	note D#, 14
	note F_, 7
	note D#, 6
	note G_, 7
	note F_, 7
	note F_, 7
	note G_, 6
	octave 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	dec_octave
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	note A#, 13
	note A#, 14
	inc_octave
	note D_, 5
	note __, 2
	note D_, 5
	note __, 1
	dec_octave
	note A#, 5
	note __, 2
	note A#, 5
	note __, 2
	inc_octave
	note D_, 5
	note __, 2
	note D_, 5
	note __, 1
	octave 4
	note A_, 7
	note __, 7
	note A_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	dec_octave
	note G_, 14
	note A_, 7
	note G_, 6
	note A#, 7
	note A_, 7
	note A_, 7
	note A#, 6
	note A_, 7
	note __, 7
	note F_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F#, 3
	note G_, 10
	note G_, 14
	note F_, 7
	note G_, 6
	note D_, 7
	note F_, 7
	note F_, 7
	note D_, 6
	note D#, 7
	note F_, 7
	note D#, 7
	note __, 6
	dec_octave
	note A_, 7
	note __, 7
	note A_, 7
	note __, 6
	note A#, 14
	inc_octave
	note C_, 7
	dec_octave
	note A#, 6
	inc_octave
	note D_, 7
	note C_, 7
	note F_, 7
	note D_, 6
	octave 2
	note F_, 5
	note __, 2
	note F_, 5
	note __, 2
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	dec_octave
	note F_, 5
	note __, 2
	note F_, 5
	note __, 2
	note A#, 5
	note __, 2
	note A#, 6
	note A#, 14
	inc_octave
	note C_, 13
	note C_, 14
	dec_octave
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	octave 4
	note D_, 14
	note E_, 7
	note D_, 6
	note F_, 7
	note E_, 7
	note F#, 4
	note G_, 9
	note G_, 14
	note E_, 7
	note G_, 6
	note D_, 7
	note E_, 7
	note E_, 7
	note D_, 6
	note C_, 14
	dec_octave
	note A_, 7
	inc_octave
	note C_, 6
	note F#, 3
	note G_, 11
	note F_, 13
	note F_, 14
	note F_, 13
	note F_, 14
	note C_, 7
	note F_, 6
	note D_, 14
	note E_, 7
	note D_, 6
	note F_, 7
	note E_, 7
	note G#, 4
	note A_, 9
	note A_, 14
	note G_, 7
	note A_, 6
	note E_, 7
	note G_, 7
	note D_, 7
	note E_, 6
	note C_, 14
	note C_, 13
	note C_, 14
	note C_, 13
	note C_, 14
	note C_, 13
	note C_, 14
	note __, 13
	note D_, 14
	note E_, 7
	note D_, 6
	note F_, 7
	note E_, 7
	note F#, 4
	note G_, 9
	note G_, 14
	note E_, 7
	note G_, 6
	note D_, 7
	note E_, 7
	note E_, 7
	note D_, 6
	note C_, 14
	note D_, 7
	note C_, 6
	note E_, 7
	note D_, 7
	note F_, 13
	note F_, 14
	note C_, 7
	note F_, 6
	dec_octave
	note A_, 7
	inc_octave
	note C_, 7
	dec_octave
	note A#, 13
	note A#, 14
	inc_octave
	note D_, 7
	dec_octave
	note A#, 6
	inc_octave
	note F_, 7
	note D_, 7
	note C_, 13
	note C_, 14
	note E_, 7
	note C_, 6
	note G_, 7
	note E_, 7
	note C#, 13
	endchannel


Music_TCG2Ishihara_Ch1: 
	notetype1 10
	notetype0 1
	note __, 13
	note __, 14
	note __, 13
.MainLoop
.Loop1
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	loopchannel 3, .Loop1
	note __, 14
	octave 4
	note E_, 13
	note F_, 5
	note __, 2
	note F_, 7
	dec_octave
	note G#, 13
	note A_, 5
	note __, 2
	note A_, 7
	note E_, 13
	note F_, 5
	note __, 2
	note F_, 7
	dec_octave
	note A#, 13
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	octave 2
	note C_, 5
	note __, 8
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	dec_octave
	note A#, 5
	note __, 9
	note A#, 5
	note __, 8
	inc_octave
	note E_, 5
	note __, 9
	note D#, 5
	note __, 8
	note C_, 5
	note __, 9
	note C_, 5
	note __, 8
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	dec_octave
	note A#, 5
	note __, 9
	note A#, 5
	note __, 8
	inc_octave
	note D#, 16
	note D#, 11
	note C_, 5
	note __, 9
	note C_, 5
	note __, 8
	note F_, 5
	note __, 9
	note F_, 5
	note __, 8
	dec_octave
	note A#, 5
	note __, 9
	note A#, 5
	note __, 8
	inc_octave
	note D#, 5
	note __, 9
	note D#, 5
	note __, 8
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note __, 13
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	callchannel Branch_1ddc75
	note F_, 14
	note C#, 7
	note C#, 6
	note F_, 7
	note F_, 7
	note G_, 3
	note G#, 10
	note G#, 14
	note G_, 4
	note G#, 4
	note G_, 5
	octave 2
	note F_, 4
	note G_, 3
	note A_, 4
	note A#, 3
	inc_octave
	note C_, 4
	note D_, 3
	note D#, 3
	note E_, 3
	callchannel Branch_1ddc75
	note F_, 14
	note C#, 7
	note C#, 6
	note F_, 7
	note F_, 7
	note G_, 3
	note G#, 10
	note G#, 14
	note G_, 4
	note G#, 4
	note G_, 5
	note F_, 14
	octave 2
	note G#, 4
	note A#, 3
	note B_, 3
	inc_octave
	note C_, 3
	octave 3
	note G#, 7
	note G#, 7
	note __, 13
	octave 3
	callchannel Branch_1ddc41
	callchannel Branch_1ddc4e
	note __, 14
	octave 3
	note D#, 13
	note F_, 7
	note __, 7
	note F#, 3
	vibrato 3, $33
	note G_, 10
	note G_, 14
	vibrato 0, $33
	note D#, 7
	note __, 6
	callchannel Branch_1ddc41
	vibrato 7, $33
	note C_, 7
	note C_, 6
	note C_, 14
	vibrato 0, $33
	callchannel Branch_1ddc4e
	callchannel Branch_1ddc41
	callchannel Branch_1ddc4e
	note __, 14
	note C#, 13
	callchannel Branch_1ddc41
	note F_, 7
	note __, 6
	note G_, 14
	note G#, 7
	note __, 6
	note A#, 7
	note __, 7
	vibrato 7, $33
	note A_, 13
	note A_, 14
	vibrato 0, $33
	note F_, 7
	note __, 6
	callchannel Branch_1ddc41
	dec_octave
	note A#, 7
	note __, 6
	note A_, 14
	octave 2
	note F_, 13
	callchannel Branch_1ddc41
	callchannel Branch_1ddc4e
	note C_, 3
	vibrato 3, $33
	note C#, 11
	note C#, 13
	vibrato 0, $33
	callchannel Branch_1ddc41
	callchannel Branch_1ddc4e
	note __, 14
	note F_, 7
	note __, 6
	note G#, 7
	note __, 7
	note A_, 3
	vibrato 7, $33
	note A#, 10
	note A#, 14
	vibrato 0, $33
	note G_, 7
	note __, 6
	callchannel Branch_1ddc41
	dec_octave
	vibrato 7, $33
	note A#, 13
	note A#, 14
	vibrato 0, $33
	callchannel Branch_1ddc4e
	callchannel Branch_1ddc41
	callchannel Branch_1ddc4e
	octave 3
	note C#, 14
	note D#, 7
	note __, 6
	callchannel Branch_1ddc41
	note D#, 13
	note D#, 7
	note __, 7
	dec_octave
	note A#, 7
	note __, 6
	callchannel Branch_1ddc41
	octave 2
	note A_, 3
	vibrato 7, $33
	note A#, 10
	note A#, 14
	vibrato 0, $33
	inc_octave
	note F_, 7
	note __, 6
	callchannel Branch_1ddc41
	dec_octave
	note A#, 7
	note __, 6
	note A_, 14
	callchannel Branch_1ddc4e
	octave 2
	note C#, 4
	note D#, 3
	note F_, 4
	note F#, 3
	note G#, 4
	note A#, 3
	note B_, 3
	inc_octave
	note C_, 3
	vibrato 7, $33
	note C#, 14
	note C#, 13
	octave 3
	note G#, 7
	note __, 7
	callchannel Branch_1ddc68
	octave 4
	note C#, 14
	callchannel Branch_1ddc68
	octave 4
	note F_, 7
	note __, 7
	note F#, 3
	note G_, 10
	note G_, 14
	callchannel Branch_1ddc68
	octave 3
	note G#, 7
	note __, 7
	note G_, 13
	note G_, 14
	callchannel Branch_1ddc68
	callchannel Branch_1ddc5b
	octave 3
	note A_, 7
	note __, 6
	note A#, 7
	note __, 7
	note __, 13
	inc_octave
	note C#, 14
	note C_, 7
	note __, 6
	note __, 14
	dec_octave
	note A#, 7
	note __, 6
	note __, 14
	note A#, 13
	note A#, 14
	note A_, 7
	note __, 6
	note G_, 7
	note __, 7
	note A_, 13
	note A_, 14
	octave 2
	note F_, 13
	callchannel Branch_1ddc5b
	octave 3
	note A_, 7
	note __, 6
	note G#, 12
	note __, 2
	note G#, 7
	note __, 6
	callchannel Branch_1ddc5b
	octave 4
	note E_, 3
	note F_, 10
	note F_, 14
	note D#, 7
	note __, 6
	callchannel Branch_1ddc5b
	octave 4
	note D_, 3
	note D#, 10
	note D#, 14
	note G_, 7
	note __, 6
	callchannel Branch_1ddc5b
	octave 3
	note G_, 13
	note G_, 14
	callchannel Branch_1ddc4e
	callchannel Branch_1ddc41
	callchannel Branch_1ddc4e
	inc_octave
	note C#, 14
	octave 2
	note C#, 4
	note G#, 4
	inc_octave
	note C#, 5
	inc_octave
	note C#, 5
	note C#, 9
	octave 4
	note D#, 13
	note __, 14
	octave 2
	note D#, 4
	note A#, 4
	inc_octave
	note D#, 5
	inc_octave
	note D#, 5
	note D#, 9
	octave 3
	note A_, 13
	note A_, 14
	octave 3
	note C_, 13
	note F_, 5
	note F_, 9
	note A_, 5
	note A_, 8
	inc_octave
	note C_, 5
	note C_, 9
	note __, 13
	inc_octave
	note C_, 5
	note C_, 9
	note __, 13
	loopchannel 0, .MainLoop

Branch_1ddc41:
	octave 3
	note C_, 5
	note C_, 9
	endchannel

Branch_1ddc4e:
	octave 3
	note C_, 5
	note C_, 8
	endchannel

Branch_1ddc5b:
	octave 3
	note C_, 5
	note C_, 9
	endchannel

Branch_1ddc68:
	octave 3
	note C_, 5
	note C_, 8
	endchannel

Branch_1ddc75:
	octave 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 1
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	dec_octave
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	note A#, 5
	note __, 2
	note A#, 5
	note __, 2
	note A#, 5
	note __, 2
	note A#, 5
	note __, 1
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 1
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	dec_octave
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	note A#, 14
	note A#, 5
	note A#, 8
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 1
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	dec_octave
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	note A#, 5
	note __, 2
	note A#, 5
	note __, 2
	note A#, 5
	note __, 2
	note A#, 5
	note __, 1
	note __, 14
	note __, 13
	note __, 14
	note G_, 13
	note G_, 14
	note A#, 5
	note __, 2
	note A#, 5
	note __, 1
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	note A#, 5
	note __, 2
	note A#, 5
	note __, 1
	octave 4
	note E_, 4
	note F_, 3
	note __, 7
	octave 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 1
	octave 4
	note A_, 7
	note __, 16
	note __, 4
	note D#, 14
	note F_, 7
	note __, 6
	octave 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	octave 4
	note F_, 7
	note __, 6
	octave 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 2
	octave 4
	note C_, 7
	note __, 6
	octave 3
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	octave 4
	note D_, 3
	note D#, 10
	note D#, 14
	note D_, 7
	note __, 6
	octave 2
	note G_, 5
	note __, 2
	note G_, 5
	note __, 2
	octave 4
	note D_, 7
	note __, 6
	note C_, 7
	note __, 7
	octave 2
	note A_, 5
	note __, 2
	note A_, 5
	note __, 1
	octave 3
	note F_, 7
	note __, 7
	note __, 7
	note __, 6
	note G_, 14
	note A_, 7
	note __, 6
	octave 2
	note G_, 5
	note __, 2
	note __, 5
	note __, 2
	octave 4
	note C_, 7
	note __, 6
	octave 2
	note __, 14
	note __, 13
	note __, 14
	note F_, 5
	note __, 2
	note F_, 6
	note F_, 14
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	octave 2
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note G_, 4
	note A_, 3
	note A#, 3
	inc_octave
	note C_, 3
	octave 2
	note __, 14
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	inc_octave
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	note D_, 5
	note __, 1
	note __, 9
	note __, 5
	dec_octave
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	inc_octave
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	dec_octave
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	note __, 14
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	note __, 9
	note __, 5
	dec_octave
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	inc_octave
	note E_, 5
	note __, 2
	note E_, 5
	note __, 2
	dec_octave
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	note __, 14
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	inc_octave
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	note D_, 5
	note __, 1
	note __, 9
	note __, 5
	dec_octave
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	inc_octave
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	dec_octave
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	note __, 14
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	note __, 9
	note __, 5
	dec_octave
	note A_, 13
	note A#, 14
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 1
	note __, 14
	dec_octave
	note F_, 5
	note __, 2
	note F_, 5
	note __, 1
	inc_octave
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	note D_, 5
	note __, 2
	note D_, 5
	note __, 1
	note __, 9
	note __, 5
	dec_octave
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	inc_octave
	note E_, 5
	note __, 2
	note E_, 5
	note __, 2
	dec_octave
	note G_, 5
	note __, 2
	note G_, 5
	note __, 1
	note __, 14
	note B_, 13
	inc_octave
	note C#, 5
	note __, 2
	note C#, 5
	note __, 2
	note D_, 13
	note D_, 14
	dec_octave
	note A_, 5
	note __, 2
	note A_, 5
	note __, 1
	inc_octave
	note C_, 5
	note __, 2
	note C_, 5
	note __, 2
	note D_, 13
	note D_, 14
	dec_octave
	note A#, 7
	note A#, 6
	inc_octave
	note D_, 7
	note D_, 7
	note E_, 13
	note E_, 14
	note C_, 7
	note C_, 6
	note E_, 7
	note E_, 7
	note F_, 13
	endchannel


Music_TCG2Ishihara_Ch3: 
	notetype1 10
	notetype2 11
	notetype1 1
	notetype0 1
	note __, 13
	octave 2
	note C_, 14
	note C#, 4
	note D_, 3
	note D#, 3
	note E_, 3
.MainLoop
	octave 2
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	dec_octave
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	dec_octave
	note D#, 7
	note __, 7
	note C_, 7
	note __, 6
	note D#, 7
	note __, 7
	note E_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	dec_octave
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	note F_, 14
	inc_octave
	inc_octave
	note E_, 13
	note F_, 4
	note __, 10
	dec_octave
	note B_, 13
	inc_octave
	note C_, 4
	note __, 10
	dec_octave
	note E_, 13
	note F_, 4
	note __, 10
	note C_, 13
	dec_octave
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	dec_octave
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	dec_octave
	note D#, 7
	note __, 7
	note C_, 7
	note __, 6
	note D#, 7
	note __, 7
	note E_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	dec_octave
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	note F_, 14
	note A#, 13
	note B_, 7
	note __, 7
	inc_octave
	note C_, 7
	note __, 6
	vibrato 7, $33
	note D#, 7
	note D#, 7
	vibrato 0, $33
	note C_, 7
	note __, 6
	note D#, 7
	note __, 7
	note E_, 7
	note __, 6
	callchannel Branch_1de0c5
	octave 2
	note A#, 14
	inc_octave
	note F_, 13
	note A#, 7
	note __, 7
	note D#, 13
	note D#, 14
	dec_octave
	note A#, 13
	note D#, 14
	note E_, 7
	note __, 6
	callchannel Branch_1de0c5
	octave 2
	note A#, 14
	inc_octave
	note F_, 13
	note A#, 7
	note __, 7
	note D#, 13
	note D#, 14
	dec_octave
	note A#, 13
	note D#, 14
	note D_, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	note G#, 14
	dec_octave
	note G#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	inc_octave
	note C#, 14
	dec_octave
	dec_octave
	note G_, 7
	note __, 6
	note G#, 7
	note __, 7
	note G#, 7
	note __, 6
	inc_octave
	inc_octave
	note C_, 14
	dec_octave
	dec_octave
	note D#, 7
	note __, 6
	note G#, 7
	note __, 7
	note G#, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note A_, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note B_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note D#, 14
	dec_octave
	note C_, 7
	note __, 6
	dec_octave
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note F_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 13
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	note G#, 14
	dec_octave
	note G#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	inc_octave
	note C#, 14
	dec_octave
	dec_octave
	note C#, 7
	note __, 6
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	inc_octave
	note D#, 14
	dec_octave
	dec_octave
	note G_, 7
	note __, 6
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note G_, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	inc_octave
	note C#, 14
	dec_octave
	dec_octave
	note F_, 7
	note __, 6
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note F_, 13
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note C_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	inc_octave
	note C#, 14
	dec_octave
	dec_octave
	note G#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	inc_octave
	note C#, 14
	dec_octave
	dec_octave
	note G_, 7
	note __, 6
	note G#, 7
	note __, 7
	note G#, 7
	note __, 6
	inc_octave
	inc_octave
	note D#, 14
	dec_octave
	dec_octave
	note D#, 7
	note __, 6
	note G#, 7
	note __, 7
	note G#, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note A_, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	inc_octave
	note C#, 14
	dec_octave
	dec_octave
	note B_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note D#, 14
	dec_octave
	note C_, 7
	note __, 6
	dec_octave
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note F_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 13
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	note G#, 14
	dec_octave
	note G#, 7
	note __, 6
	note C#, 7
	note __, 7
	note C#, 7
	note __, 6
	inc_octave
	note G#, 14
	dec_octave
	note G#, 7
	note __, 6
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note G_, 7
	note __, 6
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note G_, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	inc_octave
	note G#, 14
	dec_octave
	dec_octave
	note C_, 13
	note C_, 7
	note __, 7
	inc_octave
	note C_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	dec_octave
	note F_, 13
	note F_, 7
	note __, 7
	note F_, 13
	note A_, 7
	note __, 7
	inc_octave
	note C_, 7
	note __, 6
	note F_, 7
	note __, 7
	note __, 7
	note __, 6
	inc_octave
	inc_octave
	note F_, 7
	notetype1 3
	note F_, 7
	note __, 13
	notetype1 1
	loopchannel 0, .MainLoop

Branch_1de0c5:
	octave 2
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	dec_octave
	note F_, 7
	note __, 6
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note A#, 7
	note __, 7
	note D#, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	dec_octave
	note F_, 7
	note __, 6
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note G_, 14
	dec_octave
	note C_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	dec_octave
	note F_, 7
	note __, 6
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	note A#, 7
	note __, 7
	note D#, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	dec_octave
	note C_, 13
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	note D#, 14
	note E_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note F_, 14
	dec_octave
	note F_, 7
	note __, 6
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note D#, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note A_, 14
	dec_octave
	note F_, 7
	note __, 6
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note C_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note A_, 14
	dec_octave
	note F_, 7
	note __, 6
	note D#, 7
	note __, 7
	note D#, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note D#, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note C_, 7
	note __, 7
	dec_octave
	note G_, 13
	note __, 14
	note A_, 13
	note A_, 14
	note F_, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	note A_, 14
	note A_, 13
	dec_octave
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	note A_, 14
	dec_octave
	note A#, 7
	note __, 6
	note A_, 7
	note __, 7
	note A_, 7
	note __, 6
	inc_octave
	note A_, 14
	note A_, 13
	dec_octave
	note A_, 7
	note __, 7
	note A_, 7
	note __, 6
	inc_octave
	note A_, 14
	dec_octave
	note A_, 7
	note __, 6
	note G_, 7
	note __, 7
	note G_, 7
	note __, 6
	inc_octave
	note A#, 14
	note A#, 13
	dec_octave
	note C_, 7
	note __, 7
	note C_, 7
	note __, 6
	inc_octave
	note A#, 14
	dec_octave
	note C_, 7
	note __, 6
	note F_, 7
	note __, 7
	note F_, 7
	note __, 6
	inc_octave
	note A_, 14
	note A_, 13
	dec_octave
	note F_, 7
	note __, 7
	note F_, 13
	note G_, 14
	note A_, 7
	note __, 6
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	note A_, 14
	note A_, 13
	dec_octave
	note A#, 7
	note __, 7
	note A#, 7
	note __, 6
	inc_octave
	inc_octave
	note C_, 14
	dec_octave
	dec_octave
	note A#, 7
	note __, 6
	note A_, 7
	note __, 7
	note B_, 7
	note __, 6
	inc_octave
	note C#, 7
	note __, 7
	note D_, 13
	note D_, 14
	dec_octave
	note D_, 7
	note __, 6
	inc_octave
	inc_octave
	note C_, 14
	dec_octave
	dec_octave
	note G_, 13
	note G_, 14
	inc_octave
	note D_, 13
	note G_, 7
	note __, 7
	dec_octave
	note A_, 13
	note A_, 14
	inc_octave
	note E_, 13
	note A_, 7
	note __, 7
	dec_octave
	note A#, 13
	endchannel


Music_TCG2Ishihara_Ch4: 
	togglenoise $06
	notetype 1
	octave 1
	note D#, 13
	notetype 9
	note E_, 3
	notetype 1
.MainLoop
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note D#, 13
	note C#, 14
	note D#, 7
	note C#, 6
	note C#, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note D#, 13
	note C#, 14
	note D#, 7
	note C#, 6
	note C#, 14
	note __, 13
	note __, 14
	note __, 13
	note __, 14
	note __, 13
	note D#, 7
	note D#, 7
	note E_, 13
.Loop1
	callchannel Branch_1de321
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note E_, 13
	note C_, 14
	note D#, 4
	note D#, 4
	note D#, 5
	note C#, 14
	note C#, 13
	callchannel Branch_1de321
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note E_, 13
	note C#, 7
	note C#, 7
	note C#, 13
	callchannel Branch_1de321
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note C#, 4
	note C#, 4
	note C#, 5
	note C#, 14
	note C#, 13
	callchannel Branch_1de321
	note C_, 14
	note C#, 13
	note C#, 14
	note C_, 16
	note __, 11
	note C#, 13
	note C#, 14
	note E_, 13
	note __, 14
	note C#, 13
	note C#, 14
	note C_, 16
	note __, 11
	note C#, 13
	note C#, 14
	note C_, 13
	note __, 14
	note C#, 13
	note C#, 14
	note C_, 13
	note __, 14
	note C#, 4
	note C#, 4
	note C#, 5
	note C#, 14
	note C#, 13
	loopchannel 2, .Loop1
	callchannel Branch_1de321
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note C#, 13
	note C#, 14
	note C#, 13
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note C#, 13
	note C#, 14
	note E_, 13
	note __, 14
	note C#, 4
	note C#, 4
	note C#, 5
	note C#, 14
	note C#, 13
	note C#, 14
	note D#, 7
	note C#, 6
	note C#, 14
	note C#, 13
	callchannel Branch_1de321
	callchannel Branch_1de321
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note C#, 4
	note C#, 4
	note C#, 5
	note C#, 14
	note C#, 13
	callchannel Branch_1de321
	note C_, 14
	note C_, 13
	note C#, 14
	note E_, 13
	note C#, 14
	note D#, 7
	note C#, 6
	note C#, 14
	note C#, 13
	note C_, 14
	note C#, 5
	note C#, 4
	note C#, 4
	note C#, 14
	note C_, 13
	note D#, 14
	note C#, 13
	note C#, 14
	note C_, 13
	note __, 14
	note C#, 13
	note C#, 14
	note C#, 13
	note C#, 14
	note D#, 5
	note D#, 4
	note D#, 4
	notetype 9
	note F_, 3
	notetype 1
	loopchannel 0, .MainLoop

Branch_1de321:
	note C_, 14
	note C_, 13
	note C#, 14
	note C#, 13
	note C_, 14
	note D#, 13
	note C#, 14
	note E_, 13
	endchannel

