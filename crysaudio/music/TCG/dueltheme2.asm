Music_DuelTheme2:
	channel_count 4
	channel 1, Music_DuelTheme2_Ch1
	channel 2, Music_DuelTheme2_Ch2
	channel 3, Music_DuelTheme2_Ch3
	channel 4, Music_DuelTheme2_Ch4

Music_DuelTheme2_Ch1:
	speed 9
	stereo_panning TRUE, TRUE
;	vibrato_type 8
	vibrato 20, 3, 3
;	cutoff 8
	octave 1
	duty_cycle 1
	volume_envelope 9, 4
.Loop1
	note D_, 2
	note D_, 1
	sound_loop 8, .Loop1
.MainLoop
	octave 1
.Loop2
	note D_, 2
	note D_, 1
	sound_loop 23, .Loop2
	duty_cycle 1
	volume_envelope 10, 0
	inc_octave
	inc_octave
	speed 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	speed 9
	sound_call Branch_f5f3d
	note C_, 6
;	tie
	speed 1
	note C_, 12
	volume_envelope 3, 7
	note C_, 6
	volume_envelope 10, 0
	dec_octave
	note B_, 12
	volume_envelope 3, 7
	note B_, 6
	volume_envelope 10, 0
	note G_, 12
	volume_envelope 3, 7
	note G_, 6
	speed 9
	volume_envelope 10, 0
;	cutoff 8
	note A_, 1
	volume_envelope 3, 7
	note A_, 1
	volume_envelope 10, 0
;	cutoff 6
	note D_, 1
;	cutoff 8
	note D_, 9
;	tie
	note D_, 9
	volume_envelope 4, 7
	note D_, 3
	duty_cycle 2
;	cutoff 8
	volume_envelope 2, -7
	note E_, 4
	volume_envelope 6, 0
	note E_, 7
	volume_envelope 2, 7
	note E_, 1
	volume_envelope 5, -7
	note G_, 4
	volume_envelope 8, 0
	speed 1
	note G_, 12
	volume_envelope 2, 7
	note G_, 6
	inc_octave
	speed 9
	volume_envelope 7, -7
;	cutoff 8
	note C_, 3
	duty_cycle 1
	volume_envelope 10, 0
	dec_octave
	speed 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	speed 9
	sound_call Branch_f5f3d
;	cutoff 8
	note C_, 4
;	tie
	speed 1
	note C_, 4
	note E_, 5
	note F_, 4
	note F#, 5
	note G_, 12
	volume_envelope 3, 7
	note G_, 6
	volume_envelope 10, 0
	note E_, 12
	volume_envelope 3, 7
	note E_, 6
	speed 9
	volume_envelope 10, 0
;	cutoff 8
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	volume_envelope 10, 0
	note D_, 1
	volume_envelope 3, 7
	note D_, 1
	dec_octave
	volume_envelope 10, 0
;	cutoff 6
	note A_, 1
	inc_octave
;	cutoff 8
	note D_, 9
;	tie
	note D_, 10
	volume_envelope 3, 7
	note D_, 1
	volume_envelope 10, 0
	speed 1
;	cutoff 8
	note D_, 4
	note D#, 5
	speed 9
	note E_, 11
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	inc_octave
;	cutoff 8
	note C_, 3
	dec_octave
	speed 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	sound_call Branch_f5f90
	note D_, 1
	volume_envelope 3, 7
	note D_, 1
	duty_cycle 1
	volume_envelope 9, 4
	octave 1
	note D_, 1
.Loop3
	note D_, 2
	note D_, 1
	sound_loop 3, .Loop3
	duty_cycle 2
	volume_envelope 6, -3
	inc_octave
	inc_octave
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	note G_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note B_, 1
	note D_, 1
	note B_, 1
	duty_cycle 1
	volume_envelope 10, 0
	sound_call Branch_f5f62
	octave 4
	volume_envelope 4, 7
	note F#, 12
	volume_envelope 10, 0
	note C#, 9
	volume_envelope 4, 7
	note C#, 1
	volume_envelope 10, 0
	note C#, 1
	note D_, 1
	note E_, 3
	note D_, 3
	note C#, 3
	dec_octave
;	cutoff 6
	note B_, 3
