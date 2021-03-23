Music_DuelTheme1:
	channel_count 4
	channel 1, Music_DuelTheme1_Ch1
	channel 2, Music_DuelTheme1_Ch2
	channel 3, Music_DuelTheme1_Ch3
	channel 4, Music_DuelTheme1_Ch4

Music_DuelTheme1_Ch1: ; f532a (3d:532a)
	notetype0 7
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 20, 3, 3
	notetype2 8
	duty_cycle 2
.MainLoop
	octave 2
.Loop1
	rest 16
	sound_loop 7, .Loop1
	rest 9
.Loop2
	rest 3
	sound_call Branch_f54f9
	notetype1 10
	notetype0 1
	note F_, 4
	note F#, 3
	;tie
	notetype0 7
	note F#, 1
	notetype1 3
	note F#, 1
	dec_octave
	notetype1 10
	note A_, 1
	rest 2
	inc_octave
	notetype1 10
	note D_, 10
	notetype1 3
	note D_, 12
	sound_call Branch_f54f9
	notetype1 10
	note F#, 2
	notetype1 3
	note F#, 1
	notetype1 10
	note A_, 13
	notetype1 3
	note A_, 10
	notetype1 10
	note F#, 1
	notetype1 3
	note F#, 1
	notetype1 10
	note F#, 1
	note G_, 1
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	;tie
	notetype0 7
	note B_, 15
	notetype1 3
	note B_, 4
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	;tie
	notetype0 7
	note B_, 3
	note A_, 3
	notetype1 3
	note A_, 1
	notetype1 10
	note G_, 2
	notetype1 3
	note G_, 2
	notetype1 10
	notetype0 1
	note G#, 4
	note A_, 3
	;tie
	notetype0 7
	note A_, 15
	notetype1 3
	note A_, 4
	notetype1 10
	notetype0 1
	note G#, 4
	note A_, 3
	;tie
	notetype0 7
	note A_, 3
	note G_, 4
	note F#, 2
	notetype1 3
	note F#, 2
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 15
	notetype1 3
	note G_, 4
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 3
	note F#, 4
	note E_, 3
	notetype1 3
	note E_, 1
	notetype1 10
	notetype0 1
	note D#, 4
	note E_, 3
	;tie
	notetype0 7
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 10
	note D_, 13
	notetype1 3
	note D_, 9
	dec_octave
	sound_loop 2, .Loop2
	inc_octave
	duty_cycle 1
	notetype1 10
	notetype0 1
	note C#, 4
	note D_, 3
	;tie
	notetype0 7
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	sound_call Branch_f5538
	notetype0 1
	note G#, 4
	note A_, 3
	;tie
	notetype0 7
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note F#, 5
	notetype1 3
	note F#, 1
	dec_octave
	notetype1 10
	note A_, 1
	inc_octave
	notetype0 1
	note D_, 4
	notetype1 3
	note D_, 3
	notetype1 10
	note F#, 4
	notetype1 3
	note F#, 3
	notetype1 10
	note A_, 4
	notetype1 3
	note A_, 3
	notetype0 7
	rest 3
	dec_octave
	duty_cycle 1
	notetype1 10
	notetype2 8
