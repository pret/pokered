Music_Imakuni:
	channel_count 4
	channel 1, Music_Imakuni_Ch1
	channel 2, Music_Imakuni_Ch2
	channel 3, Music_Imakuni_Ch3
	channel 4, Music_Imakuni_Ch4

Music_Imakuni_Ch1: ; fad55 (3e:6d55)
	notetype0 3
	;stereo_panning 1, 1
	;vibrato_type 5
	vibrato 20, 3, 3
	notetype2 8
	duty_cycle 2
	notetype1 10
.MainLoop
.Loop1
	rest 10
	sound_loop 16, .Loop1
	sound_call Branch_fadf9
	octave 4
	note D_, 15
	dec_octave
	note B_, 7
	rest 8
	note G_, 7
	rest 8
	notetype0 9
	note F_, 10
	;tie
	notetype0 1
	note F_, 7
	rest 8
	notetype0 9
	rest 10
	sound_call Branch_fadf9
	sound_call Branch_fae1d
	notetype0 1
	octave 4
	note E_, 7
	rest 15
	note E_, 3
	note C_, 2
	note E_, 3
	note C_, 15
	dec_octave
	note G#, 15
	note A_, 7
	rest 8
	notetype0 3
	rest 15
	notetype0 1
	rest 15
	rest 15
	inc_octave
	note E_, 7
	rest 8
	note F#, 7
	rest 8
	note G_, 15
	;tie
	note G_, 7
	note F#, 3
	note G_, 2
	note F#, 3
	note E_, 7
	rest 8
	note D#, 7
	rest 8
	note E_, 15
	note C_, 7
	rest 8
	dec_octave
	note G#, 7
	rest 8
	notetype0 7
	note F#, 15
	notetype0 9
	rest 10
	sound_call Branch_fadf9
	sound_call Branch_fae1d
	dec_octave
	notetype0 1
	note F_, 7
	rest 8
	note B_, 7
	inc_octave
	note C_, 8
	dec_octave
	note G#, 7
	note A_, 8
	note F_, 7
	rest 8
	note B_, 7
	inc_octave
	note C_, 8
	dec_octave
	note G#, 7
	note A_, 8
	notetype0 3
	note F_, 10
	notetype0 1
	note D#, 7
	rest 8
	note A_, 7
	note A#, 8
	note F#, 7
	note G_, 8
	note D#, 7
	rest 8
	note A_, 7
	note A#, 8
	note F#, 7
	note G_, 8
	notetype0 3
	note D#, 10
	notetype0 1
.Loop2
	note D_, 7
	dec_octave
	note A_, 8
	note D_, 7
	note A_, 8
	note D_, 7
	note A_, 8
	inc_octave
	sound_loop 4, .Loop2
	note D_, 7
	dec_octave
	note A_, 8
	note D_, 7
	note A_, 8
	vibrato 5, 3, 3
	notetype0 3
	note D_, 10
	vibrato 20, 3, 3
	sound_loop 0, .MainLoop

Branch_fadf9:
	notetype0 1
	octave 4
	note C#, 7
	rest 15
	note C#, 3
	note D_, 2
	note C#, 3
	dec_octave
	note A#, 15
	note B_, 15
	inc_octave
	note D_, 7
	rest 8
	notetype0 5
	rest 9
	notetype0 1
	rest 15
	rest 15
	note D_, 7
	rest 8
	note E_, 7
	rest 8
	note F_, 15
	;tie
	note F_, 7
	note E_, 3
	note F_, 2
	note E_, 3
	note D_, 7
	rest 8
	note C#, 7
	rest 8
	sound_ret

Branch_fae1d:
	octave 4
	note D_, 7
	rest 8
	dec_octave
	note G_, 7
	rest 8
	inc_octave
	note G_, 7
	rest 8
	notetype0 9
	note F_, 10
	;tie
	notetype0 1
	note F_, 7
	rest 8
	notetype0 9
	rest 10
	sound_ret


