Music_DeckMachine:
	channel_count 4
	channel 1, Music_DeckMachine_Ch1
	channel 2, Music_DeckMachine_Ch2
	channel 3, Music_DeckMachine_Ch3
	channel 4, Music_DeckMachine_Ch4

Music_DeckMachine_Ch1:
	stereo_panning TRUE, TRUE
;	cutoff 8
	duty_cycle 3
.MainLoop
	octave 5
	speed 1
.Loop1
;	cutoff 6
	volume_envelope 9, 1
	note C_, 7
	volume_envelope 3, 1
	note C_, 8
	volume_envelope 4, 1
	note C_, 8
	volume_envelope 9, 1
	note G_, 7
	volume_envelope 3, 1
	note G_, 8
	volume_envelope 4, 1
	note C_, 7
	volume_envelope 9, 1
	note E_, 7
	volume_envelope 3, 1
	note E_, 8
	volume_envelope 4, 1
	note E_, 8
	volume_envelope 9, 1
	note C_, 7
	volume_envelope 3, 1
	note C_, 8
	volume_envelope 4, 1
	note C_, 7
	volume_envelope 9, 1
	note G_, 7
	volume_envelope 3, 1
	note G_, 8
	volume_envelope 9, 1
;	cutoff 4
	note F_, 7
;	cutoff 5
	volume_envelope 4, 1
	note G_, 8
	sound_loop 9, .Loop1
	volume_envelope 9, 1
	note C_, 7
	volume_envelope 3, 1
	note C_, 8
	volume_envelope 4, 1
	note C_, 15
	speed 10
	rest 9
	sound_loop 0, .MainLoop


Music_DeckMachine_Ch2:
	stereo_panning TRUE, TRUE
;	cutoff 8
	duty_cycle 1
;	cutoff 7
.MainLoop
	octave 3
	speed 1
.Loop1
	rest 15
	volume_envelope 11, 2
	rest 7
	note C_, 8
	volume_envelope 2, 7
	note C_, 8
	rest 7
	volume_envelope 11, 2
	note C_, 7
	volume_envelope 2, 7
	note C_, 8
	rest 7
	volume_envelope 11, 2
	dec_octave
	note A_, 8
	volume_envelope 2, 7
	note A_, 8
	rest 7
	inc_octave
	volume_envelope 11, 2
	note C_, 7
	volume_envelope 2, 7
	note C_, 8
	rest 15
	sound_loop 9, .Loop1
	volume_envelope 11, 2
	note E_, 7
	volume_envelope 2, 7
	note E_, 8
	rest 15
	speed 10
	rest 9
	sound_loop 0, .MainLoop


Music_DeckMachine_Ch3:
	stereo_panning TRUE, TRUE
	channel_volume 1
	fade_wave 11
;	echo 96
;	cutoff 8
.MainLoop
	octave 3
	speed 1
.Loop1
	note C_, 7
	rest 8
	note G_, 7
	inc_octave
;	cutoff 5
	note G_, 8
;	cutoff 8
	rest 7
	dec_octave
	note C_, 8
	inc_octave
;	cutoff 5
	note E_, 7
	dec_octave
;	cutoff 8
	note C_, 8
	note D_, 7
	inc_octave
;	cutoff 5
	note C_, 8
	dec_octave
	rest 7
;	cutoff 8
	note A_, 8
	inc_octave
;	cutoff 5
	note G_, 7
	dec_octave
	dec_octave
;	cutoff 8
	note A_, 8
	inc_octave
	note D_, 7
	rest 8
	note E_, 7
	rest 8
	note G_, 7
	inc_octave
;	cutoff 5
	note G_, 8
	rest 7
	dec_octave
;	cutoff 8
	note E_, 8
	inc_octave
;	cutoff 5
	note E_, 7
	dec_octave
;	cutoff 8
	note C_, 8
	note F_, 7
	inc_octave
;	cutoff 5
	note C_, 8
	rest 7
	dec_octave
;	cutoff 8
	note F_, 8
	inc_octave
;	cutoff 5
	note G_, 7
	dec_octave
;	cutoff 8
	note E_, 8
	note D_, 7
	rest 8
	sound_loop 4, .Loop1
	note C_, 7
	rest 8
	note G_, 7
	inc_octave
;	cutoff 5
	note G_, 8
	rest 7
	dec_octave
;	cutoff 8
	note C_, 8
	inc_octave
;	cutoff 5
	note E_, 7
	dec_octave
	dec_octave
;	cutoff 8
	note G_, 8
	inc_octave
	note C_, 7
	inc_octave
;	cutoff 5
	note C_, 8
	rest 7
	dec_octave
;	cutoff 8
	note F_, 8
	inc_octave
;	cutoff 5
	note G_, 7
	dec_octave
;	cutoff 8
	note E_, 8
	note D_, 7
	rest 8
	note C_, 15
	rest 15
	speed 10
	rest 3
	speed 1
	rest 7
	dec_octave
	note G_, 15
	rest 8
	note A_, 7
	rest 8
	note B_, 7
	rest 8
	sound_loop 0, .MainLoop


Music_DeckMachine_Ch4:
	toggle_noise 6
	drum_speed 1
	octave 1
.MainLoop
.Loop1
	sound_call Branch_f7031
	drum_note 5, 15
	drum_note 2, 7
	drum_note 4, 8
	drum_note 5, 15
	sound_loop 9, .Loop1
	sound_call Branch_f7031
	drum_note 5, 7
	drum_note 3, 4
	drum_note 3, 4
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	sound_loop 0, .MainLoop

Branch_f7031:
	drum_note 1, 7
	drum_note 4, 8
	drum_note 5, 15
	drum_note 2, 7
	drum_note 4, 8
	drum_note 5, 15
	drum_note 1, 7
	drum_note 4, 8
	sound_ret
