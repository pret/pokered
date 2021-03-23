Music_Ronald:
	channel_count 4
	channel 1, Music_Ronald_Ch1
	channel 2, Music_Ronald_Ch2
	channel 3, Music_Ronald_Ch3
	channel 4, Music_Ronald_Ch4

Music_Ronald_Ch1: ; fa7a0 (3e:67a0)
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 12, 3, 3
	notetype2 8
	duty_cycle 0
.MainLoop
	octave 3
	notetype0 13
.Loop1
	notetype1 9
	notetype2 3
	note D_, 1
	note D_, 1
	notetype2 4
	note F_, 1
	rest 2
	note D_, 1
	rest 1
	note C_, 1
	rest 1
	note D_, 1
	rest 1
	note F_, 1
	rest 1
	notetype1 9
	notetype2 8
	note E_, 2
	rest 1
	dec_octave
	notetype1 9
	notetype2 3
	note G_, 1
	inc_octave
	note D_, 1
	notetype2 4
	note F_, 1
	rest 2
	note F_, 1
	rest 1
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	notetype2 8
	notetype1 9
	note G_, 2
	rest 1
	sound_loop 2, .Loop1
.Loop2
	vibrato 20, 3, 3
	sound_call Branch_fa9aa
	notetype0 1
	octave 4
	note C#, 3
	note D_, 10
	;tie
	notetype0 13
	note D_, 2
	vibrato 12, 3, 3
	sound_call Branch_fa9ec
	sound_loop 2, .Loop2
.Loop3
	vibrato 20, 3, 3
	sound_call Branch_fa9cb
	notetype0 1
	octave 4
	note C#, 3
	note D_, 10
	;tie
	notetype0 13
	note D_, 2
	vibrato 12, 3, 3
	sound_call Branch_fa9ec
	sound_loop 2, .Loop3
	sound_call Branch_fa9aa
	vibrato 20, 3, 3
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	rest 7
	duty_cycle 2
	notetype1 9
	rest 6
	dec_octave
	notetype2 4
	note G_, 7
	inc_octave
	note F_, 6
	dec_octave
	note G_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G_, 7
	inc_octave
	note D_, 6
	dec_octave
	note G_, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	notetype2 4
	note A#, 6
	inc_octave
	note C_, 7
	dec_octave
	note A#, 6
	note G_, 7
	note F_, 6
	note F#, 7
	notetype2 8
	note G_, 6
	notetype2 4
	note C#, 7
	note C_, 6
	dec_octave
	note A#, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 6
	inc_octave
	notetype2 4
	note C_, 7
	dec_octave
	note A#, 6
	note G_, 7
	note F_, 6
	note F#, 7
	note G_, 6
	notetype2 8
	note A#, 7
	inc_octave
	note C_, 6
	note D_, 7
	notetype0 13
	sound_call Branch_fa9aa
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	rest 7
	duty_cycle 2
	notetype1 9
	rest 6
	dec_octave
	notetype2 4
	note G_, 7
	inc_octave
	note F_, 6
	dec_octave
	note G_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G_, 7
	inc_octave
	note D_, 6
	dec_octave
	note G_, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	notetype2 4
	note A#, 6
	inc_octave
	note C_, 7
	dec_octave
	note A#, 6
	note G_, 7
	note F_, 6
	note F#, 7
	note G_, 6
	notetype2 8
	note A#, 7
	inc_octave
	notetype2 4
	note C_, 6
	dec_octave
	note A#, 7
	inc_octave
	notetype2 8
	note C#, 4
	note C_, 4
	dec_octave
	note A#, 5
	notetype2 4
	note G_, 6
	note F_, 7
	note G_, 6
	note C#, 7
	note C_, 6
	dec_octave
	note A#, 7
	inc_octave
	notetype2 8
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	notetype2 4
	note A#, 6
	note G_, 7
	notetype2 8
	sound_call Branch_fa9cb
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	rest 7
	duty_cycle 2
	notetype1 9
	rest 13
	notetype2 4
	note F_, 6
	rest 7
	notetype2 8
	note E_, 4
	note F_, 4
	note E_, 5
	notetype2 4
	note D_, 6
	rest 7
	notetype2 8
	note E_, 6
	notetype2 4
	note C_, 7
	dec_octave
	note G_, 6
	inc_octave
	note C_, 7
	note C#, 6
	note D_, 7
	dec_octave
	notetype2 8
	note A#, 6
	notetype2 4
	note G_, 7
	rest 6
	note F_, 7
	notetype2 8
	note F#, 6
	notetype2 4
	note G_, 7
	notetype2 8
	note A#, 6
	notetype2 4
	note G_, 7
	note A#, 6
	inc_octave
	note C_, 7
	notetype2 8
	note C#, 6
	notetype2 4
	note D_, 7
	note F_, 6
	note D_, 7
	notetype2 8
	note F_, 6
	dec_octave
	notetype2 4
	note G_, 7
	dec_octave
	note G_, 6
	inc_octave
	note D_, 7
	duty_cycle 1
	notetype1 10
	notetype2 8
	sound_call Branch_fa9cb
	notetype0 1
	octave 4
	note C#, 3
	note D_, 3
	rest 7
	rest 13
	dec_octave
	note G_, 3
	note G#, 10
	note G_, 3
	rest 10
	notetype0 13
	note F_, 4
	vibrato 12, 3, 3
	notetype0 1
	notetype1 9
	note C_, 6
	rest 7
	rest 13
	note F_, 6
	rest 7
	rest 13
	note A_, 6
	rest 7
	rest 13
	notetype0 13
	notetype1 9
	note G_, 2
	rest 1
	vibrato 20, 3, 3
	notetype0 1
	notetype1 10
	note F#, 3
	note G_, 10
	note A#, 3
	rest 10
	note G_, 3
	rest 10
	inc_octave
	note D_, 13
	rest 13
	dec_octave
	note A#, 6
	rest 7
	rest 13
	note A#, 3
	inc_octave
	note C_, 10
	rest 13
	dec_octave
	note A#, 3
	rest 10
	inc_octave
	note C_, 13
	dec_octave
	note A#, 3
	rest 10
	inc_octave
	note C#, 4
	note C_, 4
	dec_octave
	note A#, 5
	note G_, 3
	rest 10
	note B_, 3
	inc_octave
	note C_, 10
	dec_octave
	note A#, 3
	rest 10
	rest 13
	inc_octave
	note G_, 3
	rest 10
	note C_, 4
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 3
	rest 10
	inc_octave
	note C_, 13
	dec_octave
	note A#, 3
	rest 10
	note G_, 3
	rest 10
	inc_octave
	note E_, 3
	note F_, 10
	rest 13
	note D#, 13
	rest 13
	note D_, 6
	rest 7
	rest 13
	note C_, 6
	rest 7
	rest 13
	note C#, 3
	rest 10
	note C#, 3
	note D_, 10
	dec_octave
	note A#, 3
	rest 10
	note G_, 3
	rest 10
	notetype0 13
	note A#, 3
	rest 4
	notetype0 1
	note B_, 3
	inc_octave
	note C_, 16
	rest 7
	note E_, 3
	note F_, 10
	rest 6
	note D_, 7
	rest 13
	note C_, 6
	rest 7
	note C#, 3
	note D_, 10
	;tie
	notetype0 13
	note D_, 5
	rest 1
	dec_octave
	note D_, 8
	rest 1
	duty_cycle 0
	vibrato 12, 3, 3
	sound_loop 0, .MainLoop