Music_Imakuni_Ch2: ; fae32 (3e:6e32)
	;stereo_panning 1, 1
	;vibrato_type 0
	vibrato 0, 3, 3
	notetype2 8
	duty_cycle 1
	notetype1 10
.Loop1
	sound_call Branch_faea5
	sound_loop 6, .Loop1
.Loop2
	rept 2
	notetype0 3
	rest 10
	notetype0 1
	note C_, 7
	rest 8
	endr
	rest 15
	note C_, 7
	rest 8
	notetype0 3
	rest 10
	notetype0 1
	note C_, 7
	rest 8
	rest 15
	notetype0 3
	rest 10
	vibrato 8, 3, 3
	note C_, 10
	vibrato 0, 3, 3
	sound_loop 2, .Loop2
.Loop3
	sound_call Branch_faea5
	sound_loop 2, .Loop3
	notetype0 1
	octave 2
	note F_, 15
	;tie
	note F_, 7
	inc_octave
	note F_, 8
	note D#, 7
	rest 8
	rest 15
	note G#, 7
	note A_, 8
	note F_, 7
	note D#, 8
	notetype0 3
	rest 10
	notetype0 1
	dec_octave
	note D#, 15
	;tie
	note D#, 7
	inc_octave
	note D#, 8
	note C#, 7
	rest 8
	rest 15
	note F#, 7
	note G_, 8
	note D#, 7
	note C#, 8
	notetype0 3
	rest 10
	notetype0 1
.Loop4
	note D_, 7
	rest 8
	rept 2
	rest 15
	endr
	sound_loop 4, .Loop4
	note D_, 7
	rest 8
	rest 15
	vibrato 5, 3, 3
	note D_, 15
	;tie
	note D_, 7
	rest 8
	vibrato 0, 3, 3
	sound_loop 0, Music_Imakuni_Ch2

Branch_faea5:
	octave 3
	notetype0 6
	rest 10
	notetype0 1
	rept 2
	rest 15
	note C#, 7
	rest 8
	endr
	vibrato 8, 3, 3
	notetype0 9
	rest 10
	notetype0 3
	note C#, 10
	vibrato 0, 3, 3
	sound_ret


Music_Imakuni_Ch3: ; faebc (3e:6ebc)
	;stereo_panning 1, 1
	notetype1 1
	notetype2 11
	;vibrato_type 6
	vibrato 0, 3, 3
	;echo 0
	;cutoff 8
.MainLoop
	sound_call Branch_faf7d
	vibrato 8, 3, 3
	notetype0 1
	note D_, 15
	;tie
	note D_, 7
	inc_octave
	vibrato 0, 3, 3
	note G_, 3
	dec_octave
	note G_, 2
	dec_octave
	note G_, 3
	sound_call Branch_faf7d
	vibrato 8, 3, 3
	note D_, 10
	vibrato 0, 3, 3
.Loop1
	sound_call Branch_faf7d
	vibrato 8, 3, 3
	note D_, 10
	vibrato 0, 3, 3
	sound_loop 4, .Loop1
.Loop2
	octave 3
	notetype0 3
	note C_, 5
	rest 5
	inc_octave
	notetype0 1
	note E_, 7
	rest 8
	dec_octave
	notetype0 3
	note G#, 5
	note A_, 5
	inc_octave
	notetype0 1
	note D#, 7
	rest 8
	rest 15
	note D#, 7
	rest 8
	notetype0 3
	rest 5
	dec_octave
	note C_, 5
	inc_octave
	notetype0 1
	note E_, 7
	rest 8
	dec_octave
	notetype0 3
	note G#, 5
	note A_, 5
	rest 5
	inc_octave
	vibrato 8, 3, 3
	note D#, 10
	vibrato 0, 3, 3
	sound_loop 2, .Loop2
