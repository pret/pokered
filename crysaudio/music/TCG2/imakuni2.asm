Music_Imakuni2:
	channel_count 4
	channel 1, Music_Imakuni2_Ch1
	channel 2, Music_Imakuni2_Ch2
	channel 3, Music_Imakuni2_Ch3
	channel 4, Music_Imakuni2_Ch4

Music_Imakuni2_Ch2: ; 1f3411 (7c:7411)
	channel_volume 10
.MainLoop
	;musicf0 31
	;musicf3
	;musicdc 255
	speed 1
	octave 2
	;musicf0 31
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	inc_octave
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	dec_octave
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	rest 5
	rest 12
	dec_octave
	;musicef 254
	note E_, 5
	rest 11
	inc_octave
	rest 9
	rest 8
	;musicef 254
	note C_, 16
	note C#, 5
	rest 12
	note D#, 16
	note E_, 5
	rest 12
	dec_octave
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	note G#, 8
	rest 8
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	inc_octave
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	dec_octave
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	rest 5
	rest 12
	dec_octave
	;musicef 254
	note E_, 5
	rest 11
	rest 9
	sound_call Branch_1f3762
	rest 8
	;musicf0 31
	octave 2
	note E_, 16
	note G_, 16
	;tie
	note G_, 5
	;tie
	;musice4 19
	note G_, 4
	;tie
	;musice4 3
	note G#, 4
	;tie
	;musice4 27
	note G#, 2
	;tie
	;musice4 0
	note A_, 2
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	inc_octave
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	dec_octave
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	rest 5
	rest 12
	dec_octave
	;musicef 254
	note E_, 5
	rest 11
	inc_octave
	rest 9
	rest 8
	;musicef 254
	note C_, 16
	note C#, 5
	rest 12
	note D#, 16
	note E_, 5
	rest 12
	dec_octave
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	note G#, 8
	rest 8
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	inc_octave
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	dec_octave
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	rest 5
	rest 12
	dec_octave
	;musicf0 31
	note G_, 16
	note A_, 9
	inc_octave
	inc_octave
	sound_call Branch_1f3762
	rest 8
	octave 3
	rest 16
	;musicf0 9
	note D#, 9
	;tie
	note E_, 8
	;tie
	note E_, 16
	;musicf0 18
	;vibrato_type 17
	vibrato 1, 3, 3
	octave 4
	note D#, 5
	rest 4
	rest 16
	note D_, 3
	note E_, 3
	note D#, 2
	note C_, 9
	;tie
	note C_, 8
	note C#, 16
	note E_, 5
	rest 4
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	note E_, 5
	rest 12
	note F#, 5
	rest 11
	note G_, 9
	;tie
	note G_, 16
	note F#, 3
	note G_, 3
	note F#, 2
	note E_, 5
	rest 12
	note D#, 5
	rest 11
	note E_, 9
	;tie
	note E_, 8
	note C#, 5
	rest 11
	dec_octave
	note A_, 5
	rest 12
	channel_volume 9
	note G_, 16
	;tie
	note G_, 9
	;tie
	note G_, 8
	;tie
	note G_, 16
	;tie
	note G_, 4
	;tie
	;musice4 254
	note G_, 5
	;tie
	;musice4 252
	note G_, 4
	;tie
	;musice4 250
	note G_, 4
	;tie
	;musice4 248
	note G_, 4
	;tie
	;musice4 255
	note F#, 4
	;tie
	;musice4 250
	note F#, 4
	;tie
	;musice4 247
	note F#, 3
	;tie
	;musice4 0
	note F_, 1
	rest 9
	sound_call Branch_1f3762
	;musicf0 9
	octave 2
	rest 8
	octave 2
	note E_, 16
	note G_, 9
	;tie
	note G_, 8
	;tie
	note G_, 5
	;tie
	;musice4 19
	note G_, 4
	;tie
	;musice4 3
	note G#, 4
	;tie
	;musice4 27
	note G#, 2
	;tie
	;musice4 0
	note A_, 1
	;musicf0 18
	;vibrato_type 17
	vibrato 1, 3, 3
	octave 4
	note D#, 5
	rest 4
	rest 16
	note D_, 3
	note E_, 3
	note D#, 2
	note C_, 9
	;tie
	note C_, 8
	note C#, 16
	note E_, 5
	rest 4
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	note E_, 5
	rest 12
	note F#, 5
	rest 11
	note G_, 9
	;tie
	note G_, 16
	note F#, 3
	note G_, 3
	note F#, 2
	note E_, 5
	rest 12
	note D#, 5
	rest 11
	note E_, 9
	;tie
	note E_, 8
	dec_octave
	note A_, 5
	rest 11
	inc_octave
	note A_, 5
	rest 12
	channel_volume 8
	note G_, 16
	;tie
	note G_, 9
	;tie
	note G_, 8
	;tie
	note G_, 16
	;tie
	note G_, 4
	;tie
	;musice4 254
	note G_, 5
	;tie
	;musice4 252
	note G_, 4
	;tie
	;musice4 250
	note G_, 4
	;tie
	;musice4 248
	note G_, 4
	;tie
	;musice4 255
	note F#, 4
	;tie
	;musice4 250
	note F#, 4
	;tie
	;musice4 247
	note F#, 3
	;tie
	;musice4 0
	note F_, 1
	;musicf0 9
	octave 2
	note A_, 9
	inc_octave
	note C#, 5
	rest 3
	rest 16
	inc_octave
	note E_, 5
	rest 12
	dec_octave
	note C#, 5
	rest 3
	note C#, 4
	note E_, 4
	note A_, 5
	rest 4
	rest 8
	;musicf0 4
	octave 3
	rest 8
	;musicef 251
	note A_, 8
	;musicef 2
	note G#, 9
	;musicef 2
	note A_, 8
	;musicef 2
	inc_octave
	note E_, 8
	note F_, 8
	;musicef 0
	;musicf0 18
	;vibrato_type 17
	vibrato 1, 3, 3
	octave 4
	note F#, 5
	rest 4
	rest 16
	note F#, 3
	note D_, 3
	note F#, 2
	note D_, 9
	;tie
	note D_, 8
	dec_octave
	note A#, 16
	note B_, 5
	rest 4
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	octave 4
	note F#, 5
	rest 12
	note G#, 5
	rest 11
	note A_, 9
	;tie
	note A_, 16
	note G#, 3
	note A_, 3
	note G#, 2
	note F#, 5
	rest 12
	note F_, 5
	rest 11
	note F#, 9
	;tie
	note F#, 8
	note D_, 5
	rest 11
	dec_octave
	note A#, 5
	rest 12
	channel_volume 9
	note G#, 16
	;tie
	note G#, 9
	;tie
	note G#, 8
	;tie
	note G#, 16
	;tie
	note G#, 5
	;tie
	;musice4 254
	note G#, 4
	;tie
	;musice4 252
	note G#, 4
	;tie
	;musice4 250
	note G#, 4
	;tie
	;musice4 248
	note G#, 4
	;tie
	;musice4 255
	note G_, 4
	;tie
	;musice4 250
	note G_, 4
	;tie
	;musice4 247
	note G_, 3
	;tie
	;musice4 0
	note F#, 1
	rest 9
	;musicec 5
	sound_call Branch_1f3762
	;musicec 0
	rest 8
	rest 16
	;musicf0 9
	octave 3
	note D#, 9
	;tie
	note E_, 8
	;tie
	note E_, 16
	;musicf0 18
	;vibrato_type 17
	vibrato 1, 3, 3
	octave 4
	note D#, 5
	rest 4
	rest 16
	note D_, 3
	note E_, 3
	note D#, 2
	note C_, 9
	;tie
	note C_, 8
	note C#, 16
	note E_, 5
	rest 4
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	note E_, 5
	rest 12
	note F#, 5
	rest 11
	note G_, 9
	;tie
	note G_, 16
	note F#, 3
	note G_, 3
	note F#, 2
	note E_, 5
	rest 12
	note D#, 5
	rest 11
	note E_, 9
	;tie
	note E_, 8
	dec_octave
	note A_, 5
	rest 11
	inc_octave
	note A_, 5
	rest 12
	channel_volume 8
	note G_, 16
	;tie
	note G_, 9
	;tie
	note G_, 8
	;tie
	note G_, 16
	;tie
	note G_, 4
	;tie
	;musice4 254
	note G_, 5
	;tie
	;musice4 252
	note G_, 4
	;tie
	;musice4 250
	note G_, 4
	;tie
	;musice4 248
	note G_, 4
	;tie
	;musice4 255
	note F#, 4
	;tie
	;musice4 250
	note F#, 4
	;tie
	;musice4 247
	note F#, 3
	;tie
	;musice4 0
	note F_, 1
	octave 2
	;musicf0 31
	note A_, 9
	inc_octave
	;musicf0 9
	note C#, 5
	rest 3
	rest 16
	inc_octave
	note E_, 5
	rest 12
	dec_octave
	note C#, 5
	rest 3
	inc_octave
	note C#, 4
	note E_, 4
	note A_, 5
	rest 4
	rest 8
	rest 16
	;musicf0 8
	;musice4 0
	;musicef 2
	octave 3
	note B_, 5
	note A_, 4
	note E_, 4
	note C_, 4
	dec_octave
	note A_, 4
	note F_, 4
	note D_, 4
	dec_octave
	note B_, 4
	inc_octave
	note D#, 5
	;tie
	note E_, 4
	note G#, 8
	note B_, 8
	inc_octave
	note D_, 8
	;tie
	note D_, 9
	note C#, 8
	dec_octave
	note B_, 8
	note D#, 8
	note E_, 9
	note G#, 8
	note B_, 8
	rest 8
	inc_octave
	note C#, 5
	note D_, 4
	note C#, 4
	note D_, 4
	note C#, 4
	note D_, 4
	note C#, 4
	note D_, 4
	dec_octave
	note C#, 5
	;tie
	note D_, 4
	note F#, 8
	note A_, 8
	inc_octave
	note C_, 8
	;tie
	note C_, 9
	dec_octave
	note B_, 8
	note A_, 8
	note C#, 8
	note D_, 9
	note F#, 8
	note A_, 8
	rest 8
	note B_, 5
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note D#, 5
	;tie
	note E_, 4
	note G#, 8
	note B_, 8
	inc_octave
	note D_, 8
	;tie
	note D_, 9
	note C#, 8
	dec_octave
	note B_, 8
	note E_, 9
	note F_, 8
	note A_, 8
	inc_octave
	note C_, 8
	note D#, 8
	;tie
	note D#, 9
	note D_, 8
	note C_, 8
	dec_octave
	note F_, 8
	note B_, 5
	note E_, 4
	note G#, 4
	note B_, 4
	inc_octave
	note E_, 4
	dec_octave
	note G#, 4
	note B_, 4
	inc_octave
	note E_, 4
	note G#, 5
	dec_octave
	note B_, 4
	inc_octave
	note E_, 4
	note G#, 4
	note B_, 4
	inc_octave
	note E_, 4
	note G#, 4
	note B_, 4
	inc_octave
