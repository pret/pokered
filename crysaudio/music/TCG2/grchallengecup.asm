Music_GRChallengeCup:
	channel_count 4
	channel 1, Music_GRChallengeCup_Ch1
	channel 2, Music_GRChallengeCup_Ch2
	channel 3, Music_GRChallengeCup_Ch3
	channel 4, Music_GRChallengeCup_Ch4

Music_GRChallengeCup_Ch2: ; 1f2d24 (7c:6d24)
;.MainLoop
	notetype1 10
	notetype0 1
	;musicdc 17
	;musicf0 0
	octave 4
	vibrato 24, 3, 3
	;musicef 255
	note C_, 4
	note C#, 4
	note D_, 4
	note D#, 4
	;musicf1 69
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 8
	note E_, 7
	note E_, 5
	note E_, 3
	note F_, 5
	note E_, 2
	note G_, 15
	note G_, 5
	note F_, 15
	note F_, 5
	note D_, 15
	note D_, 5
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 8
	note E_, 7
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	note D_, 15
	note D_, 5
	dec_octave
	note B_, 15
	note B_, 5
	inc_octave
	note D_, 15
	note D_, 5
	note E_, 15
	;tie
	note E_, 8
	note E_, 7
	note A_, 5
	note E_, 5
	note E_, 5
	note A_, 5
	note A_, 5
	note E_, 5
	note B_, 15
	note B_, 5
	note G_, 15
	note G_, 5
	note B_, 15
	note B_, 5
	;musicef 250
	notetype1 2
	;musicf3
	notetype0 6
	note A_, 10
	;tie
	notetype0 1
	note A_, 15
	;tie
	note A_, 10
	notetype1 10
	;musicf1 54
	note A_, 5
	note A_, 15
	;tie
	note A_, 15
	;musicf0 8
	;musicef 255
	;musicf1 67
.Loop1
	octave 2
	;musicf2
	notetype2 8
	note E_, 5
	note E_, 10
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	;musicf3
	note E_, 15
	;musicf2
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	sound_loop 2, .Loop1
.MainLoop
	;musicf0 8
	;musicef 255
	;musicf1 67
