Music_GROverworld:
	channel_count 4
	channel 1, Music_GROverworld_Ch1
	channel 2, Music_GROverworld_Ch2
	channel 3, Music_GROverworld_Ch3
	channel 4, Music_GROverworld_Ch4

Music_GROverworld_Ch2: ; 1ead0d (7a:6d0d)
	channel_volume 10
.MainLoop
	sound_call Branch_1eae1e
	note A#, 16
	;tie
	note A#, 9
	note A#, 8
	inc_octave
	note D_, 16
	;tie
	note D_, 9
	note D_, 8
	note C_, 16
	note C_, 6
	dec_octave
	note A_, 16
	note A_, 6
	note F_, 16
	note F_, 6
	speed 11
	note G_, 12
	;musicf0 11
	speed 1
	;musicdc 17
	octave 2
	;musicf1 70
	;musicf2
	note B_, 9
	note B_, 16
	rest 8
	rest 9
	rest 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	rest 16
	rest 1
	sound_call Branch_1eae1e
	note A#, 16
	;tie
	note A#, 9
	note A#, 8
	inc_octave
	note D_, 16
	;tie
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
	;musicf1 103
	;musicf2
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 12
	;tie
	note D_, 8
	note D_, 16
	;musicf0 14
	;musicf1 70
	;musicef 2
	;musicf2
	octave 3
	note D_, 4
	note D_, 4
	note F_, 5
	note F_, 3
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 3
	note G_, 16
	note A_, 7
	note G_, 8
	;tie
	note A_, 8
	rest 2
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
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 3
	note D_, 16
	note C_, 7
	note D_, 8
	;tie
	note C_, 8
	rest 2
	dec_octave
	note A#, 5
	note A#, 3
	inc_octave
	note C_, 7
	dec_octave
	note A#, 8
	;tie
	inc_octave
	note C_, 8
	rest 2
	note F_, 5
	note F_, 3
	note F_, 16
	;tie
	note F_, 16
	;tie
	note F_, 16
	;musicf1 54
	;musicf2
	note D#, 8
	note D#, 8
	dec_octave
	note A#, 9
	note A#, 8
	inc_octave
	note D#, 8
	note D#, 8
	;musicf1 86
	;musicf2
	note D_, 8
	note D_, 1
	note D#, 7
	note D#, 1
	note D_, 5
	note D#, 3
	note C_, 5
	note D_, 3
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 3
	note D_, 16
	;musicf1 160
	;musicf2
	note D#, 16
	note D#, 1
	note F_, 15
	note F_, 1
	;musicf1 86
	;musicf2
	note G_, 7
	note F_, 8
	;tie
	note G_, 8
	inc_octave
	rest 2
	note D_, 5
	note D_, 3
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 3
	note D_, 16
	note C_, 9
	note D_, 8
	note D_, 8
	note C_, 8
	;musicf1 86
	;musicf2
	note F_, 6
	note D_, 5
	;musicf3
	note C_, 11
	note D_, 11
	dec_octave
	;musicf1 86
	;musicf2
	note A_, 16
	;tie
	note A_, 16
	;tie
	note A_, 16
	;tie
	note A_, 16
	;tie
	note A_, 2
	note A_, 16
	note G_, 5
	note A_, 3
	note F_, 5
	note G_, 3
	note G_, 16
	;tie
	note G_, 16
	;tie
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
	;musicf3
	speed 11
	note A#, 6
	note A_, 6
	note G_, 6
	speed 1
	speed 11
	note F_, 3
	;tie
	speed 1
	note F_, 1
	;tie
	note F_, 16
	sound_loop 0, .MainLoop

