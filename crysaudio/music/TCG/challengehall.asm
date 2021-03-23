Music_ChallengeHall:
	channel_count 4
	channel 1, Music_ChallengeHall_Ch1
	channel 2, Music_ChallengeHall_Ch2
	channel 3, Music_ChallengeHall_Ch3
	channel 4, Music_ChallengeHall_Ch4

Music_ChallengeHall_Ch1: ; f9646 (3e:5646)
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 15, 3, 3
	notetype2 7
	octave 3
	duty_cycle 2
	notetype1 8
	notetype2 8
	notetype0 1
	note A_, 7
	note G#, 4
	notetype1 1
	note G#, 4
	notetype1 8
	note A_, 4
	notetype1 1
	note A_, 3
	notetype1 8
	note B_, 4
	notetype1 1
	note B_, 4
	inc_octave
	notetype1 8
	note C#, 7
	note C_, 4
	notetype1 1
	note C_, 4
	notetype1 8
	note C#, 4
	notetype1 1
	note C#, 3
	notetype1 8
	note D_, 4
	notetype1 1
	note D_, 4
	notetype1 8
	note E_, 7
	note D#, 4
	notetype1 1
	note D#, 4
	notetype1 8
	note E_, 4
	notetype1 1
	note E_, 3
	notetype1 8
	note F#, 4
	notetype1 1
	note F#, 4
	notetype1 8
	note G#, 4
	notetype1 1
	note G#, 3
	notetype1 8
	note A_, 8
	note B_, 7
	inc_octave
	note C#, 4
	note D_, 4
.MainLoop
	notetype1 7
	notetype0 1
	octave 5
.Loop1
	note E_, 4
	note F#, 3
	note E_, 4
	note F#, 4
	sound_loop 8, .Loop1
	duty_cycle 1
	notetype1 8
	dec_octave
	dec_octave
	dec_octave
	note B_, 7
	notetype1 2
	note B_, 8
	dec_octave
	notetype1 8
	note B_, 7
	note B_, 8
	note B_, 7
	notetype1 2
	note B_, 8
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	notetype1 8
	note B_, 15
	inc_octave
	note D_, 15
	note E_, 15
	inc_octave
	duty_cycle 0
	notetype1 10
	sound_call Branch_f9848
	notetype1 10
	note D_, 8
	notetype0 10
	note C#, 6
	;tie
	note C#, 6
	notetype1 3
	notetype0 1
	note C#, 15
	duty_cycle 1
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	rest 15
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	rest 15
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	rest 15
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	duty_cycle 0
	notetype1 10
	sound_call Branch_f9848
	notetype1 10
	note C#, 8
	dec_octave
	notetype0 10
	note A_, 6
	;tie
	note A_, 6
	notetype1 3
	notetype0 1
	note A_, 15
	duty_cycle 1
	notetype1 8
	inc_octave
	note C#, 7
	notetype1 2
	note C#, 8
	rest 15
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	rest 15
	notetype1 8
	note C#, 15
	note D_, 15
	note E_, 15
	notetype1 2
	note E_, 15
	duty_cycle 0
	notetype1 10
	note F#, 7
	note F_, 7
	notetype1 3
	note F_, 1
	notetype1 10
	note F#, 7
	note F_, 8
	note F#, 7
	note G#, 7
	notetype1 3
	note G#, 1
	notetype1 10
	notetype0 10
	note A_, 3
	;tie
	notetype0 1
	note A_, 15
	dec_octave
	duty_cycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	duty_cycle 0
	notetype1 10
	rest 15
	inc_octave
	note E_, 7
	note D#, 7
	notetype1 3
	note D#, 1
	notetype1 10
	note E_, 7
	note D#, 8
	note E_, 7
	note G#, 7
	notetype1 3
	note G#, 1
	notetype1 10
	notetype0 9
	note A_, 5
	notetype0 1
	dec_octave
	duty_cycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	duty_cycle 0
	notetype1 10
	rest 15
	inc_octave
	note D_, 7
	note C#, 8
	note D_, 7
	notetype1 3
	note D_, 8
	notetype1 10
	note A_, 7
	notetype1 3
	note A_, 8
	notetype1 10
	note G#, 15
	;tie
	note G#, 7
	notetype1 3
	note G#, 8
	notetype1 10
	note F#, 15
	notetype1 3
	note F#, 7
	notetype1 10
	note G#, 8
	notetype0 10
	note E_, 6
	notetype0 1
	notetype1 3
	note E_, 15
	notetype1 10
	note C#, 15
	note D_, 15
	note E_, 15
	notetype1 3
	note E_, 15
	notetype1 10
	note F#, 7
	note F_, 7
	notetype1 3
	note F_, 1
	notetype1 10
	note F#, 7
	note F_, 8
	note F#, 6
	notetype1 3
	note F#, 1
	notetype1 10
	note G#, 6
	notetype1 3
	note G#, 2
	notetype1 10
	notetype0 10
	note A_, 3
	notetype0 1
	note G#, 15
	dec_octave
	duty_cycle 1
	notetype1 8
	note B_, 7
	inc_octave
	duty_cycle 0
	notetype1 10
	note F#, 6
	notetype1 3
	note F#, 2
	notetype1 10
	note E_, 15
	notetype1 3
	note E_, 15
	notetype1 10
	note B_, 15
	duty_cycle 1
	notetype1 8
	dec_octave
	note B_, 7
	inc_octave
	duty_cycle 0
	notetype1 10
	note G#, 6
	notetype1 3
	note G#, 2
	notetype1 10
	notetype0 10
	note A_, 3
	notetype0 1
	notetype1 3
	note A_, 15
	notetype1 10
	note B_, 6
	notetype1 3
	note B_, 1
	inc_octave
	notetype1 10
	note C#, 6
	notetype1 3
	note C#, 2
	notetype1 10
	notetype0 10
	note D_, 3
	notetype0 1
	notetype1 3
	note D_, 15
	dec_octave
	notetype1 10
	note F#, 6
	notetype1 3
	note F#, 1
	notetype1 10
	note B_, 6
	notetype1 3
	note B_, 2
	notetype1 10
	note A_, 15
	notetype1 3
	note A_, 15
	notetype1 10
	note G#, 11
	notetype1 3
	note G#, 4
	rest 7
	notetype1 10
	note A_, 7
	notetype1 3
	note A_, 1
	notetype1 10
	notetype0 10
	note A_, 6
	duty_cycle 2
	notetype1 7
	notetype0 1
	inc_octave
	note C#, 7
	note C_, 8
	note C#, 7
	note D_, 8
	note E_, 5
	note F#, 5
	note G#, 5
	note A_, 4
	note B_, 4
	inc_octave
	note C#, 4
	note D_, 3
	sound_loop 0, .MainLoop

