Music_Club3:
	channel_count 4
	channel 1, Music_Club3_Ch1
	channel 2, Music_Club3_Ch2
	channel 3, Music_Club3_Ch3
	channel 4, Music_Club3_Ch4

Music_Club3_Ch1: ; fa210 (3e:6210)
	notetype0 9
	;stereo_panning 1, 1
	;vibrato_type 5
	vibrato 20, 3, 3
	notetype2 8
.MainLoop
	duty_cycle 0
.Loop1
	octave 2
	notetype1 9
	rest 4
	note G_, 2
	notetype1 3
	note G_, 1
	inc_octave
	notetype1 9
	note C_, 1
	notetype1 3
	note C_, 2
	dec_octave
	notetype1 9
	note A#, 6
	;tie
	note A#, 12
	notetype1 3
	note A#, 4
	rest 4
	notetype1 9
	note G_, 2
	notetype1 3
	note G_, 1
	inc_octave
	notetype1 9
	notetype0 1
	note C_, 5
	;tie
	note C#, 4
	;tie
	notetype0 9
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 9
	note A#, 6
	;tie
	note A#, 12
	notetype1 3
	note A#, 4
	sound_loop 2, .Loop1
	duty_cycle 1
	notetype1 9
	notetype2 7
	sound_call Branch_fa330
	sound_call Branch_fa403
	note A#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note D_, 1
	note D#, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	inc_octave
	notetype2 8
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 4
	notetype0 9
	notetype1 8
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	notetype1 9
	notetype2 7
	sound_call Branch_fa330
	sound_call Branch_fa403
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note C#, 1
	note D_, 1
	inc_octave
	note F#, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	octave 4
	duty_cycle 2
	notetype1 7
	notetype0 1
	notetype2 8
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	duty_cycle 1
	notetype2 7
	notetype0 9
	sound_call Branch_fa370
	sound_call Branch_fa403
	note A#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note D_, 1
	note D#, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	inc_octave
	notetype2 8
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 4
	notetype0 9
	notetype1 8
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	sound_call Branch_fa370
	sound_call Branch_fa403
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	dec_octave
	note C_, 1
	note C#, 1
	inc_octave
	note F#, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	inc_octave
	duty_cycle 2
	notetype0 1
	notetype2 8
	notetype1 7
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	notetype0 9
	notetype2 8
	sound_loop 0, .MainLoop

Branch_fa330:
	octave 2
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note C#, 1
	note C_, 1
	dec_octave
	note D_, 1
	note A#, 1
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	note A#, 1
	dec_octave
	notetype0 1
	notetype2 8
	note F_, 5
	note F#, 4
	notetype0 9
	notetype2 7
	note G_, 1
	inc_octave
	note E_, 1
	dec_octave
	note F_, 1
	note F#, 1
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	note E_, 1
	dec_octave
	note D_, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	note A#, 1
	inc_octave
	note C_, 1
	dec_octave
	note F_, 1
	note F#, 1
	sound_ret

Branch_fa370:
	octave 2
	notetype1 9
	notetype2 7
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note C#, 1
	note C_, 1
	dec_octave
	note D_, 1
	note A#, 1
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	note A#, 1
	dec_octave
	notetype0 1
	notetype2 8
	note F_, 5
	note F#, 4
	octave 4
	duty_cycle 2
	notetype1 7
	note G_, 3
	notetype1 1
	note G_, 2
	inc_octave
	notetype1 7
	note D_, 2
	notetype1 1
	dec_octave
	note G_, 2
	inc_octave
	notetype1 7
	note G_, 3
	notetype1 1
	note D_, 2
	notetype1 7
	note D_, 2
	notetype1 1
	note G_, 2
	dec_octave
	notetype1 7
	note G_, 3
	notetype1 1
	inc_octave
	note D_, 2
	notetype1 7
	note D_, 2
	notetype1 1
	dec_octave
	note G_, 2
	inc_octave
	notetype1 7
	note G_, 3
	notetype1 1
	note D_, 2
	notetype1 7
	note D_, 2
	notetype1 1
	note G_, 2
	notetype0 9
	duty_cycle 1
	notetype2 7
	notetype1 9
	octave 2
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note F_, 1
	note E_, 1
	dec_octave
	note D_, 1
	inc_octave
	note G_, 1
	octave 2
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 2
	note G_, 1
	octave 5
	duty_cycle 2
	notetype0 1
	notetype2 8
	notetype1 7
	octave 5
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	note G_, 5
	note C#, 4
	note C_, 5
	dec_octave
	note A#, 4
	notetype0 9
	duty_cycle 1
	notetype2 7
	notetype1 9
	sound_ret