.Loop1
	note E_, 5
	rest 6
	;musicef 253
	sound_loop 3, .Loop1
	;musicf0 9
	octave 2
	note G_, 16
	;tie
	note G_, 5
	;tie
	;musice4 19
	note G_, 4
	;tie
	;musice4 3
	note G#, 4
	;tie
	;musice4 27
	note G#, 2
	;tie
	;musice4 0
	note A_, 2
	sound_loop 0, .MainLoop

Branch_1f3762:
	;musicf0 9
	;musicf1 101
	;musicf3
	;musicdc 255
	speed 1
	;musicef 255
	octave 4
	note C#, 5
	rest 3
	note C#, 5
	rest 11
	note C#, 5
	rest 4
	rest 16
	note C#, 5
	rest 3
	note C#, 5
	rest 4
	sound_ret


Music_Imakuni2_Ch1: ; 1f377a (7c:777a)
	channel_volume 10
.MainLoop
	;musicf0 9
	;musicf1 103
	;musicf3
	;musicdc 255
	speed 1
	;musicef 255
	octave 4
	rest 9
	rest 8
	rest 8
	rest 8
	note E_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	note D#, 5
	rest 11
	dec_octave
	rest 9
	rest 8
	;musicef 254
	note D#, 5
	rest 11
	rest 9
	rest 8
	;musicef 254
	note G#, 16
	note A_, 5
	rest 12
	inc_octave
	note C_, 16
	note C#, 5
	rest 12
	rest 16
	rest 9
	rest 8
	rest 8
	rest 8
	;musicef 4
	inc_octave
	rest 9
	rest 8
	rest 8
	rest 8
	note E_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	note D#, 5
	rest 11
	dec_octave
	rest 9
	rest 8
	;musicef 254
	note D#, 5
	rest 11
	;musicef 2
	inc_octave
	inc_octave
	rest 9
	note C_, 5
	rest 3
	note C_, 5
	rest 11
	note C_, 5
	rest 4
	rest 16
	note C_, 5
	rest 3
	note C_, 5
	rest 12
	dec_octave
	dec_octave
	rest 16
	rest 9
	rest 8
	rest 16
	octave 4
	rest 9
	rest 8
	rest 8
	rest 8
	note E_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	note D#, 5
	rest 11
	dec_octave
	rest 9
	rest 8
	;musicef 254
	note D#, 5
	rest 11
	rest 9
	rest 8
	;musicef 254
	note G#, 16
	note A_, 5
	rest 12
	inc_octave
	note C_, 16
	note C#, 5
	rest 12
	rest 16
	rest 9
	rest 8
	rest 8
	rest 8
	;musicef 4
	inc_octave
	rest 9
	rest 8
	rest 8
	rest 8
	note E_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	note D#, 5
	rest 11
	dec_octave
	rest 9
	rest 8
	;musicef 254
	note E_, 5
	rest 11
	;musicef 2
	inc_octave
	inc_octave
	rest 9
	note C_, 5
	rest 3
	note C_, 5
	rest 11
	note C_, 5
	rest 4
	rest 16
	note C_, 5
	rest 3
	note C_, 5
	rest 12
	dec_octave
	dec_octave
	rest 16
	note G_, 9
	;tie
	note G#, 8
	;tie
	note G#, 16
	;musicf0 31
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note C#, 2
	rest 15
	;musicef 2
	dec_octave
	note E_, 5
	rest 11
	note A_, 9
	inc_octave
	;musicf0 9
	note C#, 5
	rest 3
	rest 16
	dec_octave
	note A_, 5
	rest 4
	rest 8
	inc_octave
	inc_octave
	note G#, 5
	rest 3
	dec_octave
	note C#, 4
	note E_, 4
	note A_, 5
	rest 4
	rest 8
	sound_call Branch_1f3a58
	;musicf0 31
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note C#, 2
	rest 15
	;musicef 2
	dec_octave
	note E_, 5
	rest 11
	rest 9
	;musicec 255
	sound_call Branch_1f3762
	;musicec 0
	rest 8
	rest 16
	rest 9
	rest 8
	rest 16
	;musicf0 31
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note C#, 2
	rest 15
	;musicef 2
	dec_octave
	note E_, 5
	rest 11
	note A_, 9
	inc_octave
	;musicf0 9
	note C#, 5
	rest 3
	rest 16
	dec_octave
	note A_, 5
	rest 4
	rest 8
	inc_octave
	inc_octave
	note G#, 5
	rest 3
	dec_octave
	note C#, 4
	note E_, 4
	note A_, 5
	rest 4
	rest 8
	sound_call Branch_1f3a58
	;musicf0 31
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note C#, 2
	rest 15
	;musicef 2
	dec_octave
	note E_, 5
	rest 11
	;musicf0 9
	;musicef 255
	rest 9
	inc_octave
	rest 5
	rest 3
	rest 16
	inc_octave
	note C#, 5
	rest 12
	dec_octave
	note C_, 5
	rest 3
	rest 8
	note E_, 5
	rest 4
	dec_octave
	note A_, 8
	sound_call Branch_1f3a58
	;musicf0 31
	octave 3
	note D_, 9
	rest 8
	rest 8
	;musicf0 9
	note D_, 3
	note F#, 3
	note A_, 2
	inc_octave
	note D_, 5
	rest 12
	dec_octave
	;musicf0 31
	note A#, 16
	note B_, 9
	rest 8
	;musicf0 9
	note A_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note F#, 2
	rest 15
	;musicef 2
	note C#, 5
	rest 11
	note D_, 9
	;musicf0 9
	note F#, 5
	rest 3
	rest 16
	note D_, 5
	rest 4
	rest 8
	inc_octave
	inc_octave
	note C#, 5
	rest 3
	dec_octave
	dec_octave
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 5
	rest 4
	rest 8
	;musicec 253
	sound_call Branch_1f3a58
	;musicec 0
	;musicf0 9
	octave 3
	rest 9
	rest 8
	rest 8
	note D_, 3
	note F#, 3
	note A_, 2
	inc_octave
	note D_, 5
	rest 12
	dec_octave
	;musicf0 31
	note A#, 16
	note B_, 9
	rest 8
	;musicf0 9
	note A_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note F#, 2
	rest 15
	;musicef 2
	note C#, 5
	rest 11
	rest 9
	;musicec 6
	sound_call Branch_1f3762
	;musicec 0
	rest 8
	rest 16
	;musicf0 9
	octave 2
	note G_, 9
	;tie
	note G#, 8
	;tie
	note G#, 16
	;musicf0 31
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note C#, 2
	rest 15
	;musicef 2
	dec_octave
	note E_, 5
	rest 11
	note A_, 9
	;musicf0 9
	inc_octave
	note C#, 5
	rest 3
	rest 16
	dec_octave
	note A_, 5
	rest 4
	rest 8
	inc_octave
	inc_octave
	note G#, 5
	rest 3
	dec_octave
	note C#, 4
	note E_, 4
	note A_, 5
	rest 4
	rest 8
	sound_call Branch_1f3a58
	;musicf0 31
	octave 2
	note A_, 9
	rest 8
	rest 8
	;musicf0 9
	note A_, 3
	inc_octave
	note C#, 3
	note E_, 2
	note A_, 5
	rest 12
	;musicf0 31
	note F#, 16
	note G_, 9
	rest 8
	;musicf0 9
	note E_, 5
	rest 11
	;musicf0 31
	;musicef 254
	note C#, 2
	rest 15
	;musicef 2
	dec_octave
	note E_, 5
	rest 11
	;musicf0 9
	rest 9
	inc_octave
	note C_, 5
	rest 3
	rest 16
	inc_octave
	note C#, 5
	rest 12
	dec_octave
	note C_, 5
	rest 3
	rest 8
	inc_octave
	note E_, 5
	rest 4
	rest 8
	octave 2
	note G_, 8
	rest 8
	inc_octave
	note C_, 9
	;tie
	note C_, 8
	note D_, 8
	rest 8
	;vibrato_type 5
	vibrato 1, 3, 3
	octave 3
	note E_, 9
	note G#, 8
	note B_, 4
	rest 4
	inc_octave
	note C#, 4
	note D_, 13
	note C#, 8
	dec_octave
	note B_, 8
	note D#, 8
	note E_, 9
	note G#, 8
	note B_, 8
	rest 8
	inc_octave
	note G_, 5
	note G#, 4
	note G_, 4
	note G#, 4
	note G_, 4
	note G#, 4
	note G_, 4
	note G#, 4
	dec_octave
	note D_, 9
	note F#, 8
	note A_, 4
	rest 4
	note B_, 4
	inc_octave
	note C_, 13
	dec_octave
	note B_, 8
	note A_, 8
	note C#, 8
	note D_, 9
	note F#, 8
	note A_, 8
	rest 8
	inc_octave
	note F_, 5
	note F#, 4
	note F_, 4
	note F#, 4
	note F_, 4
	note F#, 4
	note F_, 4
	note F#, 4
	dec_octave
	note E_, 9
	note G#, 8
	note B_, 4
	rest 4
	inc_octave
	note C#, 4
	note D_, 13
	note C#, 8
	dec_octave
	note B_, 8
	note E_, 4
	rest 4
	note F_, 9
	note A_, 8
	inc_octave
	note C_, 4
	rest 4
	note D_, 4
	note D#, 13
	note D_, 8
	note C_, 8
	dec_octave
	note F_, 8
	channel_volume 4
	note E_, 16
	;tie
	note E_, 16
	;tie
	note E_, 16
	;tie
	note E_, 16
	;tie
	note E_, 2
	;musicf0 8
	;musicef 2
	;musice4 0