.Loop3
	note A_, 1
	rest 2
	sound_loop 3, .Loop3
	inc_octave
	notetype0 1
	note C#, 4
	note D_, 3
	;tie
	notetype0 7
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	sound_call Branch_f5538
	notetype0 1
	note G#, 4
	note A_, 3
	;tie
	notetype0 7
	note A_, 5
	;tie
	note A_, 10
	;tie
	note A_, 6
	notetype1 3
	note A_, 2
	inc_octave
	notetype1 10
	notetype0 1
	note C#, 4
	note D_, 3
	;tie
	notetype0 7
	note D_, 2
	note C#, 1
	notetype1 3
	note C#, 2
	dec_octave
	notetype1 10
	note B_, 1
	notetype1 3
	note B_, 1
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	;tie
	notetype0 7
	note B_, 1
	notetype1 3
	note B_, 1
	notetype1 10
	note A_, 13
	;tie
	note A_, 6
	notetype1 3
	note A_, 2
	dec_octave
	notetype1 8
	notetype0 1
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	dec_octave
	note C#, 5
	note E_, 5
	note A_, 4
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 4
	dec_octave
	sound_call Branch_f5580
	notetype1 10
	note A_, 2
	;tie
	note A_, 8
	;tie
	note A_, 8
	;tie
	note A_, 6
	duty_cycle 1
	notetype1 10
	notetype0 1
	dec_octave
	note B_, 4
	inc_octave
	note C_, 3
	notetype0 7
	note C#, 1
	rest 1
	note C#, 1
	note D_, 2
	note E_, 2
	note G_, 2
	duty_cycle 2
	sound_call Branch_f5580
	notetype1 10
	notetype0 1
	note G#, 4
	note A_, 3
	;tie
	notetype0 7
	note A_, 5
	note G_, 2
	note F#, 2
	notetype1 3
	note F#, 2
	notetype1 10
	note E_, 2
	notetype1 3
	note E_, 2
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 5
	note F#, 2
	note E_, 2
	notetype1 3
	note E_, 2
	notetype1 10
	note D_, 2
	notetype1 3
	note D_, 2
	notetype1 10
	note D_, 8
	;tie
	note D_, 8
	note D_, 8
	;tie
	note D_, 8
	notetype1 3
	note D_, 2
	notetype1 10
	note D_, 12
	notetype1 3
	note D_, 2
	notetype1 10
	note D_, 6
	;tie
	note D_, 8
	rest 4
	sound_loop 0, .MainLoop

Branch_f54f9:
	octave 2
	notetype1 10
	note A_, 1
	note B_, 1
	inc_octave
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 10
	notetype0 1
	note F_, 4
	note F#, 3
	;tie
	notetype0 7
	note F#, 10
	notetype1 3
	note F#, 1
	notetype1 10
	note D_, 3
	notetype1 3
	note D_, 1
	notetype1 10
	notetype0 1
	note D#, 4
	note E_, 3
	;tie
	notetype0 7
	note E_, 5
	notetype1 3
	note E_, 2
	notetype1 10
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 2
	note F#, 1
	notetype1 3
	note F#, 2
	notetype1 10
	note E_, 1
	notetype1 3
	note E_, 1
	sound_ret

Branch_f5538:
	note C_, 1
	rest 2
	dec_octave
	note G_, 1
	rest 2
	note G_, 1
	rest 2
	duty_cycle 2
	notetype1 10
	note G_, 1
	inc_octave
	notetype0 1
	note C_, 4
	notetype1 3
	note C_, 3
	notetype1 10
	note E_, 4
	notetype1 3
	note E_, 3
	notetype1 10
	note G_, 4
	notetype1 3
	note G_, 3
	notetype0 7
	rest 3
	duty_cycle 1
	notetype1 10
	notetype2 8
	dec_octave
.Loop4
	note G_, 1
	rest 2
	sound_loop 3, .Loop4
	inc_octave
	duty_cycle 2
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	;tie
	notetype0 7
	note B_, 2
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 10
	sound_ret

Branch_f5580:
	notetype0 1
	notetype1 10
	note F_, 4
	note F#, 3
	;tie
	notetype0 7
	note F#, 9
	notetype1 3
	note F#, 2
	notetype1 10
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 10
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note B_, 2
	notetype1 3
	note B_, 2
	inc_octave
	notetype1 10
	notetype0 1
	note F_, 4
	note F#, 3
	;tie
	notetype0 7
	note F#, 7
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 10
	note D_, 1
	notetype1 3
	note D_, 1
	notetype1 10
	note C#, 2
	notetype1 3
	note C#, 1
	dec_octave
	notetype1 10
	note A_, 9
	note F#, 1
	notetype1 3
	note F#, 1
	notetype1 10
	notetype0 1
	note A#, 4
	note B_, 3
	;tie
	notetype0 7
	note B_, 8
	notetype1 3
	note B_, 1
	notetype1 10
	note A_, 4
	note G_, 4
	note F#, 10
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 10
	note A_, 1
	notetype1 3
	note A_, 1
	notetype1 10
	note D_, 10
	note E_, 2
	note F#, 2
	notetype1 3
	note F#, 2
	sound_ret