;	cutoff 8
	note B_, 4
	volume_envelope 4, 7
	note B_, 1
	inc_octave
	volume_envelope 10, 0
	speed 1
	note C#, 4
	dec_octave
	note B_, 5
	speed 9
	note A_, 6
	volume_envelope 4, 7
	note A_, 1
	duty_cycle 1
	volume_envelope 9, 3
;	cutoff 8
	note D_, 2
	note D_, 2
	rest 2
	note C#, 2
	duty_cycle 1
	volume_envelope 10, 0
;	cutoff 8
	sound_call Branch_f5f62
	octave 4
	volume_envelope 4, 7
	note F#, 6
	dec_octave
	volume_envelope 10, 0
	note B_, 2
	inc_octave
	note C#, 2
	note D_, 1
	volume_envelope 4, 7
	note D_, 1
	volume_envelope 10, 0
	note D_, 9
	volume_envelope 4, 7
	note D_, 1
	volume_envelope 10, 0
;	cutoff 7
	note C#, 1
	note D_, 1
;	cutoff 8
	note E_, 3
	note D_, 3
	note C#, 3
	dec_octave
;	cutoff 6
	note A_, 3
	inc_octave
;	cutoff 8
	note F_, 10
;	cutoff 7
	note E_, 1
	note F_, 1
;	cutoff 8
	note G_, 3
	note F_, 3
	note E_, 3
	speed 1
	note C_, 2
;	tie
	note C_, 16
	volume_envelope 4, 7
	note C_, 9
	speed 9
	volume_envelope 10, 0
;	cutoff 8
	note A_, 10
;	cutoff 7
	note G_, 1
	note F_, 1
;	cutoff 8
	note G_, 6
	inc_octave
	note C_, 3
	dec_octave
	speed 1
	note C_, 3
	note D_, 4
	note E_, 3
	note F_, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 3
	sound_call Branch_f5f90
	note D_, 1
	volume_envelope 3, 7
	note D_, 1
	duty_cycle 1
	volume_envelope 9, 4
	octave 1
	note D_, 1
.Loop4
	note D_, 2
	note D_, 1
	sound_loop 3, .Loop4
	duty_cycle 1
	volume_envelope 10, 0
;	cutoff 8
	octave 5
	note D_, 1
	note C_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C_, 1
	dec_octave
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note D_, 12
;	tie
	note D_, 12
	duty_cycle 1
	volume_envelope 9, 4
	sound_loop 0, .MainLoop

Branch_f5f3d:
;	cutoff 8
	note D_, 12
;	tie
	note D_, 4
;	tie
	speed 1
	note D_, 7
	volume_envelope 4, 7
	note D_, 2
;	tie
	speed 9
	note D_, 1
	dec_octave
	volume_envelope 10, 0
	note A_, 4
;	tie
	speed 1
	note A_, 7
	volume_envelope 4, 7
	note A_, 2
;	tie
	speed 9
	note A_, 1
	inc_octave
	volume_envelope 10, 0
	note C_, 12
;	tie
	sound_ret

Branch_f5f62:
	octave 3
	speed 1
	note C#, 3
	note D_, 4
	note E_, 3
	note F#, 4
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C#, 3
	speed 9
	note D_, 2
	note C#, 2
	dec_octave
	note A_, 2
	note F#, 5
	volume_envelope 4, 7
	note F#, 1
	inc_octave
	volume_envelope 10, 0
	note D_, 2
	note C#, 2
	dec_octave
	note A_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 1
	volume_envelope 4, 7
	note B_, 1
	volume_envelope 10, 0
	inc_octave
;	cutoff 6
	note F#, 1
;	cutoff 8
	note F#, 9
	sound_ret

Branch_f5f90:
	octave 5
	speed 9
.Loop5
	note D_, 1
	volume_envelope 3, 7
	note D_, 1
	duty_cycle 1
	volume_envelope 9, 4
	octave 1
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	duty_cycle 1
	volume_envelope 10, 0
	octave 5
	note C_, 4
	sound_loop 3, .Loop5
	sound_ret


Music_DuelTheme2_Ch2:
	speed 9
	stereo_panning TRUE, TRUE