Branch_1eae1e:
	;musicf0 13
	octave 3
	speed 1
	;musicdc 17
	vibrato 33, 3, 3
	;musicef 1
	;musicf1 48
	;musicf2
	octave 3
	note D_, 5
	note D_, 3
	note E_, 5
	note E_, 3
	note F_, 16
	;tie
	note F_, 16
	;tie
	note F_, 16
	;tie
	note F_, 16
	;tie
	note F_, 16
	;tie
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
	;tie
	note D_, 8
	rest 2
	dec_octave
	note G_, 5
	note G_, 3
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 3
	note G_, 16
	note G_, 5
	note G_, 3
	note G_, 5
	note G_, 3
	note F_, 16
	;tie
	note F_, 9
	note F_, 8
	note A_, 16
	;tie
	note A_, 9
	note A_, 8
	inc_octave
	note C_, 16
	;tie
	note C_, 9
	note C_, 8
	note E_, 16
	;tie
	note E_, 9
	note E_, 8
	note D_, 7
	note D_, 8
	rest 8
	rest 2
	dec_octave
	note G_, 5
	inc_octave
	note D_, 3
	dec_octave
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 3
	note G_, 16
	inc_octave
	note D_, 5
	note D_, 3
	note E_, 5
	note D_, 3
	note F_, 16
	;tie
	note F_, 16
	;tie
	note F_, 16
	;tie
	note F_, 16
	;tie
	note F_, 16
	;tie
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
	;tie
	note D_, 8
	rest 2
	dec_octave
	note G_, 5
	note G_, 3
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	note G_, 16
	;tie
	note G_, 3
	note G_, 5
	note G_, 3
	note A_, 5
	note G_, 3
	sound_ret


Music_GROverworld_Ch1: ; 1eaeaf (7a:6eaf)
	channel_volume 10
	speed 1
	rest 16