Branch_fa403:
	octave 2
	note G_, 1
	inc_octave
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note C#, 1
	note C_, 1
	dec_octave
	note D_, 1
	note A#, 1
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	note A#, 1
	dec_octave
	notetype0 1
	notetype2 8
	note F_, 5
	note F#, 4
	notetype0 9
	notetype2 7
	note G_, 1
	sound_ret


Music_Club3_Ch2: ; fa423 (3e:6423)
	notetype0 9
	;stereo_panning 1, 1
	;vibrato_type 5
	vibrato 20, 3, 3
	notetype2 8
.MainLoop
	duty_cycle 0
.Loop1
	octave 2
	notetype1 7
	rest 4
	note D_, 2
	notetype1 3
	note D_, 1
	notetype1 7
	note F_, 1
	notetype1 3
	note F_, 2
	notetype1 7
	note E_, 6
	;tie
	note E_, 12
	notetype1 3
	note E_, 4
	rest 4
	notetype1 7
	note D_, 2
	notetype1 3
	note D_, 1
	notetype1 7
	notetype0 1
	note F_, 5
	;tie
	note F#, 4
	notetype0 9
	note F_, 1
	notetype1 3
	note F_, 1
	notetype1 7
	note E_, 6
	;tie
	note E_, 12
	notetype1 3
	note E_, 4
	sound_loop 2, .Loop1
	duty_cycle 1
.Loop2
	sound_call Branch_fa5a6
	notetype0 9
	rest 1
	inc_octave
	notetype1 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 1
	notetype1 3
	note F_, 2
	dec_octave
	notetype1 9
	note D_, 1
	inc_octave
	inc_octave
	notetype1 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype1 9
	notetype0 9
	rest 1
	dec_octave
	notetype0 1
	notetype2 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	notetype1 3
	note A#, 4
	inc_octave
	inc_octave
	notetype1 9
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 8
	rest 1
	dec_octave
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note A#, 1
	notetype1 3
	note A#, 2
	inc_octave
	notetype1 9
	note C#, 1
	notetype1 3
	note C#, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	dec_octave
	notetype0 1
	notetype1 8
	note A#, 5
	notetype1 3
	note C_, 4
	notetype0 9
	rest 1
	dec_octave
	notetype1 8
	notetype2 8
	note A#, 1
	note B_, 1
	inc_octave
	note C_, 1
	sound_call Branch_fa5a6
	notetype0 9
	rest 1
	inc_octave
	notetype0 1
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 1
	notetype1 3
	note F_, 2
	notetype1 9
	note D_, 1
	inc_octave
	notetype1 8
	notetype0 1
	note G_, 5
	notetype1 3
	note G_, 4
	notetype0 9
	rest 1
	dec_octave
	dec_octave
	notetype0 1
	notetype1 8
	note G_, 5
	notetype1 3
	note G_, 4
	inc_octave
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	rest 1
	rest 1
	notetype0 1
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype2 8
	notetype1 8
	note F_, 5
	note F#, 4
	inc_octave
	inc_octave
	notetype0 9
	notetype1 9
	notetype2 7
	note C#, 1
	notetype1 3
	note C#, 2
	notetype1 9
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 8
	notetype0 1
	note F_, 5
	notetype1 3
	note F_, 4
	notetype1 8
	notetype0 9
	rest 1
	dec_octave
	notetype2 8
	note D_, 1
	note D#, 1
	note E_, 1
	sound_loop 2, .Loop2
	sound_loop 0, .MainLoop

Branch_fa5a6:
	octave 3
	rest 1
	notetype1 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype1 8
	notetype2 8
	note F_, 5
	note F#, 4
	inc_octave
	notetype0 9
	notetype2 7
	notetype1 9
	note G_, 1
	note G_, 1
	notetype1 3
	note G_, 1
	notetype1 9
	note F_, 1
	notetype1 3
	note F_, 2
	notetype1 9
	note E_, 1
	inc_octave
	notetype1 8
	notetype2 8
	notetype0 1
	note D_, 5
	notetype1 3
	note D_, 4
	notetype1 8
	notetype0 9
	rest 1
	dec_octave
	notetype0 1
	notetype2 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	notetype1 3
	note A#, 4
	notetype1 8
	inc_octave
	inc_octave
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	rest 1
	dec_octave
	notetype0 1
	notetype1 8
	note D_, 5
	notetype1 3
	note D_, 4
	notetype0 9
	notetype1 9
	notetype2 7
	note G_, 1
	dec_octave
	notetype0 1
	notetype1 8
	notetype2 8
	note F_, 5
	note F#, 4
	notetype0 9
	inc_octave
	notetype1 9
	notetype2 7
	note A#, 1
	notetype1 3
	note A#, 2
	inc_octave
	notetype1 9
	note C#, 1
	notetype1 3
	note C#, 1
	dec_octave
	notetype1 9
	note G_, 1
	notetype1 3
	note G_, 1
	dec_octave
	notetype1 9
	note A#, 1
	notetype1 3
	note A#, 1
	notetype2 8
	notetype1 8
	note A#, 1
	notetype1 3
	note A#, 2
	sound_ret


