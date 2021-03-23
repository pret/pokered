Music_Ishihara:
	channel_count 4
	channel 1, Music_Ishihara_Ch1
	channel 2, Music_Ishihara_Ch2
	channel 3, Music_Ishihara_Ch3
	channel 4, Music_Ishihara_Ch4

Music_Ishihara_Ch2: ; 1dd6cc (77:56cc)
	notetype1 10
	notetype0 1
	;musicdc 255
	rest 13
	rest 14
	rest 13
.MainLoop
	;musicf0 27
	octave 2
	;musicf1 87
	;musicf3
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	note A_, 5
	rest 9
	note A_, 5
	rest 8
	note D#, 5
	rest 9
	note D#, 5
	rest 8
	note G_, 5
	rest 9
	note G_, 5
	rest 8
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	note A_, 5
	rest 9
	note A_, 5
	rest 8
	note D#, 5
	rest 9
	note D#, 5
	rest 8
	note G_, 16
	;tie
	note G_, 11
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	note A_, 5
	rest 9
	note A_, 5
	rest 8
	note D#, 5
	rest 9
	note D#, 5
	rest 8
	note G_, 5
	rest 9
	note G_, 5
	rest 8
	;musicf2
	note F_, 5
	rest 2
	note F_, 5
	rest 2
	;musicf3
	;musicf0 3
	;musicef 254
	;musicf1 69
	octave 4
	;musicf3
	note G#, 13
	;musicf2
	note A_, 5
	rest 2
	note A_, 7
	;musicf3
	dec_octave
	note B_, 13
	inc_octave
	;musicf2
	note C_, 5
	rest 2
	note C_, 7
	;musicf3
	dec_octave
	note G#, 13
	;musicf2
	note A_, 2
	rest 5
	note A_, 7
	;musicf3
	note E_, 13
	;musicf2
	note F_, 5
	rest 2
	note F_, 7
	;musicf3
	;musicf0 27
	octave 2
	;musicf3
	note C_, 5
	rest 8
	note A_, 5
	rest 9
	note A_, 5
	rest 8
	note D#, 5
	rest 9
	note D#, 5
	rest 8
	note G_, 5
	rest 9
	note G_, 5
	rest 8
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	note A_, 5
	rest 9
	note A_, 5
	rest 8
	note D#, 5
	rest 9
	note D#, 5
	rest 8
	note G_, 16
	;tie
	note G_, 11
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	note A_, 5
	rest 9
	note A_, 5
	rest 8
	note D#, 5
	rest 9
	note D#, 5
	rest 8
	note G_, 5
	rest 9
	note G_, 5
	rest 8
	;musicf2
	note F_, 5
	rest 2
	note F_, 5
	rest 2
	rest 13
	rest 14
	rest 13
	rest 14
	rest 13
	rest 14
	rest 13
	sound_call Branch_1dd880
	note C#, 14
	;musicf2
	note F_, 7
	note C#, 6
	note G#, 7
	note F_, 7
	;musicf3
	note B_, 4
	inc_octave
	note C_, 9
	;tie
	note C_, 14
	dec_octave
	note A#, 4
	inc_octave
	note C_, 4
	dec_octave
	note A#, 5
	;musicf2
	note A_, 7
	note G#, 7
	note G_, 7
	note A_, 6
	;musicf3
	sound_call Branch_1dd880
	note C#, 14
	;musicf2
	note F_, 7
	note C#, 6
	note G#, 7
	note F_, 7
	;musicf3
	note B_, 4
	inc_octave
	note C_, 9
	;tie
	note C_, 14
	dec_octave
	note A#, 4
	inc_octave
	note C_, 4
	dec_octave
	note A#, 5
	;musicf2
	note G#, 7
	note A#, 7
	note G_, 7
	note G#, 6
	;musicf0 32
	;musicf1 55
	sound_call Branch_1dd809
	;musicf0 27
	octave 2
	;musicf3
	note A_, 13
	;musicec 254
	sound_call Branch_1ddc41
	;musicf0 32
	;musicf1 55
	sound_call Branch_1dd849
	note F_, 13
	;tie
	note F_, 14
	;tie
	note F_, 13
	;tie
	note F_, 14
	;tie
	note F_, 13
	;tie
	note F_, 14
	;musicf0 27
	octave 2
	;musicf3
	note A_, 13
	;musicec 254
	sound_call Branch_1ddc41
	sound_call Branch_1ddc4e
	;musicf0 2
	;musicf1 55
	sound_call Branch_1dd809
	;musicf0 27
	octave 2
	note A_, 13
	;musicec 254
	sound_call Branch_1ddc41
	;musicf0 2
	;musicf1 55
	sound_call Branch_1dd849
	note E_, 3
	;tie
	note F_, 10
	;tie
	note F_, 14
	;musicf0 27
	;musicf1 32
	octave 3
	;musicf3
	note F_, 13
	;musicf2
	note A_, 5
	note A_, 9
	inc_octave
	note C_, 5
	note C_, 8
	note F_, 5
	note F_, 9
	;musicf3
	note F_, 4
	note A_, 4
	inc_octave
	note C_, 5
	;musicf2
	note F_, 5
	note F_, 9
	rest 13
	sound_loop 0, .MainLoop