.Loop2
	octave 2
	;musicf2
	notetype2 8
	note F_, 5
	note F_, 10
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	;musicf3
	note F_, 15
	;musicf2
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	sound_loop 2, .Loop2
.Loop3
	octave 2
	;musicf2
	notetype2 8
	note F#, 5
	note F#, 10
	note F#, 5
	note F#, 3
	note F#, 5
	note F#, 2
	;musicf3
	note F#, 15
	;musicf2
	note F#, 5
	note F#, 3
	note F#, 5
	note F#, 2
	sound_loop 2, .Loop3
	octave 2
	;musicf2
	notetype2 8
	note F_, 5
	note F_, 10
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	;musicf3
	note F_, 15
	;musicf2
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	octave 2
	;musicf2
	notetype2 8
	note F_, 5
	note F_, 10
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	;musicf3
	;musicf0 0
	;musicef 1
	;vibrato_type 1
	vibrato 15, 3, 3
	octave 3
	;musice4 0
	;musicf1 70
	note E_, 15
	note E_, 8
	note E_, 5
	note E_, 2
	inc_octave
	vibrato 30, 3, 3
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 8
	note E_, 7
	dec_octave
	;musicf3
	note A_, 15
	note B_, 15
	inc_octave
	note C_, 15
	;musicf1 70
	vibrato 15, 3, 3
	note D_, 15
	;tie
	note D_, 15
	note D_, 15
	note C_, 8
	note D_, 7
	note C_, 15
	;tie
	note C_, 15
	note C_, 15
	dec_octave
	;musicf3
	note A_, 8
	note B_, 7
	;musicf1 70
	inc_octave
	note C_, 15
	;tie
	note C_, 15
	note C_, 15
	vibrato 0, 3, 3
	note C_, 8
	note C_, 7
	dec_octave
	;musicf3
	note B_, 15
	;musicf1 70
	note A_, 8
	note B_, 7
	note G_, 8
	note A_, 7
	note B_, 8
	note G_, 7
	vibrato 30, 3, 3
	note A_, 15
	;tie
	note A_, 15
	;tie
	note A_, 15
	;tie
	note A_, 15
	;tie
	note A_, 15
	note A_, 15
	note E_, 15
	note E_, 8
	note E_, 5
	note E_, 2
	inc_octave
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 8
	note E_, 7
	;musicf3
	dec_octave
	note A_, 15
	note B_, 15
	inc_octave
	note C_, 15
	;musicf1 70
	vibrato 15, 3, 3
	note D_, 15
	;tie
	note D_, 15
	note D_, 15
	note C_, 8
	note D_, 7
	note C_, 15
	;tie
	note C_, 15
	note C_, 15
	dec_octave
	;musicf3
	note A_, 8
	note B_, 7
	;musicf1 70
	vibrato 0, 3, 3
	inc_octave
	note C_, 15
	;tie
	note C_, 8
	note C_, 7
	note E_, 15
	;tie
	note E_, 8
	note E_, 7
	note D_, 15
	note D_, 5
	note G_, 15
	note G_, 5
	note D_, 15
	note D_, 5
	vibrato 15, 3, 3
	;musicf3
	note F_, 15
	;tie
	note F_, 15
	;tie
	note F_, 15
	;musicf1 70
	note E_, 8
	note F_, 7
	note E_, 15
	;tie
	note E_, 15
	note E_, 15
	;musicf3
	note F_, 8
	note G_, 7
	;musicf1 70
	note A_, 15
	;tie
	note A_, 15
	note A_, 15
	note A_, 8
	note A_, 7
	;musicf3
	note A_, 15
	;musicf1 70
	note G_, 8
	note A_, 7
	note F_, 8
	note G_, 7
	note A_, 8
	note F_, 7
	note G_, 15
	note G_, 8
	note C_, 5
	note G_, 2
	vibrato 0, 3, 3
	note C_, 15
	;tie
	note C_, 15
	;tie
	note C_, 15
	;tie
	note C_, 15
	note C_, 15
	;musicf3
	note D_, 8
	note E_, 7
	;musicf1 70
	vibrato 15, 3, 3
	note F_, 15
	;tie
	note F_, 15
	note F_, 15
	note F_, 8
	note F_, 7
	;musicf3
	note F_, 15
	;musicf1 70
	note E_, 8
	note F_, 7
	note D_, 8
	note E_, 7
	note F_, 8
	note D_, 7
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	note E_, 15
	dec_octave
	;musicf3
	note A_, 8
	note B_, 7
	;musicf1 70
	inc_octave
	note C_, 15
	;tie
	note C_, 15
	note C_, 15
	note C_, 8
	note C_, 7
	;musicf1 70
	note D_, 15
	;musicf1 70
	note C_, 8
	note D_, 7
	dec_octave
	note B_, 8
	inc_octave
	note C_, 7
	dec_octave
	note A_, 8
	note B_, 7
	note G_, 15
	note G_, 15
	inc_octave
	;musicf3
	note G_, 15
	;tie
	note G_, 15
	;tie
	note G_, 15
	;tie
	note G_, 15
	;musicf1 70
	note F_, 15
	note F_, 8
	note E_, 5
	note F_, 2
	note E_, 15
	;tie
	note E_, 15
	note E_, 8
	;musicf3
	note F_, 7
	;musicf1 70
	note E_, 5
	note F_, 3
	note C_, 5
	note E_, 2
	dec_octave
	note A_, 15
	note A_, 5
	inc_octave
	note C_, 15
	note D_, 5
	note D_, 15
	note D_, 5
	;musicf3
	note C_, 15
	;tie
	note C_, 15
	;tie
	note C_, 15
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	note A_, 3
	;musicf1 70
	note B_, 15
	;tie
	note B_, 15
	note B_, 15
	inc_octave
	;musicf3
	note C_, 8
	note D_, 7
	vibrato 30, 3, 3
	;musicef 255
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	;tie
	note E_, 15
	sound_loop 0, .MainLoop


