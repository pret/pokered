Music_Fort4:
	channel_count 4
	channel 1, Music_Fort4_Ch1
	channel 2, Music_Fort4_Ch2
	channel 3, Music_Fort4_Ch3
	channel 4, Music_Fort4_Ch4

Music_Fort4_Ch2:
;	preset 22
	volume_envelope 9, 0
	duty_cycle 0
	vibrato 80, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 2
	note C_, 16
.MainLoop
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
;	musicef -1
;	musicf1 71
	octave 2
	speed 4
;	cutoff 7
;	musicf2
.Loop1
	note D_, 1
	note D_, 3
	rest 4
	inc_octave
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	dec_octave
	note D_, 1
	note D_, 3
	rest 4
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	rest 4
	note C_, 1
	note C_, 3
	sound_loop 4, .Loop1
	duty_cycle 1
	octave 3
;	cutoff 8
	speed 8
;	musicf1 103
;	musicf3
	volume_envelope 1, -6
	note E_, 14
	volume_envelope 11, 0
;	vibrato_type 5
	vibrato 1, 3, 3
;	musicf2
	note E_, 2
;	tie
	note E_, 6
	note E_, 2
;	musicf3
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
;	musicf2
	note E_, 4
	note E_, 2
;	musicf3
	volume_envelope 1, -5
	note D_, 10
	volume_envelope 11, 0
;	musicf2
	note D_, 14
	note D_, 2
;	musicf3
	volume_envelope 11, 0
	note D_, 4
	note D_, 2
;	musicf3
	volume_envelope 1, -6
	note G_, 10
	volume_envelope 11, 0
;	musicf2
	note G_, 6
	note G_, 2
;	musicf3
	note F_, 3
	note C_, 3
	note F_, 2
	vibrato 40, 3, 3
	speed 1
	note E_, 4
	speed 8
	speed 1
	note F_, 4
	speed 8
;	musicf2
	note E_, 5
;	tie
	note E_, 10
;	tie
	note E_, 12
	note E_, 4
;	musicf3
	volume_envelope 1, -6
	note E_, 14
	volume_envelope 11, 0
;	vibrato_type 5
	vibrato 1, 3, 3
;	musicf2
	note E_, 2
;	tie
	note E_, 6
	note E_, 2
;	musicf3
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
;	musicf2
	note A_, 4
	note A_, 2
;	musicf3
	volume_envelope 1, -5
	note G_, 10
	volume_envelope 11, 0
;	musicf2
	note G_, 14
	note G_, 2
;	musicf3
	vibrato 0, 3, 3
	volume_envelope 1, -4
;	musicf2
	note A_, 4
	note A_, 2
	volume_envelope 11, 0
;	musicf3
	note G_, 6
;	musicf2
	note D_, 2
	note D_, 2
	volume_envelope 1, -4
	note G_, 6
	note G_, 2
;	musicf3
	note F_, 4
	volume_envelope 11, 0
	note G_, 3
	speed 4
	note F_, 1
	note G_, 1
	speed 8
	vibrato 0, 3, 3
	volume_envelope 1, -5
	note F_, 7
	volume_envelope 11, 0
	vibrato 1, 3, 3
	note F_, 8
	vibrato 0, 3, 3
	speed 4
	note E_, 1
	note F_, 1
	speed 8
	vibrato 48, 3, 3
	note E_, 8
	volume_envelope 1, -3
	note F_, 4
	volume_envelope 11, 0
	note G_, 4
	volume_envelope 1, -5
	note A_, 6
	volume_envelope 11, 0
	note A_, 2
	volume_envelope 1, -5
	note G_, 6
	volume_envelope 11, 0
	note G_, 2
	volume_envelope 1, -5
	inc_octave
	note C_, 6
	volume_envelope 11, 0
	note C_, 2
	dec_octave
	volume_envelope 1, -5
	note G_, 6
	volume_envelope 11, 0
	note G_, 2
	volume_envelope 12, 0
;	musicf2
	note A_, 1
	note A_, 1
	rest 2
;	musicf3
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 3
;	musicf1 96
	speed 4
;	cutoff 7
;	musicf2
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	dec_octave
	note D_, 1
	note D_, 3
	rest 4
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	rest 4
	note C_, 1
	note C_, 3