.Loop1
	note B_, 5
	rest 6
	;musicef 253
	sound_loop 3, .Loop1
	note B_, 5
	rest 6
	note B_, 5
	rest 6
	note B_, 5
	rest 6
	sound_loop 0, .MainLoop

Branch_1f3a58:
	;musicf0 4
	octave 4
	;musicef 251
	note C_, 8
	;musicef 2
	note C#, 8
	;musicef 2
	note C_, 9
	;musicef 2
	note C#, 8
	note C_, 8
	note C#, 8
	;musicef 0
	sound_ret


Music_Imakuni2_Ch3: ; 1f3a6c (7c:7a6c)
	channel_volume 1
	speed 1
	fade_wave 11
	;musicdc 255
	channel_volume 1
	;musice9 96
.MainLoop
	;musice8 8
	octave 2
	note A_, 9
	rest 16
	rest 8
	inc_octave
	note A_, 9
	rest 8
	note F#, 16
	note G_, 9
	rest 16
	rest 16
	rest 9
	dec_octave
	channel_volume 2
	note G_, 16
	note A_, 9
	channel_volume 1
	rest 16
	rest 8
	rest 9
	rest 16
	rest 8
	rest 9
	rest 8
	note F#, 16
	note G_, 9
	rest 8
	note G#, 8
	rest 8
	note A_, 9
	rest 16
	rest 8
	inc_octave
	note A_, 9
	rest 8
	note F#, 16
	note G_, 9
	rest 16
	rest 8
	rest 9
	rest 8
	dec_octave
	channel_volume 2
	note G_, 16
	note A_, 9
	channel_volume 1
	sound_call Branch_1f3d18
	octave 2
	channel_volume 1
	rest 8
	note E_, 8
	rest 8
	note G_, 16
	;tie
	note G_, 5
	;tie
	;musice4 38
	note G_, 4
	;tie
	;musice4 6
	note G#, 4
	;tie
	;musice4 52
	note G#, 2
	;tie
	;musice4 0
	note A_, 2
	note A_, 9
	rest 16
	rest 8
	inc_octave
	note A_, 9
	rest 8
	note F#, 16
	note G_, 9
	rest 16
	rest 8
	rest 9
	rest 8
	dec_octave
	channel_volume 2
	note G_, 16
	note A_, 9
	channel_volume 1
	rest 16
	rest 8
	rest 9
	rest 16
	rest 8
	rest 9
	rest 8
	note F#, 16
	note G_, 9
	rest 8
	note G#, 8
	rest 8
	note A_, 9
	rest 16
	rest 8
	inc_octave
	note A_, 9
	rest 8
	note F#, 16
	note G_, 9
	rest 16
	rest 8
	rest 9
	rest 8
	dec_octave
	note G_, 16
	note A_, 9
	sound_call Branch_1f3d18
	rest 8
	rest 16
	octave 2
	channel_volume 1
	note A_, 9
	;tie
	note A#, 16
	;tie
	note A#, 8
	note A_, 9
	rest 16
	rest 8
	inc_octave
	inc_octave
	note E_, 5
	rest 4
	dec_octave
	rest 8
	note F#, 16
	note G_, 9
	rest 8
	inc_octave
	note D#, 5
	rest 3
	rest 8
	channel_volume 2
	note C#, 2
	channel_volume 1
	rest 15
	dec_octave
	dec_octave
	note E_, 16
	note A_, 5
	rest 4
	inc_octave
	inc_octave
	note C_, 5
	rest 3
	dec_octave
	note E_, 2
	rest 6
	inc_octave
	note D#, 2
	rest 6
	note A_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	dec_octave
	note E_, 5
	rest 11
	note G_, 9
	;tie
	note G_, 8
	note G#, 16
	note A_, 9
	rest 16
	rest 8
	inc_octave
	inc_octave
	note E_, 5
	rest 4
	dec_octave
	dec_octave
	rest 8
	inc_octave
	note F#, 16
	note G_, 9
	rest 8
	inc_octave
	note D#, 5
	rest 3
	rest 8
	channel_volume 2
	note C#, 2
	channel_volume 1
	rest 15
	dec_octave
	dec_octave
	note E_, 16
	note A_, 9
	sound_call Branch_1f3d18
	octave 2
	channel_volume 1
	rest 8
	note E_, 8
	rest 8
	note G_, 9
	;tie
	note G_, 8
	;tie
	note G_, 4
	;tie
	;musice4 38
	note G_, 4
	;tie
	;musice4 6
	note G#, 4
	;tie
	;musice4 52
	note G#, 3
	;tie
	;musice4 0
	note A_, 1
	note A_, 9
	rest 16
	rest 8
	inc_octave
	inc_octave
	note E_, 5
	rest 4
	dec_octave
	rest 8
	note F#, 16
	note G_, 9
	rest 8
	inc_octave
	note D#, 5
	rest 3
	rest 8
	channel_volume 2
	note C#, 2
	channel_volume 1
	rest 15
	dec_octave
	dec_octave
	note E_, 16
	note A_, 5
	rest 4
	inc_octave
	inc_octave
	note C_, 5
	rest 3
	dec_octave
	note E_, 2
	rest 6
	inc_octave
	note D#, 2
	rest 6
	note A_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	dec_octave
	note E_, 5
	rest 11
	note G_, 9
	;tie
	note G_, 8
	note G#, 16
	note A_, 9
	rest 16
	rest 8
	inc_octave
	inc_octave
	note E_, 5
	rest 4
	dec_octave
	rest 8
	note F#, 16
	note G_, 9
	rest 8
	inc_octave
	note D#, 5
	rest 3
	rest 8
	channel_volume 2
	note C#, 2
	channel_volume 1
	rest 15
	dec_octave
	dec_octave
	note E_, 16
	note A_, 5
	rest 4
	inc_octave
	inc_octave
	note C_, 5
	rest 3
	dec_octave
	note E_, 2
	rest 6
	inc_octave
	note D#, 2
	rest 6
	note A_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	dec_octave
	note A_, 5
	rest 11
	inc_octave
	note C_, 9
	;tie
	note C_, 8
	;tie
	note C_, 4
	;tie
	;musice4 28
	note C_, 4
	;tie
	;musice4 8
	note C#, 4
	;tie
	;musice4 37
	note C#, 3
	;tie
	;musice4 0
	note D_, 1
	note D_, 9
	rest 16
	rest 8
	inc_octave
	note A_, 5
	rest 4
	dec_octave
	rest 8
	note A#, 16
	note B_, 9
	rest 8
	inc_octave
	note G#, 5
	rest 3
	rest 8
	channel_volume 2
	note F#, 2
	channel_volume 1
	rest 15
	dec_octave
	note C#, 16
	note D_, 5
	rest 4
	inc_octave
	note F_, 5
	rest 3
	dec_octave
	note A_, 2
	rest 6
	inc_octave
	note D_, 2
	rest 6
	inc_octave
	note D_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	dec_octave
	dec_octave
	note A_, 5
	rest 11
	inc_octave
	note C_, 9
	;tie
	note C_, 8
	note C#, 16
	note D_, 9
	rest 16
	rest 8
	inc_octave
	note A_, 5
	rest 4
	dec_octave
	rest 8
	note A#, 16
	note B_, 9
	rest 8
	inc_octave
	note G#, 5
	rest 3
	rest 8
	channel_volume 2
	note F#, 2
	channel_volume 1
	rest 15
	dec_octave
	note C#, 16
	note D_, 9
	;musicec 7
	sound_call Branch_1f3d18
	;musicec 0
	octave 2
	channel_volume 1
	rest 16
	rest 8
	note A_, 9
	;tie
	note A#, 16
	;tie
	note A#, 8
	note A_, 9
	rest 16
	rest 8
	inc_octave
	inc_octave
	note E_, 5
	rest 4
	dec_octave
	rest 8
	note F#, 16
	note G_, 9
	rest 8
	inc_octave
	note D#, 5
	rest 3
	rest 8
	channel_volume 2
	note C#, 2
	channel_volume 1
	rest 15
	dec_octave
	dec_octave
	note E_, 16
	note A_, 5
	rest 4
	inc_octave
	inc_octave
	note C_, 5
	rest 3
	dec_octave
	note E_, 2
	rest 6
	inc_octave
	note D#, 2
	rest 6
	note A_, 5
	rest 12
	rest 16
	rest 9
	rest 8
	dec_octave
	dec_octave
	note E_, 5
	rest 11
	note G_, 9
	;tie
	note G_, 8
	note G#, 16
	note A_, 9
	rest 16
	rest 8
	inc_octave
	inc_octave
	note E_, 5
	rest 4
	dec_octave
	dec_octave
	rest 8
	inc_octave
	note F#, 16
	note G_, 9
	rest 8
	inc_octave
	note D#, 5
	rest 3
	rest 8
	channel_volume 2
	note C#, 2
	channel_volume 1
	rest 15
	dec_octave
	dec_octave
	note E_, 16
	note A_, 5
	rest 12
	inc_octave
	note E_, 2
	rest 6
	note D#, 2
	rest 6
	note A_, 5
	rest 12
	dec_octave
	note G_, 5
	rest 11
	note A_, 5
	rest 12
	note G_, 8
	rest 8
	inc_octave
	note C_, 9
	;tie
	note C_, 8
	note D_, 8
	rest 8
	dec_octave
	note E_, 9
	;tie
	note E_, 8
	rest 8
	inc_octave
	note E_, 8
	rest 9
	note E_, 8
	note D_, 8
	note E_, 8
	rest 9
	dec_octave
	note E_, 8
	inc_octave
	note E_, 8
	rest 8
	dec_octave
	note E_, 9
	;tie
	note E_, 8
	note D#, 16
	note D_, 9
	;tie
	note D_, 8
	rest 8
	inc_octave
	note D_, 8
	rest 9
	note D_, 8
	note C_, 8
	note D_, 8
	rest 9
	dec_octave
	note D_, 8
	inc_octave
	note D_, 8
	rest 8
	dec_octave
	note D_, 9
	;tie
	note D_, 8
	note D#, 16
	note E_, 9
	rest 8
	note E_, 8
	inc_octave
	note E_, 8
	rest 9
	note E_, 8
	dec_octave
	note E_, 8
	rest 8
	note F_, 9
	rest 8
	note F_, 8
	inc_octave
	note F_, 8
	rest 9
	note F_, 8
	dec_octave
	note F_, 8
	note D#, 8
	note E_, 3
	rest 2
	note E_, 4
	note D_, 4
	note D#, 4
	note E_, 3
	rest 1
	note E_, 4
	note D_, 4
	note D#, 4
	note E_, 3
	rest 2
	note E_, 4
	note D_, 4
	note D#, 4
	note E_, 3
	rest 1
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note E_, 9
	rest 2
	channel_volume 2
	note E_, 4
	rest 6
	channel_volume 3
	note E_, 4
	rest 6
	rest 2
	channel_volume 1
	dec_octave
	note G_, 16
	;tie
	note G_, 5
	;tie
	;musice4 38
	note G_, 4
	;tie
	;musice4 6
	note G#, 4
	;tie
	;musice4 52
	note G#, 2
	;tie
	;musice4 0
	note A_, 2
	sound_loop 0, .MainLoop