Music_GRChallengeCup_Ch1: ; 1f2f36 (7c:6f36)
;.MainLoop
	notetype1 10
	notetype0 1
	;musicdc 17
	;musicf0 1
	;musicef 255
	octave 3
	vibrato 24, 3, 3
	note G_, 4
	note G#, 4
	note A_, 4
	note A#, 4
	inc_octave
	;musicf1 53
	note C#, 15
	;tie
	note C#, 15
	;tie
	note C#, 8
	note C#, 7
	note C#, 5
	note C#, 3
	note C#, 5
	note C#, 2
	note D_, 15
	note D_, 5
	note D_, 15
	note D_, 5
	dec_octave
	note A#, 15
	note A#, 5
	inc_octave
	note C#, 15
	;tie
	note C#, 15
	;tie
	note C#, 8
	note C#, 7
	note C#, 5
	note C#, 3
	note C#, 5
	note C#, 2
	dec_octave
	note B_, 15
	note B_, 5
	note G_, 15
	note G_, 5
	note B_, 15
	note B_, 5
	inc_octave
	note C_, 15
	;tie
	note C_, 8
	note C_, 7
	note C_, 5
	note C_, 5
	note C_, 5
	note C_, 5
	note C_, 5
	note C_, 5
	note D_, 15
	note D_, 5
	dec_octave
	note B_, 15
	note B_, 5
	inc_octave
	note D_, 15
	note D_, 5
	;musicef 250
	notetype1 2
	;musicf3
	notetype0 6
	note C#, 10
	;tie
	notetype0 1
	note C#, 15
	;tie
	note C#, 10
	notetype1 9
	;musicf1 54
	note C#, 5
	note C#, 15
	;tie
	note C#, 15
	;musicf0 8
	;musicf1 67
.Loop1
	octave 1
	;musicf2
	notetype2 8
	note A_, 5
	note A_, 10
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	;musicf3
	inc_octave
	note B_, 15
	dec_octave
	;musicf2
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	sound_loop 2, .Loop1
.MainLoop
	;musicf1 67