Branch_1dd809:
	octave 4
	;musicf2
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	;musicf3
	note F_, 14
	;musicf2
	note G_, 7
	note F_, 6
	note G#, 7
	note G_, 7
	;musicf3
	note A_, 3
	note A#, 10
	;tie
	note A#, 14
	;musicf2
	note G_, 7
	note A_, 6
	note F_, 7
	note G_, 7
	note D#, 13
	;tie
	note D#, 14
	;tie
	note D#, 13
	note D#, 14
	note C_, 7
	note C_, 6
	note C#, 7
	note C_, 7
	;tie
	note C#, 7
	rest 6
	;musicf3
	note F_, 14
	;musicf2
	note D#, 7
	note F_, 6
	;tie
	note D#, 7
	rest 7
	note C#, 7
	rest 6
	note C#, 7
	rest 7
	note C_, 13
	;tie
	note C_, 14
	;tie
	note C_, 13
	;tie
	note C_, 14
	;tie
	note C_, 13
	;tie
	note C_, 14
	sound_ret

Branch_1dd849:
	octave 4
	note C_, 7
	note C_, 6
	;musicf3
	note C_, 14
	;musicf2
	note C#, 7
	note C_, 6
	note F_, 7
	note C#, 7
	;musicf3
	note G_, 3
	note G#, 10
	;tie
	note G#, 14
	;musicf2
	note G_, 7
	note G#, 6
	note F_, 7
	note G_, 7
	;musicf3
	note F#, 3
	note G_, 10
	;tie
	note G_, 14
	;musicf2
	note A#, 7
	note G_, 6
	note F_, 7
	note A#, 7
	note D#, 13
	;tie
	note D#, 14
	;tie
	note D#, 13
	note D#, 14
	note D#, 7
	note D#, 6
	;musicf3
	note F_, 14
	;musicf2
	note G_, 7
	note F_, 6
	note G#, 7
	note G_, 7
	note G_, 13
	;tie
	note G_, 7
	note G_, 7
	;musicf3
	note D#, 13
	;musicf2
	note G_, 7
	note D#, 7
	sound_ret

