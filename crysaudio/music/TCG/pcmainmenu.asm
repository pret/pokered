Music_PCMainMenu:
	channel_count 4
	channel 1, Music_PCMainMenu_Ch1
	channel 2, Music_PCMainMenu_Ch2
	channel 3, Music_PCMainMenu_Ch3
	channel 4, Music_PCMainMenu_Ch4

Music_PCMainMenu_Ch1: ; f9052 (3e:5052)
	notetype0 7
	;stereo_panning 1, 1
	notetype2 8
	octave 3
	duty_cycle 2
.MainLoop
	sound_call Branch_f90c2
	rest 4
	dec_octave
	duty_cycle 1
	notetype2 5
	notetype1 6
	note F_, 1
	rest 1
	duty_cycle 2
	notetype2 8
	notetype1 12
	note A_, 1
	notetype1 3
	note A_, 1
	rest 2
	inc_octave
	notetype1 12
	note C_, 1
	notetype1 3
	note C_, 1
	dec_octave
	duty_cycle 1
	notetype2 5
	notetype1 6
	note F_, 1
	rest 1
	duty_cycle 2
	notetype2 8
	notetype1 12
	note B_, 1
	notetype1 3
	note B_, 1
	sound_call Branch_f90c2
	rest 4
	dec_octave
	duty_cycle 1
	notetype2 5
	notetype1 6
	note F_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype2 8
	notetype1 12
	note E_, 1
	notetype1 3
	note E_, 1
	rest 2
	notetype1 12
	note C_, 1
	notetype1 3
	note C_, 1
	duty_cycle 1
	notetype2 5
	notetype1 6
	dec_octave
	note F_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype2 8
	notetype1 12
	note D_, 1
	notetype1 3
	note D_, 1
	sound_loop 0, .MainLoop

Branch_f90c2:
	octave 3
	rest 4
	duty_cycle 1
	notetype1 6
	notetype2 5
	note G_, 1
	rest 3
	notetype2 8
	duty_cycle 2
	notetype1 12
	note B_, 2
	inc_octave
	note D_, 1
	notetype1 2
	note D_, 1
	dec_octave
	duty_cycle 1
	notetype1 6
	notetype2 5
	note G_, 1
	rest 1
	inc_octave
	duty_cycle 2
	notetype2 8
	notetype1 12
	note C_, 1
	notetype1 3
	note C_, 1
	sound_ret


Music_PCMainMenu_Ch2: ; f90ed (3e:50ed)
	notetype0 7
	;stereo_panning 1, 1
	notetype2 8
	octave 3
	duty_cycle 2
.MainLoop
	sound_call Branch_f915e
	rest 4
	inc_octave
	duty_cycle 1
	notetype2 5
	notetype1 6
	note C_, 1
	rest 1
	dec_octave
	duty_cycle 2
	notetype2 8
	notetype1 8
	note F_, 1
	notetype1 2
	note F_, 1
	rest 2
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	duty_cycle 1
	notetype2 5
	notetype1 6
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	duty_cycle 2
	notetype2 8
	notetype1 8
	note G_, 1
	notetype1 2
	note G_, 1
	sound_call Branch_f915e
	rest 4
	inc_octave
	duty_cycle 1
	notetype2 5
	notetype1 6
	note C_, 1
	rest 1
	duty_cycle 2
	notetype2 8
	notetype1 8
	note C_, 1
	notetype1 2
	note C_, 1
	rest 2
	dec_octave
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	duty_cycle 1
	inc_octave
	notetype1 6
	notetype2 5
	note C_, 1
	rest 1
	dec_octave
	duty_cycle 2
	notetype2 8
	notetype1 8
	note B_, 1
	notetype1 2
	note B_, 1
	sound_loop 0, .MainLoop

Branch_f915e:
	octave 4
	rest 4
	duty_cycle 1
	notetype2 5
	notetype1 6
	note D_, 1
	rest 3
	duty_cycle 2
	notetype2 8
	dec_octave
	notetype1 8
	note G_, 2
	note B_, 1
	notetype1 2
	note B_, 1
	inc_octave
	duty_cycle 1
	notetype2 5
	notetype1 6
	note D_, 1
	rest 1
	dec_octave
	duty_cycle 2
	notetype2 8
	notetype1 8
	note A_, 1
	notetype1 2
	note A_, 1
	sound_ret


Music_PCMainMenu_Ch3: ; f9189 (3e:5189)
	notetype0 7
	notetype1 1
	;stereo_panning 1, 1
	notetype2 11
	;cutoff 7
	;echo 0
.MainLoop
	octave 2
	;cutoff 7
	note G_, 1
	rest 1
	;cutoff 8
	note G_, 1
	rest 1
	notetype0 1
	note A#, 4
	;tie
	note B_, 3
	;tie
	notetype0 7
	note B_, 1
	rest 1
	;cutoff 4
	inc_octave
	note C_, 1
	rest 1
	note C_, 1
	;cutoff 8
	note C#, 2
	note D_, 2
	dec_octave
	note G_, 1
	;tie
	note F#, 1
	;cutoff 7
	note F_, 1
	rest 1
	;cutoff 8
	note F_, 1
	rest 1
	notetype0 1
	note G#, 4
	;tie
	note A_, 3
	;tie
	notetype0 7
	note A_, 1
	rest 1
	;cutoff 4
	note A#, 1
	rest 1
	note A#, 1
	;cutoff 8
	note B_, 2
	inc_octave
	note C_, 2
	dec_octave
	note F_, 1
	;tie
	note F#, 1
	;cutoff 7
	note G_, 1
	rest 1
	;cutoff 8
	note G_, 1
	rest 1
	notetype0 1
	note A#, 4
	;tie
	note B_, 3
	;tie
	notetype0 7
	note B_, 1
	rest 1
	;cutoff 4
	inc_octave
	note C_, 1
	rest 1
	note C_, 1
	;cutoff 8
	note C#, 2
	note D_, 2
	dec_octave
	note G_, 1
	;tie
	note F#, 1
	;cutoff 7
	note F_, 1
	rest 1
	;cutoff 8
	note F_, 1
	rest 1
	notetype0 1
	note B_, 4
	;tie
	inc_octave
	note C_, 3
	;tie
	notetype0 7
	note C_, 1
	rest 1
	;cutoff 8
	notetype0 1
	note F#, 4
	;tie
	note G_, 3
	;tie
	notetype0 7
	note G_, 1
	;cutoff 4
	note F_, 1
	;cutoff 8
	note C_, 2
	note F_, 2
	notetype0 1
	note C_, 3
	;tie
	dec_octave
	note B_, 3
	;tie
	note A#, 3
	;tie
	note A_, 3
	;tie
	note G#, 2
	notetype0 7
	sound_loop 0, .MainLoop


Music_PCMainMenu_Ch4: ; f922b (3e:522b)
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
; 0xf9251