Branch_fa9aa:
	octave 4
	duty_cycle 1
	notetype1 10
	rest 2
	notetype0 1
	note G#, 3
	note A_, 3
	rest 7
	rest 13
	note F_, 13
	note D_, 3
	rest 10
	rest 13
	note E_, 6
	rest 7
	notetype0 13
	rest 1
	note F_, 1
	notetype0 1
	note G_, 3
	rest 10
	note E_, 6
	rest 7
	rest 13
	note C_, 6
	rest 7
	rest 13
	sound_ret

Branch_fa9cb:
	octave 4
	duty_cycle 1
	notetype1 10
	notetype0 1
	note D#, 3
	note E_, 10
	note F_, 3
	rest 10
	note G_, 3
	rest 10
	note E_, 6
	rest 7
	rest 13
	note C_, 6
	rest 7
	rest 13
	note D_, 6
	rest 7
	rest 13
	note D#, 3
	note E_, 10
	note F_, 3
	rest 10
	note G_, 3
	rest 10
	note E_, 13
	note C_, 6
	rest 7
	rest 13
	sound_ret

Branch_fa9ec:
	octave 3
	duty_cycle 0
	notetype1 9
	notetype0 1
	note F_, 6
	rest 7
	notetype0 13
	rest 2
	notetype0 1
	note F_, 6
	rest 7
	notetype0 13
	rest 3
	notetype0 1
	note F_, 6
	rest 7
	rest 13
	note A_, 6
	rest 7
	rest 13
	notetype0 13
	notetype1 9
	note G_, 2
	rest 1
	sound_ret