Music_DuelTheme1_Ch2: ; f55e7 (3d:55e7)
	notetype0 7
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 20, 3, 3
	notetype2 8
.MainLoop
	duty_cycle 1
	notetype1 9
	octave 2
.Loop1
	rept 3
	note D_, 1
	rest 2
	endr
	rest 1
	dec_octave
	note A_, 1
	rest 1
	note A_, 1
	note B_, 1
	rest 2
	inc_octave
	sound_loop 4, .Loop1
.Loop2
	octave 2
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	sound_call Branch_f59f9
	sound_loop 4, .Loop2
	octave 2
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	sound_call Branch_f59f9
	octave 2
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note C_, 2
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 10
	notetype2 6
	note G_, 1
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	rest 2
	inc_octave
.Loop3
	octave 2
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	sound_call Branch_f59f9
	sound_loop 3, .Loop3
	octave 2
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note C_, 2
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 10
	notetype2 6
	note G_, 1
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	rest 2
	inc_octave
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	sound_call Branch_f59f9
	octave 2
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	note D_, 1
	rest 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note F#, 1
	rest 1
.Loop4
	note G_, 1
	rest 2
	note G_, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note G_, 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note G_, 1
	rest 3
	note D_, 1
	rest 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note G_, 1
	duty_cycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	rest 2
	sound_loop 2, .Loop4
	note F#, 1
	rest 2
	note F#, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	inc_octave
	note C#, 2
	sound_call Branch_f5a17
	octave 2
	note F#, 1
	rest 2
	note F#, 1
	inc_octave
	duty_cycle 2
	notetype1 10
	notetype2 6
	note E_, 2
	sound_call Branch_f5a17
	note E_, 1
	rest 2
	note E_, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note G_, 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note B_, 1
	duty_cycle 1
	notetype1 9
	notetype2 8
	note G_, 1
	rest 2
	note A_, 1
	rest 2
	note A_, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note G_, 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note A_, 1
	rest 3
	note E_, 1
	rest 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	duty_cycle 1
	notetype1 9
	notetype2 8
	note A_, 1
	rest 2
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	rest 2
	inc_octave
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 7
	;frequency_offset 0
	note E_, 1
	note F#, 1
	note A_, 1
	rest 1
	notetype1 7
	sound_call Branch_f594d
	notetype1 7
	octave 3
	notetype0 1
	note C#, 4
	note D_, 3
	;tie
	notetype0 7
	note D_, 1
	rest 1
	dec_octave
	note F#, 1
	notetype1 10
	notetype2 6
	note F#, 2
	notetype1 7
	notetype2 8
	note A_, 10
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	inc_octave
	note D_, 2
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 7
	note E_, 1
	note F#, 1
	note A_, 1
	rest 1
	sound_call Branch_f594d
	notetype1 7
	octave 3
	note D_, 2
	rest 1
	note F#, 13
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 2
	note D_, 1
	duty_cycle 2
	inc_octave
	notetype1 10
	notetype2 6
	note D_, 2
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	inc_octave
	duty_cycle 2
	notetype1 7
	note D_, 1
	rest 1
	note D_, 1
	note E_, 1
	note F#, 1
	rest 1
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 15
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note G_, 1
	rest 2
	note G_, 1
	inc_octave
	duty_cycle 2
	notetype1 7
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 2
	rest 1
	note F#, 3
	rest 1
	dec_octave
	notetype1 10
	notetype2 6
	note G_, 1
	duty_cycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	rest 2
	inc_octave
	duty_cycle 2
	notetype1 7
	notetype0 1
	note E_, 4
	note F#, 3
	;tie
	notetype0 7
	note F#, 15
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note F#, 1
	rest 2
	note F#, 1
	inc_octave
	duty_cycle 2
	notetype1 7
	notetype0 1
	note E_, 4
	note F#, 3
	;tie
	notetype0 7
	note F#, 2
	rest 1
	note E_, 3
	rest 1
	dec_octave
	notetype1 10
	notetype2 6
	note A_, 1
	duty_cycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	rest 2
	inc_octave
	duty_cycle 2
	notetype1 7
	notetype0 1
	note D#, 4
	note E_, 3
	;tie
	notetype0 7
	note E_, 15
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note A_, 1
	rest 2
	note A_, 1
	duty_cycle 2
	notetype1 7
	notetype0 1
	note A#, 4
	note B_, 3
	;tie
	notetype0 7
	note B_, 2
	rest 1
	note A_, 3
	rest 1
	note G_, 3
	rest 1
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 1
	rest 1
	note F#, 13
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	duty_cycle 2
	notetype1 10
	notetype2 6
	note D_, 2
	dec_octave
	;frequency_offset 0
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 2
	sound_call Branch_f59b4
	octave 3
	notetype0 1
	notetype1 7
	note F_, 4
	note F#, 3
	;tie
	notetype0 7
	note F#, 1
	rest 1
	note D_, 5
	rest 1
	dec_octave
	note F#, 1
	notetype0 1
	note A_, 4
	rest 3
	inc_octave
	note D_, 4
	rest 3
	note F#, 4
	rest 3
	notetype0 7
	rest 3
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
.Loop5
	note D_, 1
	rest 2
	sound_loop 3, .Loop5
	sound_call Branch_f59b4
	notetype1 8
	octave 3
	note D_, 16
	;tie
	note D_, 6
	rest 2
	notetype0 1
	note G#, 4
	note A_, 3
	;tie
	notetype0 7
	note A_, 2
	note A_, 1
	rest 2
	note A_, 1
	rest 1
	note D_, 2
	rest 1
	note D_, 13
	note C#, 6
	rest 2
	dec_octave
	notetype1 8
	notetype0 1
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 4
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 4
	dec_octave
	dec_octave
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 4
	dec_octave
	notetype0 7
	sound_call Branch_f598c
	note D_, 8
	;tie
	note D_, 8
	note C#, 6
	dec_octave
	duty_cycle 1
	notetype1 7
	notetype0 1
	note G_, 4
	note G#, 3
	notetype0 7
	note A_, 1
	rest 1
	note A_, 1
	note B_, 2
	inc_octave
	note C#, 2
	note E_, 2
	duty_cycle 2
	sound_call Branch_f598c
	note D_, 4
	note E_, 2
	note D_, 2
	rest 2
	note C#, 2
	rest 2
	note E_, 6
	note D_, 2
	note C#, 2
	rest 2
	dec_octave
	note A_, 2
	rest 2
	note G_, 8
	;tie
	note G_, 8
	note F#, 8
	;tie
	note F#, 8
	rest 2
	note G_, 12
	rest 2
	note G_, 14
	rest 4
	sound_loop 0, .MainLoop