Branch_1dd880:
	;musicf0 32
	;musicf1 39
	octave 4
	note E_, 4
	;tie
	note F_, 3
	rest 7
	note E_, 4
	;tie
	note F_, 3
	rest 6
	note A_, 7
	rest 7
	note A_, 7
	rest 6
	;musicf3
	note D#, 14
	;musicf2
	note F_, 7
	note D#, 6
	note G_, 7
	note F_, 7
	note F_, 7
	note G_, 6
	;tie
	note F_, 7
	rest 7
	note C_, 7
	rest 6
	note C_, 7
	rest 7
	;musicf3
	note D_, 3
	;tie
	note D#, 10
	;tie
	note D#, 14
	;musicf2
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
	;tie
	note C_, 7
	rest 6
	dec_octave
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	;musicf3
	note D#, 14
	;musicf2
	note F_, 7
	note D#, 6
	note G_, 7
	note F_, 7
	note F_, 7
	note G_, 6
	;musicf0 27
	;musicf1 32
	octave 2
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	dec_octave
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	;musicf3
	note A#, 13
	;tie
	note A#, 14
	;musicf2
	inc_octave
	note D_, 5
	rest 2
	note D_, 5
	rest 1
	dec_octave
	note A#, 5
	rest 2
	note A#, 5
	rest 2
	inc_octave
	note D_, 5
	rest 2
	note D_, 5
	rest 1
	;musicf0 32
	;musicf1 39
	octave 4
	note A_, 7
	rest 7
	note A_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	dec_octave
	;musicf3
	note G_, 14
	;musicf2
	note A_, 7
	note G_, 6
	note A#, 7
	note A_, 7
	note A_, 7
	note A#, 6
	;tie
	note A_, 7
	rest 7
	note F_, 7
	rest 6
	note F_, 7
	rest 7
	;musicf3
	note F#, 3
	;tie
	note G_, 10
	;tie
	note G_, 14
	;musicf2
	note F_, 7
	note G_, 6
	note D_, 7
	note F_, 7
	note F_, 7
	note D_, 6
	note D#, 7
	note F_, 7
	;tie
	note D#, 7
	rest 6
	dec_octave
	note A_, 7
	rest 7
	note A_, 7
	rest 6
	;musicf3
	note A#, 14
	;musicf2
	inc_octave
	note C_, 7
	dec_octave
	note A#, 6
	inc_octave
	note D_, 7
	note C_, 7
	note F_, 7
	note D_, 6
	;musicf0 27
	;musicf1 32
	octave 2
	;musicf2
	note F_, 5
	rest 2
	note F_, 5
	rest 2
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	dec_octave
	note F_, 5
	rest 2
	note F_, 5
	rest 2
	note A#, 5
	rest 2
	note A#, 6
	;tie
	note A#, 14
	;musicf3
	inc_octave
	note C_, 13
	;tie
	note C_, 14
	;musicf2
	dec_octave
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	;musicf0 2
	octave 4
	;musicef 255
	;musicf1 39
	;musicf3
	note D_, 14
	;musicf2
	note E_, 7
	note D_, 6
	note F_, 7
	note E_, 7
	;musicf3
	note F#, 4
	note G_, 9
	;tie
	note G_, 14
	;musicf2
	note E_, 7
	note G_, 6
	note D_, 7
	note E_, 7
	note E_, 7
	note D_, 6
	;musicf3
	note C_, 14
	dec_octave
	;musicf2
	note A_, 7
	inc_octave
	note C_, 6
	;musicf3
	note F#, 3
	note G_, 11
	;musicf2
	note F_, 13
	;tie
	note F_, 14
	;tie
	note F_, 13
	note F_, 14
	note C_, 7
	note F_, 6
	;musicf3
	note D_, 14
	;musicf2
	note E_, 7
	note D_, 6
	note F_, 7
	note E_, 7
	;musicf3
	note G#, 4
	note A_, 9
	;tie
	note A_, 14
	;musicf2
	note G_, 7
	note A_, 6
	note E_, 7
	note G_, 7
	note D_, 7
	note E_, 6
	note C_, 14
	;tie
	note C_, 13
	;tie
	note C_, 14
	;tie
	note C_, 13
	;tie
	note C_, 14
	;tie
	note C_, 13
	note C_, 14
	;musicf3
	rest 13
	note D_, 14
	;musicf2
	note E_, 7
	note D_, 6
	note F_, 7
	note E_, 7
	;musicf3
	note F#, 4
	note G_, 9
	;tie
	note G_, 14
	;musicf2
	note E_, 7
	note G_, 6
	note D_, 7
	note E_, 7
	note E_, 7
	note D_, 6
	;musicf3
	note C_, 14
	;musicf2
	note D_, 7
	note C_, 6
	note E_, 7
	note D_, 7
	;musicf3
	note F_, 13
	;tie
	note F_, 14
	;musicf2
	note C_, 7
	note F_, 6
	dec_octave
	note A_, 7
	inc_octave
	note C_, 7
	;musicf3
	dec_octave
	note A#, 13
	;tie
	note A#, 14
	inc_octave
	;musicf2
	note D_, 7
	dec_octave
	note A#, 6
	inc_octave
	note F_, 7
	note D_, 7
	;musicf3
	note C_, 13
	;tie
	note C_, 14
	;musicf2
	note E_, 7
	note C_, 6
	note G_, 7
	note E_, 7
	;musicf3
	note C#, 13
	;tie
	sound_ret


Music_Ishihara_Ch1: ; 1dd9de (77:59de)
	notetype1 10
	notetype0 1
	;musicdc 255
	;musicf1 86
	rest 13
	rest 14
	rest 13