.Loop2
	octave 1
	;musicf2
	notetype2 8
	note A_, 5
	note A_, 10
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	;musicf3
	inc_octave
	note B_, 15
	dec_octave
	;musicf2
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	sound_loop 5, .Loop2
	octave 1
	;musicf2
	notetype2 8
	note A_, 5
	note A_, 10
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	;musicf3
	inc_octave
	note B_, 15
	;tie
	note B_, 8
	dec_octave
	;musicf0 21
	notetype1 8
	octave 2
	note A_, 5
	rest 2
	inc_octave
	note A_, 15
	;tie
	note A_, 15
	sound_call Branch_1f3140
	rest 15
	rest 15
	note E_, 15
	;musicec 3
	sound_call Branch_1f3140
	note G_, 15
	note F#, 15
	;tie
	note F#, 15
	;musicec 2
	sound_call Branch_1f3140
	note F#, 8
	rest 7
	note F#, 15
	;tie
	note F#, 15
	;musicec 2
	sound_call Branch_1f3140
	note F#, 5
	rest 3
	note F#, 5
	rest 2
	note F_, 15
	;tie
	note F_, 15
	;musicec 1
	sound_call Branch_1f3140
	note F_, 8
	rest 7
	note D_, 15
	note C_, 8
	rest 7
	;musicec 3
	sound_call Branch_1f3140
	note D_, 8
	rest 7
	note E_, 15
	;tie
	note E_, 15
	sound_call Branch_1f3140
	rest 15
	rest 8
	sound_call Branch_1f3150
	rest 15
	dec_octave
	note A_, 15
	rest 8
	note A_, 7
	inc_octave
	note A_, 15
	;tie
	note A_, 15
	sound_call Branch_1f3140
	rest 15
	rest 15
	note E_, 15
	;musicec 3
	sound_call Branch_1f3140
	note G_, 15
	note F#, 15
	;tie
	note F#, 15
	;musicec 2
	sound_call Branch_1f3140
	note F#, 8
	rest 7
	note F#, 15
	;tie
	note F#, 15
	;musicec 2
	sound_call Branch_1f3140
	note F#, 5
	rest 3
	note F#, 5
	rest 2
	note F_, 15
	;tie
	note F_, 8
	rest 7
	;musicec 1
	sound_call Branch_1f3140
	rest 8
	rest 7
	note B_, 15
	rest 5
	note B_, 10
	;musicec 3
	sound_call Branch_1f3140
	rest 15
	inc_octave
	note C_, 15
	;tie
	note C_, 15
	;musicec 8
	sound_call Branch_1f3140
	octave 3
	note G_, 8
	note F_, 7
	note G_, 15
	;tie
	note G_, 15
	;musicec 6
	sound_call Branch_1f3140
	note A_, 8
	note A#, 7
	inc_octave
	note C_, 15
	;tie
	note C_, 15
	;musicec 1
	sound_call Branch_1f3140
	octave 4
	note C_, 8
	rest 7
	dec_octave
	note B_, 15
	note B_, 8
	rest 7
	;musicec 1
	sound_call Branch_1f3140
	octave 4
	note D_, 8
	rest 7
	note C_, 15
	rest 8
	dec_octave
	note G_, 5
	rest 2
	note G_, 15
	;tie
	note G_, 15
	;tie
	note G_, 8
	sound_call Branch_1f3150
	rest 8
	rest 7
	;musicec 3
	sound_call Branch_1f3140
	octave 3
	note F_, 8
	note G_, 7
	note A_, 15
	;tie
	note A_, 15
	;musicec 5
	sound_call Branch_1f3140
	note A_, 8
	rest 7
	note G#, 13
	rest 2
	note G#, 8
	rest 7
	;musicec 4
	sound_call Branch_1f3140
	note G#, 8
	rest 7
	note A_, 15
	;tie
	note A_, 15
	sound_call Branch_1f3140
	rest 15
	rest 8
	sound_call Branch_1f3150
	rest 15
	;musicec 3
	sound_call Branch_1f3140
	note E_, 8
	note G_, 7
	note A_, 15
	;tie
	note A_, 15
	;musicec 1
	sound_call Branch_1f3140
	note A_, 8
	rest 7
	note B_, 15
	note A_, 5
	rest 10
	;musicec 3
	sound_call Branch_1f3140
	note F_, 8
	rest 7
	note E_, 15
	;tie
	note E_, 15
	inc_octave
	notetype1 6
	note D_, 15
	;tie
	note D_, 15
	notetype1 6
	note C#, 15
	;tie
	note C#, 15
	;musicec 3
	sound_call Branch_1f3140
	rest 8
	dec_octave
	note G_, 5
	rest 2
	note A_, 15
	;tie
	note A_, 15
	;musicec 1
	sound_call Branch_1f3140
	note A_, 8
	note F_, 7
	note D_, 15
	rest 5
	note F_, 10
	;musicec 4
	sound_call Branch_1f3140
	rest 15
	note G_, 15
	;tie
	note G_, 15
	;musicec 1
	sound_call Branch_1f3140
	note G_, 4
	note D_, 4
	note C_, 4
	note D_, 3
	note D_, 15
	;tie
	note D_, 15
	rest 15
	note G#, 8
	note B_, 7
	note A_, 15
	;tie
	note A_, 15
	;musicf0 8
	;musicef 255
	octave 2
	;musicf1 67
	;musicf3
	note B_, 15
	;musicf2
	notetype2 8
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	note E_, 5
	note E_, 10
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	;musicf3
	note B_, 15
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	sound_loop 0, .MainLoop