Branch_f9848:
	note C#, 15
	notetype1 3
	note C#, 15
	notetype1 10
	note E_, 15
	notetype1 3
	note E_, 7
	notetype1 10
	note C#, 8
	note D_, 15
	notetype1 3
	note D_, 15
	notetype1 10
	note F#, 15
	notetype1 3
	note F#, 7
	notetype1 10
	note D_, 8
	note E_, 7
	notetype1 3
	note E_, 8
	notetype1 10
	note A_, 15
	note G#, 7
	notetype1 3
	note G#, 8
	notetype1 10
	note F#, 7
	notetype1 3
	note F#, 8
	notetype1 10
	note E_, 15
	note D_, 7
	notetype1 3
	note D_, 8
	dec_octave
	notetype1 10
	note B_, 15
	notetype1 3
	note B_, 7
	inc_octave
	sound_ret


Music_ChallengeHall_Ch2: ; f9883 (3e:5883)
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 15, 3, 3
	notetype2 7
	octave 3
	notetype0 10
.Loop1
	rest 6
	sound_loop 2, .Loop1
.MainLoop
	duty_cycle 1
	notetype1 9
	notetype2 8
	notetype0 10
	note E_, 6
	;tie
	note E_, 6
	notetype0 1
	note E_, 7
	notetype1 2
	note E_, 8
	dec_octave
	notetype1 8
	note E_, 7
	note E_, 8
	note E_, 7
	notetype1 2
	note E_, 8
	notetype1 8
	note E_, 7
	notetype1 2
	note E_, 8
	notetype1 8
	note E_, 7
	notetype1 2
	note E_, 8
	notetype1 8
	note E_, 15
	note F#, 15
	note G#, 15
	sound_call Branch_f9a28
	note B_, 8
	notetype0 10
	note A_, 6
	;tie
	note A_, 6
	notetype0 1
	rest 15
	duty_cycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	rest 15
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	rest 15
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	rest 15
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	sound_call Branch_f9a28
	note G#, 8
	notetype0 10
	note E_, 6
	;tie
	note E_, 6
	notetype0 1
	rest 15
	duty_cycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	rest 15
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	rest 15
	notetype1 8
	note A_, 15
	note B_, 15
	inc_octave
	note C#, 15
	notetype1 2
	note C#, 15
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	rest 15
	dec_octave
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	rest 15
	inc_octave
	notetype1 8
	note D_, 7
	duty_cycle 2
	notetype1 6
	inc_octave
	note D_, 8
	note A_, 7
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 6
	note D_, 7
	notetype1 2
	note D_, 8
	notetype1 6