.MainLoop
.Loop1
	rest 14
	rest 13
	rest 14
	rest 13
	rest 14
	rest 13
	rest 14
	rest 13
	sound_loop 3, .Loop1
	rest 14
	;musicf0 3
	;musicef 254
	;musicf1 69
	octave 4
	;musicf3
	note E_, 13
	;musicf2
	note F_, 5
	rest 2
	note F_, 7
	;musicf3
	dec_octave
	note G#, 13
	;musicf2
	note A_, 5
	rest 2
	note A_, 7
	;musicf3
	note E_, 13
	;musicf2
	note F_, 5
	rest 2
	note F_, 7
	;musicf3
	dec_octave
	note A#, 13
	;musicf2
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	;musicf3
	;musicf0 27
	octave 2
	;musicf3
	note C_, 5
	rest 8
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	dec_octave
	note A#, 5
	rest 9
	note A#, 5
	rest 8
	inc_octave
	note E_, 5
	rest 9
	note D#, 5
	rest 8
	note C_, 5
	rest 9
	note C_, 5
	rest 8
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	dec_octave
	note A#, 5
	rest 9
	note A#, 5
	rest 8
	inc_octave
	note D#, 16
	;tie
	note D#, 11
	note C_, 5
	rest 9
	note C_, 5
	rest 8
	note F_, 5
	rest 9
	note F_, 5
	rest 8
	dec_octave
	note A#, 5
	rest 9
	note A#, 5
	rest 8
	inc_octave
	note D#, 5
	rest 9
	note D#, 5
	rest 8
	;musicf2
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	rest 13
	rest 14
	rest 13
	rest 14
	rest 13
	rest 14
	rest 13
	sound_call Branch_1ddc75
	note F_, 14
	;musicf2
	note C#, 7
	note C#, 6
	note F_, 7
	note F_, 7
	;musicf3
	note G_, 3
	note G#, 10
	;tie
	note G#, 14
	note G_, 4
	note G#, 4
	note G_, 5
	;musicf0 27
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
	sound_call Branch_1ddc75
	note F_, 14
	;musicf2
	note C#, 7
	note C#, 6
	note F_, 7
	note F_, 7
	;musicf3
	note G_, 3
	note G#, 10
	;tie
	note G#, 14
	note G_, 4
	note G#, 4
	note G_, 5
	note F_, 14
	;musicf0 36
	octave 2
	;musicf3
	note G#, 4
	note A#, 3
	note B_, 3
	inc_octave
	note C_, 3
	;musicf0 1
	octave 3
	;musicf2
	note G#, 7
	note G#, 7
	;musicf3
	rest 13
	;musicf0 27
	octave 3
	;musicf1 32
	;musicec 1
	sound_call Branch_1ddc41
	;musicec 249
	sound_call Branch_1ddc4e
	rest 14
	;musicf0 36
	;musicf1 69
	;musicf3
	octave 3
	note D#, 13
	note F_, 7
	rest 7
	note F#, 3
	vibrato 3, 3, 3
	note G_, 10
	;tie
	note G_, 14
	vibrato 0, 3, 3
	note D#, 7
	rest 6
	;musicec 3
	sound_call Branch_1ddc41
	vibrato 7, 3, 3
	note C_, 7
	;tie
	note C_, 6
	;tie
	note C_, 14
	vibrato 0, 3, 3
	;musicec 252
	sound_call Branch_1ddc4e
	;musicec 3
	sound_call Branch_1ddc41
	;musicec 253
	sound_call Branch_1ddc4e
	rest 14
	note C#, 13
	;musicec 1
	sound_call Branch_1ddc41
	note F_, 7
	rest 6
	note G_, 14
	note G#, 7
	rest 6
	note A#, 7
	rest 7
	vibrato 7, 3, 3
	note A_, 13
	;tie
	note A_, 14
	vibrato 0, 3, 3
	note F_, 7
	rest 6
	sound_call Branch_1ddc41
	dec_octave
	note A#, 7
	rest 6
	note A_, 14
	;musicf0 27
	octave 2
	;musicf3
	note F_, 13
	;musicec 251
	sound_call Branch_1ddc41
	sound_call Branch_1ddc4e
	note C_, 3
	vibrato 3, 3, 3
	note C#, 11
	;tie
	note C#, 13
	vibrato 0, 3, 3
	;musicec 1
	sound_call Branch_1ddc41
	;musicec 249
	sound_call Branch_1ddc4e
	rest 14
	note F_, 7
	rest 6
	note G#, 7
	rest 7
	note A_, 3
	vibrato 7, 3, 3
	note A#, 10
	;tie
	note A#, 14
	vibrato 0, 3, 3
	note G_, 7
	rest 6
	;musicec 254
	sound_call Branch_1ddc41
	dec_octave
	vibrato 7, 3, 3
	note A#, 13
	;tie
	note A#, 14
	vibrato 0, 3, 3
	;musicec 251
	sound_call Branch_1ddc4e
	;musicec 3
	sound_call Branch_1ddc41
	;musicec 251
	sound_call Branch_1ddc4e
	octave 3
	note C#, 14
	note D#, 7
	rest 6
	;musicec 252
	sound_call Branch_1ddc41
	note D#, 13
	;tie
	note D#, 7
	rest 7
	dec_octave
	note A#, 7
	rest 6
	;musicec 3
	sound_call Branch_1ddc41
	octave 2
	note A_, 3
	vibrato 7, 3, 3
	note A#, 10
	;tie
	note A#, 14
	vibrato 0, 3, 3
	inc_octave
	note F_, 7
	rest 6
	sound_call Branch_1ddc41
	dec_octave
	note A#, 7
	rest 6
	note A_, 14
	;musicec 249
	sound_call Branch_1ddc4e
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
	vibrato 7, 3, 3
	note C#, 14
	;tie
	note C#, 13
	;musicf0 26
	octave 3
	;musicf3
	note G#, 7
	rest 7
	;musicec 249
	sound_call Branch_1ddc68
	octave 4
	note C#, 14
	;musicec 249
	sound_call Branch_1ddc68
	octave 4
	note F_, 7
	rest 7
	note F#, 3
	note G_, 10
	;tie
	note G_, 14
	;musicec 251
	sound_call Branch_1ddc68
	octave 3
	note G#, 7
	rest 7
	note G_, 13
	;tie
	note G_, 14
	;musicec 252
	sound_call Branch_1ddc68
	;musicec 3
	sound_call Branch_1ddc5b
	octave 3
	note A_, 7
	rest 6
	note A#, 7
	rest 7
	rest 13
	inc_octave
	note C#, 14
	note C_, 7
	rest 6
	rest 14
	dec_octave
	note A#, 7
	rest 6
	rest 14
	note A#, 13
	note A#, 14
	note A_, 7
	rest 6
	note G_, 7
	rest 7
	note A_, 13
	;tie
	note A_, 14
	;musicf0 27
	octave 2
	note F_, 13
	;musicec 251
	sound_call Branch_1ddc5b
	octave 3
	note A_, 7
	rest 6
	note G#, 12
	rest 2
	note G#, 7
	rest 6
	;musicec 1
	sound_call Branch_1ddc5b
	octave 4
	note E_, 3
	note F_, 10
	;tie
	note F_, 14
	note D#, 7
	rest 6
	;musicec 1
	sound_call Branch_1ddc5b
	octave 4
	note D_, 3
	note D#, 10
	note D#, 14
	note G_, 7
	rest 6
	;musicec 3
	sound_call Branch_1ddc5b
	octave 3
	note G_, 13
	;tie
	note G_, 14
	;musicec 251
	sound_call Branch_1ddc4e
	;musicec 3
	sound_call Branch_1ddc41
	;musicec 251
	sound_call Branch_1ddc4e
	inc_octave
	note C#, 14
	;musicf0 27
	octave 2
	note C#, 4
	note G#, 4
	inc_octave
	note C#, 5
	inc_octave
	;musicf2
	note C#, 5
	note C#, 9
	;musicf0 26
	;musicf3
	octave 4
	note D#, 13
	rest 14
	;musicf0 27
	octave 2
	note D#, 4
	note A#, 4
	inc_octave
	note D#, 5
	inc_octave
	;musicf2
	note D#, 5
	note D#, 9
	;musicf3
	;musicf0 26
	octave 3
	note A_, 13
	;tie
	note A_, 14
	;musicf0 27
	;musicf1 32
	octave 3
	;musicef 254
	;musicf3
	note C_, 13
	;musicf2
	note F_, 5
	note F_, 9
	note A_, 5
	note A_, 8
	inc_octave
	note C_, 5
	note C_, 9
	;musicf3
	rest 13
	;musicf2
	inc_octave
	note C_, 5
	note C_, 9
	rest 13
	sound_loop 0, .MainLoop

