Music_GRBlimp:
	channel_count 4
	channel 1, Music_GRBlimp_Ch1
	channel 2, Music_GRBlimp_Ch2
	channel 3, Music_GRBlimp_Ch3
	channel 4, Music_GRBlimp_Ch4

Music_GRBlimp_Ch2:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 28, 3, 3
;	cutoff 8
	octave 4
	duty_cycle 2
	volume_envelope 7, 5
	vibrato 28, 3, 3
;	preset 0
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	stereo_panning TRUE, TRUE
;	musicf1 48
	sound_call Branch_1e7cf5
	note G#, 16
;	tie
	note G#, 5
	note G#, 7
	inc_octave
	note C_, 16
;	tie
	note C_, 5
	dec_octave
;	musicf3
	note A#, 4
	inc_octave
	note C_, 3
	dec_octave
;	musicf1 69
	note A#, 14
	note A#, 5
	note G_, 14
	note A#, 5
	note D#, 14
	note G_, 4
	speed 6
	note F_, 14
	speed 1
	note F_, 14
	sound_call Branch_1e7cf5
	note G#, 16
;	tie
	note G#, 5
	note G#, 7
	inc_octave
	note C_, 16
;	tie
	note C_, 5
	dec_octave
;	musicf3
	note A#, 4
	inc_octave
	note C_, 3
	dec_octave
;	musicf1 69
	note A#, 14
	note A#, 5
	note F_, 14
	note F_, 5
	note A#, 14
	note A#, 4
	inc_octave
	speed 6
	note C_, 14
	speed 1
	note C_, 14
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
;	musicf3
	speed 1
	note C_, 5
	note C#, 5
	note D#, 4
;	musicf1 68
	note F_, 16
;	tie
	note F_, 12
;	tie
	note F_, 16
;	tie
	note F_, 12
	note F_, 14
;	musicf3
	note F_, 14
;	musicf1 64
	note D#, 14
	note D#, 7
;	musicf3
	note C#, 7
;	musicf1 64
	note C_, 7
	note C#, 7
	rest 7
	dec_octave
	note G#, 5
	inc_octave
	note C#, 2
	dec_octave
	vibrato 14, 3, 3
	note A#, 14
;	tie
	note A#, 16
;	tie
	note A#, 16
;	tie
	note A#, 10
	note A#, 14
;	musicf3
	note A#, 5
	inc_octave
	note C_, 5
	note C#, 4
	vibrato 28, 3, 3
;	musicf1 64
	note D#, 16
;	tie
	note D#, 12
;	tie
	note D#, 16
;	tie
	note D#, 12
	note D#, 14
;	musicf3
	note D#, 14
;	musicf1 64
	note C#, 14
	note D#, 7
	dec_octave
;	musicf3
	note B_, 7
;	musicf1 64
	note A#, 7
	note B_, 7
	rest 7
	note F#, 4
	note B_, 3
	vibrato 14, 3, 3
	note G#, 14
;	tie
	note G#, 16
;	tie
	note G#, 16
;	tie
	note G#, 10
	note G#, 14
;	musicf3
	note G#, 5
	note A#, 5
	note B_, 4
	inc_octave
	vibrato 28, 3, 3
	note C#, 16
;	tie
	note C#, 12
;	tie
	note C#, 16
;	tie
	note C#, 16
;	tie
	note C#, 10
	dec_octave
;	musicf1 64
	note B_, 7
	inc_octave
	note C#, 7
	dec_octave
;	musicf3
	note F#, 14
;	musicf1 64
	note B_, 7
	note F#, 7
	inc_octave
	note C#, 16
;	tie
	note C#, 12
;	tie
	note C#, 16
;	tie
	note C#, 16
;	tie
	note C#, 10
	note C#, 14
;	musicf1 64
	note C#, 5
	note C#, 5
	note D#, 4
	note C#, 5
	note E_, 5
	note D#, 4
	note D#, 16
;	tie
	note D#, 12
;	tie
	note D#, 14
;	musicf3
	note C#, 5
	note D#, 5
	note C#, 4