.MainLoop
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	;musicf2
	note C_, 9
	note C_, 16
	rest 8
	rest 9
	rest 8
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 11
	note C_, 10
	note C_, 6
	rest 16
	rest 1
	rest 16
	dec_octave
	note B_, 9
	note B_, 16
	rest 8
	rest 9
	rest 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	rest 16
	rest 1
	rest 16
	note A_, 9
	note A_, 16
	rest 8
	rest 9
	rest 8
	note F_, 6
	note F_, 2
	note F_, 6
	note F_, 2
	note A_, 6
	note A_, 11
	note A_, 10
	note A_, 6
	rest 16
	rest 1
	rest 16
	note B_, 9
	note B_, 16
	rest 8
	rest 9
	rest 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	rest 16
	rest 1
	rest 16
	inc_octave
	note C_, 9
	note C_, 16
	rest 8
	rest 9
	rest 8
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 11
	note C_, 10
	note C_, 6
	rest 16
	rest 1
	rest 16
	dec_octave
	note B_, 9
	note B_, 16
	rest 8
	rest 9
	rest 8
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 11
	note B_, 10
	note B_, 6
	rest 16
	rest 1
	rest 16
	note G_, 9
	note G_, 16
	rest 8
	rest 9
	rest 8
	note G_, 6
	note G_, 2
	note G_, 6
	note G_, 2
	note A_, 6
	note A_, 11
	note F_, 10
	note F_, 6
	rest 16
	rest 1
	rest 16
	inc_octave
	note C_, 9
	note C_, 16
	rest 8
	rest 9
	rest 8
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 11
	note C_, 10
	note C_, 6
	rest 16
	rest 1
	rest 16
	dec_octave
	note G_, 9
	note G_, 16
	rest 8
	rest 9
	rest 8
	note G_, 6
	note G_, 2
	note G_, 6
	note G_, 2
	note G_, 6
	note G_, 11
	note G_, 10
	note G_, 6
	rest 16
	rest 1
	;musicf0 15
	octave 2
	fade_wave 8
	;musicf1 48
	;musicf2
	note B_, 5
	note B_, 3
	inc_octave
	note C_, 5
	note C_, 3
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	;musicf2
	note C_, 8
	note C_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 8
	note C_, 1
	;musicf3
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note C_, 4
	note C_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note C_, 7
	note C_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 15
	octave 2
	fade_wave 8
	;musicf1 48
	;musicf2
	note A_, 5
	note A_, 3
	inc_octave
	note C_, 5
	note C_, 3
	;musicf0 11
	speed 1
	;musicdc 17
	octave 2
	;musicf1 70
	;musicf2
	note B_, 8
	note B_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 8
	note B_, 1
	;musicf3
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note D_, 4
	note D_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note B_, 7
	note B_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note D_, 4
	note D_, 4
	note B_, 4
	note D_, 5
	note D_, 4
	note B_, 4
	;musicf0 15
	octave 2
	fade_wave 8
	;musicf1 48
	;musicf2
	note B_, 5
	note B_, 3
	inc_octave
	note D_, 5
	note D_, 3
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	;musicf2
	note C_, 8
	note C_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note F_, 6
	note F_, 2
	note F_, 6
	note F_, 2
	note A_, 8
	note A_, 1
	;musicf3
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note C_, 4
	note C_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note A_, 7
	note A_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 15
	octave 3
	fade_wave 8
	;musicf1 48
	;musicf2
	note C_, 8
	note C_, 8
	;musicf0 11
	speed 1
	;musicdc 17
	octave 2
	;musicf1 70
	;musicf2
	note B_, 8
	note B_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 8
	note B_, 1
	;musicf3
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note D_, 4
	note D_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note B_, 7
	note B_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note D_, 4
	note D_, 4
	note B_, 4
	note D_, 5
	note D_, 4
	note B_, 4
	;musicf0 15
	octave 2
	fade_wave 8
	;musicf1 48
	;musicf2
	note B_, 5
	note B_, 3
	inc_octave
	note C_, 5
	note C_, 3
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	;musicf2
	note C_, 8
	note C_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note C_, 6
	note C_, 2
	note C_, 6
	note C_, 2
	note C_, 8
	note C_, 1
	;musicf3
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note C_, 4
	note C_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note C_, 7
	note C_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 15
	octave 2
	fade_wave 8
	;musicf1 48
	;musicf2
	note A_, 5
	note A_, 3
	inc_octave
	note C_, 5
	note C_, 3
	;musicf0 11
	speed 1
	;musicdc 17
	octave 2
	;musicf1 70
	;musicf2
	note B_, 8
	note B_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 8
	note B_, 1
	;musicf3
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note D_, 4
	note D_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note B_, 7
	note B_, 1
	;musicf0 23
	;musicf1 32
	;musicf2
	octave 5
	note D_, 4
	note D_, 4
	note B_, 4
	note D_, 5
	note D_, 4
	note B_, 4
	;musicf0 15
	octave 2
	fade_wave 8
	;musicf1 48
	;musicf2
	note B_, 5
	note B_, 3
	inc_octave
	note C_, 5
	note C_, 3
	;musicef 254
	note D_, 16
	;tie
	note D_, 9
	note D_, 8
	note F_, 16
	;tie
	note F_, 9
	note F_, 8
	note E_, 16
	note E_, 6
	note C_, 16
	note C_, 6
	note E_, 16
	note E_, 6
	;musicf3
	speed 11
	note G_, 6
	note F#, 3
	;musicef 2
	speed 1
	;musicf0 14
	;musicef 254
	octave 2
	note D_, 6
	note D#, 6
	note F_, 5
	note G_, 6
	note A_, 5
	note A#, 5
	;musicef 2
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	;musicf2
	note D_, 8
	note D_, 1
	;musicf0 12
	;musicf1 71
	octave 2
	;musicf3
	note G_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note D_, 6
	note D_, 2
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note G_, 4
	rest 4
	;musicf2
	inc_octave
	note D_, 5
	dec_octave
	note G_, 4
	note G_, 4
	inc_octave
	note D_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note D_, 7
	note D_, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note D_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	;musicf2
	note F_, 8
	note F_, 1
	;musicf0 12
	;musicf1 71
	octave 3
	;musicf3
	note D_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note D_, 6
	note D_, 2
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 4
	note D_, 4
	rest 4
	;musicf2
	note A_, 5
	note D_, 4
	note D_, 4
	note A_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 2
	note A_, 7
	note A_, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note A_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	speed 1
	;musicdc 17
	octave 2
	;musicf1 70
	;musicf2
	note G#, 8
	note G#, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 2
	note F_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note C_, 6
	note C_, 2
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note F_, 4
	rest 4
	;musicf2
	inc_octave
	note C_, 5
	dec_octave
	note F_, 4
	note F_, 4
	inc_octave
	note C_, 4
	;musicf0 11
	;musicf1 70
	;musicf2
	octave 3
	note F_, 7
	note F_, 1
	;musicf0 12
	;musicf1 71
	octave 3
	note C_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	speed 1
	;musicdc 17
	octave 2
	;musicf1 70
	;musicf2
	note A#, 8
	note A#, 1
	;musicf0 12
	;musicf1 71
	octave 2
	;musicf3
	note A#, 4
	rest 4
	;musicf2
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
	;musicf0 11
	;musicf1 70
	octave 2
	note A#, 6
	note A#, 2
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note F_, 4
	rest 4
	;musicf2
	inc_octave
	note D_, 5
	dec_octave
	note F_, 4
	note F_, 4
	inc_octave
	note D_, 4
	;musicf0 11
	;musicf1 70
	octave 2
	note A#, 7
	note A#, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note D_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	note C_, 8
	note C_, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note C_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	;musicf1 70
	octave 3
	note G_, 6
	note G_, 2
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 4
	note C_, 4
	rest 4
	;musicf2
	note G_, 5
	note C_, 4
	note C_, 4
	note G_, 4
	;musicf0 11
	;musicf1 70
	octave 3
	note G_, 7
	note G_, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note G_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	speed 1
	;musicdc 17
	octave 4
	;musicf1 70
	note C_, 8
	note C_, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note C_, 4
	rest 4
	;musicf2
	note F_, 4
	note C_, 4
	note C_, 4
	note F_, 4
	note A_, 5
	note C_, 4
	note F_, 4
	note A_, 4
	;musicf0 11
	;musicf1 70
	octave 3
	note F_, 6
	note F_, 2
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note A_, 4
	rest 4
	;musicf2
	inc_octave
	note F_, 5
	dec_octave
	note A_, 4
	note A_, 4
	inc_octave
	note F_, 4
	;musicf0 11
	;musicf1 70
	octave 3
	note C_, 7
	note C_, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note F_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	speed 1
	;musicdc 17
	octave 3
	;musicf1 70
	note D#, 8
	note D#, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 2
	note G_, 4
	rest 4
	;musicf2
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
	;musicf0 11
	;musicf1 70
	octave 2
	note A#, 6
	note A#, 2
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note G_, 4
	rest 4
	;musicf2
	inc_octave
	note D_, 5
	dec_octave
	note G_, 4
	note G_, 4
	inc_octave
	note D_, 4
	;musicf0 11
	;musicf1 70
	octave 3
	note D#, 7
	note D#, 1
	;musicf0 12
	;musicf1 71
	;musicf3
	octave 3
	note D_, 4
	rest 4
	;musicf2
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
	;musicf0 14
	octave 3
	;musicf3
	speed 11
	note F_, 12
	note D#, 6
	speed 11
	note C_, 3
	;tie
	speed 1
	note C_, 1
	;tie
	note C_, 16
	rest 16
	sound_loop 0, .MainLoop