Branch_1ddc41:
	;musicf0 27
	octave 3
	;musicf1 32
	note C_, 5
	note C_, 9
	;musicec 0
	;musicf0 36
	;musicf3
	sound_ret

Branch_1ddc4e:
	;musicf0 27
	octave 3
	;musicf1 32
	note C_, 5
	note C_, 8
	;musicec 0
	;musicf0 36
	;musicf3
	sound_ret

Branch_1ddc5b:
	;musicf0 27
	octave 3
	;musicf1 32
	note C_, 5
	note C_, 9
	;musicec 0
	;musicf0 26
	;musicf3
	sound_ret

Branch_1ddc68:
	;musicf0 27
	octave 3
	;musicf1 32
	note C_, 5
	note C_, 8
	;musicec 0
	;musicf0 26
	;musicf3
	sound_ret

Branch_1ddc75:
	;musicf0 27
	;musicf1 32
	octave 2
	;musicf2
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	note A_, 5
	rest 1
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	dec_octave
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	note A#, 5
	rest 2
	note A#, 5
	rest 2
	note A#, 5
	rest 2
	note A#, 5
	rest 1
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	note A_, 5
	rest 1
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	dec_octave
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	note A#, 14
	;tie
	note A#, 5
	note A#, 8
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	note A_, 5
	rest 1
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	dec_octave
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	note A#, 5
	rest 2
	note A#, 5
	rest 2
	note A#, 5
	rest 2
	note A#, 5
	rest 1
	rest 14
	rest 13
	rest 14
	;musicf3
	note G_, 13
	;tie
	note G_, 14
	;musicf2
	note A#, 5
	rest 2
	note A#, 5
	rest 1
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	note A#, 5
	rest 2
	note A#, 5
	rest 1
	;musicf0 26
	;musicf3
	octave 4
	note E_, 4
	note F_, 3
	rest 7
	;musicf0 27
	octave 2
	;musicf2
	note A_, 5
	rest 2
	note A_, 5
	rest 1
	;musicf3
	;musicf0 26
	octave 4
	note A_, 7
	rest 16
	rest 4
	note D#, 14
	note F_, 7
	rest 6
	;musicf0 27
	octave 2
	;musicf2
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	;musicf3
	;musicf0 26
	octave 4
	note F_, 7
	rest 6
	;musicf0 27
	octave 2
	;musicf2
	note A_, 5
	rest 2
	note A_, 5
	rest 2
	;musicf3
	;musicf0 26
	octave 4
	note C_, 7
	rest 6
	;musicf0 27
	octave 3
	;musicf2
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	;musicf0 26
	octave 4
	;musicf3
	note D_, 3
	note D#, 10
	;tie
	note D#, 14
	note D_, 7
	rest 6
	;musicf0 27
	octave 2
	;musicf2
	note G_, 5
	rest 2
	note G_, 5
	rest 2
	;musicf3
	;musicf0 26
	octave 4
	note D_, 7
	rest 6
	note C_, 7
	rest 7
	;musicf0 2
	octave 2
	;musicf2
	note A_, 5
	rest 2
	note A_, 5
	rest 1
	;musicf3
	;musicf0 26
	octave 3
	note F_, 7
	rest 7
	rest 7
	rest 6
	note G_, 14
	note A_, 7
	rest 6
	;musicf0 27
	octave 2
	;musicf2
	note G_, 5
	rest 2
	rest 5
	rest 2
	;musicf3
	;musicf0 26
	octave 4
	note C_, 7
	rest 6
	;musicf0 27
	;musicf1 32
	octave 2
	;musicf2
	rest 14
	rest 13
	rest 14
	note F_, 5
	rest 2
	note F_, 6
	;tie
	note F_, 14
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	;musicf0 0
	;musicf3
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
	;musicf0 27
	octave 2
	;musicf2
	rest 14
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	inc_octave
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	note D_, 5
	rest 1
	rest 9
	rest 5
	dec_octave
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	inc_octave
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	dec_octave
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	rest 14
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	rest 9
	rest 5
	dec_octave
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	inc_octave
	note E_, 5
	rest 2
	note E_, 5
	rest 2
	dec_octave
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	rest 14
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	inc_octave
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	note D_, 5
	rest 1
	rest 9
	rest 5
	dec_octave
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	inc_octave
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	dec_octave
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	rest 14
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	rest 9
	rest 5
	dec_octave
	;musicf3
	note A_, 13
	note A#, 14
	;musicf2
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 1
	rest 14
	dec_octave
	note F_, 5
	rest 2
	note F_, 5
	rest 1
	inc_octave
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	note D_, 5
	rest 2
	note D_, 5
	rest 1
	rest 9
	rest 5
	dec_octave
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	inc_octave
	note E_, 5
	rest 2
	note E_, 5
	rest 2
	dec_octave
	note G_, 5
	rest 2
	note G_, 5
	rest 1
	rest 14
	;musicf3
	note B_, 13
	;musicf2
	inc_octave
	note C#, 5
	rest 2
	note C#, 5
	rest 2
	;musicf3
	note D_, 13
	;tie
	note D_, 14
	;musicf2
	dec_octave
	note A_, 5
	rest 2
	note A_, 5
	rest 1
	inc_octave
	note C_, 5
	rest 2
	note C_, 5
	rest 2
	;musicf3
	note D_, 13
	;musicf2
	;musicf3
	note D_, 14
	dec_octave
	;musicf2
	note A#, 7
	note A#, 6
	inc_octave
	note D_, 7
	note D_, 7
	;musicf3
	note E_, 13
	;tie
	note E_, 14
	;musicf2
	note C_, 7
	note C_, 6
	note E_, 7
	note E_, 7
	;musicf3
	note F_, 13
	;tie
	sound_ret