Music_Club3_Ch3: ; fa63e (3e:663e)
	notetype0 9
	;stereo_panning 1, 1
	notetype1 1
	notetype2 11
	;echo 0
	;cutoff 8
.Loop1
	octave 2
	note G_, 1
	rest 1
	note G_, 14
	rest 1
	inc_octave
	note F_, 1
	rest 2
	note G_, 1
	rest 2
	dec_octave
	note G_, 1
	rest 1
	note E_, 3
	note F_, 1
	rest 1
	note F#, 1
	rest 1
	sound_loop 4, .Loop1
.Loop2
	octave 2
	note G_, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note G_, 1
	inc_octave
	note F_, 1
	note G_, 1
	rest 1
	dec_octave
	note G_, 1
	rest 1
	inc_octave
	note G_, 1
	rest 1
	octave 5
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note E_, 1
	note F_, 1
	octave 5
	;cutoff 4
	note G_, 1
	octave 2
	;cutoff 8
	note G_, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note G_, 1
	inc_octave
	note F_, 1
	note G_, 1
	rest 1
	dec_octave
	note G_, 1
	rest 1
	inc_octave
	note G_, 1
	rest 1
	inc_octave
	;cutoff 4
	note F_, 1
	rest 1
	;cutoff 8
	note E_, 1
	octave 2
	note F_, 1
	note F#, 1
	note D#, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note D#, 1
	inc_octave
	note D_, 1
	note D#, 1
	rest 1
	dec_octave
	note D#, 1
	rest 1
	inc_octave
	note D#, 1
	rest 1
	octave 5
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note C_, 1
	note C#, 1
	octave 5
	;cutoff 4
	note G_, 1
	octave 2
	;cutoff 8
	note D#, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note D#, 1
	inc_octave
	note D_, 1
	note D#, 1
	rest 1
	dec_octave
	note D#, 1
	rest 1
	inc_octave
	note D#, 1
	rest 1
	inc_octave
	;cutoff 4
	note F_, 1
	rest 1
	dec_octave
	;cutoff 8
	note D_, 1
	note D#, 1
	note E_, 1
	dec_octave
	note C_, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note C_, 1
	note A#, 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note C_, 1
	rest 1
	inc_octave
	note C_, 1
	rest 1
	octave 5
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note A_, 1
	note A#, 1
	octave 5
	;cutoff 4
	note G_, 1
	octave 2
	;cutoff 8
	note C_, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note C_, 1
	note A#, 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note C_, 1
	rest 1
	inc_octave
	note C_, 1
	rest 1
	inc_octave
	;cutoff 4
	note F_, 1
	rest 1
	;cutoff 8
	note E_, 1
	octave 2
	note A#, 1
	note B_, 1
	note D_, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note D_, 1
	inc_octave
	note C_, 1
	note D_, 1
	rest 1
	dec_octave
	note D_, 1
	rest 1
	inc_octave
	note D_, 1
	rest 1
	octave 5
	;cutoff 4
	note C_, 1
	rest 1
	octave 3
	;cutoff 6
	note A#, 1
	dec_octave
	;cutoff 8
	note C_, 1
	note C#, 1
	note D_, 1
	octave 4
	;cutoff 4
	note G_, 1
	rest 1
	octave 2
	;cutoff 8
	note D_, 1
	inc_octave
	note C_, 1
	note D_, 1
	rest 1
	dec_octave
	note D_, 1
	rest 1
	note F_, 1
	rest 1
	inc_octave
	;cutoff 4
	note A#, 1
	rest 1
	dec_octave
	;cutoff 8
	note A#, 1
	note B_, 1
	inc_octave
	note C_, 1
	sound_loop 2, .Loop2
	sound_loop 0, Music_Club3_Ch3


Music_Club3_Ch4: ; fa772 (3e:6772)
	toggle_noise 6
	drum_speed 9
	octave 1
.MainLoop
.Loop1
	sound_call Branch_fa796
	drum_note 2, 2
	drum_note 5, 2
	sound_call Branch_fa796
	drum_note 2, 2
	drum_note 4, 1
	drum_note 2, 1
	sound_loop 3, .Loop1
	sound_call Branch_fa796
	drum_note 2, 2
	drum_note 5, 2
	sound_call Branch_fa796
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 2, 4
	drum_speed 9
	drum_note 2, 1
	drum_note 2, 1
	sound_loop 0, .MainLoop

Branch_fa796:
	drum_note 1, 2
	drum_note 4, 2
	drum_note 2, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 1
	drum_note 1, 1
	sound_ret
; 0xfa7a0