;	vibrato_type 8
	vibrato 15, 3, 3
;	cutoff 8
	octave 2
	duty_cycle 1
	volume_envelope 7, 4
;	frequency_offset 5
.Loop1
	note D_, 2
	note D_, 1
	sound_loop 8, .Loop1
.MainLoop
.Loop2
	note D_, 2
	note D_, 1
	sound_loop 24, .Loop2
	duty_cycle 2
	volume_envelope 6, -3
;	frequency_offset 0
.Loop3
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	sound_loop 12, .Loop3
.Loop4
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	sound_loop 10, .Loop4
	inc_octave
	note C_, 1
	note G_, 1
	inc_octave
	note C_, 1
	note G_, 1
	duty_cycle 1
	volume_envelope 7, 0
	dec_octave
	note D_, 1
	rest 1
	dec_octave
;	cutoff 6
	note A_, 1
;	cutoff 8
	note A_, 9
	duty_cycle 2
	volume_envelope 6, -3
.Loop5
	note A_, 1
	note D_, 1
	note A_, 1
	sound_loop 4, .Loop5
	duty_cycle 2
	inc_octave
;	cutoff 8
	volume_envelope 2, -7
	note C_, 4
	volume_envelope 6, 0
	note C_, 7
	rest 1
	volume_envelope 5, -7
	note E_, 4
	speed 1
	volume_envelope 8, 0
	note E_, 12
	rest 6
	speed 9
	volume_envelope 7, -7
	note G_, 3
	dec_octave
	duty_cycle 1
	volume_envelope 7, 0
	speed 1
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note G_, 3
	speed 9
	duty_cycle 2
	volume_envelope 6, -3
.Loop6
	note A_, 1
	note D_, 1
	sound_loop 9, .Loop6
.Loop7
	note D_, 1
	dec_octave
	note A_, 1
	inc_octave
	sound_loop 3, .Loop7
.Loop8
	note G_, 1
	note C_, 1
	sound_loop 8, .Loop8
	speed 1
	note G_, 4
	duty_cycle 1
	volume_envelope 7, 0
	inc_octave
	note C_, 5
	note D_, 4
	note D#, 5
	speed 1
	note E_, 12
	rest 6
	note C_, 12
	rest 6
	speed 9
	dec_octave
	note G_, 1
	rest 1
	note A_, 1
	rest 1
;	cutoff 6
	note D_, 1
;	cutoff 8
	note A_, 9
	duty_cycle 2
	volume_envelope 6, -3
.Loop9
	note A_, 1
	note D_, 1
	sound_loop 5, .Loop9
	note A_, 1
	duty_cycle 1
	volume_envelope 7, 0
	speed 1
	note A#, 4
	note B_, 5
	speed 9
	inc_octave
	note C_, 11
	rest 1
	note E_, 5
	rest 1
	note G_, 3
	dec_octave
	speed 1
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note G_, 3
	sound_call Branch_f618f
	note A_, 1
	rest 1
	duty_cycle 1
	volume_envelope 7, 4
;	frequency_offset 5
	dec_octave
	dec_octave
	note D_, 1
.Loop10
	note D_, 2
	note D_, 1
	sound_loop 3, .Loop10
	duty_cycle 2
	volume_envelope 6, -3
;	frequency_offset 0
	inc_octave
	note E_, 1
	rest 1
	note E_, 1
	note F#, 1
	rest 1
	note F#, 1
	note G_, 1
	rest 1
	note G_, 1
	inc_octave
	note C#, 1
	dec_octave
	note E_, 1
	inc_octave
	note C#, 1
	duty_cycle 2
	volume_envelope 6, -3
	sound_call Branch_f6173
	octave 4
.Loop11
	note D_, 1
	dec_octave
	note G_, 1
	note B_, 1
	note D_, 1
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	inc_octave
	sound_loop 4, .Loop11
.Loop12
	note C#, 1
	dec_octave
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	sound_loop 2, .Loop12
	duty_cycle 1
	volume_envelope 9, 3
	octave 2
	rest 1
;	cutoff 8
	note B_, 2
	note B_, 2
	rest 2
	note A_, 2
	inc_octave