;	musicf1 64
	note C_, 14
	note C_, 5
	dec_octave
	note G#, 14
	inc_octave
	note C_, 5
	note C_, 14
	dec_octave
	note G#, 4
	inc_octave
	vibrato 28, 3, 3
;	musicf1 70
	speed 7
	note D_, 16
	note D_, 2
	sound_ret

Branch_1e7cf5:
	octave 4
	speed 1
;	musicf2
	note C_, 4
	note C_, 3
	note D_, 4
	note C_, 3
;	musicf1 69
	speed 7
	note D#, 10
	note D#, 2
;	musicf1 48
	speed 1
	note D_, 4
	note D_, 3
	note C_, 4
	note D_, 3
	dec_octave
	note A#, 4
	inc_octave
	note C_, 3
	note D_, 4
	dec_octave
	note A#, 3
	speed 7
	inc_octave
	note C_, 12
	note C_, 2
	dec_octave
	speed 1
	note A_, 4
	note A_, 3
	note A_, 4
	note A_, 3
	note A#, 16
;	tie
	note A#, 5
	note A#, 7
	note G_, 16
;	tie
	note G_, 5
	note G_, 7
	note D#, 14
	note D#, 5
	inc_octave
	note D_, 14
	note D#, 5
	dec_octave
	note A#, 14
	note A#, 4
	inc_octave
	note C_, 7
	dec_octave
	note A#, 14
	note F_, 4
	inc_octave
	note C_, 3
	dec_octave
	note F_, 16
;	tie
	note F_, 12
;	tie
	note F_, 16
;	tie
	note F_, 12
	note F_, 14
	inc_octave
	note C_, 4
	note C_, 3
	note D_, 4
	note C_, 3
	speed 7
	note D#, 10
	note D#, 2
;	musicf1 64
	speed 1
	note D_, 4
	note D_, 3
	note C_, 4
	note D_, 3
	dec_octave
	note A#, 4
	inc_octave
	note C_, 3
	note D_, 4
	dec_octave
	note A#, 3
	inc_octave
	note C_, 7
	note D_, 7
	dec_octave
	rest 7
	note F_, 4
	inc_octave
	note C_, 3
	dec_octave
	note F_, 16
;	tie
	note F_, 12
;	tie
	note F_, 16
;	tie
	note F_, 12
	note F_, 14
	note F_, 4
	note F_, 3
	note G_, 4
	note F_, 3
	sound_ret


Music_GRBlimp_Ch1:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 28, 3, 3
;	cutoff 8
	speed 7
	octave 3
;	preset 1
	volume_envelope 8, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicf1 64
	sound_call Branch_1e7e8a
	note C#, 14
;	tie
	note C#, 7
	note C#, 7
	note F_, 14
;	tie
	note F_, 7
	note F_, 7
	note G_, 14
	note G_, 5
	note D#, 14
	note D#, 5
	dec_octave
	note A#, 14
	inc_octave
	note D#, 4
	dec_octave
	note A#, 14
;	tie
	note A#, 14
;	tie
	note A#, 14
;	musicf3
	note A_, 4
	note A#, 3
	note G_, 4
	note A_, 3
;	musicf2
	note A_, 14
;	tie
	note A_, 14
	note A_, 14
	sound_call Branch_1e7e8a
	note D#, 16
;	tie
	note D#, 5
	note D#, 7
	note G#, 16
;	tie
	note G#, 5
	note G#, 7
	note F_, 14
	note F_, 5
	note C#, 14
	note C#, 5
	note F_, 14
	note F_, 4
	note F_, 16
;	tie
	note F_, 12
;	tie
	note F_, 16
;	musicf3
	note E_, 4
	note F_, 3
	note E_, 4
	note D_, 3
	note E_, 16
;	tie
	note E_, 12
	dec_octave
	note D_, 4
	note E_, 3
	note G_, 4
	note A#, 3
	inc_octave
	note D_, 4
	note F_, 3
	note G_, 4
	inc_octave
	note C_, 3
	vibrato 28, 3, 3
	note C#, 14
	dec_octave
;	musicf1 65
	note C#, 3
	inc_octave
	note C#, 4
	dec_octave
	note C#, 3
	note C#, 4
	note F_, 5
	note C#, 5
	note C#, 4
	note F_, 5
	note F_, 5
	note C#, 4
	vibrato 7, 3, 3
	note G#, 7