Music_Ishihara_Ch3: ; 1dde54 (77:5e54)
	notetype1 10
	notetype2 11
	notetype1 1
	;musice9 96
	;musicdc 255
	notetype0 1
	rest 13
	octave 2
	note C_, 14
	;tie
	note C#, 4
	;tie
	note D_, 3
	;tie
	note D#, 3
	;tie
	note E_, 3
.MainLoop
	octave 2
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	dec_octave
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	dec_octave
	note D#, 7
	rest 7
	note C_, 7
	rest 6
	note D#, 7
	rest 7
	note E_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	dec_octave
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	note F_, 14
	inc_octave
	inc_octave
	note E_, 13
	note F_, 4
	rest 10
	dec_octave
	note B_, 13
	inc_octave
	note C_, 4
	rest 10
	dec_octave
	note E_, 13
	note F_, 4
	rest 10
	note C_, 13
	dec_octave
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	dec_octave
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	dec_octave
	note D#, 7
	rest 7
	note C_, 7
	rest 6
	note D#, 7
	rest 7
	note E_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	dec_octave
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	note F_, 14
	note A#, 13
	note B_, 7
	rest 7
	inc_octave
	note C_, 7
	rest 6
	;vibrato_type 5
	vibrato 7, 3, 3
	note D#, 7
	;tie
	note D#, 7
	vibrato 0, 3, 3
	note C_, 7
	rest 6
	note D#, 7
	rest 7
	note E_, 7
	rest 6
	sound_call Branch_1de0c5
	octave 2
	note A#, 14
	inc_octave
	note F_, 13
	note A#, 7
	rest 7
	note D#, 13
	;tie
	note D#, 14
	dec_octave
	note A#, 13
	note D#, 14
	note E_, 7
	rest 6
	sound_call Branch_1de0c5
	octave 2
	note A#, 14
	inc_octave
	note F_, 13
	note A#, 7
	rest 7
	note D#, 13
	;tie
	note D#, 14
	dec_octave
	note A#, 13
	note D#, 14
	note D_, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	;musice8 2
	note G#, 14
	;musice8 8
	dec_octave
	note G#, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note C#, 14
	;musice8 8
	dec_octave
	dec_octave
	note G_, 7
	rest 6
	note G#, 7
	rest 7
	note G#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note C_, 14
	;musice8 8
	dec_octave
	dec_octave
	note D#, 7
	rest 6
	note G#, 7
	rest 7
	note G#, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note A_, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note B_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note D#, 14
	;musice8 8
	dec_octave
	note C_, 7
	rest 6
	dec_octave
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note F_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 13
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	;musice8 2
	note G#, 14
	;musice8 8
	dec_octave
	note G#, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note C#, 14
	;musice8 8
	dec_octave
	dec_octave
	note C#, 7
	rest 6
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note D#, 14
	;musice8 8
	dec_octave
	dec_octave
	note G_, 7
	rest 6
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note G_, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note C#, 14
	;musice8 8
	dec_octave
	dec_octave
	note F_, 7
	rest 6
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note F_, 13
	;tie
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note C_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note C#, 14
	;musice8 8
	dec_octave
	dec_octave
	note G#, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note C#, 14
	;musice8 8
	dec_octave
	dec_octave
	note G_, 7
	rest 6
	note G#, 7
	rest 7
	note G#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note D#, 14
	;musice8 8
	dec_octave
	dec_octave
	note D#, 7
	rest 6
	note G#, 7
	rest 7
	note G#, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note A_, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note C#, 14
	;musice8 8
	dec_octave
	dec_octave
	note B_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note D#, 14
	dec_octave
	;musice8 8
	note C_, 7
	rest 6
	dec_octave
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note F_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 13
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	;musice8 2
	note G#, 14
	;musice8 8
	dec_octave
	note G#, 7
	rest 6
	note C#, 7
	rest 7
	note C#, 7
	rest 6
	inc_octave
	;musice8 2
	note G#, 14
	;musice8 8
	dec_octave
	note G#, 7
	rest 6
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note G_, 7
	rest 6
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note G_, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 2
	note G#, 14
	;musice8 8
	dec_octave
	dec_octave
	note C_, 13
	;tie
	note C_, 7
	rest 7
	inc_octave
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	dec_octave
	note F_, 13
	;tie
	note F_, 7
	rest 7
	note F_, 13
	note A_, 7
	rest 7
	inc_octave
	note C_, 7
	rest 6
	note F_, 7
	rest 7
	rest 7
	rest 6
	inc_octave
	inc_octave
	note F_, 7
	notetype1 3
	note F_, 7
	rest 13
	notetype1 1
	sound_loop 0, .MainLoop

