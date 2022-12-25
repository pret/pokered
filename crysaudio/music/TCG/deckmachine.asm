Music_DeckMachine:
	channel_count 4
	channel 1, Music_DeckMachine_Ch1
	channel 2, Music_DeckMachine_Ch2
	channel 3, Music_DeckMachine_Ch3
	channel 4, Music_DeckMachine_Ch4

Music_DeckMachine_Ch1: ; f6ef1 (3d:6ef1)
	;stereo_panning 1, 1
	fade_wave 8
	duty_cycle 3
.MainLoop
	octave 5
	speed 1
.Loop1
	fade_wave 6
	channel_volume 9
	note C_, 7
	channel_volume 3
	note C_, 8
	channel_volume 4
	note C_, 8
	channel_volume 9
	note G_, 7
	channel_volume 3
	note G_, 8
	channel_volume 4
	note C_, 7
	channel_volume 9
	note E_, 7
	channel_volume 3
	note E_, 8
	channel_volume 4
	note E_, 8
	channel_volume 9
	note C_, 7
	channel_volume 3
	note C_, 8
	channel_volume 4
	note C_, 7
	channel_volume 9
	note G_, 7
	channel_volume 3
	note G_, 8
	channel_volume 9
	fade_wave 4
	note F_, 7
	fade_wave 5
	channel_volume 4
	note G_, 8
	sound_loop 9, .Loop1
	channel_volume 9
	note C_, 7
	channel_volume 3
	note C_, 8
	channel_volume 4
	note C_, 15
	speed 10
	rest 9
	sound_loop 0, .MainLoop


Music_DeckMachine_Ch2: ; f6f41 (3d:6f41)
	;stereo_panning 1, 1
	fade_wave 8
	duty_cycle 1
	fade_wave 7
.MainLoop
	octave 3
	speed 1
.Loop1
	rest 15
	channel_volume 11
	rest 7
	note C_, 8
	channel_volume 2
	note C_, 8
	rest 7
	channel_volume 11
	note C_, 7
	channel_volume 2
	note C_, 8
	rest 7
	channel_volume 11
	dec_octave
	note A_, 8
	channel_volume 2
	note A_, 8
	rest 7
	inc_octave
	channel_volume 11
	note C_, 7
	channel_volume 2
	note C_, 8
	rest 15
	sound_loop 9, .Loop1
	channel_volume 11
	note E_, 7
	channel_volume 2
	note E_, 8
	rest 15
	speed 10
	rest 9
	sound_loop 0, .MainLoop


Music_DeckMachine_Ch3: ; f6f7b (3d:6f7b)
	;stereo_panning 1, 1
	channel_volume 1
	fade_wave 11
	;echo 96
	;cutoff 8
.MainLoop
	octave 3
	speed 1
.Loop1
	note C_, 7
	rest 8
	note G_, 7
	inc_octave
	;cutoff 5
	note G_, 8
	;cutoff 8
	rest 7
	dec_octave
	note C_, 8
	inc_octave
	;cutoff 5
	note E_, 7
	dec_octave
	;cutoff 8
	note C_, 8
	note D_, 7
	inc_octave
	;cutoff 5
	note C_, 8
	dec_octave
	rest 7
	;cutoff 8
	note A_, 8
	inc_octave
	;cutoff 5
	note G_, 7
	dec_octave
	dec_octave
	;cutoff 8
	note A_, 8
	inc_octave
	note D_, 7
	rest 8
	note E_, 7
	rest 8
	note G_, 7
	inc_octave
	;cutoff 5
	note G_, 8
	rest 7
	dec_octave
	;cutoff 8
	note E_, 8
	inc_octave
	;cutoff 5
	note E_, 7
	dec_octave
	;cutoff 8
	note C_, 8
	note F_, 7
	inc_octave
	;cutoff 5
	note C_, 8
	rest 7
	dec_octave
	;cutoff 8
	note F_, 8
	inc_octave
	;cutoff 5
	note G_, 7
	dec_octave
	;cutoff 8
	note E_, 8
	note D_, 7
	rest 8
	sound_loop 4, .Loop1
	note C_, 7
	rest 8
	note G_, 7
	inc_octave
	;cutoff 5
	note G_, 8
	rest 7
	dec_octave
	;cutoff 8
	note C_, 8
	inc_octave
	;cutoff 5
	note E_, 7
	dec_octave
	dec_octave
	;cutoff 8
	note G_, 8
	inc_octave
	note C_, 7
	inc_octave
	;cutoff 5
	note C_, 8
	rest 7
	dec_octave
	;cutoff 8
	note F_, 8
	inc_octave
	;cutoff 5
	note G_, 7
	dec_octave
	;cutoff 8
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


Music_DeckMachine_Ch4: ; f7018 (3d:7018)
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
; 0xf703a