;	tie
	note G#, 14
	note G#, 7
	inc_octave
	note C_, 7
	dec_octave
	note G#, 7
	rest 7
	note A#, 4
	note A#, 3
	note G#, 7
	note A#, 7
	dec_octave
	note A#, 3
	inc_octave
	note G#, 4
	dec_octave
	note A#, 3
	note A#, 4
	inc_octave
	note C#, 5
	dec_octave
	note A#, 5
	note A#, 4
	inc_octave
	note C#, 5
	note C#, 5
	dec_octave
	note A#, 4
	inc_octave
	note F#, 7
;	tie
	note F#, 16
;	tie
	note F#, 5
	note F#, 14
	note F#, 7
	note F#, 7
	vibrato 28, 3, 3
	note B_, 14
	dec_octave
;	musicf1 65
	note B_, 3
	inc_octave
	note B_, 4
	dec_octave
	note B_, 3
	note B_, 4
	inc_octave
	note D#, 5
	dec_octave
	note B_, 5
	note B_, 4
	inc_octave
	note D#, 5
	note D#, 5
	dec_octave
	note B_, 4
	inc_octave
	vibrato 7, 3, 3
	note F#, 7
;	tie
	note F#, 14
	note F#, 7
	note A#, 7
	note F#, 7
	rest 7
	note G#, 4
	note G#, 3
	note F#, 7
	note F#, 7
	dec_octave
	note G#, 3
	inc_octave
	note F#, 4
	dec_octave
	note G#, 3
	note G#, 4
	note B_, 5
	note G#, 5
	note G#, 4
	note B_, 5
	note B_, 5
	note G#, 4
	inc_octave
	note E_, 7
;	tie
	note E_, 16
;	tie
	note E_, 4
	note E_, 14
	dec_octave
	note B_, 7
	note B_, 7
	vibrato 28, 3, 3
	inc_octave
	note E_, 14
;	musicf1 65
	note C#, 3
	note E_, 4
	note C#, 3
	note C#, 4
	note E_, 5
	note C#, 5
	note C#, 4
	note E_, 5
	note E_, 5
	note C#, 4
	note A_, 14
;	musicf1 65
	note G#, 7
	note A_, 7
;	musicf3
	note D#, 14
;	musicf1 65
	note G#, 7
	note D#, 7
	note A_, 14
;	musicf1 65
	note C#, 3
	note A_, 4
	note C#, 3
	note C#, 4
	note E_, 5
	note C#, 5
	note C#, 4
	note E_, 5
	note E_, 5
	note C#, 4
	note A_, 7
;	tie
	note A_, 14
	note A_, 7
	note A_, 5
	note A_, 4
	note B_, 4
	note A_, 5
	inc_octave
	note C#, 5
	dec_octave
	note A_, 4
	vibrato 14, 3, 3
	note A#, 14
;	tie
	note A#, 16
;	tie
	note A#, 5
	note A#, 7
	note A#, 7
	note A#, 7
	note G#, 14
	note G#, 5
	note D#, 14
	note G#, 5
	note G#, 14
	note D#, 4
	vibrato 28, 3, 3
;	musicf1 70
	speed 7
	note A#, 16
	note A#, 2
	sound_ret

Branch_1e7e8a:
	octave 3
;	musicf2
	speed 1
	note A_, 4
	note A_, 3
	note A_, 4
	note A_, 3
	speed 7
	note A#, 10
	note A#, 2
	speed 1
;	musicf1 64
	note A#, 4
	note A#, 3
	note A#, 4
	note A#, 3
	note G_, 4
	note A#, 3
	note A#, 4
	note G_, 3
	speed 7
	note A_, 12
	note A_, 2
	speed 1
	note F_, 4
	note F_, 3
	note F_, 4
	note F_, 3
	note G_, 16
;	tie
	note G_, 5
	note G_, 7
	note D#, 16