.Loop2
	note D_, 1
	note D_, 3
	rest 4
	inc_octave
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	dec_octave
	note D_, 1
	note D_, 3
	rest 4
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	rest 4
	note C_, 1
	note C_, 3
	sound_loop 3, .Loop2
	duty_cycle 1
	octave 3
;	cutoff 8
	vibrato 0, 3, 3
	speed 8
;	musicf1 103
;	musicf3
.Loop3
	volume_envelope 1, -5
	note A_, 6
	volume_envelope 11, 0
	note A_, 2
	volume_envelope 1, -5
	note G_, 6
	volume_envelope 11, 0
	note G_, 2
	volume_envelope 1, -5
	inc_octave
	note C_, 6
	volume_envelope 11, 0
	note C_, 2
	dec_octave
	volume_envelope 1, -5
	note G_, 6
	volume_envelope 11, 0
	note G_, 2
	sound_loop 2, .Loop3
	volume_envelope 8, 0
	speed 1
	note A_, 4
	speed 8
	speed 1
	volume_envelope 9, 0
	note A#, 4
	speed 8
	vibrato 40, 3, 3
	volume_envelope 8, 0
	note A_, 15
	note A_, 16
;	tie
	note A_, 16
;	tie
	note A_, 8
	note A_, 1
	dec_octave
	speed 1
	volume_envelope 12, 0
;	musicf1 102
;	musicf3
	note A#, 8
	inc_octave
;	musicf2
	note C#, 5
	note C#, 3
	note E_, 5
	note E_, 3
	note G_, 5
	note G_, 3
	note A#, 5
	note A#, 3
	inc_octave
	note C#, 5
	note C#, 3
	note E_, 5
	note E_, 3
;	musicf3
	sound_loop 0, .MainLoop


Music_Fort4_Ch1:
	volume_envelope 15, 1
	duty_cycle 2
;	musicee 28
	stereo_panning TRUE, TRUE
	vibrato 0, 3, 3
	speed 1
	octave 3
;	musicef -6
	note G_, 5
;	musicef 2
	note G_, 5
;	musicef 4
	note G_, 6
	speed 8
	note G_, 4
;	musicee 0
	rest 12
.MainLoop
;	musicee 0
	speed 8
	rest 16
	rest 16
	rest 16
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
;	musicf1 23
	speed 4
	octave 4
;	musicf3
	rest 1
	rest 1
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	inc_octave
	note A_, 1
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	inc_octave
	note A_, 1
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note G#, 1
.Loop1
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note G_, 1
	rest 1
;	musicf2
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A#, 1
	rest 1
	note F_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	dec_octave
	note G_, 1
	rest 1
;	musicf2
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A#, 1
	sound_loop 2, .Loop1
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	inc_octave
	note A_, 1
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
.Loop2
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	sound_loop 3, .Loop2
	rest 1
	dec_octave
	note A_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note G_, 1
	rest 1
;	musicf2
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A#, 1
	rest 1
	note F_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	dec_octave
	note G_, 1
	rest 1
;	musicf2
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A#, 1
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note G_, 1
	rest 1
;	musicf2
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A#, 1
	rest 1
	note F_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	dec_octave
	note G_, 1
	rest 1
;	musicf2
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A#, 1
.Loop3
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note B_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note B_, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
	note F_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	dec_octave
	note B_, 1
	rest 1
;	musicf2
	inc_octave
	note D_, 1
	dec_octave
	note B_, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	sound_loop 2, .Loop3
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A#, 1
	rest 1
;	musicf2
	inc_octave
	note C#, 1
	dec_octave
	note A#, 1
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
	note F_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	dec_octave
	note A#, 1
	rest 1
;	musicf2
	inc_octave
	note C#, 1
	dec_octave
	note A#, 1
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
	note F_, 1
	dec_octave
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note C#, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	rest 1
	note F_, 1
;	preset 23
	volume_envelope 6, 7
	duty_cycle 2
	vibrato 28, 3, 3
	dec_octave
	note A_, 1
	rest 1
;	musicf2
	inc_octave
	note C#, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
;	musicf3
;	preset 24
	volume_envelope 2, 6
	duty_cycle 2
	vibrato 28, 3, 3
	note A_, 1
	duty_cycle 1
	octave 3
;	cutoff 8
	speed 8
