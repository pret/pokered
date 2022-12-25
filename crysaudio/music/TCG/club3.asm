Music_Club3:
	channel_count 4
	channel 1, Music_Club3_Ch1
	channel 2, Music_Club3_Ch2
	channel 3, Music_Club3_Ch3
	channel 4, Music_Club3_Ch4

Music_Club3_Ch1: ; fa210 (3e:6210)
	speed 9
	;stereo_panning 1, 1
	;vibrato_type 5
	vibrato 20, 3, 3
	fade_wave 8
.MainLoop
	duty_cycle 0
.Loop1
	octave 2
	channel_volume 9
	rest 4
	note G_, 2
	channel_volume 3
	note G_, 1
	inc_octave
	channel_volume 9
	note C_, 1
	channel_volume 3
	note C_, 2
	dec_octave
	channel_volume 9
	note A#, 6
	;tie
	note A#, 12
	channel_volume 3
	note A#, 4
	rest 4
	channel_volume 9
	note G_, 2
	channel_volume 3
	note G_, 1
	inc_octave
	channel_volume 9
	speed 1
	note C_, 5
	;tie
	note C#, 4
	;tie
	speed 9
	note C_, 1
	channel_volume 3
	note C_, 1
	dec_octave
	channel_volume 9
	note A#, 6
	;tie
	note A#, 12
	channel_volume 3
	note A#, 4
	sound_loop 2, .Loop1
	duty_cycle 1
	channel_volume 9
	fade_wave 7
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
	fade_wave 8
	speed 1
	note G_, 5
	channel_volume 3
	note G_, 4
	speed 9
	channel_volume 8
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	channel_volume 9
	fade_wave 7
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
	channel_volume 7
	speed 1
	fade_wave 8
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
	fade_wave 7
	speed 9
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
	fade_wave 8
	speed 1
	note G_, 5
	channel_volume 3
	note G_, 4
	speed 9
	channel_volume 8
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
	speed 1
	fade_wave 8
	channel_volume 7
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
	speed 9
	fade_wave 8
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
	speed 1
	fade_wave 8
	note F_, 5
	note F#, 4
	speed 9
	fade_wave 7
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
	channel_volume 9
	fade_wave 7
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
	speed 1
	fade_wave 8
	note F_, 5
	note F#, 4
	octave 4
	duty_cycle 2
	channel_volume 7
	note G_, 3
	channel_volume 1
	note G_, 2
	inc_octave
	channel_volume 7
	note D_, 2
	channel_volume 1
	dec_octave
	note G_, 2
	inc_octave
	channel_volume 7
	note G_, 3
	channel_volume 1
	note D_, 2
	channel_volume 7
	note D_, 2
	channel_volume 1
	note G_, 2
	dec_octave
	channel_volume 7
	note G_, 3
	channel_volume 1
	inc_octave
	note D_, 2
	channel_volume 7
	note D_, 2
	channel_volume 1
	dec_octave
	note G_, 2
	inc_octave
	channel_volume 7
	note G_, 3
	channel_volume 1
	note D_, 2
	channel_volume 7
	note D_, 2
	channel_volume 1
	note G_, 2
	speed 9
	duty_cycle 1
	fade_wave 7
	channel_volume 9
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
	speed 1
	fade_wave 8
	channel_volume 7
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
	speed 9
	duty_cycle 1
	fade_wave 7
	channel_volume 9
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
	speed 1
	fade_wave 8
	note F_, 5
	note F#, 4
	speed 9
	fade_wave 7
	note G_, 1
	sound_ret


Music_Club3_Ch2: ; fa423 (3e:6423)
	speed 9
	;stereo_panning 1, 1
	;vibrato_type 5
	vibrato 20, 3, 3
	fade_wave 8
.MainLoop
	duty_cycle 0
.Loop1
	octave 2
	channel_volume 7
	rest 4
	note D_, 2
	channel_volume 3
	note D_, 1
	channel_volume 7
	note F_, 1
	channel_volume 3
	note F_, 2
	channel_volume 7
	note E_, 6
	;tie
	note E_, 12
	channel_volume 3
	note E_, 4
	rest 4
	channel_volume 7
	note D_, 2
	channel_volume 3
	note D_, 1
	channel_volume 7
	speed 1
	note F_, 5
	;tie
	note F#, 4
	speed 9
	note F_, 1
	channel_volume 3
	note F_, 1
	channel_volume 7
	note E_, 6
	;tie
	note E_, 12
	channel_volume 3
	note E_, 4
	sound_loop 2, .Loop1
	duty_cycle 1