.Loop2
	note E_, 4
	note F#, 3
	note E_, 4
	note F#, 4
	sound_loop 4, .Loop2
	notetype1 2
	note F#, 5
	rest 10
	dec_octave
	dec_octave
	duty_cycle 1
	notetype1 8
	note C#, 7
	inc_octave
	duty_cycle 2
	notetype1 6
	note E_, 8
	note A_, 7
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 6
	note C#, 7
	notetype1 2
	note C#, 8
	notetype1 5
.Loop3
	note D_, 4
	note E_, 3
	note D_, 4
	note E_, 4
	sound_loop 4, .Loop3
	dec_octave
	note B_, 15
	inc_octave
	note D_, 7
	notetype1 2
	note D_, 8
	notetype1 5
	note C#, 15
	duty_cycle 1
	notetype1 8
	octave 2
	note B_, 7
	inc_octave
	inc_octave
	;vibrato_type 1
	duty_cycle 2
	notetype1 5
	note B_, 8
	inc_octave
	notetype0 10
	note C#, 6
	notetype1 2
	notetype0 1
	note C#, 15
	;vibrato_type 8
	duty_cycle 0
	notetype1 7
	octave 2
	note E_, 15
	note F#, 15
	note A#, 15
	rest 15
	duty_cycle 1
	notetype1 8
	inc_octave
	note D_, 7
	notetype1 2
	note D_, 8
	rest 15
	dec_octave
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	rest 15
	inc_octave
	notetype1 8
	note D_, 7
	inc_octave
	duty_cycle 2
	notetype1 6
	note D_, 8
	note A_, 7
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 6
	note D_, 7
	notetype1 2
	note D_, 8
	notetype1 6
.Loop4
	note E_, 4
	note F#, 3
	note E_, 4
	note F#, 4
	sound_loop 2, .Loop4
	duty_cycle 0
	notetype1 7
	dec_octave
	dec_octave
	note F_, 15
	rest 7
	note F_, 6
	rest 2
	notetype0 10
	note F#, 3
	notetype0 1
	rest 15
	duty_cycle 1
	notetype1 8
	note C#, 7
	duty_cycle 0
	notetype1 7
	note E_, 6
	rest 2
	notetype0 10
	note F#, 3
	notetype0 1
	rest 15
	dec_octave
	duty_cycle 1
	notetype1 8
	note B_, 7
	inc_octave
	duty_cycle 0
	notetype1 7
	note D_, 6
	rest 2
	note E_, 15
	duty_cycle 1
	notetype1 8
	note E_, 7
	notetype1 2
	note E_, 8
	duty_cycle 0
	notetype1 7
	note D_, 11
	rest 4
	duty_cycle 1
	notetype1 8
	dec_octave
	note B_, 7
	inc_octave
	duty_cycle 0
	notetype1 7
	note D_, 6
	rest 2
	note C#, 15
	duty_cycle 1
	notetype1 8
	notetype2 7
	note C#, 5
	note C#, 5
	note C#, 5
	notetype2 8
	note C#, 7
	notetype1 2
	note C#, 8
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	duty_cycle 0
	notetype1 10
	note A_, 7
	notetype1 3
	note A_, 8
	rest 15
	notetype0 10
	rest 3
	sound_loop 0, .MainLoop

Branch_f9a28:
	duty_cycle 0
	notetype1 7
	note A_, 15
	duty_cycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	duty_cycle 0
	notetype1 7
	inc_octave
	note C#, 15
	dec_octave
	duty_cycle 1
	notetype1 8
	note A_, 7
	duty_cycle 0
	notetype1 7
	note A_, 8
	note B_, 15
	duty_cycle 1
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	duty_cycle 0
	notetype1 7
	inc_octave
	note D_, 15
	dec_octave
	duty_cycle 1
	notetype1 8
	note B_, 7
	duty_cycle 0
	notetype1 7
	note B_, 8
	inc_octave
	note C#, 7
	notetype1 3
	note C#, 8
	duty_cycle 1
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	duty_cycle 0
	notetype1 7
	note E_, 7
	rest 8
	note E_, 7
	rest 8
	notetype1 7
	note D_, 15
	duty_cycle 1
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	dec_octave
	duty_cycle 0
	notetype1 7
	note G#, 15
	inc_octave
	duty_cycle 1
	notetype1 8
	note D_, 7
	dec_octave
	duty_cycle 0
	notetype1 7
	sound_ret


Music_ChallengeHall_Ch3: ; f9a92 (3e:5a92)
	;stereo_panning 1, 1
	notetype1 1
	notetype2 11
	;echo 0
	;cutoff 8
	;cutoff 8
	notetype0 10
