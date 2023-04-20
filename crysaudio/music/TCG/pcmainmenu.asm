Music_PCMainMenu:
	channel_count 4
	channel 1, Music_PCMainMenu_Ch1
	channel 2, Music_PCMainMenu_Ch2
	channel 3, Music_PCMainMenu_Ch3
	channel 4, Music_PCMainMenu_Ch4

Music_PCMainMenu_Ch1:
	speed 7
	stereo_panning TRUE, TRUE
;	cutoff 8
	octave 3
	duty_cycle 2
.MainLoop
	sound_call Branch_f90c2
	rest 4
	dec_octave
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	note F_, 1
	rest 1
	duty_cycle 2
;	cutoff 8
	volume_envelope 11, 4
	note A_, 1
	volume_envelope 3, 7
	note A_, 1
	rest 2
	inc_octave
	volume_envelope 11, 4
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	dec_octave
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	note F_, 1
	rest 1
	duty_cycle 2
;	cutoff 8
	volume_envelope 11, 4
	note B_, 1
	volume_envelope 3, 7
	note B_, 1
	sound_call Branch_f90c2
	rest 4
	dec_octave
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	note F_, 1
	rest 1
	inc_octave
	duty_cycle 2
;	cutoff 8
	volume_envelope 11, 4
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
	rest 2
	volume_envelope 11, 4
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	dec_octave
	note F_, 1
	rest 1
	inc_octave
	duty_cycle 2
;	cutoff 8
	volume_envelope 11, 4
	note D_, 1
	volume_envelope 3, 7
	note D_, 1
	sound_loop 0, .MainLoop

Branch_f90c2:
	octave 3
	rest 4
	duty_cycle 1
	volume_envelope 6, 1
;	cutoff 5
	note G_, 1
	rest 3
;	cutoff 8
	duty_cycle 2
	volume_envelope 11, 4
	note B_, 2
	inc_octave
	note D_, 1
	volume_envelope 2, 7
	note D_, 1
	dec_octave
	duty_cycle 1
	volume_envelope 6, 1
;	cutoff 5
	note G_, 1
	rest 1
	inc_octave
	duty_cycle 2
;	cutoff 8
	volume_envelope 11, 4
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	sound_ret


Music_PCMainMenu_Ch2:
	speed 7
	stereo_panning TRUE, TRUE
;	cutoff 8
	octave 3
	duty_cycle 2
.MainLoop
	sound_call Branch_f915e
	rest 4
	inc_octave
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	note C_, 1
	rest 1
	dec_octave
	duty_cycle 2
;	cutoff 8
	volume_envelope 8, 4
	note F_, 1
	volume_envelope 2, 7
	note F_, 1
	rest 2
	volume_envelope 8, 4
	note A_, 1
	volume_envelope 2, 7
	note A_, 1
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	duty_cycle 2
;	cutoff 8
	volume_envelope 8, 4
	note G_, 1
	volume_envelope 2, 7
	note G_, 1
	sound_call Branch_f915e
	rest 4
	inc_octave
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	note C_, 1
	rest 1
	duty_cycle 2
;	cutoff 8
	volume_envelope 8, 4
	note C_, 1
	volume_envelope 2, 7
	note C_, 1
	rest 2
	dec_octave
	volume_envelope 8, 4
	note A_, 1
	volume_envelope 2, 7
	note A_, 1
	duty_cycle 1
	inc_octave
	volume_envelope 6, 1
;	cutoff 5
	note C_, 1
	rest 1
	dec_octave
	duty_cycle 2
;	cutoff 8
	volume_envelope 8, 4
	note B_, 1
	volume_envelope 2, 7
	note B_, 1
	sound_loop 0, .MainLoop

Branch_f915e:
	octave 4
	rest 4
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	note D_, 1
	rest 3
	duty_cycle 2
;	cutoff 8
	dec_octave
	volume_envelope 8, 4
	note G_, 2
	note B_, 1
	volume_envelope 2, 7
	note B_, 1
	inc_octave
	duty_cycle 1
;	cutoff 5
	volume_envelope 6, 1
	note D_, 1
	rest 1
	dec_octave
	duty_cycle 2
;	cutoff 8
	volume_envelope 8, 4
	note A_, 1
	volume_envelope 2, 7
	note A_, 1
	sound_ret


Music_PCMainMenu_Ch3:
	speed 7
	channel_volume 1
	stereo_panning TRUE, TRUE
	fade_wave 11
;	cutoff 7
;	echo 0
.MainLoop
	octave 2
;	cutoff 7
	note G_, 1
	rest 1
;	cutoff 8
	note G_, 1
	rest 1
	speed 1
	note A#, 4
;	tie
	note B_, 3
;	tie
	speed 7
	note B_, 1
	rest 1
;	cutoff 4
	inc_octave
	note C_, 1
	rest 1
	note C_, 1
;	cutoff 8
	note C#, 2
	note D_, 2
	dec_octave
	note G_, 1
;	tie
	note F#, 1
;	cutoff 7
	note F_, 1
	rest 1
;	cutoff 8
	note F_, 1
	rest 1
	speed 1
	note G#, 4
;	tie
	note A_, 3
;	tie
	speed 7
	note A_, 1
	rest 1
;	cutoff 4
	note A#, 1
	rest 1
	note A#, 1
;	cutoff 8
	note B_, 2
	inc_octave
	note C_, 2
	dec_octave
	note F_, 1
;	tie
	note F#, 1
;	cutoff 7
	note G_, 1
	rest 1
;	cutoff 8
	note G_, 1
	rest 1
	speed 1
	note A#, 4
;	tie
	note B_, 3
;	tie
	speed 7
	note B_, 1
	rest 1
;	cutoff 4
	inc_octave
	note C_, 1
	rest 1
	note C_, 1
;	cutoff 8
	note C#, 2
	note D_, 2
	dec_octave
	note G_, 1
;	tie
	note F#, 1
;	cutoff 7
	note F_, 1
	rest 1
;	cutoff 8
	note F_, 1
	rest 1
	speed 1
	note B_, 4
;	tie
	inc_octave
	note C_, 3
;	tie
	speed 7
	note C_, 1
	rest 1
;	cutoff 8
	speed 1
	note F#, 4
;	tie
	note G_, 3
;	tie
	speed 7
	note G_, 1
;	cutoff 4
	note F_, 1
;	cutoff 8
	note C_, 2
	note F_, 2
	speed 1
	note C_, 3
;	tie
	dec_octave
	note B_, 3
;	tie
	note A#, 3
;	tie
	note A_, 3
;	tie
	note G#, 2
	speed 7
	sound_loop 0, .MainLoop


Music_PCMainMenu_Ch4:
	toggle_noise 6
	drum_speed 7
	octave 1
.MainLoop
.Loop1
	sound_call Branch_f9248
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 2
	drum_note 4, 1
	drum_note 5, 1
	sound_loop 7, .Loop1
	sound_call Branch_f9248
	drum_note 5, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_speed 7
	drum_note 2, 2
	drum_note 2, 1
	drum_note 2, 1
	sound_loop 0, .MainLoop

Branch_f9248:
	drum_note 1, 2
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 2
	drum_note 4, 1
	drum_note 5, 1
	drum_note 1, 1
	drum_note 3, 1
	sound_ret