.Loop2
	sound_call Branch_fa5a6
	speed 9
	rest 1
	inc_octave
	channel_volume 8
	speed 1
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	dec_octave
	speed 1
	fade_wave 8
	channel_volume 8
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	note G_, 1
	channel_volume 3
	note G_, 1
	channel_volume 9
	note F_, 1
	channel_volume 3
	note F_, 2
	dec_octave
	channel_volume 9
	note D_, 1
	inc_octave
	inc_octave
	channel_volume 8
	speed 1
	note D_, 5
	channel_volume 3
	note D_, 4
	channel_volume 9
	speed 9
	rest 1
	dec_octave
	speed 1
	fade_wave 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	channel_volume 3
	note A#, 4
	inc_octave
	inc_octave
	channel_volume 9
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	channel_volume 8
	rest 1
	dec_octave
	speed 1
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	dec_octave
	speed 1
	fade_wave 8
	channel_volume 8
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
	channel_volume 9
	fade_wave 7
	note A#, 1
	channel_volume 3
	note A#, 2
	inc_octave
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	dec_octave
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	dec_octave
	speed 1
	channel_volume 8
	note A#, 5
	channel_volume 3
	note C_, 4
	speed 9
	rest 1
	dec_octave
	channel_volume 8
	fade_wave 8
	note A#, 1
	note B_, 1
	inc_octave
	note C_, 1
	sound_call Branch_fa5a6
	speed 9
	rest 1
	inc_octave
	speed 1
	channel_volume 8
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	dec_octave
	speed 1
	fade_wave 8
	channel_volume 8
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	note G_, 1
	channel_volume 3
	note G_, 1
	channel_volume 9
	note F_, 1
	channel_volume 3
	note F_, 2
	channel_volume 9
	note D_, 1
	inc_octave
	channel_volume 8
	speed 1
	note G_, 5
	channel_volume 3
	note G_, 4
	speed 9
	rest 1
	dec_octave
	dec_octave
	speed 1
	channel_volume 8
	note G_, 5
	channel_volume 3
	note G_, 4
	inc_octave
	channel_volume 8
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	rest 1
	rest 1
	speed 1
	channel_volume 8
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	dec_octave
	speed 1
	fade_wave 8
	channel_volume 8
	note F_, 5
	note F#, 4
	inc_octave
	inc_octave
	speed 9
	channel_volume 9
	fade_wave 7
	note C#, 1
	channel_volume 3
	note C#, 2
	channel_volume 9
	note C_, 1
	channel_volume 3
	note C_, 1
	dec_octave
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	channel_volume 8
	speed 1
	note F_, 5
	channel_volume 3
	note F_, 4
	channel_volume 8
	speed 9
	rest 1
	dec_octave
	fade_wave 8
	note D_, 1
	note D#, 1
	note E_, 1
	sound_loop 2, .Loop2
	sound_loop 0, .MainLoop

Branch_fa5a6:
	octave 3
	rest 1
	channel_volume 8
	speed 1
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	dec_octave
	speed 1
	channel_volume 8
	fade_wave 8
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
	fade_wave 7
	channel_volume 9
	note G_, 1
	note G_, 1
	channel_volume 3
	note G_, 1
	channel_volume 9
	note F_, 1
	channel_volume 3
	note F_, 2
	channel_volume 9
	note E_, 1
	inc_octave
	channel_volume 8
	fade_wave 8
	speed 1
	note D_, 5
	channel_volume 3
	note D_, 4
	channel_volume 8
	speed 9
	rest 1
	dec_octave
	speed 1
	fade_wave 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	channel_volume 3
	note A#, 4
	channel_volume 8
	inc_octave
	inc_octave
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	rest 1
	dec_octave
	speed 1
	channel_volume 8
	note D_, 5
	channel_volume 3
	note D_, 4
	speed 9
	channel_volume 9
	fade_wave 7
	note G_, 1
	dec_octave
	speed 1
	channel_volume 8
	fade_wave 8
	note F_, 5
	note F#, 4
	speed 9
	inc_octave
	channel_volume 9
	fade_wave 7
	note A#, 1
	channel_volume 3
	note A#, 2
	inc_octave
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	dec_octave
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	dec_octave
	channel_volume 9
	note A#, 1
	channel_volume 3
	note A#, 1
	fade_wave 8
	channel_volume 8
	note A#, 1
	channel_volume 3
	note A#, 2
	sound_ret


Music_Club3_Ch3: ; fa63e (3e:663e)
	speed 9
	;stereo_panning 1, 1
	channel_volume 1
	fade_wave 11
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