Music_GROverworld_Ch3: ; 1eb3d6 (7a:73d6)
	channel_volume 1
	;musicdc 17
	fade_wave 11
	channel_volume 1
	;musice8 1
	;musice9 96
	speed 1
	rest 16
.MainLoop
	;musice8 1
.Loop1
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 4
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	;musice8 4
	note G_, 16
	;musice8 1
	rest 16
	rest 1
	rest 16
	sound_loop 3, .Loop1
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 5
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	;musice8 4
	note G_, 16
	rest 16
	rest 1
	;musice8 1
	note D_, 8
	;tie
	note D_, 8
.Loop2
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 5
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	;musice8 4
	note G_, 16
	;musice8 1
	rest 16
	rest 1
	rest 16
	sound_loop 2, .Loop2
	octave 2
	note D#, 9
	;tie
	note D#, 16
	rest 8
	rest 9
	rest 8
	;musice8 5
	note D#, 8
	note D#, 8
	;musice8 1
	note F_, 6
	;tie
	note F_, 11
	;musice8 4
	note F_, 16
	rest 16
	rest 1
	;musice8 1
	note F_, 8
	;tie
	note F_, 8
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 4
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	note G_, 8
	;tie
	note G_, 8
	rest 16
	rest 1
	rest 16
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 4
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	note G_, 8
	;tie
	note G_, 8
	rest 16
	rest 1
	note D_, 8
	;tie
	note D_, 8
