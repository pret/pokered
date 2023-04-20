Music_Club3:
	channel_count 4
	channel 1, Music_Club3_Ch1
	channel 2, Music_Club3_Ch2
	channel 3, Music_Club3_Ch3
	channel 4, Music_Club3_Ch4

Music_Club3_Ch1:
	speed 9
	stereo_panning TRUE, TRUE
;	vibrato_type 5
	vibrato 20, 3, 3
;	cutoff 8
.MainLoop
	duty_cycle 0
.Loop1
	octave 2
	volume_envelope 9, 0
	rest 4
	note G_, 2
	volume_envelope 3, 7
	note G_, 1
	inc_octave
	volume_envelope 9, 0
	note C_, 1
	volume_envelope 3, 7
	note C_, 2
	dec_octave
	volume_envelope 9, 0
	note A#, 6
;	tie
	note A#, 12
	volume_envelope 3, 7
	note A#, 4
	rest 4
	volume_envelope 9, 0
	note G_, 2
	volume_envelope 3, 7
	note G_, 1
	inc_octave
	volume_envelope 9, 0
	speed 1
	note C_, 5
;	tie
	note C#, 4
;	tie
	speed 9
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	dec_octave
	volume_envelope 9, 0
	note A#, 6
;	tie
	note A#, 12
	volume_envelope 3, 7
	note A#, 4
	sound_loop 2, .Loop1
	duty_cycle 1
	volume_envelope 9, 3
;	cutoff 7
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
;	cutoff 8
	speed 1
	note G_, 5
	volume_envelope 3, 7
	note G_, 4
	speed 9
	volume_envelope 8, 0
	note C#, 1
	note C_, 1
	dec_octave
	note A#, 1
	volume_envelope 9, 3
;	cutoff 7
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
	volume_envelope 7, 0
	speed 1
;	cutoff 8
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
;	cutoff 7
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
;	cutoff 8
	speed 1
	note G_, 5
	volume_envelope 3, 7
	note G_, 4
	speed 9
	volume_envelope 8, 0
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
;	cutoff 8
	volume_envelope 7, 0
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
;	cutoff 8
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
;	cutoff 8
	note F_, 5
	note F#, 4
	speed 9
;	cutoff 7
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
	volume_envelope 9, 3
;	cutoff 7
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
;	cutoff 8
	note F_, 5
	note F#, 4
	octave 4
	duty_cycle 2
	volume_envelope 7, 0
	note G_, 3
	volume_envelope 1, 7
	note G_, 2
	inc_octave
	volume_envelope 7, 0
	note D_, 2
	volume_envelope 1, 7
	dec_octave
	note G_, 2
	inc_octave
	volume_envelope 7, 0
	note G_, 3
	volume_envelope 1, 7
	note D_, 2
	volume_envelope 7, 0
	note D_, 2
	volume_envelope 1, 7
	note G_, 2
	dec_octave
	volume_envelope 7, 0
	note G_, 3
	volume_envelope 1, 7
	inc_octave
	note D_, 2
	volume_envelope 7, 0
	note D_, 2
	volume_envelope 1, 7
	dec_octave
	note G_, 2
	inc_octave
	volume_envelope 7, 0
	note G_, 3
	volume_envelope 1, 7
	note D_, 2
	volume_envelope 7, 0
	note D_, 2
	volume_envelope 1, 7
	note G_, 2
	speed 9
	duty_cycle 1
;	cutoff 7
	volume_envelope 9, 3
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
;	cutoff 8
	volume_envelope 7, 0
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
;	cutoff 7
	volume_envelope 9, 3
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
;	cutoff 8
	note F_, 5
	note F#, 4
	speed 9
;	cutoff 7
	note G_, 1
	sound_ret


Music_Club3_Ch2:
	speed 9
	stereo_panning TRUE, TRUE
;	vibrato_type 5
	vibrato 20, 3, 3
;	cutoff 8
.MainLoop
	duty_cycle 0
.Loop1
	octave 2
	volume_envelope 7, 0
	rest 4
	note D_, 2
	volume_envelope 3, 7
	note D_, 1
	volume_envelope 7, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 2
	volume_envelope 7, 0
	note E_, 6
;	tie
	note E_, 12
	volume_envelope 3, 7
	note E_, 4
	rest 4
	volume_envelope 7, 0
	note D_, 2
	volume_envelope 3, 7
	note D_, 1
	volume_envelope 7, 0
	speed 1
	note F_, 5
;	tie
	note F#, 4
	speed 9
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 7, 0
	note E_, 6
;	tie
	note E_, 12
	volume_envelope 3, 7
	note E_, 4
	sound_loop 2, .Loop1
	duty_cycle 1
.Loop2
	sound_call Branch_fa5a6
	speed 9
	rest 1
	inc_octave
	volume_envelope 8, 0
	speed 1
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	dec_octave
	speed 1
;	cutoff 8
	volume_envelope 8, 0
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 9, 3
	note F_, 1
	volume_envelope 3, 7
	note F_, 2
	dec_octave
	volume_envelope 9, 3
	note D_, 1
	inc_octave
	inc_octave
	volume_envelope 8, 0
	speed 1
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	volume_envelope 9, 3
	speed 9
	rest 1
	dec_octave
	speed 1
;	cutoff 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	volume_envelope 3, 7
	note A#, 4
	inc_octave
	inc_octave
	volume_envelope 9, 3
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	volume_envelope 8, 0
	rest 1
	dec_octave
	speed 1
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	dec_octave
	speed 1