Branch_f594d:
	octave 3
	notetype0 1
	note C#, 4
	note D_, 3
	;tie
	notetype0 7
	note D_, 9
	dec_octave
	duty_cycle 1
	notetype1 9
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 7
	note A_, 3
	rest 1
	inc_octave
	note C_, 6
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 7
	notetype0 1
	note D#, 4
	note E_, 3
	;tie
	notetype0 7
	note E_, 2
	note D_, 1
	dec_octave
	notetype1 10
	notetype2 6
	note G_, 2
	inc_octave
	notetype1 7
	notetype2 8
	note C_, 1
	rest 1
	sound_ret

Branch_f598c:
	notetype1 8
	note D_, 10
	rest 2
	note E_, 1
	rest 1
	note F#, 1
	rest 1
	note G_, 2
	rest 2
	inc_octave
	note D_, 8
	note C#, 1
	rest 1
	dec_octave
	note B_, 1
	rest 1
	note A_, 2
	rest 1
	note F#, 9
	note D_, 1
	rest 1
	note G_, 9
	rest 1
	note F#, 4
	note E_, 4
	note D_, 10
	note E_, 1
	rest 1
	note F#, 1
	rest 1
	dec_octave
	note B_, 10
	inc_octave
	note C#, 2
	note D_, 2
	rest 2
	note D_, 2
	;tie
	sound_ret