Music_Ronald_Ch2: ; faa0e (3e:6a0e)
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 12, 3, 3
	notetype2 8
	duty_cycle 0
.MainLoop
	octave 2
.Loop1
	notetype0 1
	notetype1 9
	note G_, 3
	rest 3
	note G_, 3
	rest 4
	note A#, 3
	rest 10
	inc_octave
	note D_, 6
	dec_octave
	note G_, 3
	rest 4
	note A#, 3
	rest 3
	rest 13
	note G_, 3
	note D_, 4
	note A#, 6
	rest 7
	note D_, 3
	rest 3
	note G_, 3
	rest 4
	note G_, 6
	rest 7
	rest 13
	note A#, 6
	rest 13
	note G_, 3
	note A#, 4
	inc_octave
	note D_, 6
	rest 7
	rest 13
	notetype0 13
	notetype1 9
	note C_, 2
	rest 1
	dec_octave
	notetype0 1
	notetype1 9
	note D_, 3
	rest 3
	note G_, 3
	rest 4
	note A#, 3
	rest 10
	inc_octave
	note D_, 6
	dec_octave
	note G_, 3
	rest 4
	note A#, 3
	rest 3
	rest 13
	note G_, 3
	note A#, 4
	inc_octave
	note D_, 6
	rest 7
	dec_octave
	note D_, 3
	rest 3
	note G_, 3
	rest 4
	note G_, 6
	rest 7
	rest 13
	inc_octave
	note D_, 6
	rest 13
	dec_octave
	note A#, 3
	inc_octave
	note D_, 4
	note F_, 6
	rest 7
	rest 13
	notetype0 13
	notetype1 9
	note E_, 2
	rest 1
	dec_octave
	sound_loop 2, .Loop1
.Loop2
	sound_call Branch_fab76
	notetype2 8
	notetype1 8
	note C_, 2
	rest 1
	sound_call Branch_fab76
	notetype2 8
	notetype1 8
	note E_, 2
	rest 1
	sound_loop 4, .Loop2
.Loop3
	vibrato 20, 3, 3
	notetype1 8
	notetype0 13
	duty_cycle 1
	octave 4
	rest 2
	notetype2 4
	note F_, 1
	rest 1
	notetype2 8
	note D_, 1
	dec_octave
	dec_octave
	notetype2 4
	duty_cycle 0
	notetype1 9
	note A#, 1
	rest 1
	inc_octave
	inc_octave
	duty_cycle 1
	notetype1 8
	note C_, 1
	rest 1
	notetype2 8
	note D_, 1
	notetype2 3
	note E_, 1
	notetype2 4
	note C_, 1
	rest 1
	dec_octave
	note A_, 1
	rest 1
	note A#, 1
	rest 2
	vibrato 12, 3, 3
	duty_cycle 0
	notetype1 9
	note F_, 1
	rest 2
	note F_, 1
	rest 1
	dec_octave
	note G_, 1
	rest 1
	inc_octave
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	notetype2 8
	notetype1 9
	note G_, 2
	rest 1
	sound_loop 2, .Loop3
	vibrato 20, 3, 3
	sound_call Branch_fab8a
	octave 3
	rest 2
	vibrato 12, 3, 3
	duty_cycle 0
	notetype1 9
	notetype2 4
	note F_, 1
	rest 2
	note F_, 1
	rest 1
	dec_octave
	note G_, 1
	rest 1
	inc_octave
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	notetype2 8
	notetype1 9
	note G_, 2
	rest 1
	vibrato 20, 3, 3
	sound_call Branch_fab8a
	octave 3
	rest 1
	notetype0 1
	notetype2 8
	note E_, 3
	note F_, 10
	note E_, 3
	rest 10
	notetype0 13
	note D_, 4
	dec_octave
	vibrato 12, 3, 3
	duty_cycle 0
	notetype1 9
	notetype2 4
	note G_, 1
	rest 1
	inc_octave
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	notetype2 8
	notetype1 9
	note E_, 2
	rest 1
	sound_call Branch_fabb1
	rest 1
	notetype2 4
	octave 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	inc_octave
	notetype2 8
	notetype1 9
	note C_, 2
	rest 1
	notetype1 9
	rest 2
	notetype2 4
	note F_, 1
	rest 2
	note F_, 1
	rest 1
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 1
	rest 1
	notetype2 8
	notetype1 9
	note F_, 2
	rest 1
	sound_call Branch_fabb1
	rest 1
	octave 2
	notetype2 4
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	inc_octave
	notetype2 8
	notetype1 9
	note C_, 2
	rest 1
	rest 2
	dec_octave
	notetype1 9
	notetype2 4
	note G_, 1
	rest 2
	note G_, 1
	rest 1
	vibrato 20, 3, 3
	notetype2 8
	duty_cycle 1
	notetype1 7
	note F#, 8
	rest 1
	duty_cycle 0
	vibrato 12, 3, 3
	sound_loop 0, .MainLoop