;	musicf1 103
;	musicf3
	octave 3
	volume_envelope 1, -5
	note F_, 6
	volume_envelope 11, 0
	note F_, 2
	volume_envelope 1, -5
	note D_, 6
	volume_envelope 11, 0
	note D_, 2
	volume_envelope 1, -5
	note G_, 6
	volume_envelope 11, 0
	note G_, 2
	volume_envelope 1, -5
	note D_, 6
	volume_envelope 11, 0
	note D_, 2
	volume_envelope 12, 0
;	musicf2
	note E_, 1
	note E_, 1
	rest 1
;	musicf3
	volume_envelope 15, 1
	duty_cycle 2
;	musicee 28
	stereo_panning TRUE, TRUE
	vibrato 0, 3, 3
	speed 1
	octave 3
;	musicef -6
	note G_, 4
;	musicef 2
	note G_, 4
;	musicef 4
	speed 8
	note G_, 4
	rest 4
	inc_octave
	note C_, 4
	dec_octave
.Loop4
	speed 8
	rest 3
	speed 1
	octave 3
;	musicef -6
	note G_, 4
;	musicef 2
	note G_, 4
;	musicef 4
	speed 8
	note G_, 4
	inc_octave
	rest 4
	note C_, 4
	dec_octave
	sound_loop 3, .Loop4
;	musicee 0
	duty_cycle 1
	octave 3
;	cutoff 8
	speed 8
;	musicf1 103
;	musicf3
	octave 3
	volume_envelope 1, -5
	note D#, 6
	volume_envelope 11, 0
	note D#, 2
	volume_envelope 1, -5
	note C#, 6
	volume_envelope 11, 0
	note C#, 2
	volume_envelope 1, -5
	note G_, 6
	volume_envelope 11, 0
	note G_, 2
	volume_envelope 1, -5
	note C#, 6
	sound_call Branch_1f1c7c
	duty_cycle 1
	octave 3
;	cutoff 8
	speed 8
;	musicf1 103
;	musicf3
	octave 3
	volume_envelope 1, -5
	note E_, 6
	volume_envelope 11, 0
	note E_, 2
	volume_envelope 1, -5
	note D_, 6
	volume_envelope 11, 0
	note D_, 2
	volume_envelope 1, -5
	note G_, 6
	volume_envelope 11, 0
	note G_, 2
	volume_envelope 1, -5
	note D_, 6
	volume_envelope 11, 0
	note D_, 2
;	musicee 0
;	preset 4
	volume_envelope 10, 0
	duty_cycle 2
	vibrato 28, 3, 3
	octave 3
;	musicf1 80
;	musicf3
	speed 1
	note E_, 4
	note F_, 4
	speed 8
	note E_, 5
	sound_call Branch_1f1c69
;	preset 4
	volume_envelope 10, 0
	duty_cycle 2
	vibrato 28, 3, 3
	octave 3
;	musicf1 80
;	musicf3
;	musicef -4
	note E_, 2
;	musicef 4
;	musicf2
	note D_, 1
	note D_, 1
;	musicf3
	sound_call Branch_1f1c97
;	preset 4
	volume_envelope 10, 0
	duty_cycle 2
	vibrato 28, 3, 3
	octave 3
;	musicf1 80
	note E_, 1
	note E_, 2
;	musicf3
	note F_, 6
	sound_call Branch_1f1c69
;	preset 4
	volume_envelope 10, 0
	duty_cycle 2
	vibrato 28, 3, 3
	octave 3
;	musicf1 87
;	musicf3
;	musicef -4
	note F_, 2
;	musicef 4
;	musicf2
	note G_, 1
	note G_, 1
	sound_call Branch_1f1c97
;	preset 4
	volume_envelope 10, 0
	duty_cycle 2
	vibrato 28, 3, 3
	octave 3
;	musicf1 87
	note F_, 1
	note F_, 2
;	musicf3
	speed 1
	note E_, 4
	note F_, 4
	speed 8
	note E_, 5
	sound_call Branch_1f1c69
;	preset 4
	volume_envelope 10, 0
	duty_cycle 2
	vibrato 28, 3, 3
	octave 3
;	musicf1 80
;	musicf3
;	musicef -4
	note E_, 2
;	musicef 4
	dec_octave
;	musicf2
	note B_, 1
	note B_, 1
	sound_call Branch_1f1c97
;	preset 4
	volume_envelope 10, 0
	duty_cycle 2
	vibrato 28, 3, 3
	octave 3
;	musicf1 80
	note D_, 1
	note D_, 2
;	musicf3
	speed 1
	note C#, 4
	note D_, 4
	speed 8