Branch_1f3d18:
	;musice8 1
	channel_volume 1
.Loop1
	channel_volume 1
	octave 7
	note C#, 1
	channel_volume 3
	dec_octave
	note C#, 7
	sound_loop 2, .Loop1
	rest 8
	octave 7
	channel_volume 1
	note C#, 1
	channel_volume 3
	dec_octave
	note C#, 7
	rest 1
	rest 16
.Loop2
	channel_volume 1
	octave 7
	note C#, 1
	channel_volume 3
	dec_octave
	note C#, 7
	sound_loop 2, .Loop2
	rest 1
	;musice8 8
	sound_ret


Music_Imakuni2_Ch4: ; 1f3d41 (7c:7d41)
	toggle_noise 6
.MainLoop
	drum_speed 1
	octave 1
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 11, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 1, 16
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 5, 8
	;musicef 250
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	;musicef 0
	drum_note 2, 9
	drum_note 9, 8
	drum_note 9, 16
	drum_note 9, 16
	rest 1
	drum_note 4, 8
	drum_note 9, 8
	drum_note 9, 16
	rest 1
	drum_note 2, 16
	drum_note 2, 16
	rest 1
	;musicef 250
	drum_note 2, 6
	;musicef 252
	drum_note 2, 5
	drum_note 2, 5
	;musicef 0
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 1, 16
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 2, 16
	rest 1
	;musicef 250
	drum_note 2, 4
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	drum_note 2, 4
	;musicef 0
	drum_note 2, 9
	drum_note 9, 8
	drum_note 9, 16
	drum_note 9, 16
	rest 1
	drum_note 4, 8
	drum_note 9, 8
	drum_note 9, 16
	rest 1
	rest 16
	drum_speed 2
	drum_note 5, 16
	drum_speed 1
	rest 1
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 16
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 2, 8
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	;musicef 250
	drum_note 2, 4
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	drum_note 2, 4
	;musicef 0
	drum_note 2, 9
	drum_note 9, 8
	drum_note 9, 16
	drum_note 9, 16
	rest 1
	drum_note 4, 8
	drum_note 9, 8
	drum_note 9, 16
	rest 1
	drum_note 2, 16
	drum_note 2, 16
	rest 1
	;musicef 250
	drum_note 2, 6
	;musicef 252
	drum_note 2, 5
	drum_note 2, 5
	;musicef 0
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 16
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 2, 8
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	;musicef 250
	drum_note 2, 4
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	drum_note 2, 4
	;musicef 0
	drum_note 1, 16
	rest 1
	drum_note 4, 16
	drum_note 2, 16
	rest 1
	drum_note 4, 8
	drum_note 2, 8
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 16
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 2, 8
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	;musicef 250
	drum_note 2, 4
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	drum_note 2, 4
	;musicef 0
	drum_note 2, 9
	drum_note 9, 8
	drum_note 9, 16
	drum_note 9, 16
	rest 1
	drum_note 4, 8
	drum_note 9, 8
	drum_note 9, 16
	rest 1
	rest 16
	drum_speed 2
	drum_note 5, 16
	drum_speed 1
	rest 1
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 16
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 2, 8
	drum_note 2, 16
	rest 1
	drum_note 2, 16
	drum_note 1, 16
	rest 1
	drum_note 4, 8
	drum_note 1, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 4, 9
	drum_note 4, 8
	drum_note 5, 16
	drum_note 4, 16
	rest 1
	;musicef 250
	drum_note 2, 4
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	drum_note 2, 4
	;musicef 0
	drum_note 1, 16
	rest 1
	drum_note 4, 16
	drum_note 2, 16
	rest 1
	drum_note 4, 8
	drum_note 2, 8
	drum_note 2, 16
	rest 1
	drum_note 5, 16
	drum_note 2, 9
	;musicef 250
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 2, 8
	;musicef 250
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 1, 16
	rest 1
	drum_note 2, 8
	drum_note 5, 16
	rest 1
	drum_note 2, 8
	drum_note 4, 8
	drum_note 4, 8
	drum_note 1, 9
	drum_note 2, 8
	drum_note 5, 8
	;musicef 250
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 2, 9
	drum_note 2, 8
	drum_note 4, 8
	drum_note 2, 8
	drum_note 1, 9
	drum_note 2, 4
	drum_note 2, 4
	drum_note 2, 8
	drum_note 1, 16
	rest 1
	drum_note 1, 8
	drum_note 2, 8
	;musicef 250
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 1, 9
	drum_note 2, 8
	drum_note 5, 8
	drum_note 2, 4
	drum_note 2, 4
	drum_note 2, 9
	drum_note 4, 4
	drum_note 2, 4
	drum_note 2, 8
	drum_note 2, 8
	drum_note 1, 9
	drum_note 2, 8
	drum_note 2, 8
	drum_note 2, 8
	drum_note 4, 9
	drum_note 2, 4
	drum_note 2, 4
	drum_note 2, 8
	drum_note 2, 8
	drum_note 1, 9
	drum_note 4, 4
	drum_note 2, 4
	drum_note 2, 8
	drum_note 5, 8
	drum_note 4, 9
	;musicef 250
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	;musicef 0
	drum_note 2, 8
	drum_note 2, 8
	drum_note 2, 9
	;musicef 250
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 2, 8
	;musicef 250
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 2, 9
	;musicef 250
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 2, 4
	;musicef 250
	drum_note 2, 4
	;musicef 252
	drum_note 2, 4
	;musicef 0
	drum_note 2, 4
	drum_note 2, 16
	rest 1
	rest 16
	drum_speed 2
	drum_note 5, 16
	drum_speed 1
	rest 1
	sound_loop 0, .MainLoop
; 0x1f3f40