Branch_fab76:
	octave 2
	notetype1 9
	notetype0 13
	rest 2
	notetype2 4
	note A#, 1
	rest 2
	note A#, 1
	rest 1
	note G_, 1
	rest 1
	note A#, 1
	rest 1
	inc_octave
	note D_, 1
	rest 1
	sound_ret

Branch_fab8a:
	octave 4
	duty_cycle 1
	notetype1 8
	notetype0 13
	note C_, 1
	notetype2 3
	note D_, 1
	note E_, 1
	notetype2 4
	note C_, 1
	rest 1
	dec_octave
	note A_, 1
	rest 1
	note A#, 1
	rest 1
	inc_octave
	notetype2 8
	note C_, 1
	notetype2 3
	note D_, 1
	note E_, 1
	notetype2 8
	note C_, 1
	dec_octave
	notetype2 4
	note A_, 1
	rest 1
	note A#, 1
	sound_ret

Branch_fabb1:
	octave 2
	notetype1 9
	notetype0 13
	rest 2
	notetype2 4
	note A#, 1
	rest 2
	note A#, 1
	rest 1
	inc_octave
	note C_, 1
	sound_ret


Music_Ronald_Ch3: ; fabc0 (3e:6bc0)
	notetype0 1
	;stereo_panning 1, 1
	notetype1 1
	notetype2 11
	;echo 0
	;cutoff 8
.MainLoop
	octave 2
.Loop1
	note G_, 13
	note G_, 2
	rest 4
	note G_, 5
	rest 2
	inc_octave
	note A#, 6
	dec_octave
	note F_, 2
	rest 5
	note F_, 6
	note F#, 3
	rest 4
	note G_, 2
	rest 4
	note G_, 3
	rest 10
	note F_, 7
	note G_, 6
	rest 7
	inc_octave
	note C_, 13
	rest 6
	inc_octave
	note C_, 2
	rest 11
	dec_octave
	note C_, 2
	rest 5
	dec_octave
	note E_, 13
	rest 6
	note F_, 7
	rest 6
	note F_, 7
	note F#, 13
	note G_, 13
	inc_octave
	note C_, 6
	rest 7
	dec_octave
	sound_loop 4, .Loop1
.Loop2
	sound_call Branch_fac94
	octave 3
	note A#, 6
	sound_call Branch_facbb
	sound_call Branch_fac94
	octave 4
	note F_, 6
	sound_call Branch_facbb
	sound_loop 8, .Loop2
	sound_call Branch_facc5
	octave 2
	note D_, 13
	rest 6
	inc_octave
	note D_, 2
	rest 5
	inc_octave
	note D_, 6
	octave 2
	note D_, 2
	rest 5
	note D_, 13
	octave 4
	note D_, 6
	octave 2
	note A_, 7
	rest 6
	inc_octave
	note C_, 7
	note C_, 13
	note C#, 13
	note D_, 6
	rest 7
	dec_octave
	note C_, 13
	note C_, 2
	rest 4
	note C_, 5
	rest 2
	octave 4
	note D_, 6
	octave 2
	note G_, 2
	rest 5
	note G_, 6
	inc_octave
	note C_, 3
	rest 4
	dec_octave
	note C_, 2
	rest 4
	note C_, 3
	rest 4
	octave 4
	note D_, 6
	octave 2
	note G_, 7
	note C_, 6
	rest 7
	note D_, 13
	rest 6
	inc_octave
	note D_, 2
	rest 5
	inc_octave
	note D_, 6
	octave 2
	note D_, 2
	rest 5
	note D_, 13
	octave 4
	note F_, 6
	octave 2
	note A_, 7
	rest 6
	inc_octave
	note D_, 7
	note D_, 13
	dec_octave
	note A_, 13
	note D_, 6
	rest 7
	sound_call Branch_facc5
	octave 2
	note G#, 13
	rest 6
	inc_octave
	note G#, 2
	rest 5
	inc_octave
	note D_, 6
	octave 2
	note G#, 2
	rest 5
	note G#, 13
	octave 4
	note D_, 6
	dec_octave
	note D#, 7
	rest 6
	note G#, 7
	note G#, 13
	dec_octave
	note G#, 13
	inc_octave
	note D#, 6
	rest 7
	dec_octave
	note A_, 13
	note A_, 2
	rest 4
	note A_, 5
	rest 2
	octave 4
	note D_, 6
	dec_octave
	note E_, 2
	rest 5
	note E_, 6
	note E_, 3
	rest 4
	dec_octave
	note A_, 2
	rest 4
	note A_, 3
	rest 4
	octave 4
	note D_, 6
	dec_octave
	note E_, 7
	dec_octave
	note A_, 6
	rest 7
	notetype0 13
	note G#, 8
	rest 1
	notetype0 1
	sound_loop 0, .MainLoop