Branch_f59b4:
	octave 2
	notetype1 8
	notetype0 1
	note G#, 4
	note A_, 3
	;tie
	notetype0 7
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G#, 1
	rest 1
	note G_, 1
	rest 2
	note C_, 1
	rest 2
	note C_, 1
	rest 2
	duty_cycle 2
	notetype1 7
	note E_, 1
	notetype0 1
	note G_, 4
	rest 3
	inc_octave
	note C_, 4
	rest 3
	note E_, 4
	rest 3
	notetype0 7
	rest 3
	notetype2 8
	dec_octave
	duty_cycle 1
	notetype1 8
.Loop6
	note C_, 1
	rest 2
	sound_loop 3, .Loop6
	inc_octave
	duty_cycle 2
	notetype1 7
	notetype0 1
	note F#, 4
	note G_, 3
	;tie
	notetype0 7
	note G_, 2
	note F#, 1
	rest 1
	note E_, 1
	rest 1
	sound_ret

Branch_f59f9:
	octave 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note D_, 1
	rest 3
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	dec_octave
	duty_cycle 1
	notetype1 9
	notetype2 8
	note B_, 1
	rest 2
	sound_ret

Branch_f5a17:
	octave 2
	duty_cycle 1
	notetype1 9
	notetype2 8
	note F#, 1
	rest 3
	note C#, 1
	rest 1
	duty_cycle 2
	notetype1 10
	notetype2 6
	note A_, 1
	duty_cycle 1
	notetype1 9
	notetype2 8
	note E_, 1
	rest 2
	sound_ret


Music_DuelTheme1_Ch3: ; f5a32 (3d:5a32)
	notetype0 7
	;stereo_panning 1, 1
	notetype1 1
	notetype2 14
	;echo 96
	;cutoff 8
	octave 2
.MainLoop
.Loop1
	rept 3
	note D_, 1
	rest 2
	endr
	rest 1
	sound_call Branch_f5c47
	sound_loop 4, .Loop1
.Loop2
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	inc_octave
	;cutoff 3
	note D_, 2
	dec_octave
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	sound_call Branch_f5c47
	sound_loop 4, .Loop2
	sound_call Branch_f5b8d
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note F#, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	sound_call Branch_f5c47
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	inc_octave
	;cutoff 3
	note D_, 2
	dec_octave
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	sound_call Branch_f5c47
	sound_call Branch_f5b8d
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	sound_call Branch_f5c47
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 2
	note D_, 2
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	sound_call Branch_f5c7e
	octave 3
	note C_, 3
	dec_octave
	note G_, 1
	rest 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
.Loop3
	note D_, 1
	rest 2
	sound_loop 3, .Loop3
	inc_octave
	note D_, 1
	notetype0 1
	note F#, 4
	rest 3
	note A_, 4
	rest 3
	inc_octave
	note D_, 4
	rest 3
	notetype0 7
	rest 3
	dec_octave
	dec_octave