;	musicf2
	note C#, 7
	note C#, 1
;	musicf3
	speed 1
	octave 2
	note G_, 8
;	musicf2
	note A#, 5
	note A#, 3
	inc_octave
	note C#, 5
	note C#, 3
	note E_, 5
	note E_, 3
	note G_, 5
	note G_, 3
	note A#, 5
	note A#, 3
	inc_octave
	note C#, 5
	note C#, 3
;	musicf3
	speed 8
	rest 16
	sound_loop 0, .MainLoop

Branch_1f1c69:
	volume_envelope 15, 1
	duty_cycle 2
;	musicee 28
	stereo_panning TRUE, TRUE
	vibrato 0, 3, 3
	speed 1
	octave 3
	note G_, 16
;	musicee 0
	speed 8
	sound_ret

Branch_1f1c7c:
	volume_envelope 15, 1
	duty_cycle 2
;	musicee 28
	stereo_panning TRUE, TRUE
	vibrato 0, 3, 3
	speed 1
	octave 3
;	musicef -6
	note G_, 5
;	musicef 4
	note G_, 5
;	musicef 2
	note G_, 6
;	musicee 0
	speed 8
	sound_ret

Branch_1f1c97:
	volume_envelope 15, 1
	duty_cycle 2
;	musicee 28
	stereo_panning TRUE, TRUE
	vibrato 0, 3, 3
	speed 1
	octave 4
	note G_, 8
;	musicee 0
	speed 8
	sound_ret


Music_Fort4_Ch3:
	fade_wave 11
	channel_volume 1
;	echo 96
	stereo_panning TRUE, TRUE
	speed 1
	octave 2
	note C_, 16
.MainLoop
	sound_call Branch_1f1ff8
.Loop1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note A_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	note A_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note C_, 16
	sound_loop 2, .Loop1
.Loop2
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G#, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note G#, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G#, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note G#, 4
	rest 4
	note D_, 4
	rest 4
	note G#, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note C_, 16
	sound_loop 2, .Loop2
.Loop3
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D#, 4
	rest 4
	inc_octave
	note D#, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D#, 4
	rest 4
	inc_octave
	note D#, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	note D#, 4
	rest 4
	note G_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note C_, 16
	sound_loop 2, .Loop3
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note A_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	note A_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note C_, 16
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note A_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note G#, 4
;	tie
	note A_, 4
	inc_octave
	note C_, 8
	dec_octave
	note G_, 8
	note A_, 8
	note F_, 8
	note G_, 8
	note C_, 8
.Loop4
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note A_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note A_, 4
	rest 4
	note D_, 4
	rest 4
	note A_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note C_, 16
	sound_loop 2, .Loop4
.Loop5
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D#, 4
	rest 4
	inc_octave
	note D#, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D#, 4
	rest 4
	inc_octave
	note D#, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	note D#, 4
	rest 4
	note G_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note C_, 16
	sound_loop 2, .Loop5
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	note D_, 4
	rest 4
	note G_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note C_, 16
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note D_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note G_, 4
	rest 4
	note D_, 4
	rest 4
	inc_octave
	note D_, 4
	rest 4
	dec_octave
	note G_, 4
	rest 4
	note D_, 4
	rest 4
	note G_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note G_, 16
;	cutoff 6
	note A_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note F_, 4
	rest 4
	note C#, 4
	rest 4
	inc_octave
	note C#, 4
	rest 4
	dec_octave
	note F_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note A_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note F_, 4
	rest 4
	note C#, 4
	rest 4
	inc_octave
	note C#, 4
	rest 4
	dec_octave
	note F_, 4
	rest 4
	note C#, 4
	rest 4
	note F_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note G_, 16
;	cutoff 6
	note A_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note E_, 4
	rest 4
	note C#, 4
	rest 4
	inc_octave
	note C#, 4
	rest 4
	dec_octave
	note E_, 4
	rest 4
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
;	cutoff 6
	note A_, 16
;	cutoff 8
	inc_octave
	inc_octave
	inc_octave
	channel_volume 2
;	cutoff 7
	note E_, 4
	rest 4
	note C#, 4
	rest 4
	inc_octave
	note C#, 4
	rest 4
	dec_octave
	note E_, 4
	rest 4
	note C#, 4
	rest 4
	note E_, 4
	rest 4