Branch_1f3140:
	;musicf0 8
	octave 2
	;musicef 255
	note E_, 15
	;musicef 1
	;musicf0 21
	;musicf1 128
	octave 3
	;musicec 0
	sound_ret

Branch_1f3150:
	;musicf0 8
	octave 2
	;musicf2
	note G_, 4
	note G_, 3
	;musicf0 21
	notetype1 8
	octave 3
	;musicf3
	sound_ret


Music_GRChallengeCup_Ch3: ; 1f315d (7c:715d)
	notetype1 10
	notetype0 1
	notetype2 11
	notetype1 1
	;musice9 96
	;musicdc 17
	octave 5
	rest 16
	octave 2
	note A_, 15
	;tie
	note A_, 15
	;tie
	note A_, 8
	rest 7
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	note A#, 15
	rest 5
	note A#, 15
	rest 5
	note A#, 15
	rest 5
	note A_, 15
	;tie
	note A_, 15
	;tie
	note A_, 8
	rest 7
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	note F_, 15
	;tie
	note F_, 15
	;tie
	note F_, 8
	rest 7
	note F_, 5
	rest 3
	note F_, 5
	rest 2
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	note A_, 16
	;tie
	note A_, 16
	;tie
	note A_, 16
	;tie
	note A_, 16
	;tie
	note A_, 16
	;tie
	note A_, 10
	rest 16
	rest 14
	;musice8 4
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
.MainLoop
	;musice8 4
	octave 2
.Loop1
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
	sound_loop 3, .Loop1
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	;musicec 3
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	;musicec 3
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	;musicec 5
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 8
	octave 4
	;musice8 4
	note C_, 4
	rest 3
	;musice8 8
	octave 2
	;musice8 8
	note F#, 15
	note G_, 15
	note G#, 15
	;musice8 4
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	;musicec 3
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	;musicec 3
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note B_, 15
	note B_, 8
	note B_, 7
	;musicec 5
	sound_call Branch_1f333b
	note B_, 8
	note B_, 7
	inc_octave
	note C_, 15
	note C_, 8
	note C_, 7
	;musicec 8
	sound_call Branch_1f333b
	octave 3
	note C_, 8
	dec_octave
	note G_, 7
	note C_, 8
	inc_octave
	inc_octave
	;musice8 4
	note E_, 4
	rest 3
	;musice8 4
	dec_octave
	dec_octave
	note C_, 8
	note C_, 7
	;musice8 8
	note D_, 15
	note E_, 15
	;musice8 4
	note F_, 15
	note F_, 8
	note F_, 7
	;musicec 3
	sound_call Branch_1f333b
	note F_, 8
	note F_, 7
	note F_, 15
	note F_, 8
	note F_, 7
	sound_call Branch_1f333b
	note F_, 8
	note F_, 7
	note E_, 15
	note E_, 8
	note E_, 7
	;musicec 254
	sound_call Branch_1f333b
	note E_, 8
	note E_, 7
	note E_, 8
	inc_octave
	inc_octave
	;musice8 4
	note C_, 4
	rest 3
	dec_octave
	dec_octave
	note E_, 8
	note E_, 7
	;musicec 5
	sound_call Branch_1f333b
	note E_, 8
	note E_, 7
	note D_, 15
	note D_, 8
	note D_, 7
	;musicec 5
	sound_call Branch_1f333b
	note D_, 8
	note D_, 7
	note E_, 15
	note E_, 8
	note E_, 7
	;musicec 7
	sound_call Branch_1f333b
	note E_, 8
	note E_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note G_, 8
	inc_octave
	inc_octave
	note C_, 4
	rest 3
	dec_octave
	dec_octave
	note G_, 8
	note G_, 7
	;musicec 3
	sound_call Branch_1f333b
	note G_, 8
	note G_, 7
	note F_, 15
	note F_, 8
	note F_, 7
	;musicec 3
	sound_call Branch_1f333b
	note F_, 8
	note F_, 7
	note F_, 15
	note F_, 8
	note F_, 7
	;musicec 5
	sound_call Branch_1f333b
	note F_, 8
	note F_, 7
	note E_, 15
	note E_, 8
	note E_, 7
	;musicec 254
	sound_call Branch_1f333b
	note E_, 8
	note E_, 7
	note D#, 8
	inc_octave
	inc_octave
	note C#, 4
	rest 3
	dec_octave
	dec_octave
	note D#, 8
	note D#, 7
	;musicec 4
	sound_call Branch_1f333b
	note D#, 8
	note D#, 7
	note D_, 15
	note D_, 8
	note D_, 7
	;musicec 3
	sound_call Branch_1f333b
	note D_, 8
	note D_, 7
	note D_, 15
	note D_, 8
	note D_, 7
	;musicec 3
	sound_call Branch_1f333b
	note D_, 8
	note D_, 7
	note G_, 15
	note G_, 8
	note G_, 7
	;musicec 3
	sound_call Branch_1f333b
	inc_octave
	note D_, 8
	note D_, 7
	;musice8 8
	note G_, 15
	dec_octave
	note G_, 15
	note G#, 15
	inc_octave
	note G#, 15
	;musice8 4
	dec_octave
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	sound_loop 0, .MainLoop