.Loop4
	note D_, 1
	rest 2
	sound_loop 3, .Loop4
	note D_, 2
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	sound_call Branch_f5c7e
	octave 2
	note C_, 3
	note D_, 1
	rest 1
	note D#, 1
	rest 1
	sound_call Branch_f5c60
	octave 2
	;cutoff 8
	note E_, 1
	rest 1
	note E_, 2
	;cutoff 6
	note B_, 2
	sound_call Branch_f5c60
	octave 2
	;cutoff 8
	note F#, 2
	note G_, 2
	;cutoff 6
	note G#, 2
	sound_call Branch_f5c6f
	octave 2
	;cutoff 8
	note A_, 1
	rest 1
	note A_, 2
	;cutoff 6
	note E_, 2
	sound_call Branch_f5c6f
	octave 2
	;cutoff 8
	note B_, 2
	inc_octave
	note C_, 2
	note C#, 2
	dec_octave
.Loop5
	sound_call Branch_f5c4d
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 2
	rest 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	;cutoff 7
	note E_, 1
	;cutoff 8
	note E_, 1
	rest 1
	note E_, 2
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 2
	rest 1
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	;cutoff 7
	note F#, 1
	;cutoff 8
	note F#, 1
	rest 1
	note F#, 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 2
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	;cutoff 7
	note G_, 1
	;cutoff 8
	note F#, 1
	rest 1
	note E_, 2
	sound_call Branch_f5c4d
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note B_, 2
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	;cutoff 7
	note B_, 1
	;cutoff 8
	note F#, 1
	rest 1
	note F_, 2
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 2
	rest 1
	note E_, 1
	rest 1
	note E_, 1
	note F#, 2
	note G_, 2
	note G#, 2
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 2
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	note A_, 2
	note E_, 2
	note C#, 2
	sound_loop 2, .Loop5
.Loop6
	sound_call Branch_f5c4d
	sound_loop 2, .Loop6
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 2
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	;cutoff 7
	note D_, 1
	;cutoff 8
	note D_, 1
	rest 1
	note A_, 14
	rest 4
	sound_loop 0, .MainLoop

Branch_f5b8d:
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	;
	;sound_call Branch_f5c47
	note A_, 1
	rest 1
	note A_, 1
	note B_, 1
	rest 2
	;
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note G_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	;
	;sound_call Branch_f5c47
	note A_, 1
	rest 1
	note A_, 1
	note B_, 1
	rest 2
	;
.Loop7
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	;
	;sound_call Branch_f5c47
	note A_, 1
	rest 1
	note A_, 1
	note B_, 1
	rest 2
	;
	sound_loop 3, .Loop7
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note G_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	;
	;sound_call Branch_f5c47
	note A_, 1
	rest 1
	note A_, 1
	note B_, 1
	rest 2
	;
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	;
	;sound_call Branch_f5c47
	note A_, 1
	rest 1
	note A_, 1
	note B_, 1
	rest 2
	;
	note D_, 1
	rest 2
	note D_, 1
	inc_octave
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note D_, 1
	rest 3
	note D_, 1
	rest 1
	note E_, 2
	note F#, 1
	rest 1
.Loop8
	note G_, 1
	rest 2
	note G_, 1
	inc_octave
	;cutoff 3
	note B_, 2
	dec_octave
	;cutoff 8
	note G_, 1
	rest 3
	note D_, 1
	rest 1
	note D_, 1
	note E_, 1
	rest 2
	sound_loop 2, .Loop8
	note F#, 1
	rest 2
	note F#, 1
	inc_octave
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note F#, 1
	rest 3
	note C#, 1
	rest 1
	note C#, 1
	note E_, 1
	rest 2
	note F#, 1
	rest 2
	note F#, 1
	inc_octave
	inc_octave
	;cutoff 3
	note C#, 2
	dec_octave
	dec_octave
	;cutoff 8
	note F#, 1
	rest 3
	note C#, 1
	rest 1
	note C#, 1
	note E_, 1
	rest 2
	note E_, 1
	rest 2
	note E_, 1
	inc_octave
	;cutoff 3
	note B_, 2
	dec_octave
	;cutoff 8
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	note F#, 1
	note G_, 1
	rest 2
	note A_, 1
	rest 2
	note A_, 1
	inc_octave
	;cutoff 3
	note B_, 2
	dec_octave
	;cutoff 8
	note A_, 1
	rest 3
	note E_, 1
	rest 1
	note F#, 1
	note A_, 1
	rest 2
	sound_ret