;	cutoff 8
	note C#, 1
	note D_, 1
	note E_, 1
	duty_cycle 2
	volume_envelope 6, -3
	sound_call Branch_f6173
	octave 3
.Loop13
	note B_, 1
	note D_, 1
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	dec_octave
	note G_, 1
	inc_octave
	sound_loop 2, .Loop13
.Loop14
	inc_octave
	note C#, 1
	dec_octave
	note E_, 1
	note A_, 1
	note C#, 1
	note E_, 1
	dec_octave
	note A_, 1
	inc_octave
	sound_loop 2, .Loop14
.Loop15
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	sound_loop 2, .Loop15
.Loop16
	inc_octave
	note E_, 1
	dec_octave
	note G_, 1
	inc_octave
	note C_, 1
	dec_octave
	note E_, 1
	note G_, 1
	note C_, 1
	sound_loop 2, .Loop16
	inc_octave
	note D_, 1
	dec_octave
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	note C_, 1
	dec_octave
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	note E_, 1
	dec_octave
	note G_, 1
	inc_octave
	note C_, 1
	dec_octave
	note E_, 1
	note G_, 1
	note C_, 1
	inc_octave
	note E_, 1
	dec_octave
	note G_, 1
	inc_octave
	note C_, 1
	duty_cycle 1
	volume_envelope 7, 0
	dec_octave
	speed 1
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note G_, 3
	sound_call Branch_f618f
	note A_, 1
	rest 1
	duty_cycle 1
	volume_envelope 7, 4
;	frequency_offset 5
	dec_octave
	dec_octave
	note D_, 1
.Loop17
	note D_, 2
	note D_, 1
	sound_loop 3, .Loop17
	rest 12
	duty_cycle 1
	volume_envelope 7, 0
;	frequency_offset 0
	inc_octave
	note A_, 12
;	tie
	note A_, 12
	dec_octave
	duty_cycle 1
	volume_envelope 7, 4
;	frequency_offset 5
	sound_loop 0, .MainLoop

Branch_f6173:
	octave 4
.Loop18
	note C#, 1
	dec_octave
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	dec_octave
	note A_, 1
	inc_octave
	inc_octave
	sound_loop 4, .Loop18
.Loop19
	note D_, 1
	dec_octave
	note G_, 1
	note B_, 1
	note D_, 1
	note G_, 1
	dec_octave
	note B_, 1
	inc_octave
	inc_octave
	sound_loop 4, .Loop19
	sound_ret

Branch_f618f:
	octave 4
	speed 9
.Loop20
	note A_, 1
	rest 1
	volume_envelope 7, 4
;	frequency_offset 5
	dec_octave
	dec_octave
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 2
	volume_envelope 7, 0
;	frequency_offset 0
	inc_octave
	inc_octave
	note G_, 4
	sound_loop 3, .Loop20
	sound_ret


Music_DuelTheme2_Ch3:
	speed 9
	stereo_panning TRUE, TRUE
	channel_volume 1
	fade_wave 11
;	echo 64
;	cutoff 7
	octave 2
.Loop1
	sound_call Branch_f62e5
	sound_loop 4, .Loop1
.MainLoop
.Loop2
	sound_call Branch_f62e5
	sound_loop 44, .Loop2
.Loop3
	sound_call Branch_f62e5
	sound_call Branch_f62e5
	sound_call Branch_f62e5
	octave 2
;	cutoff 4
	note D_, 2
;	cutoff 7
	note C_, 3
	note E_, 1
	sound_loop 3, .Loop3
.Loop4
	sound_call Branch_f62e5
	sound_loop 2, .Loop4
	octave 2
;	cutoff 8
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	note F#, 1
	inc_octave
	note F#, 1
	dec_octave
	note F#, 1
	note G_, 1
	inc_octave
	note G_, 1
	dec_octave
	note G_, 1
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
.Loop5
	sound_call Branch_f62e5
	sound_loop 4, .Loop5
	octave 2
.Loop6
;	cutoff 4
	note E_, 2
;	cutoff 7
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	sound_loop 4, .Loop6
.Loop7
;	cutoff 4
	note A_, 2
;	cutoff 7
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	sound_loop 4, .Loop7
.Loop8
	sound_call Branch_f62e5
	sound_loop 2, .Loop8
	octave 2