;	cutoff 8
	volume_envelope 8, 0
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note A#, 1
	volume_envelope 3, 7
	note A#, 2
	inc_octave
	volume_envelope 9, 3
	note C#, 1
	volume_envelope 3, 7
	note C#, 1
	dec_octave
	volume_envelope 9, 3
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	dec_octave
	speed 1
	volume_envelope 8, 0
	note A#, 5
	volume_envelope 3, 7
	note C_, 4
	speed 9
	rest 1
	dec_octave
	volume_envelope 8, 0
;	cutoff 8
	note A#, 1
	note B_, 1
	inc_octave
	note C_, 1
	sound_call Branch_fa5a6
	speed 9
	rest 1
	inc_octave
	speed 1
	volume_envelope 8, 0
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	dec_octave
	speed 1
;	cutoff 8
	volume_envelope 8, 0
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 9, 3
	note F_, 1
	volume_envelope 3, 7
	note F_, 2
	volume_envelope 9, 3
	note D_, 1
	inc_octave
	volume_envelope 8, 0
	speed 1
	note G_, 5
	volume_envelope 3, 7
	note G_, 4
	speed 9
	rest 1
	dec_octave
	dec_octave
	speed 1
	volume_envelope 8, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 4
	inc_octave
	volume_envelope 8, 0
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	rest 1
	rest 1
	speed 1
	volume_envelope 8, 0
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	dec_octave
	speed 1
;	cutoff 8
	volume_envelope 8, 0
	note F_, 5
	note F#, 4
	inc_octave
	inc_octave
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note C#, 1
	volume_envelope 3, 7
	note C#, 2
	volume_envelope 9, 3
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	dec_octave
	volume_envelope 9, 3
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 8, 0
	speed 1
	note F_, 5
	volume_envelope 3, 7
	note F_, 4
	volume_envelope 8, 0
	speed 9
	rest 1
	dec_octave
;	cutoff 8
	note D_, 1
	note D#, 1
	note E_, 1
	sound_loop 2, .Loop2
	sound_loop 0, .MainLoop

Branch_fa5a6:
	octave 3
	rest 1
	volume_envelope 8, 0
	speed 1
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	dec_octave
	speed 1
	volume_envelope 8, 0
;	cutoff 8
	note F_, 5
	note F#, 4
	inc_octave
	speed 9
;	cutoff 7
	volume_envelope 9, 3
	note G_, 1
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 9, 3
	note F_, 1
	volume_envelope 3, 7
	note F_, 2
	volume_envelope 9, 3
	note E_, 1
	inc_octave
	volume_envelope 8, 0
;	cutoff 8
	speed 1
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	volume_envelope 8, 0
	speed 9
	rest 1
	dec_octave
	speed 1
;	cutoff 8
	note G_, 5
	note D_, 4
	dec_octave
	note A#, 5
	volume_envelope 3, 7
	note A#, 4
	volume_envelope 8, 0
	inc_octave
	inc_octave
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	rest 1
	dec_octave
	speed 1
	volume_envelope 8, 0
	note D_, 5
	volume_envelope 3, 7
	note D_, 4
	speed 9
	volume_envelope 9, 3
;	cutoff 7
	note G_, 1
	dec_octave
	speed 1
	volume_envelope 8, 0
;	cutoff 8
	note F_, 5
	note F#, 4
	speed 9
	inc_octave
	volume_envelope 9, 3
;	cutoff 7
	note A#, 1
	volume_envelope 3, 7
	note A#, 2
	inc_octave
	volume_envelope 9, 3
	note C#, 1
	volume_envelope 3, 7
	note C#, 1
	dec_octave
	volume_envelope 9, 3
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	dec_octave
	volume_envelope 9, 3
	note A#, 1
	volume_envelope 3, 7
	note A#, 1
;	cutoff 8
	volume_envelope 8, 0
	note A#, 1
	volume_envelope 3, 7
	note A#, 2
	sound_ret


Music_Club3_Ch3:
	speed 9
	stereo_panning TRUE, TRUE
	channel_volume 1
	fade_wave 11
;	echo 0
;	cutoff 8
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
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
	note E_, 1
	note F_, 1
	octave 5
;	cutoff 4
	note G_, 1
	octave 2
;	cutoff 8
	note G_, 1
	octave 4
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note F_, 1
	rest 1
;	cutoff 8
	note E_, 1
	octave 2
	note F_, 1
	note F#, 1
	note D#, 1
	octave 4
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
	note C_, 1
	note C#, 1
	octave 5
;	cutoff 4
	note G_, 1
	octave 2
;	cutoff 8
	note D#, 1
	octave 4
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note F_, 1
	rest 1
	dec_octave
;	cutoff 8
	note D_, 1
	note D#, 1
	note E_, 1
	dec_octave
	note C_, 1
	octave 4
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
	note A_, 1
	note A#, 1
	octave 5
;	cutoff 4
	note G_, 1
	octave 2
;	cutoff 8
	note C_, 1
	octave 4
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note F_, 1
	rest 1
;	cutoff 8
	note E_, 1
	octave 2
	note A#, 1
	note B_, 1
	note D_, 1
	octave 4
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note C_, 1
	rest 1
	octave 3
;	cutoff 6
	note A#, 1
	dec_octave
;	cutoff 8
	note C_, 1
	note C#, 1
	note D_, 1
	octave 4
;	cutoff 4
	note G_, 1
	rest 1
	octave 2
;	cutoff 8
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
;	cutoff 4
	note A#, 1
	rest 1
	dec_octave
;	cutoff 8
	note A#, 1
	note B_, 1
	inc_octave
	note C_, 1
	sound_loop 2, .Loop2
	sound_loop 0, Music_Club3_Ch3


Music_Club3_Ch4:
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