Branch_1de0c5:
	octave 2
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	dec_octave
	note F_, 7
	rest 6
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note A#, 7
	rest 7
	note D#, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	dec_octave
	note F_, 7
	rest 6
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	note G_, 14
	dec_octave
	note C_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	dec_octave
	note F_, 7
	rest 6
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	note A#, 7
	rest 7
	note D#, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	dec_octave
	note C_, 13
	;tie
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	note D#, 14
	note E_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	;musice8 2
	note F_, 14
	;musice8 8
	dec_octave
	note F_, 7
	rest 6
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note D#, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	;musice8 2
	note A_, 14
	;musice8 8
	dec_octave
	note F_, 7
	rest 6
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note C_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	;musice8 2
	note A_, 14
	;musice8 8
	dec_octave
	note F_, 7
	rest 6
	note D#, 7
	rest 7
	note D#, 7
	rest 6
	inc_octave
	;musice8 2
	note A#, 14
	;musice8 8
	dec_octave
	note D#, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	note C_, 7
	rest 7
	dec_octave
	note G_, 13
	rest 14
	note A_, 13
	;tie
	note A_, 14
	note F_, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	;musice8 4
	note A_, 14
	note A_, 13
	;musice8 8
	dec_octave
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	;musice8 4
	note A_, 14
	;musice8 8
	dec_octave
	note A#, 7
	rest 6
	note A_, 7
	rest 7
	note A_, 7
	rest 6
	inc_octave
	;musice8 4
	note A_, 14
	note A_, 13
	;musice8 8
	dec_octave
	note A_, 7
	rest 7
	note A_, 7
	rest 6
	inc_octave
	;musice8 4
	note A_, 14
	;musice8 8
	dec_octave
	note A_, 7
	rest 6
	note G_, 7
	rest 7
	note G_, 7
	rest 6
	inc_octave
	;musice8 4
	note A#, 14
	note A#, 13
	;musice8 8
	dec_octave
	note C_, 7
	rest 7
	note C_, 7
	rest 6
	inc_octave
	;musice8 8
	note A#, 14
	;musice8 8
	dec_octave
	note C_, 7
	rest 6
	note F_, 7
	rest 7
	note F_, 7
	rest 6
	inc_octave
	;musice8 4
	note A_, 14
	note A_, 13
	;musice8 8
	dec_octave
	note F_, 7
	rest 7
	note F_, 13
	note G_, 14
	note A_, 7
	rest 6
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	;musice8 4
	note A_, 14
	note A_, 13
	;musice8 8
	dec_octave
	note A#, 7
	rest 7
	note A#, 7
	rest 6
	inc_octave
	inc_octave
	;musice8 4
	note C_, 14
	;musice8 8
	dec_octave
	dec_octave
	note A#, 7
	rest 6
	note A_, 7
	rest 7
	note B_, 7
	rest 6
	inc_octave
	note C#, 7
	rest 7
	note D_, 13
	;tie
	note D_, 14
	dec_octave
	note D_, 7
	rest 6
	inc_octave
	;musice8 4
	inc_octave
	note C_, 14
	dec_octave
	;musice8 8
	dec_octave
	note G_, 13
	;tie
	note G_, 14
	inc_octave
	note D_, 13
	note G_, 7
	rest 7
	dec_octave
	note A_, 13
	;tie
	note A_, 14
	inc_octave
	note E_, 13
	note A_, 7
	rest 7
	dec_octave
	note A#, 13
	;tie
	sound_ret