.Loop1
	rest 6
	sound_loop 2, .Loop1
.MainLoop
	octave 2
	;cutoff 8
	note E_, 6
	;tie
	note E_, 6
	notetype0 1
	inc_octave
	note E_, 7
	rest 8
	dec_octave
	;cutoff 7
	note E_, 7
	note E_, 8
	;cutoff 8
	note E_, 7
	rest 8
	note E_, 7
	rest 8
	note E_, 7
	rest 8
	note E_, 15
	note F#, 15
	note G#, 15
	sound_call Branch_f9b7d
	sound_call Branch_f9b92
.Loop2
	sound_call Branch_f9b7d
	sound_loop 3, .Loop2
	sound_call Branch_f9b92
	sound_call Branch_f9b7d
	note A_, 15
	inc_octave
	note E_, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	note E_, 7
	rest 8
	dec_octave
	note A_, 7
	rest 8
	note A_, 15
	note B_, 15
	inc_octave
	note C#, 15
	dec_octave
.Loop3
	note D_, 15
	inc_octave
	note A_, 7
	rest 8
	dec_octave
	note A_, 15
	inc_octave
	note F#, 7
	rest 8
	dec_octave
	sound_loop 2, .Loop3
	note C#, 15
	inc_octave
	note A_, 7
	rest 8
	dec_octave
	note A_, 15
	inc_octave
	note A_, 7
	rest 8
	dec_octave
	note C#, 15
	inc_octave
	note A_, 7
	rest 8
	dec_octave
	note A_, 15
	inc_octave
	note E_, 7
	rest 8
	dec_octave
	note B_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note F#, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note G#, 15
	inc_octave
	note G#, 7
	rest 8
	dec_octave
	note A_, 15
	inc_octave
	inc_octave
	note C#, 7
	rest 8
	dec_octave
	dec_octave
	note G_, 15
	inc_octave
	inc_octave
	note C#, 7
	rest 8
	dec_octave
	dec_octave
	note F#, 7
	rest 8
	note F#, 15
	note G#, 15
	note A#, 15
	note B_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note C#, 15
	inc_octave
	note F#, 7
	rest 8
	dec_octave
	note D_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note D#, 15
	inc_octave
	note F#, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	note E_, 7
	rest 8
	dec_octave
	note F_, 15
	inc_octave
	note G#, 7
	rest 8
	dec_octave
	note F#, 15
	inc_octave
	inc_octave
	note C#, 7
	rest 8
	dec_octave
	dec_octave
	note C#, 15
	inc_octave
	note A_, 7
	rest 8
	dec_octave
	note B_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note F#, 15
	inc_octave
	note F#, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note G#, 15
	inc_octave
	note G#, 7
	rest 8
	dec_octave
	note A_, 7
	rest 8
	;cutoff 7
	note A_, 5
	note A_, 5
	note A_, 5
	;cutoff 8
	note A_, 7
	rest 8
	note A_, 7
	rest 8
	note A_, 7
	rest 8
	rest 15
	notetype0 10
	rest 3
	sound_loop 0, .MainLoop

Branch_f9b7d:
	note A_, 15
	inc_octave
	note E_, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	note E_, 7
	rest 8
	dec_octave
	note A_, 15
	inc_octave
	note F#, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	note F#, 7
	rest 8
	dec_octave
	sound_ret

Branch_f9b92:
	note A_, 15
	inc_octave
	note A_, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	inc_octave
	note C#, 7
	rest 8
	dec_octave
	dec_octave
	note A_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	note E_, 15
	inc_octave
	note B_, 7
	rest 8
	dec_octave
	sound_ret


Music_ChallengeHall_Ch4: ; f9ba9 (3e:5ba9)
	toggle_noise 6
	drum_speed 1
	drum_speed 10
.Loop1
	rest 6
	sound_loop 2, .Loop1
.MainLoop
	drum_speed 1
	drum_note 2, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 4
.Loop2
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 4
	sound_loop 7, .Loop2
	drum_note 2, 15
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 15
	drum_note 2, 15
	drum_note 2, 15
	drum_note 2, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 4
	drum_note 2, 15
	drum_note 2, 15
.Loop3
	drum_note 1, 15
	drum_note 2, 15
	drum_note 1, 15
	drum_note 2, 15
	drum_note 1, 15
	drum_note 2, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 4
	drum_note 1, 15
	drum_note 2, 15
	sound_loop 15, .Loop3
	drum_note 1, 15
	drum_note 2, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 4
	drum_note 2, 15
	drum_note 2, 15
	drum_speed 10
	drum_note 2, 3
	rest 3
	sound_loop 0, .MainLoop
; 0xf9be5