.Loop3
	sound_call Branch_faf7d
	vibrato 8, 3, 3
	note D_, 10
	vibrato 0, 3, 3
	sound_loop 2, .Loop3
	notetype0 1
	octave 2
	note F_, 15
	;tie
	note F_, 7
	inc_octave
	note F_, 8
	note D#, 7
	rest 8
	note F_, 7
	rest 8
	note G#, 7
	note A_, 8
	note F_, 7
	note D#, 8
	vibrato 5, 3, 3
	notetype0 3
	note F_, 10
	vibrato 0, 3, 3
	notetype0 1
	dec_octave
	note D#, 15
	;tie
	note D#, 7
	inc_octave
	note D#, 8
	note C#, 7
	rest 8
	note D#, 7
	rest 8
	note F#, 7
	note G_, 8
	note D#, 7
	note C#, 8
	vibrato 5, 3, 3
	notetype0 3
	note D#, 10
	vibrato 0, 3, 3
	notetype0 1
.Loop4
	octave 4
	note C_, 7
	rest 8
	octave 2
	note D_, 7
	rest 8
	note D_, 7
	rest 8
	sound_loop 4, .Loop4
	octave 4
	note C_, 7
	rest 8
	octave 2
	note D_, 7
	rest 8
	octave 4
	vibrato 5, 3, 3
	note C_, 15
	;tie
	note C_, 7
	inc_octave
	vibrato 0, 3, 3
	note G_, 3
	dec_octave
	note G_, 2
	dec_octave
	note G_, 3
	notetype0 8
	sound_loop 0, .MainLoop

Branch_faf7d:
	notetype0 3
	octave 2
	note G_, 5
	rest 5
	inc_octave
	notetype0 1
	note G_, 7
	rest 8
	notetype0 3
	note C#, 5
	note D_, 5
	inc_octave
	notetype0 1
	note D_, 7
	rest 8
	rest 15
	note D_, 7
	rest 8
	notetype0 3
	rest 5
	octave 2
	note G_, 5
	inc_octave
	notetype0 1
	note G_, 7
	rest 8
	notetype0 3
	note C#, 5
	note D_, 5
	rest 5
	inc_octave
	sound_ret


Music_Imakuni_Ch4: ; fafa4 (3e:6fa4)
	toggle_noise 6
.MainLoop
	drum_speed 1
	octave 1
.Loop1
	drum_note 1, 15
	drum_note 4, 7
	drum_note 1, 8
	drum_note 2, 15
	drum_note 1, 15
	drum_note 4, 7
	drum_note 4, 8
	drum_note 5, 15
	drum_note 4, 7
	drum_note 4, 8
	drum_note 5, 15
	drum_note 4, 15
	drum_note 1, 15
	drum_note 2, 15
	drum_note 5, 15
	drum_note 1, 7
	drum_note 4, 8
	drum_note 2, 15
	drum_note 2, 15
	drum_note 4, 7
	drum_note 2, 8
	sound_loop 10, .Loop1
.Loop2
	drum_speed 11
	drum_note 6, 2
	drum_speed 1
	drum_note 2, 8
	drum_note 2, 15
	drum_note 2, 15
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_speed 3
	drum_note 6, 10
	sound_loop 2, .Loop2
	drum_speed 1
	drum_note 2, 15
	drum_note 4, 7
	drum_note 2, 8
	drum_note 5, 15
	drum_note 2, 15
	drum_note 4, 7
	drum_note 2, 8
	drum_note 5, 15
	drum_note 2, 15
	drum_note 4, 7
	drum_note 2, 8
	drum_note 5, 15
	drum_note 2, 15
	drum_note 4, 7
	drum_note 2, 8
	drum_note 5, 15
	drum_note 2, 15
	drum_note 4, 4
	drum_note 4, 4
	drum_note 2, 7
	drum_note 2, 15
	drum_note 2, 15
	sound_loop 0, .MainLoop
; 0xfafea