Music_Ishihara_Ch4: ; 1de20c (77:620c)
	toggle_noise 6
	drum_speed 1
	;musicdc 255
	octave 1
	drum_note 4, 13
	drum_speed 9
	drum_note 5, 3
	drum_speed 1
.MainLoop
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 4, 13
	drum_note 2, 14
	drum_note 4, 7
	drum_note 2, 6
	drum_note 2, 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 12
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 4, 13
	drum_note 2, 14
	drum_note 4, 7
	drum_note 2, 6
	drum_note 2, 14
	rest 13
	rest 14
	rest 13
	rest 14
	rest 13
	drum_note 4, 7
	drum_note 4, 7
	drum_note 5, 13
.Loop1
	sound_call Branch_1de321
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 5, 13
	drum_note 1, 14
	drum_note 4, 4
	drum_note 4, 4
	drum_note 4, 5
	drum_note 2, 14
	drum_note 2, 13
	sound_call Branch_1de321
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 5, 13
	drum_note 2, 7
	drum_note 2, 7
	drum_note 2, 13
	sound_call Branch_1de321
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 4
	drum_note 2, 4
	drum_note 2, 5
	drum_note 2, 14
	drum_note 2, 13
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 1, 16
	rest 11
	drum_note 2, 13
	drum_note 2, 14
	drum_note 5, 13
	;tie
	rest 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 1, 16
	rest 11
	drum_note 2, 13
	drum_note 2, 14
	drum_note 1, 13
	;tie
	rest 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 1, 13
	rest 14
	;musicef 253
	drum_note 2, 4
	;musicef 254
	drum_note 2, 4
	drum_note 2, 5
	;musicef 0
	drum_note 2, 14
	drum_note 2, 13
	sound_loop 2, .Loop1
	sound_call Branch_1de321
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 2, 13
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 5, 13
	;tie
	rest 14
	;musicef 252
	drum_note 2, 4
	;musicef 253
	drum_note 2, 4
	;musicef 254
	drum_note 2, 5
	;musicef 0
	drum_note 2, 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 4, 7
	drum_note 2, 6
	drum_note 2, 14
	drum_note 2, 13
	sound_call Branch_1de321
	sound_call Branch_1de321
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	;musicef 253
	drum_note 2, 4
	;musicef 254
	drum_note 2, 4
	;musicef 255
	drum_note 2, 5
	;musicef 0
	drum_note 2, 14
	drum_note 2, 13
	sound_call Branch_1de321
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 5, 13
	drum_note 2, 14
	drum_note 4, 7
	drum_note 2, 6
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	;musicef 253
	drum_note 2, 5
	;musicef 254
	drum_note 2, 4
	;musicef 255
	drum_note 2, 4
	;musicef 0
	drum_note 2, 14
	drum_note 1, 13
	drum_note 4, 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 1, 13
	;tie
	rest 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 2, 14
	drum_note 4, 5
	drum_note 4, 4
	drum_note 4, 4
	drum_speed 9
	drum_note 6, 3
	drum_speed 1
	sound_loop 0, .MainLoop

Branch_1de321:
	drum_note 1, 14
	drum_note 1, 13
	drum_note 2, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 4, 13
	drum_note 2, 14
	drum_note 5, 13
	sound_ret
; 0x1de32a