;	cutoff 8
	dec_octave
	dec_octave
	dec_octave
	channel_volume 1
	note G_, 8
	note A_, 8
;	vibrato_type 5
	vibrato 48, 3, 3
	note A_, 4
;	tie
;	frequency_offset 17
	note A_, 4
;	tie
;	frequency_offset 34
	note A_, 4
;	tie
;	frequency_offset 51
	note A_, 4
;	tie
;	frequency_offset 0
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 16
	sound_call Branch_1f1ff8
;	vibrato_type 5
	vibrato 48, 3, 3
	speed 8
	note D#, 16
;	tie
	note D#, 16
	note E_, 16
;	tie
	note E_, 16
	speed 1
;	cutoff 6
	note A_, 16
	rest 16
	inc_octave
;	cutoff 4
	note A_, 16
;	cutoff 6
	dec_octave
	note A_, 16
	rest 16
	rest 16
	rest 16
;	cutoff 8
	note E_, 16
;	cutoff 6
	note A#, 16
	rest 16
	inc_octave
	inc_octave
;	cutoff 4
	note D_, 16
;	cutoff 6
	dec_octave
	dec_octave
	note A#, 16
	rest 16
	rest 16
	rest 16
;	cutoff 8
	note G_, 16
;	cutoff 6
	note A_, 16
	rest 16
	inc_octave
;	cutoff 4
	note A_, 16
;	cutoff 6
	dec_octave
	note A_, 16
	rest 16
	rest 16
	rest 16
;	cutoff 8
	note G_, 16
	note A_, 16
;	tie
	note A_, 16
;	tie
	note A_, 16
;	tie
	note A_, 16
	rest 8
	note A_, 8
	inc_octave
	note E_, 4
	rest 4
	note G_, 4
	rest 4
	note A_, 4
	rest 4
	note E_, 4
	rest 4
	note G_, 4
	rest 4
	note A_, 4
	rest 4
	sound_loop 0, .MainLoop

Branch_1f1ff8:
	octave 2
.Loop6
;	cutoff 6
	note D_, 8
	rest 8
	rest 16
	inc_octave
	inc_octave
;	cutoff 7
	note F_, 5
	rest 3
	channel_volume 2
	note F_, 5
	rest 3
	channel_volume 1
;	cutoff 6
	dec_octave
	dec_octave
	note D_, 16
	rest 16
	inc_octave
;	cutoff 7
	note A_, 5
	rest 3
	channel_volume 2
	note A_, 5
	rest 3
	channel_volume 1
;	cutoff 6
	dec_octave
	rest 16
;	cutoff 8
	note C_, 16
	sound_loop 3, .Loop6
;	cutoff 6
	note D_, 16
	rest 16
	inc_octave
	inc_octave
;	cutoff 7
	note F_, 5
	rest 3
	channel_volume 2
	note F_, 5
	rest 3
	channel_volume 1
;	cutoff 6
	dec_octave
	dec_octave
	note D_, 16
	rest 16
	inc_octave
;	cutoff 7
	note A_, 5
	rest 3
	channel_volume 2
	note A_, 5
	rest 3
	channel_volume 1
;	cutoff 6
	dec_octave
	rest 16
;	cutoff 8
	note C_, 8
	note C#, 8
	sound_ret


Music_Fort4_Ch4:
	toggle_noise 6
	drum_speed 8
	rest 2
.MainLoop
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 2, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 2, 2
	drum_note 2, 2
	drum_note 2, 1
	drum_note 2, 1
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 2
	drum_note 2, 2
	drum_note 2, 1
	drum_note 2, 1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 2, 2
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	sound_call Branch_1f2131
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
;	musicef 2
	drum_note 8, 16
;	tie
	rest 16
;	musicef 0
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 2, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 2, 2
	drum_note 2, 2
	drum_note 2, 1
	drum_note 2, 1
;	musicef 1
	drum_note 8, 16
;	tie
	rest 16
;	musicef 1
	drum_note 8, 16
;	tie
	rest 16
;	musicef 0
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 2, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 2, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 2, 2
;	musicef 1
	drum_note 8, 9
;	musicef 0
	drum_speed 1
	drum_note 2, 4
	drum_note 2, 4
	drum_speed 8
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	sound_loop 0, .MainLoop

Branch_1f2131:
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 10, 2
	drum_note 1, 2
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 2
	drum_note 7, 2
	drum_note 5, 2
	sound_ret