.Loop3
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 4
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	;musice8 4
	note G_, 16
	;musice8 1
	rest 16
	rest 1
	rest 16
	sound_loop 3, .Loop3
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 5
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	;musice8 4
	note G_, 16
	rest 16
	rest 1
	;musice8 1
	note D_, 8
	;tie
	note D_, 8
.Loop4
	octave 2
	note G_, 9
	;tie
	note G_, 16
	rest 8
	rest 9
	rest 8
	;musice8 5
	note G_, 8
	note G_, 8
	;musice8 1
	note G_, 6
	;tie
	note G_, 11
	;musice8 4
	note G_, 16
	;musice8 1
	rest 16
	rest 1
	rest 16
	sound_loop 2, .Loop4
	octave 2
	note A#, 9
	;tie
	note A#, 16
	rest 8
	rest 9
	rest 8
	;musice8 5
	note A#, 8
	note A#, 8
	inc_octave
	;musice8 1
	note C_, 6
	;tie
	note C_, 11
	;musice8 4
	note C_, 16
	rest 16
	rest 1
	;musice8 1
	note C_, 8
	;tie
	note C_, 8
	;musice8 1
	speed 1
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 9
	;tie
	note D_, 8
	;musice8 4
	note D_, 9
	dec_octave
	note A_, 8
	;musice8 7
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 2
	octave 2
	;musice8 1
	note D#, 9
	;tie
	note D#, 16
	rest 8
	rest 9
	rest 8
	note D#, 5
	;tie
	note D#, 11
	rest 16
	rest 1
	;musice8 8
	note D#, 5
	;tie
	note D#, 11
	;tie
	note D#, 16
	;tie
	note D#, 1
	;musice8 1
	note A_, 8
	;tie
	note A_, 8
	octave 2
	note A#, 9
	;tie
	note A#, 16
	rest 8
	rest 9
	rest 8
	note A#, 5
	;tie
	note A#, 11
	rest 16
	rest 1
	;musice8 8
	note A#, 5
	;tie
	note A#, 11
	;tie
	note A#, 16
	;tie
	note A#, 1
	;musice8 1
	note A#, 8
	;tie
	note A#, 8
	octave 2
	note C#, 9
	;tie
	note C#, 16
	rest 8
	rest 9
	rest 8
	note C#, 5
	;tie
	note C#, 11
	rest 16
	rest 1
	;musice8 8
	note C#, 5
	;tie
	note C#, 11
	;tie
	note C#, 16
	;tie
	note C#, 1
	;musice8 1
	note C#, 8
	;tie
	note C#, 8
	octave 2
	note C_, 9
	;tie
	note C_, 16
	rest 8
	rest 9
	rest 8
	note C_, 5
	;tie
	note C_, 11
	rest 9
	inc_octave
	;musice8 5
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
	;musice8 1
	note G#, 9
	;tie
	note G#, 16
	rest 8
	rest 9
	rest 8
	note G#, 5
	;tie
	note G#, 11
	rest 16
	rest 1
	;musice8 8
	note G#, 5
	;tie
	note G#, 11
	;tie
	note G#, 16
	;tie
	note G#, 1
	;musice8 1
	note G#, 8
	;tie
	note G#, 8
	octave 2
	note D_, 9
	;tie
	note D_, 16
	rest 8
	rest 9
	rest 8
	note D_, 5
	;tie
	note D_, 11
	rest 16
	rest 1
	;musice8 8
	note D_, 5
	;tie
	note D_, 11
	;tie
	note D_, 16
	;tie
	note D_, 1
	;musice8 1
	note D_, 8
	;tie
	note D_, 8
	octave 2
	note D#, 9
	;tie
	note D#, 16
	rest 8
	rest 9
	rest 8
	note D#, 5
	;tie
	note D#, 11
	rest 16
	rest 1
	;musice8 8
	note D#, 5
	;tie
	note D#, 11
	;tie
	note D#, 16
	;tie
	note D#, 1
	;musice8 1
	note D#, 8
	;tie
	note D#, 8
	;musice8 8
	;vibrato_type 5
	vibrato 32, 3, 3
	speed 11
	note F_, 3
	;tie
	note F_, 3
	;tie
	note F_, 3
	;tie
	speed 1
	note F_, 16
	;tie
	note A#, 4
	;tie
	note B_, 4
	;tie
	inc_octave
	note C_, 9
	speed 11
	note F_, 3
	;tie
	note F_, 3
	;tie
	note F_, 3
	;tie
	speed 1
	note F_, 16
	rest 16
	rest 1
	sound_loop 0, .MainLoop
	sound_ret