;	tie
	note D#, 5
	note D#, 7
	dec_octave
	note A#, 14
	note A#, 5
	inc_octave
	note G_, 14
	note G_, 5
	note D#, 14
	note D#, 4
	note F_, 7
	note D#, 14
	note C_, 4
	note F_, 3
	note C_, 16
;	tie
	note C_, 12
;	tie
	note C_, 16
;	tie
	note C_, 12
	note C_, 14
	note A_, 4
	note A_, 3
	note A_, 4
	note A_, 3
	speed 7
	note A#, 10
	note A#, 2
	speed 1
;	musicf1 64
	note A#, 4
	note A#, 3
	note A#, 4
	note A#, 3
	note G_, 4
	note A#, 3
	note A#, 4
	note G_, 3
	note A_, 7
	note A#, 14
	note C_, 4
	note F_, 3
	note C_, 16
;	tie
	note C_, 12
;	tie
	note C_, 16
;	tie
	note C_, 12
	note C_, 14
	note C_, 4
	note C_, 3
	note D_, 4
	note C_, 3
	sound_ret


Music_GRBlimp_Ch3:
	stereo_panning TRUE, TRUE
	fade_wave 11
	channel_volume 1
;	cutoff 3
;	echo 96
	octave 2
	speed 1
	rest 14
	speed 7
.Loop1
	note F_, 4
	note C_, 4
	sound_loop 11, .Loop1
	note F_, 4
	note D#, 4
	note C#, 4
	note C#, 4
	note C_, 4
	note C_, 4
.Loop2
	note F_, 4
	note C_, 4
	sound_loop 13, .Loop2
	note F_, 4
	note G_, 4
	note G#, 4
	note G#, 4
	note C#, 4
	note C#, 4
	note C_, 4
	note G_, 4
	inc_octave
	note C_, 4
	dec_octave
	note C_, 4
	note C#, 4
	note G#, 4
	inc_octave
	note C#, 4
	dec_octave
	note G#, 4
	note F#, 4
	note C#, 4
	note F#, 4
	note C#, 4
	note B_, 4
	note F#, 4
	note B_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note E_, 4
	note B_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	note G#, 4
	note F#, 4
	note C#, 4
	note F#, 4
	note E_, 4
	note D#, 4
	note A#, 4
;	cutoff 2
	speed 1
	note G#, 10
;	tie
	note G#, 9
	note D#, 10
;	tie
	note D#, 9
	note G#, 10
;	tie
	note G#, 8
;	cutoff 1
	note G#, 4
;	tie
	note A_, 4
;	tie
	note A#, 6
;	tie
	speed 7
	note A#, 14
;	tie
	note A#, 2
	sound_ret


Music_GRBlimp_Ch4:
	toggle_noise 6
	drum_speed 9
	octave 1
	drum_speed 1
	rest 14
.Loop1
	drum_note 2, 14
;	musicef -3
	drum_note 2, 14
;	musicef 0
	drum_note 3, 3
;	musicef -4
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
	drum_note 2, 14
;	musicef -3
	drum_note 2, 14
;	musicef 0
	drum_note 3, 3
;	musicef -3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
;	musicef 0
	drum_note 2, 14
	drum_note 2, 14
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 14
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 14
;	musicef -3
	drum_note 2, 14
;	musicef 0
	drum_note 3, 3
;	musicef -3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
;	musicef 0
	sound_loop 11, .Loop1
	drum_note 2, 14
;	musicef -3
	drum_note 2, 14
;	musicef 0
	drum_note 3, 3
;	musicef -3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
	drum_note 3, 3
;	musicef -3
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
;	musicef -1
	drum_note 2, 5
;	musicef 1
	drum_note 2, 16
;	tie
	rest 3
	drum_note 2, 16
;	tie
	rest 2
	drum_note 3, 3
;	musicef -5
	drum_note 3, 4
.Loop2
	drum_note 3, 3
	drum_note 3, 4
	sound_loop 5, .Loop2
;	musicef -4
.Loop3
	drum_note 3, 3
	drum_note 3, 4
	sound_loop 5, .Loop3
;	musicef -3
.Loop4
	drum_note 3, 3
	drum_note 3, 4
	sound_loop 5, .Loop4
;	musicef 2
	drum_note 3, 14
	sound_ret