Branch_fac94:
	octave 2
	note G_, 13
	note G_, 2
	rest 4
	note G_, 5
	rest 2
	octave 4
	note D_, 6
	dec_octave
	note D_, 2
	rest 5
	note D_, 6
	note G_, 3
	rest 4
	dec_octave
	note G_, 2
	rest 4
	note G_, 3
	rest 4
	octave 4
	note D_, 6
	octave 2
	note F_, 7
	note G_, 6
	rest 7
	inc_octave
	note C_, 13
	rest 6
	inc_octave
	note C_, 2
	rest 5
	note D_, 6
	dec_octave
	note C_, 2
	rest 5
	dec_octave
	note E_, 13
	inc_octave
	sound_ret

Branch_facbb:
	octave 2
	note F_, 7
	rest 6
	note F_, 7
	note F#, 13
	note G_, 13
	inc_octave
	note C_, 6
	rest 7
	sound_ret

Branch_facc5:
	octave 2
	note D#, 13
	note D#, 2
	rest 4
	note D#, 5
	rest 2
	octave 4
	note D_, 6
	octave 2
	note A#, 2
	rest 5
	note A#, 6
	inc_octave
	note D#, 3
	rest 4
	dec_octave
	note D#, 2
	rest 4
	note D#, 3
	rest 4
	octave 4
	note D_, 6
	octave 2
	note A#, 7
	note D#, 6
	rest 7
	sound_ret


Music_Ronald_Ch4: ; face0 (3e:6ce0)
	toggle_noise 6
	drum_speed 1
	octave 1
.MainLoop
.Loop1
	sound_call Branch_fad46
	drum_note 4, 13
	sound_call Branch_fad4f
	drum_note 3, 7
	drum_note 1, 6
	drum_note 3, 7
	drum_note 5, 6
	drum_note 1, 7
	drum_note 2, 13
	drum_note 4, 6
	drum_note 3, 7
	sound_loop 3, .Loop1
	sound_call Branch_fad46
	drum_note 4, 13
	sound_call Branch_fad4f
	drum_note 3, 7
	drum_note 1, 13
	drum_note 5, 6
	drum_note 3, 3
	drum_note 3, 4
.Loop2
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 2, .Loop2
.Loop3
	rept 7
	sound_call Branch_fad46
	drum_note 4, 13
	sound_call Branch_fad4f
	drum_note 3, 7
	drum_note 1, 6
	drum_note 3, 7
	drum_note 5, 6
	drum_note 1, 7
	drum_note 2, 13
	drum_note 4, 6
	drum_note 3, 7
	endr
	sound_call Branch_fad46
	drum_note 4, 13
	sound_call Branch_fad4f
	drum_note 3, 3
	drum_note 3, 4
	rept 4
	drum_note 2, 6
	drum_note 2, 7
	endr
	sound_loop 2, .Loop3
.Loop4
	sound_call Branch_fad46
	drum_note 4, 13
	sound_loop 6, .Loop4
	sound_call Branch_fad46
	drum_speed 13
	drum_note 6, 4
	drum_speed 1
	rest 6
	drum_note 3, 3
	drum_note 3, 4
	drum_note 2, 6
	drum_note 2, 7
.Loop5
	drum_note 3, 6
	drum_note 2, 7
	sound_loop 2, .Loop5
	drum_note 2, 6
	drum_note 3, 7
	sound_loop 0, .MainLoop

Branch_fad46:
	;
	;sound_call Branch_fad4f
	drum_note 1, 13
	drum_note 5, 6
	drum_note 1, 7
	drum_note 2, 13
	drum_note 1, 6
	;
	drum_note 3, 7
	drum_note 1, 13
	drum_note 5, 6
	drum_note 1, 7
	drum_note 2, 13
	sound_ret

Branch_fad4f:
	drum_note 1, 13
	drum_note 5, 6
	drum_note 1, 7
	drum_note 2, 13
	drum_note 1, 6
	sound_ret
; 0xfad55