Branch_1f333b:
	octave 3
	notetype1 2
	;musice8 8
	note A_, 15
	notetype1 1
	;musice8 4
	;musicec 0
	octave 2
	sound_ret


Music_GRChallengeCup_Ch4: ; 1f3349 (7c:7349)
	toggle_noise 6
	drum_speed 1
	octave 1
	rest 16
.Loop1
	drum_note 2, 16
	rest 16
	rest 13
	drum_note 2, 5
	;musicef 254
	drum_note 2, 5
	drum_note 2, 5
	;musicef 0
	drum_note 2, 16
	rest 4
	drum_note 2, 16
	rest 4
	drum_note 2, 16
	rest 4
	sound_loop 3, .Loop1
	drum_speed 5
	drum_note 6, 16
	drum_speed 1
	rest 10
	drum_note 2, 8
	drum_note 1, 15
	drum_note 2, 7
	sound_call Branch_1f33e9
.MainLoop
	sound_call Branch_1f33fd
	sound_call Branch_1f33e9
	drum_note 1, 8
	drum_note 2, 7
	drum_note 4, 8
	drum_note 1, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 4, 8
	;musicef 253
	drum_note 2, 4
	drum_note 2, 3
	;musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note 4, 8
	;musicef 253
	drum_note 2, 4
	drum_note 2, 3
	;musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 5, 7
	sound_call Branch_1f33e9
	sound_call Branch_1f33fd
	sound_call Branch_1f33e9
	drum_note 1, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 1, 8
	drum_note 2, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 2, 8
	drum_note 1, 7
	drum_note 5, 8
	drum_note 2, 7
	sound_call Branch_1f33e9
	sound_call Branch_1f33fd
	sound_call Branch_1f33e9
	drum_note 1, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 1, 8
	drum_note 2, 7
	drum_note 4, 8
	;musicef 253
	drum_note 2, 4
	drum_note 2, 3
	;musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
.Loop2
	sound_call Branch_1f33e9
	sound_call Branch_1f33fd
	sound_loop 3, .Loop2
	sound_call Branch_1f33e9
	drum_note 1, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 4, 8
	;musicef 253
	drum_note 2, 4
	drum_note 2, 3
	;musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	sound_call Branch_1f33e9
	sound_loop 0, .MainLoop

Branch_1f33e9:
	octave 1
	drum_speed 1
	drum_note 1, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 1, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 1, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 5, 7
	sound_ret

Branch_1f33fd:
	octave 1
	drum_speed 1
	drum_note 1, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 1, 8
	drum_note 2, 7
	drum_note 4, 8
	drum_note 4, 7
	drum_note 2, 8
	drum_note 4, 7
	drum_note 5, 8
	drum_note 2, 7
	sound_ret
; 0x1f3411