;	cutoff 8
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note A_, 1
	inc_octave
	note E_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
.Loop9
	sound_call Branch_f62e5
	sound_loop 4, .Loop9
	octave 2
.Loop10
;	cutoff 4
	note E_, 2
;	cutoff 7
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	sound_loop 4, .Loop10
.Loop11
;	cutoff 4
	note G_, 2
;	cutoff 7
	note G_, 1
	inc_octave
	note G_, 1
	dec_octave
	note G_, 1
	inc_octave
	note G_, 1
	dec_octave
	sound_loop 2, .Loop11
.Loop12
;	cutoff 4
	note A_, 2
;	cutoff 7
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	dec_octave
	sound_loop 2, .Loop12
.Loop13
;	cutoff 4
	note A#, 2
;	cutoff 7
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	sound_loop 2, .Loop13
	inc_octave
.Loop14
;	cutoff 4
	note C_, 2
;	cutoff 7
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	sound_loop 2, .Loop14
	dec_octave
.Loop15
;	cutoff 4
	note A#, 2
;	cutoff 7
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	note A#, 1
	inc_octave
	note A#, 1
	dec_octave
	sound_loop 2, .Loop15
	inc_octave
.Loop16
;	cutoff 4
	note C_, 2
;	cutoff 7
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	sound_loop 2, .Loop16
.Loop17
	sound_call Branch_f62e5
	sound_call Branch_f62e5
	sound_call Branch_f62e5
	octave 2
;	cutoff 4
	note D_, 2
;	cutoff 7
	note C_, 3
	note E_, 1
	sound_loop 3, .Loop17
.Loop18
	sound_call Branch_f62e5
	sound_loop 2, .Loop18
	octave 3
;	cutoff 8
	note D_, 1
	note C_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C_, 1
	dec_octave
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 1
.Loop19
	sound_call Branch_f62e5
	sound_loop 4, .Loop19
	sound_loop 0, .MainLoop

Branch_f62e5:
	octave 2
;	cutoff 4
	note D_, 2
;	cutoff 7
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note D_, 1
	inc_octave
	note D_, 1
	sound_ret


Music_DuelTheme2_Ch4:
	toggle_noise 6
	drum_speed 9
.Loop1
	rest 12
	sound_loop 2, .Loop1
.MainLoop
	rest 12
	rest 6
.Loop2
	drum_note 2, 1
	sound_loop 6, .Loop2
.Loop3
	sound_call Branch_f637c
	sound_loop 3, .Loop3
	drum_note 1, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
.Loop4
	drum_note 2, 1
	sound_loop 6, .Loop4
.Loop5
	sound_call Branch_f637c
	sound_loop 15, .Loop5
	sound_call Branch_f6396
.Loop6
	sound_call Branch_f637c
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 2
	drum_note 6, 3
	drum_note 2, 1
	sound_loop 3, .Loop6
	drum_note 1, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_speed 1
	drum_note 4, 4
	drum_note 3, 5
	drum_speed 9
	drum_note 2, 3
.Loop7
	drum_note 2, 1
	sound_loop 12, .Loop7
.Loop8
	sound_call Branch_f637c
	sound_call Branch_f6389
	sound_loop 3, .Loop8
	sound_call Branch_f637c
	drum_note 1, 1
	drum_note 2, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 1, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 5
	drum_speed 9
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
.Loop9
	sound_call Branch_f637c
	sound_call Branch_f6389
	sound_loop 4, .Loop9
	sound_call Branch_f637c
	sound_call Branch_f6396
.Loop10
	sound_call Branch_f637c
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 2
	drum_note 6, 3
	drum_note 2, 1
	sound_loop 3, .Loop10
	sound_call Branch_f637c
.Loop11
	drum_note 2, 1
	sound_loop 12, .Loop11
	drum_note 6, 12
	rest 12
	sound_loop 0, .MainLoop

Branch_f637c:
	drum_note 1, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	sound_ret

Branch_f6389:
	drum_note 1, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 2, 1
	sound_ret

Branch_f6396:
	drum_note 1, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 4, 1
.Loop12
	drum_note 2, 1
	sound_loop 6, .Loop12
	sound_ret