Branch_f5c47:
	note A_, 1
	rest 1
	note A_, 1
	note B_, 1
	rest 2
	sound_ret

Branch_f5c4d:
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 2
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	;cutoff 7
	note D_, 1
	;cutoff 8
	note D_, 1
	rest 1
	note D_, 2
	sound_ret

Branch_f5c60:
	octave 2
	;cutoff 8
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 2
	rest 1
	note E_, 1
	rest 1
	;cutoff 6
	note E_, 1
	sound_ret

Branch_f5c6f:
	octave 2
	;cutoff 8
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 2
	rest 1
	note A_, 1
	rest 1
	;cutoff 6
	note A_, 1
	sound_ret

Branch_f5c7e:
	octave 2
.Loop9
	note C_, 1
	rest 2
	sound_loop 3, .Loop9
	inc_octave
	note C_, 1
	notetype0 1
	note E_, 4
	rest 3
	note G_, 4
	rest 3
	inc_octave
	note C_, 4
	rest 3
	notetype0 7
	rest 3
	dec_octave
	dec_octave
.Loop10
	note C_, 1
	rest 2
	sound_loop 3, .Loop10
	sound_ret


Music_DuelTheme1_Ch4: ; f5c9a (3d:5c9a)
	toggle_noise 6
	drum_speed 7
	octave 1
.MainLoop
.Loop1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 3, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 5, 1
	rest 1
	drum_note 4, 1
	sound_loop 3, .Loop1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 3, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_speed 7
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 2
.Loop2
	sound_call Branch_f5d39
	sound_loop 3, .Loop2
	sound_call Branch_f5d46
.Loop3
	sound_call Branch_f5d39
	sound_loop 15, .Loop3
	sound_call Branch_f5d46
.Loop4
	sound_call Branch_f5d39
	sound_loop 15, .Loop4
	drum_note 1, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 2
	drum_note 5, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_speed 7
.Loop5
	drum_note 2, 1
	sound_loop 4, .Loop5
.Loop6
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 2
	drum_note 2, 2
	drum_note 5, 2
	sound_loop 5, .Loop6
	drum_note 1, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_speed 7
.Loop7
	drum_note 2, 1
	sound_loop 4, .Loop7
.Loop8
	sound_call Branch_f5d39
	sound_loop 3, .Loop8
	sound_call Branch_f5d58
.Loop9
	sound_call Branch_f5d39
	sound_loop 7, .Loop9
	sound_call Branch_f5d46
.Loop10
	sound_call Branch_f5d39
	sound_loop 7, .Loop10
	sound_call Branch_f5d58
.Loop11
	sound_call Branch_f5d39
	sound_loop 2, .Loop11
	drum_note 1, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 2
	drum_note 5, 2
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 2
	drum_note 6, 14
	drum_note 2, 4
	sound_loop 0, .MainLoop

Branch_f5d39:
	drum_note 1, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 2
	drum_note 5, 2
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 5, 1
	rest 1
	drum_note 4, 1
	sound_ret

Branch_f5d46:
	drum_note 1, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 2
	drum_note 5, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_speed 7
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 2
	sound_ret

Branch_f5d58:
	drum_note 1, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 2
	drum_note 5, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_speed 7
.Loop12
	drum_note 2, 1
	sound_loop 8, .Loop12
	sound_ret
; 0xf5d68