Music_GROverworld_Ch4: ; 1eb5e4 (7a:75e4)
	toggle_noise 6
	drum_speed 1
	rest 16
.MainLoop
	octave 1
	drum_speed 1
.Loop1
	drum_note 2, 9
	;musicef 250
	drum_note 2, 8
	;musicef 253
	drum_note 3, 6
	drum_note 3, 5
	drum_note 3, 5
	;musicef 0
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	;musicef 253
	drum_note 3, 6
	drum_note 3, 6
	drum_note 3, 5
	;musicef 0
	drum_note 2, 16
	;musicef 253
	drum_note 2, 16
	rest 1
	;musicef 0
	drum_note 2, 16
	sound_loop 16, .Loop1
	drum_note 2, 9
	;musicef 250
	drum_note 2, 8
	;musicef 253
	drum_note 3, 6
	drum_note 3, 5
	drum_note 3, 5
	;musicef 0
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	;musicef 253
	drum_note 2, 9
	;musicef 0
	drum_note 2, 8
	drum_note 2, 16
	drum_note 3, 6
	;musicef 253
	drum_note 3, 6
	drum_note 3, 5
	drum_note 3, 6
	drum_note 3, 5
	drum_note 3, 5
.Loop2
	;musicef 0
	drum_note 2, 9
	;musicef 250
	drum_note 2, 8
	;musicef 253
	drum_note 3, 6
	drum_note 3, 5
	drum_note 3, 5
	;rept 2
	;musicef 254
	drum_note 2, 16
	rest 1
	;musicef 2
	drum_note 2, 16
	;---
	;musicef 254
	drum_note 2, 16
	rest 1
	;musicef 2
	drum_note 2, 16
	;endr
	;musicef 0
	drum_note 2, 16
	rest 1
	;musicef 253
	drum_note 3, 6
	drum_note 3, 5
	drum_note 3, 5
	sound_loop 7, .Loop2
	drum_speed 11
	drum_note 6, 12
	rest 12
	sound_loop 0, .MainLoop
; 0x1eb64e
