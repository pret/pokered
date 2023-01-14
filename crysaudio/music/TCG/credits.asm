Music_TCGCredits:
	channel_count 4
	channel 1, Music_TCGCredits_Ch1
	channel 2, Music_TCGCredits_Ch2
	channel 3, Music_TCGCredits_Ch3
	channel 4, Music_TCGCredits_Ch4

Music_TCGCredits_Ch1:
	speed 13
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 20, 3, 3
;	cutoff 8
	octave 2
	duty_cycle 1
	volume_envelope 4, -7
	note F_, 1
	volume_envelope 6, 0
	note F_, 2
;	tie
	speed 1
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	speed 13
	volume_envelope 6, -7
	note G_, 1
	volume_envelope 7, 0
	note G_, 2
;	tie
	speed 1
	note G_, 6
	volume_envelope 4, 7
	note G_, 7
	speed 13
	volume_envelope 6, -7
	note A_, 1
	volume_envelope 8, 0
	note A_, 2
;	tie
	speed 1
	note A_, 6
	volume_envelope 4, 7
	note A_, 7
	speed 13
	volume_envelope 8, 0
	note B_, 3
	volume_envelope 4, 7
	note B_, 1
	inc_octave
	volume_envelope 8, 0
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	sound_call Branch_fb5bc
	octave 2
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	sound_call Branch_fb36b
	octave 4
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
;	tie
	speed 13
	note E_, 4
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note F_, 1
	speed 1
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
	speed 13
	volume_envelope 10, 0
	note E_, 5
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note F_, 1
	speed 1
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
	speed 13
	volume_envelope 10, 0
	note C_, 5
	volume_envelope 3, 7
	note C_, 1
	dec_octave
	speed 1
	volume_envelope 10, 0
	note A_, 6
	volume_envelope 3, 7
	note A_, 13
	rest 7
	inc_octave
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	speed 13
	note D_, 2
	volume_envelope 3, 7
	note D_, 1
	volume_envelope 10, 0
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	dec_octave
	volume_envelope 10, 0
	note G#, 1
	volume_envelope 3, 7
	note G#, 1
	volume_envelope 10, 0
	speed 1
	note F#, 3
	note G_, 10
;	tie
	speed 13
	note G_, 3
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	note G_, 1
	speed 1
	note A_, 5
	volume_envelope 3, 7
	note A_, 8
	volume_envelope 10, 0
	note B_, 5
	volume_envelope 3, 7
	note B_, 8
	volume_envelope 10, 0
	note B_, 3
	inc_octave
	note C_, 10
;	tie
	speed 13
	note C_, 2
;	tie
	speed 1
	note C_, 6
	volume_envelope 3, 7
	note C_, 13
	rest 7
	dec_octave
	volume_envelope 10, 0
	note B_, 3
	inc_octave
	note C_, 10
	note D_, 5
	volume_envelope 3, 7
	note D_, 8
	volume_envelope 10, 0
	note E_, 5
	volume_envelope 3, 7
	note E_, 8
	speed 13
	volume_envelope 10, 0
	note F_, 3
	note E_, 1
	speed 1
	note C_, 6
	volume_envelope 3, 7
	note C_, 13
	rest 7
	dec_octave
	volume_envelope 10, 0
	note A_, 6
	volume_envelope 3, 7
	note A_, 13
	rest 7
	volume_envelope 10, 0
	note B_, 3
	inc_octave
	note C_, 10
;	tie
	speed 13
	note C_, 2
;	tie
	speed 1
	note C_, 6
	volume_envelope 3, 7
	note C_, 13
	rest 7
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	speed 13
	note D_, 2
	volume_envelope 3, 7
	note D_, 1
	volume_envelope 10, 0
	note C_, 8
;	tie
	note C_, 8
;	tie
	note C_, 8
	volume_envelope 3, 7
	note C_, 1
	sound_call Branch_fb36b
	octave 4
	speed 1
	volume_envelope 10, 0
	note D_, 3
	note D#, 10
;	tie
	speed 13
	note D#, 4
	volume_envelope 3, 7
	note D#, 1
	volume_envelope 10, 0
	note D_, 1
	speed 1
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	volume_envelope 10, 0
	note E_, 3
	note F_, 10
;	tie
	speed 13
	note F_, 3
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 10, 0
	note D#, 1
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	speed 1
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
	speed 13
	note G_, 4
	dec_octave
	dec_octave
	speed 1
	volume_envelope 9, 0
	note E_, 6
	note A_, 7
	inc_octave
	note C_, 6
	dec_octave
	note A_, 7
	note G_, 6
	inc_octave
	note C_, 7
	note F_, 6
	note D_, 7
	speed 13
	note E_, 8
;	tie
	note E_, 1
	volume_envelope 3, 7
	note E_, 2
	sound_ret

Branch_fb36b:
	speed 13
	octave 2
	volume_envelope 8, 0
	note A_, 1
	rest 1
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 8, 0
	note A_, 1
	note B_, 1
	inc_octave
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	rest 1
;	sound_call Branch_fb5bc
	octave 2
	speed 13
	rest 2
	volume_envelope 8, 0
	note G_, 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note A_, 1
	volume_envelope 3, 7
	note A_, 1
	rest 2
	volume_envelope 8, 0
	note B_, 1
	volume_envelope 3, 7
	note B_, 1
	volume_envelope 8, 0
	note A_, 1
	rest 1
	inc_octave
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	rest 3
	dec_octave
	volume_envelope 8, 0
	note G_, 1
	inc_octave
	note C_, 1
	rest 1
;	sound_ret
	octave 2
	note A_, 2
	note A_, 1
	volume_envelope 3, 7
	note A_, 1
	volume_envelope 8, 0
	note A_, 1
	volume_envelope 3, 7
	note A_, 1
	volume_envelope 8, 0
	note B_, 1
	inc_octave
;	sound_call Branch_fb5e4
	octave 3
	volume_envelope 10, 0
	speed 1
	note F#, 3
	note G_, 10
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	speed 13
	volume_envelope 8, 0
	note E_, 4
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	inc_octave
	volume_envelope 10, 0
	speed 1
	note C#, 3
	note D_, 10
;	tie
	speed 13
	note D_, 4
	volume_envelope 3, 7
	note D_, 1
;	sound_ret
	octave 4
	volume_envelope 10, 0
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	dec_octave
	volume_envelope 10, 0
	note G_, 4
;	tie
	note G_, 8
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	note E_, 1
	note F_, 1
	speed 1
	note G_, 6
	volume_envelope 3, 7
	note G_, 7
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
	speed 13
	note G_, 4
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 10, 0
	speed 1
	note E_, 3
	note F_, 10
;	tie
	speed 13
	note F_, 2
	note E_, 1
;	tie
	speed 1
	note E_, 6
	note F_, 4
	note E_, 3
	note D_, 13
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	speed 13
	note D_, 4
;	tie
	note D_, 8
	volume_envelope 3, 7
	note D_, 2
;	sound_call Branch_fb5e4
	octave 3
	volume_envelope 10, 0
	speed 1
	note F#, 3
	note G_, 10
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	speed 13
	volume_envelope 8, 0
	note E_, 4
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	inc_octave
	volume_envelope 10, 0
	speed 1
	note C#, 3
	note D_, 10
;	tie
	speed 13
	note D_, 4
	volume_envelope 3, 7
	note D_, 1
;	sound_ret
	octave 4
	volume_envelope 10, 0
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
	dec_octave
	volume_envelope 10, 0
	note G_, 4
;	tie
	note G_, 8
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	note E_, 1
	note F_, 1
	speed 1
	note G_, 6
	volume_envelope 3, 7
	note G_, 7
	volume_envelope 10, 0
	note G_, 3
	note G#, 10
;	tie
	note G#, 13
	volume_envelope 3, 7
	note G#, 13
	inc_octave
	volume_envelope 10, 0
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
	speed 13
	note G_, 2
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 10, 0
	note C_, 1
	note D_, 1
	volume_envelope 3, 7
	note D_, 1
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
;	tie
	speed 13
	note E_, 8
;	sound_call Branch_fb60c
	octave 4
	speed 13
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
	speed 13
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 10, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	speed 1
	note G#, 3
	note A_, 10
;	tie
	speed 13
	note A_, 8
	volume_envelope 3, 7
	note A_, 1
	volume_envelope 10, 0
	speed 1
	note G#, 3
	note A_, 10
	volume_envelope 3, 7
	note A_, 13
	volume_envelope 10, 0
	note G_, 13
	volume_envelope 3, 7
	note G_, 13
	volume_envelope 10, 0
	note F_, 13
	volume_envelope 3, 7
	note F_, 13
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
;	sound_ret
	speed 13
	octave 4
	note G_, 8
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	speed 1
	note F#, 3
	note G_, 10
	volume_envelope 3, 7
	note G_, 13
	volume_envelope 10, 0
	note F_, 13
	volume_envelope 3, 7
	note F_, 13
	volume_envelope 10, 0
	note E_, 13
	volume_envelope 3, 7
	note E_, 13
	volume_envelope 10, 0
	note E_, 6
	note F_, 7
	note E_, 13
	dec_octave
	note A_, 6
	volume_envelope 3, 7
	note A_, 7
	inc_octave
	volume_envelope 10, 0
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	dec_octave
	volume_envelope 10, 0
	note F_, 6
	volume_envelope 3, 7
	note F_, 13
	rest 7
	volume_envelope 10, 0
	note A_, 13
	inc_octave
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	volume_envelope 10, 0
	note D#, 3
	note E_, 10
;	tie
	note E_, 13
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	volume_envelope 10, 0
	note E_, 6
	volume_envelope 3, 7
	note E_, 7
	volume_envelope 10, 0
	note C_, 6
	volume_envelope 3, 7
	note C_, 13
	rest 7
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	note D_, 13
	note C#, 6
	note C_, 7
	dec_octave
	note B_, 13
	inc_octave
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	volume_envelope 10, 0
	note G_, 6
	volume_envelope 3, 7
	note G_, 7
	volume_envelope 10, 0
	speed 13
	note E_, 5
;	sound_call Branch_fb60c
	octave 4
	speed 13
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
	speed 13
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 10, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	speed 1
	note G#, 3
	note A_, 10
;	tie
	speed 13
	note A_, 8
	volume_envelope 3, 7
	note A_, 1
	volume_envelope 10, 0
	speed 1
	note G#, 3
	note A_, 10
	volume_envelope 3, 7
	note A_, 13
	volume_envelope 10, 0
	note G_, 13
	volume_envelope 3, 7
	note G_, 13
	volume_envelope 10, 0
	note F_, 13
	volume_envelope 3, 7
	note F_, 13
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
;	sound_ret
	speed 13
	octave 4
	note G_, 3
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	note G_, 1
	speed 1
	note A_, 6
	volume_envelope 3, 7
	note A_, 7
	volume_envelope 10, 0
	note B_, 6
	volume_envelope 3, 7
	note B_, 7
	volume_envelope 10, 0
	note B_, 3
	inc_octave
	note C_, 10
	volume_envelope 3, 7
	note C_, 13
	dec_octave
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
	volume_envelope 3, 7
	note G_, 13
	volume_envelope 10, 0
	note F_, 13
	volume_envelope 3, 7
	note F_, 13
	volume_envelope 10, 0
	note E_, 13
	volume_envelope 3, 7
	note E_, 13
	volume_envelope 10, 0
	note E_, 3
	note F_, 10
;	tie
	note F_, 13
	note E_, 13
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	dec_octave
	volume_envelope 10, 0
	note A_, 6
	volume_envelope 3, 7
	note A_, 7
	rest 13
	inc_octave
	volume_envelope 10, 0
	note C_, 13
	dec_octave
	note A_, 6
	volume_envelope 3, 7
	note A_, 7
	inc_octave
	volume_envelope 10, 0
	note E_, 3
	note F_, 10
;	tie
	note F_, 13
	note E_, 13
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	dec_octave
	volume_envelope 10, 0
	note G#, 6
	volume_envelope 3, 7
	note G#, 7
	rest 13
	inc_octave
	volume_envelope 10, 0
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	rest 13
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
	speed 13
	note G_, 8
	volume_envelope 3, 7
	note G_, 1
	dec_octave
	dec_octave
	volume_envelope 8, 0
	note G_, 1
	volume_envelope 2, 7
	note G_, 1
	volume_envelope 8, 0
	note A_, 1
	volume_envelope 2, 7
	note A_, 1
	volume_envelope 8, 0
	note B_, 1
	speed 1
	volume_envelope 10, 0
	note G_, 3
	note A_, 3
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 3
	note F_, 3
	note G_, 4
;	sound_call Branch_fb651
	octave 3
	volume_envelope 10, 0
	note D#, 3
	note E_, 10
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	volume_envelope 10, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
	inc_octave
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	note D_, 13
	note C_, 6
	volume_envelope 3, 7
	note C_, 13
	rest 7
	dec_octave
	speed 13
	volume_envelope 10, 0
	note G_, 6
;	tie
	note G_, 6
;	tie
	note G_, 8
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
	note F_, 5
	volume_envelope 3, 7
	note F_, 8
	volume_envelope 10, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
;	sound_ret
	octave 3
	volume_envelope 10, 0
	note G#, 3
	note A_, 10
;	tie
	note A_, 13
	volume_envelope 3, 7
	note A_, 13
	volume_envelope 10, 0
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
	note G_, 13
	volume_envelope 3, 7
	note G_, 13
	volume_envelope 10, 0
	note D#, 3
	note E_, 10
	volume_envelope 3, 7
	note E_, 13
	volume_envelope 10, 0
	note D_, 13
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	speed 13
	note D_, 4
;	tie
	note D_, 8
	volume_envelope 3, 7
	note D_, 1
	dec_octave
	volume_envelope 8, 0
	note G_, 1
	speed 1
	note A_, 6
	volume_envelope 2, 7
	note A_, 7
	volume_envelope 8, 0
	note B_, 6
	volume_envelope 2, 7
	note B_, 7
;	sound_call Branch_fb651
	octave 3
	volume_envelope 10, 0
	note D#, 3
	note E_, 10
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	volume_envelope 10, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
	inc_octave
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	note D_, 13
	note C_, 6
	volume_envelope 3, 7
	note C_, 13
	rest 7
	dec_octave
	speed 13
	volume_envelope 10, 0
	note G_, 6
;	tie
	note G_, 6
;	tie
	note G_, 8
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
	note F_, 5
	volume_envelope 3, 7
	note F_, 8
	volume_envelope 10, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
;	sound_ret
	octave 3
	volume_envelope 10, 0
	note G_, 3
	note G#, 10
;	tie
	note G#, 13
	volume_envelope 3, 7
	note G#, 13
	inc_octave
	volume_envelope 10, 0
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
	note C_, 13
	volume_envelope 3, 7
	note C_, 13
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
	speed 13
	note G_, 2
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 10, 0
	note C_, 1
	note D_, 1
	volume_envelope 3, 7
	note D_, 1
	sound_ret

Branch_fb5bc:
	octave 2
	speed 13
	rest 2
	volume_envelope 8, 0
	note G_, 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note A_, 1
	volume_envelope 3, 7
	note A_, 1
	rest 2
	volume_envelope 8, 0
	note B_, 1
	volume_envelope 3, 7
	note B_, 1
	volume_envelope 8, 0
	note A_, 1
	rest 1
	inc_octave
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	rest 3
	dec_octave
	volume_envelope 8, 0
	note G_, 1
	inc_octave
	note C_, 1
	rest 1
	sound_ret

Branch_fb5e4:
	octave 3
	volume_envelope 10, 0
	speed 1
	note F#, 3
	note G_, 10
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	speed 13
	volume_envelope 8, 0
	note E_, 4
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	inc_octave
	volume_envelope 10, 0
	speed 1
	note C#, 3
	note D_, 10
;	tie
	speed 13
	note D_, 4
	volume_envelope 3, 7
	note D_, 1
	sound_ret

Branch_fb60c:
	octave 4
	speed 13
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
	speed 13
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 10, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	volume_envelope 10, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	speed 1
	note G#, 3
	note A_, 10
;	tie
	speed 13
	note A_, 8
	volume_envelope 3, 7
	note A_, 1
	volume_envelope 10, 0
	speed 1
	note G#, 3
	note A_, 10
	volume_envelope 3, 7
	note A_, 13
	volume_envelope 10, 0
	note G_, 13
	volume_envelope 3, 7
	note G_, 13
	volume_envelope 10, 0
	note F_, 13
	volume_envelope 3, 7
	note F_, 13
	volume_envelope 10, 0
	note F#, 3
	note G_, 10
;	tie
	sound_ret

Branch_fb651:
	octave 3
	volume_envelope 10, 0
	note D#, 3
	note E_, 10
	note F_, 6
	volume_envelope 3, 7
	note F_, 7
	volume_envelope 10, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
	inc_octave
	volume_envelope 10, 0
	note C#, 3
	note D_, 10
;	tie
	note D_, 13
	note C_, 6
	volume_envelope 3, 7
	note C_, 13
	rest 7
	dec_octave
	speed 13
	volume_envelope 10, 0
	note G_, 6
;	tie
	note G_, 6
;	tie
	note G_, 8
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 10, 0
	speed 1
	note D#, 3
	note E_, 10
	note F_, 5
	volume_envelope 3, 7
	note F_, 8
	volume_envelope 10, 0
	note G_, 5
	volume_envelope 3, 7
	note G_, 8
	sound_ret


Music_TCGCredits_Ch2:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 20, 3, 3
;	cutoff 8
	duty_cycle 1
	octave 2
	speed 13
	volume_envelope 3, -7
	note A_, 1
	volume_envelope 7, 0
	note A_, 2
;	tie
	speed 1
	note A_, 6
	volume_envelope 2, 7
	note A_, 7
	speed 13
	volume_envelope 7, -7
	note B_, 1
	volume_envelope 8, 0
	note B_, 2
;	tie
	speed 1
	note B_, 6
	volume_envelope 3, 7
	note B_, 7
	inc_octave
	speed 13
	volume_envelope 5, -7
	note C_, 1
	volume_envelope 9, 0
	note C_, 2
;	tie
	speed 1
	note C_, 6
	volume_envelope 3, 7
	note C_, 7
	speed 13
	volume_envelope 9, 0
	note D_, 3
	volume_envelope 3, 7
	note D_, 1
	sound_call Branch_fb79e
	octave 4
	speed 13
	volume_envelope 8, 0
	note C_, 3
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	rest 2
	inc_octave
	volume_envelope 8, 0
	note D_, 1
;	cutoff 4
	note E_, 1
;	cutoff 8
	note C_, 3
	dec_octave
	volume_envelope 9, 2
	note D_, 1
	rest 2
	inc_octave
	volume_envelope 8, 0
	note D_, 1
;	cutoff 4
	note E_, 1
	dec_octave
;	cutoff 8
	note A_, 3
	volume_envelope 9, 2
	note C_, 1
	rest 2
;	cutoff 4
	volume_envelope 8, 0
	note F_, 1
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
	note G#, 3
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
	note G#, 1
	rest 1
	note F_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
	note E_, 3
	volume_envelope 9, 2
	note D_, 1
	rest 1
	dec_octave
	volume_envelope 8, 0
	note B_, 1
	inc_octave
;	cutoff 4
	note C_, 1
	volume_envelope 9, 2
;	cutoff 8
	note D_, 1
	volume_envelope 8, 0
	note E_, 3
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 8, 0
	note E_, 1
;	cutoff 4
	note F_, 1
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
	note A_, 3
	volume_envelope 9, 2
	note C_, 1
;	cutoff 4
	note A_, 1
	rest 1
	note F_, 1
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
	note A_, 3
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 8, 0
	note G#, 3
	rest 1
	sound_call Branch_fb79e
	octave 4
	speed 13
	volume_envelope 8, 0
	note C_, 1
;	tie
	note C_, 2
	dec_octave
	dec_octave
	volume_envelope 9, 2
	note G#, 1
	rest 2
	inc_octave
	volume_envelope 8, 0
	note A#, 1
	dec_octave
	volume_envelope 9, 2
	note G#, 1
	inc_octave
	inc_octave
	volume_envelope 8, 0
	note C_, 1
;	tie
	note C_, 2
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	rest 1
	inc_octave
	volume_envelope 8, 0
	note C_, 1
	note C_, 1
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
	note E_, 1
;	tie
	note E_, 4
	dec_octave
	dec_octave
	speed 1
	volume_envelope 8, 0
	note C_, 6
	note F_, 7
	note A_, 6
	note F_, 7
	note E_, 6
	note G_, 7
	inc_octave
	note D_, 6
	dec_octave
	note B_, 7
	inc_octave
	speed 13
	note C_, 8
;	tie
	note C_, 1
	volume_envelope 2, 7
	note C_, 2
	sound_ret

Branch_fb79e:
	speed 13
	octave 3
	volume_envelope 9, 0
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
;	sound_call Branch_fba68
	octave 3
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 9, 0
	note C_, 1
	note E_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	rest 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 9, 0
	note F_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
	rest 1
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 9, 0
	note C_, 1
	note E_, 1
	volume_envelope 9, 2
	note C_, 1
;	sound_ret
	octave 2
	volume_envelope 9, 0
	note A_, 1
	volume_envelope 3, 7
	note A_, 1
	inc_octave
	volume_envelope 9, 0
	note C_, 1
	volume_envelope 9, 2
	note C_, 1
	dec_octave
	volume_envelope 9, 0
	note B_, 1
	volume_envelope 3, 7
	note B_, 1
	inc_octave
	volume_envelope 9, 0
	note C_, 1
	note D_, 1
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
	rest 1
;	sound_call Branch_fba68
	octave 3
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 9, 0
	note C_, 1
	note E_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	rest 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 9, 0
	note F_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
	rest 1
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 9, 0
	note C_, 1
	note E_, 1
	volume_envelope 9, 2
	note C_, 1
;	sound_ret
	volume_envelope 9, 0
	octave 3
	speed 1
	note E_, 3
	note F_, 10
;	tie
	speed 13
	note F_, 1
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
	volume_envelope 9, 0
	note C_, 1
	volume_envelope 3, 7
	note C_, 1
	volume_envelope 9, 0
	note D_, 3
	volume_envelope 9, 2
	duty_cycle 1
.Loop1
	rest 2
	note C_, 1
	rest 1
	sound_loop 2, .Loop1
.Loop2
	rest 2
	note D_, 1
	rest 1
	sound_loop 2, .Loop2
	rest 2
	note C_, 1
	rest 2
;	sound_call Branch_fba9d
	octave 4
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note F#, 3
	note G_, 10
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	volume_envelope 7, 0
	note E_, 3
	note F_, 10
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	dec_octave
	speed 13
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 1
	duty_cycle 2
	volume_envelope 7, 0
	note G_, 1
;	sound_ret
	rest 2
	duty_cycle 1
	volume_envelope 9, 2
	octave 3
	note C_, 1
	rest 1
.Loop3
	rest 2
	note C_, 1
	rest 1
	sound_loop 4, .Loop3
	rest 2
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note E_, 3
	note F_, 10
	note A_, 5
	volume_envelope 2, 7
	note A_, 8
	inc_octave
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	volume_envelope 7, 0
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	dec_octave
	volume_envelope 9, 2
	duty_cycle 1
	note C_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note E_, 3
	note F_, 10
;	tie
	note F_, 13
	note E_, 5
	note F_, 4
	note E_, 4
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 13
	duty_cycle 2
	volume_envelope 7, 0
	note A_, 5
	volume_envelope 2, 7
	note A_, 8
	inc_octave
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	volume_envelope 7, 0
	note C#, 3
	note D_, 10
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 13
	rest 13
	dec_octave
	volume_envelope 8, 0
	note B_, 3
	inc_octave
	note C_, 10
;	tie
	speed 13
	note C_, 3
	rest 1
	note E_, 1
	volume_envelope 9, 2
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note A#, 3
	note B_, 10
;	tie
	speed 13
	note B_, 4
	rest 1
	inc_octave
	note C_, 1
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note D_, 1
	volume_envelope 8, 0
	note E_, 5
	rest 1
;	sound_call Branch_fba9d
	octave 4
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note F#, 3
	note G_, 10
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	volume_envelope 7, 0
	note E_, 3
	note F_, 10
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	dec_octave
	speed 13
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 1
	duty_cycle 2
	volume_envelope 7, 0
	note G_, 1
;	sound_ret
	duty_cycle 1
	octave 3
	note C_, 1
	note D_, 1
	volume_envelope 9, 2
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note E_, 3
	note F_, 10
;	tie
	speed 13
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note G#, 1
	note F_, 1
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
	speed 1
	note D_, 3
	note D#, 10
;	tie
	speed 13
	note D#, 2
	dec_octave
	dec_octave
	volume_envelope 9, 2
	note G#, 1
	rest 1
	inc_octave
	volume_envelope 8, 0
	note G#, 1
	note A#, 1
	dec_octave
	volume_envelope 9, 3
	note G#, 1
	inc_octave
	inc_octave
	volume_envelope 8, 0
	note C_, 3
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 8, 0
	speed 1
	note F#, 3
	note G_, 10
	inc_octave
	speed 13
;	cutoff 4
	note C_, 1
	dec_octave
	note B_, 1
;	cutoff 8
	note A#, 1
	rest 1
;	sound_call Branch_fbacb
	octave 3
;	cutoff 8
.Loop4
	note A#, 1
	rest 1
	sound_loop 3, .Loop4
	inc_octave
	note C_, 3
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 8, 0
	note A_, 1
	inc_octave
;	cutoff 4
	note C_, 1
	dec_octave
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note A#, 3
	note B_, 16
	rest 7
	note A#, 3
	note B_, 10
	dec_octave
	speed 13
	volume_envelope 9, 2
	note B_, 1
	inc_octave
	volume_envelope 8, 0
	note B_, 1
	rest 1
	note A_, 1
	dec_octave
	volume_envelope 9, 2
	note B_, 1
	inc_octave
	volume_envelope 8, 0
	note B_, 3
	volume_envelope 9, 2
	note D_, 1
	rest 1
	volume_envelope 8, 0
	note B_, 1
	inc_octave
;	cutoff 4
	note D_, 1
;	sound_ret
	octave 3
	volume_envelope 9, 2
;	cutoff 8
	note D_, 1
	speed 1
	volume_envelope 8, 0
	note B_, 3
	inc_octave
	note C_, 10
	speed 13
	rest 1
	note C_, 1
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
	note C_, 1
	rest 1
	note C_, 1
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
	note C_, 1
	note C_, 1
	dec_octave
;	cutoff 4
	note F_, 1
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
;	cutoff 4
	note D_, 1
	rest 1
;	cutoff 8
	note F_, 1
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
	note C_, 2
;	cutoff 4
	note D_, 1
	dec_octave
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
;	cutoff 4
	note A_, 1
	rest 1
;	cutoff 8
	note B_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
;	cutoff 4
	note A_, 1
;	cutoff 8
	note G_, 1
;	cutoff 4
	note A_, 1
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
	note C_, 2
	dec_octave
	speed 1
	note B_, 3
	inc_octave
	note C_, 10
	dec_octave
	speed 13
;	cutoff 4
	note B_, 1
;	cutoff 6
	note A#, 2
;	sound_call Branch_fbacb
	octave 3
;	cutoff 8
.Loop5
	note A#, 1
	rest 1
	sound_loop 3, .Loop5
	inc_octave
	note C_, 3
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 8, 0
	note A_, 1
	inc_octave
;	cutoff 4
	note C_, 1
	dec_octave
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note A#, 3
	note B_, 16
	rest 7
	note A#, 3
	note B_, 10
	dec_octave
	speed 13
	volume_envelope 9, 2
	note B_, 1
	inc_octave
	volume_envelope 8, 0
	note B_, 1
	rest 1
	note A_, 1
	dec_octave
	volume_envelope 9, 2
	note B_, 1
	inc_octave
	volume_envelope 8, 0
	note B_, 3
	volume_envelope 9, 2
	note D_, 1
	rest 1
	volume_envelope 8, 0
	note B_, 1
	inc_octave
;	cutoff 4
	note D_, 1
;	sound_ret
	octave 4
	note G_, 1
;	cutoff 8
	note E_, 1
	speed 13
	rest 1
	note C_, 1
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
	note C_, 1
	rest 1
	note C_, 1
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
;	cutoff 7
	note C_, 2
;	cutoff 8
	note C_, 1
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
;	cutoff 4
	note F_, 1
	rest 1
;	cutoff 8
	note A_, 1
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	volume_envelope 8, 0
;	cutoff 7
	note C_, 2
;	cutoff 8
	note C_, 1
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
;	cutoff 4
	note F_, 1
	rest 1
	note G#, 1
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note B_, 3
	inc_octave
	note C_, 10
;	tie
	speed 13
	note C_, 3
	rest 1
	dec_octave
	note A_, 1
	inc_octave
;	cutoff 4
	note C_, 1
	dec_octave
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note A#, 3
	note B_, 10
	rest 13
	dec_octave
	volume_envelope 9, 0
	note A#, 3
	note B_, 10
	volume_envelope 2, 7
	note B_, 13
	inc_octave
	volume_envelope 9, 0
	note C_, 13
	volume_envelope 2, 7
	note C_, 13
	volume_envelope 9, 0
	speed 13
	note D_, 2
	volume_envelope 2, 7
	note D_, 1
;	sound_call Branch_fbb10
	octave 3
	speed 13
	volume_envelope 8, 0
	note C_, 1
;	cutoff 3
	note D_, 1
	volume_envelope 9, 2
;	cutoff 8
	note C_, 1
	volume_envelope 8, 0
	note B_, 2
;	cutoff 3
	note A_, 1
	volume_envelope 9, 3
;	cutoff 8
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note D#, 3
	note E_, 10
;	tie
	speed 13
	note E_, 2
	volume_envelope 9, 2
	note D_, 1
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note G_, 5
	volume_envelope 2, 7
	note G_, 8
	volume_envelope 7, 0
	note F_, 5
	note G_, 4
	note F_, 4
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note D_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	volume_envelope 7, 0
	note D_, 13
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	speed 13
	volume_envelope 7, 0
	note E_, 4
	inc_octave
	inc_octave
	speed 1
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	volume_envelope 7, 0
	note B_, 13
	inc_octave
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	volume_envelope 7, 0
	note B_, 5
	volume_envelope 2, 7
	note B_, 8
	volume_envelope 7, 0
	note G_, 5
	volume_envelope 2, 7
	note G_, 8
	dec_octave
	dec_octave
	duty_cycle 1
	volume_envelope 8, 0
	note B_, 3
	inc_octave
	note C_, 10
	speed 13
;	cutoff 3
	note D_, 1
	note E_, 1
;	cutoff 8
	note F_, 2
;	sound_ret
	rest 1
	octave 2
	note A_, 1
	rest 1
	note B_, 1
	note A_, 1
	inc_octave
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 8, 0
	note E_, 2
	rest 1
	note C_, 1
	rest 1
	dec_octave
;	cutoff 7
	note G_, 1
;	cutoff 8
	note G_, 1
	inc_octave
	volume_envelope 9, 2
	note C_, 1
	dec_octave
	speed 1
	volume_envelope 8, 0
	note E_, 3
	note F_, 10
;	tie
	speed 13
	note F_, 1
	rest 1
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note F_, 13
	note A_, 6
	volume_envelope 2, 7
	note A_, 7
	inc_octave
	volume_envelope 7, 0
	note C_, 6
	volume_envelope 2, 7
	note C_, 7
	volume_envelope 7, 0
	note E_, 6
	volume_envelope 2, 7
	note E_, 7
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note D#, 3
	note E_, 10
;	tie
	speed 13
	note E_, 1
	note F_, 1
	speed 1
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	volume_envelope 7, 0
	note D_, 5
	volume_envelope 2, 7
	note D_, 8
	speed 13
	rest 1
	dec_octave
	dec_octave
	volume_envelope 9, 0
	duty_cycle 1
	note B_, 1
	inc_octave
	speed 1
	note C_, 6
	volume_envelope 2, 7
	note C_, 7
	volume_envelope 9, 0
	note D_, 6
	volume_envelope 2, 7
	note D_, 7
;	sound_call Branch_fbb10
	octave 3
	speed 13
	volume_envelope 8, 0
	note C_, 1
;	cutoff 3
	note D_, 1
	volume_envelope 9, 2
;	cutoff 8
	note C_, 1
	volume_envelope 8, 0
	note B_, 2
;	cutoff 3
	note A_, 1
	volume_envelope 9, 3
;	cutoff 8
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note D#, 3
	note E_, 10
;	tie
	speed 13
	note E_, 2
	volume_envelope 9, 2
	note D_, 1
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note G_, 5
	volume_envelope 2, 7
	note G_, 8
	volume_envelope 7, 0
	note F_, 5
	note G_, 4
	note F_, 4
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note D_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	volume_envelope 7, 0
	note D_, 13
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	speed 13
	volume_envelope 7, 0
	note E_, 4
	inc_octave
	inc_octave
	speed 1
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	volume_envelope 7, 0
	note B_, 13
	inc_octave
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	volume_envelope 7, 0
	note B_, 5
	volume_envelope 2, 7
	note B_, 8
	volume_envelope 7, 0
	note G_, 5
	volume_envelope 2, 7
	note G_, 8
	dec_octave
	dec_octave
	duty_cycle 1
	volume_envelope 8, 0
	note B_, 3
	inc_octave
	note C_, 10
	speed 13
;	cutoff 3
	note D_, 1
	note E_, 1
;	cutoff 8
	note F_, 2
;	sound_ret
	octave 3
	rest 1
	note F_, 1
	rest 1
	note G#, 1
	note F_, 1
	volume_envelope 9, 2
	note C_, 1
	inc_octave
	speed 1
	volume_envelope 8, 0
	note D_, 3
	note D#, 10
;	tie
	speed 13
	note D#, 2
	dec_octave
	dec_octave
	volume_envelope 9, 2
	note G#, 1
	rest 1
	speed 1
	rest 6
	volume_envelope 9, 0
	note G#, 7
	inc_octave
	note C_, 6
	note D#, 7
	note G_, 6
	note A#, 7
	sound_ret

Branch_fba68:
	octave 3
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 9, 0
	note C_, 1
	note E_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note F_, 1
	volume_envelope 3, 7
	note F_, 1
	rest 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note G_, 1
	volume_envelope 3, 7
	note G_, 1
	volume_envelope 9, 0
	note F_, 1
	volume_envelope 9, 2
	note C_, 1
	volume_envelope 9, 0
	note E_, 1
	volume_envelope 3, 7
	note E_, 1
	rest 1
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 9, 0
	note C_, 1
	note E_, 1
	volume_envelope 9, 2
	note C_, 1
	sound_ret

Branch_fba9d:
	octave 4
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note F#, 3
	note G_, 10
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	volume_envelope 7, 0
	note E_, 3
	note F_, 10
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	dec_octave
	speed 13
	duty_cycle 1
	volume_envelope 9, 2
	note C_, 1
	duty_cycle 2
	volume_envelope 7, 0
	note G_, 1
	sound_ret

Branch_fbacb:
	octave 3
;	cutoff 8
.Loop4
	note A#, 1
	rest 1
	sound_loop 3, .Loop4
	inc_octave
	note C_, 3
	dec_octave
	volume_envelope 9, 2
	note C_, 1
	rest 1
	volume_envelope 8, 0
	note A_, 1
	inc_octave
;	cutoff 4
	note C_, 1
	dec_octave
;	cutoff 8
	volume_envelope 9, 2
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note A#, 3
	note B_, 16
	rest 7
	note A#, 3
	note B_, 10
	dec_octave
	speed 13
	volume_envelope 9, 2
	note B_, 1
	inc_octave
	volume_envelope 8, 0
	note B_, 1
	rest 1
	note A_, 1
	dec_octave
	volume_envelope 9, 2
	note B_, 1
	inc_octave
	volume_envelope 8, 0
	note B_, 3
	volume_envelope 9, 2
	note D_, 1
	rest 1
	volume_envelope 8, 0
	note B_, 1
	inc_octave
;	cutoff 4
	note D_, 1
	sound_ret

Branch_fbb10:
	octave 3
	speed 13
	volume_envelope 8, 0
	note C_, 1
;	cutoff 3
	note D_, 1
	volume_envelope 9, 2
;	cutoff 8
	note C_, 1
	volume_envelope 8, 0
	note B_, 2
;	cutoff 3
	note A_, 1
	volume_envelope 9, 3
;	cutoff 8
	note C_, 1
	speed 1
	volume_envelope 8, 0
	note D#, 3
	note E_, 10
;	tie
	speed 13
	note E_, 2
	volume_envelope 9, 2
	note D_, 1
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	speed 1
	note G_, 5
	volume_envelope 2, 7
	note G_, 8
	volume_envelope 7, 0
	note F_, 5
	note G_, 4
	note F_, 4
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	dec_octave
	duty_cycle 1
	volume_envelope 9, 2
	note D_, 13
	inc_octave
	duty_cycle 2
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	volume_envelope 7, 0
	note D_, 13
	note E_, 5
	volume_envelope 2, 7
	note E_, 8
	volume_envelope 7, 0
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	speed 13
	volume_envelope 7, 0
	note E_, 4
	inc_octave
	inc_octave
	speed 1
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	volume_envelope 7, 0
	note B_, 13
	inc_octave
	note C_, 5
	volume_envelope 2, 7
	note C_, 8
	dec_octave
	volume_envelope 7, 0
	note B_, 5
	volume_envelope 2, 7
	note B_, 8
	volume_envelope 7, 0
	note G_, 5
	volume_envelope 2, 7
	note G_, 8
	dec_octave
	dec_octave
	duty_cycle 1
	volume_envelope 8, 0
	note B_, 3
	inc_octave
	note C_, 10
	speed 13
;	cutoff 3
	note D_, 1
	note E_, 1
;	cutoff 8
	note F_, 2
	sound_ret


Music_TCGCredits_Ch3:
	speed 1
	stereo_panning TRUE, TRUE
	channel_volume 1
	fade_wave 11
;	echo 96
;	cutoff 8
	octave 2
.Loop1
	note G_, 6
	rest 7
	sound_loop 12, .Loop1
	note G_, 6
	note A_, 7
	note B_, 6
	inc_octave
	note C_, 7
	note D_, 6
	note E_, 7
	note F_, 6
	note G_, 7
	sound_call Branch_fbc46
	sound_call Branch_fbd47
	octave 2
.Loop2
	note B_, 6
	rest 7
	note B_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note B_, 6
	rest 7
	sound_loop 2, .Loop2
.Loop3
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop3
.Loop4
	note G#, 6
	rest 7
	note G#, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G#, 6
	rest 7
	sound_loop 2, .Loop4
	sound_call Branch_fbe10
	sound_call Branch_fbd6b
	sound_call Branch_fbdb7
	sound_call Branch_fbe3d
	octave 2
	note B_, 13
	sound_call Branch_fbc46
	speed 1
	octave 2
.Loop5
	note G#, 6
	rest 7
	note G#, 6
	rest 7
	inc_octave
	inc_octave
;	cutoff 4
	note D#, 13
	dec_octave
	dec_octave
;	cutoff 8
	note G#, 6
	rest 7
	sound_loop 2, .Loop5
	inc_octave
.Loop6
	note C#, 6
	rest 7
	note C#, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note C#, 6
	rest 7
	sound_loop 2, .Loop6
	note C_, 6
	rest 7
	note C_, 6
	rest 7
	inc_octave
;	cutoff 4
	note C_, 13
	dec_octave
;	cutoff 8
	note C_, 6
	rest 7
	note C_, 6
	rest 7
	note C_, 6
	rest 7
	dec_octave
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	speed 13
	note C_, 8
;	tie
	note C_, 1
	rest 2
	sound_ret

Branch_fbc46:
	speed 1
	octave 3
;	sound_call Branch_fbd47
	octave 3
.Loop7
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop7
;	sound_ret
;	sound_call Branch_fbe23
	octave 3
.Loop8
	note C_, 6
	rest 7
	sound_loop 2, .Loop8
;	cutoff 4
	note A_, 13
;	cutoff 8
	note C_, 6
	rest 7
.Loop9
	note C_, 6
	rest 7
	sound_loop 2, .Loop9
;	cutoff 4
	note F_, 13
;	cutoff 8
	note C_, 6
	rest 7
;	sound_ret
;	sound_call Branch_fbd47
	octave 3
.Loop10
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop10
;	sound_ret
.Loop11
	note C_, 6
	rest 7
	sound_loop 2, .Loop11
;	cutoff 4
	note A_, 13
;	cutoff 8
	note C_, 6
	rest 7
.Loop12
	note C_, 6
	rest 7
	sound_loop 2, .Loop12
	inc_octave
;	cutoff 4
	note C_, 13
	dec_octave
;	cutoff 8
	note C_, 6
	rest 7
;	sound_call Branch_fbd47
	octave 3
.Loop13
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop13
;	sound_ret
;	sound_call Branch_fbe23
	octave 3
.Loop14
	note C_, 6
	rest 7
	sound_loop 2, .Loop14
;	cutoff 4
	note A_, 13
;	cutoff 8
	note C_, 6
	rest 7
.Loop15
	note C_, 6
	rest 7
	sound_loop 2, .Loop15
;	cutoff 4
	note F_, 13
;	cutoff 8
	note C_, 6
	rest 7
;	sound_ret
	octave 3
.Loop16
	note C_, 6
	rest 7
	sound_loop 2, .Loop16
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
.Loop17
	note C_, 6
	rest 7
	sound_loop 2, .Loop17
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note G_, 13
;	tie
	speed 13
	note G_, 7
	rest 1
	speed 1
;	sound_call Branch_fbd47
	octave 3
.Loop18
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop18
;	sound_ret
;	sound_call Branch_fbd58
	octave 2
.Loop19
	note B_, 6
	rest 7
	note B_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note B_, 6
	rest 7
	sound_loop 2, .Loop19
;	sound_ret
;	sound_call Branch_fbd6b
	octave 2
.Loop20
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop20
;	sound_ret
;	sound_call Branch_fbd7e
	octave 2
.Loop21
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop21
;	sound_ret
;	sound_call Branch_fbd91
	octave 2
.Loop22
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop22
;	sound_ret
;	sound_call Branch_fbda4
	octave 2
.Loop23
	note E_, 6
	rest 7
	note E_, 6
	rest 7
	inc_octave
;	cutoff 4
	note E_, 13
	dec_octave
;	cutoff 8
	note E_, 6
	rest 7
	sound_loop 2, .Loop23
;	sound_ret
;	sound_call Branch_fbdb7
	octave 2
.Loop24
	note D_, 6
	rest 7
	note D_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note D_, 6
	rest 7
	sound_loop 2, .Loop24
;	sound_ret
;	sound_call Branch_fbdca
	octave 2
.Loop25
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop25
;	sound_ret
;	sound_call Branch_fbd47
	octave 3
.Loop26
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop26
;	sound_ret
;	sound_call Branch_fbd58
	octave 2
.Loop27
	note B_, 6
	rest 7
	note B_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note B_, 6
	rest 7
	sound_loop 2, .Loop27
;	sound_ret
;	sound_call Branch_fbd6b
	octave 2
.Loop28
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop28
;	sound_ret
;	sound_call Branch_fbd7e
	octave 2
.Loop29
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop29
;	sound_ret
;	sound_call Branch_fbddd
	octave 2
.Loop30
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G#, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop30
;	sound_ret
;	sound_call Branch_fbdf0
	octave 2
.Loop31
	note A#, 6
	rest 7
	note A#, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note A#, 6
	rest 7
	sound_loop 2, .Loop31
;	sound_ret
;	sound_call Branch_fbd47
	octave 3
.Loop32
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop32
;	sound_ret
;	sound_call Branch_fbe03
	octave 3
	note C_, 6
	rest 7
	dec_octave
	note C_, 13
	rest 13
	note D_, 13
	rest 13
	note E_, 13
	rest 13
	note C_, 6
	rest 7
;	sound_ret
;	sound_call Branch_fbd91
	octave 2
.Loop33
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop33
;	sound_ret
;	sound_call Branch_fbdca
	octave 2
.Loop34
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop34
;	sound_ret
;	sound_call Branch_fbe10
	octave 2
.Loop35
	note E_, 6
	rest 7
	note E_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note E_, 6
	rest 7
	sound_loop 2, .Loop35
;	sound_ret
;	sound_call Branch_fbd6b
	octave 2
.Loop36
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop36
;	sound_ret
;	sound_call Branch_fbdb7
	octave 2
.Loop37
	note D_, 6
	rest 7
	note D_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note D_, 6
	rest 7
	sound_loop 2, .Loop37
;	sound_ret
;	sound_call Branch_fbdca
	octave 2
.Loop38
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop38
;	sound_ret
;	sound_call Branch_fbd47
	octave 3
.Loop39
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop39
;	sound_ret
;	sound_call Branch_fbe03
	octave 3
	note C_, 6
	rest 7
	dec_octave
	note C_, 13
	rest 13
	note D_, 13
	rest 13
	note E_, 13
	rest 13
	note C_, 6
	rest 7
;	sound_ret
;	sound_call Branch_fbd91
	octave 2
.Loop40
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop40
;	sound_ret
;	sound_call Branch_fbdca
	octave 2
.Loop41
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop41
;	sound_ret
;	sound_call Branch_fbe10
	octave 2
.Loop42
	note E_, 6
	rest 7
	note E_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note E_, 6
	rest 7
	sound_loop 2, .Loop42
;	sound_ret
;	sound_call Branch_fbd6b
	octave 2
.Loop43
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop43
;	sound_ret
;	sound_call Branch_fbdb7
	octave 2
.Loop44
	note D_, 6
	rest 7
	note D_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note D_, 6
	rest 7
	sound_loop 2, .Loop44
;	sound_ret
;	sound_call Branch_fbdf0
	octave 2
.Loop45
	note A#, 6
	rest 7
	note A#, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note A#, 6
	rest 7
	sound_loop 2, .Loop45
;	sound_ret
;	sound_call Branch_fbdca
	octave 2
.Loop46
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop46
;	sound_ret
	octave 2
	note G_, 6
	rest 7
	note G_, 13
	inc_octave
	note G_, 6
	rest 7
	dec_octave
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	speed 13
	note B_, 2
	note G_, 1
	speed 1
;	sound_call Branch_fbd47
	octave 3
.Loop47
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop47
;	sound_ret
;	sound_call Branch_fbd58
	octave 2
.Loop48
	note B_, 6
	rest 7
	note B_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note B_, 6
	rest 7
	sound_loop 2, .Loop48
;	sound_ret
;	sound_call Branch_fbd6b
	octave 2
.Loop49
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop49
;	sound_ret
;	sound_call Branch_fbd7e
	octave 2
.Loop50
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop50
;	sound_ret
;	sound_call Branch_fbd91
	octave 2
.Loop51
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop51
;	sound_ret
;	sound_call Branch_fbda4
	octave 2
.Loop52
	note E_, 6
	rest 7
	note E_, 6
	rest 7
	inc_octave
;	cutoff 4
	note E_, 13
	dec_octave
;	cutoff 8
	note E_, 6
	rest 7
	sound_loop 2, .Loop52
;	sound_ret
;	sound_call Branch_fbdb7
	octave 2
.Loop53
	note D_, 6
	rest 7
	note D_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note D_, 6
	rest 7
	sound_loop 2, .Loop53
;	sound_ret
;	sound_call Branch_fbe3d
	octave 2
.Loop54
	note G_, 6
	rest 7
	sound_loop 2, .Loop54
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	note G_, 13
	note A_, 13
;	sound_ret
	octave 2
	note B_, 6
	rest 7
;	sound_call Branch_fbd47
	octave 3
.Loop55
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop55
;	sound_ret
;	sound_call Branch_fbd58
	octave 2
.Loop56
	note B_, 6
	rest 7
	note B_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note B_, 6
	rest 7
	sound_loop 2, .Loop56
;	sound_ret
;	sound_call Branch_fbd6b
	octave 2
.Loop57
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop57
;	sound_ret
;	sound_call Branch_fbd7e
	octave 2
.Loop58
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop58
;	sound_ret
;	sound_call Branch_fbddd
	octave 2
.Loop59
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G#, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop59
;	sound_ret
	octave 2
.Loop60
	note A#, 6
	rest 7
	sound_loop 2, .Loop60
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note A#, 6
	rest 7
	note A#, 6
	inc_octave
	note F_, 7
	note G#, 6
	inc_octave
	note C_, 7
	note D#, 6
	note G_, 7
	dec_octave
	dec_octave
	note A#, 6
	rest 7
	sound_ret

Branch_fbd47:
	octave 3
.Loop12
	note C_, 6
	rest 7
	note C_, 6
	rest 7
;	cutoff 4
	note G_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_loop 2, .Loop12
	sound_ret

Branch_fbd58:
	octave 2
.Loop13
	note B_, 6
	rest 7
	note B_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note B_, 6
	rest 7
	sound_loop 2, .Loop13
	sound_ret

Branch_fbd6b:
	octave 2
.Loop14
	note A_, 6
	rest 7
	note A_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note A_, 6
	rest 7
	sound_loop 2, .Loop14
	sound_ret

Branch_fbd7e:
	octave 2
.Loop15
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop15
	sound_ret

Branch_fbd91:
	octave 2
.Loop16
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop16
	sound_ret

Branch_fbda4:
	octave 2
.Loop17
	note E_, 6
	rest 7
	note E_, 6
	rest 7
	inc_octave
;	cutoff 4
	note E_, 13
	dec_octave
;	cutoff 8
	note E_, 6
	rest 7
	sound_loop 2, .Loop17
	sound_ret

Branch_fbdb7:
	octave 2
.Loop18
	note D_, 6
	rest 7
	note D_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note D_, 6
	rest 7
	sound_loop 2, .Loop18
	sound_ret

Branch_fbdca:
	octave 2
.Loop19
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	sound_loop 2, .Loop19
	sound_ret

Branch_fbddd:
	octave 2
.Loop20
	note F_, 6
	rest 7
	note F_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G#, 13
	dec_octave
;	cutoff 8
	note F_, 6
	rest 7
	sound_loop 2, .Loop20
	sound_ret

Branch_fbdf0:
	octave 2
.Loop21
	note A#, 6
	rest 7
	note A#, 6
	rest 7
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note A#, 6
	rest 7
	sound_loop 2, .Loop21
	sound_ret

Branch_fbe03:
	octave 3
	note C_, 6
	rest 7
	dec_octave
	note C_, 13
	rest 13
	note D_, 13
	rest 13
	note E_, 13
	rest 13
	note C_, 6
	rest 7
	sound_ret

Branch_fbe10:
	octave 2
.Loop22
	note E_, 6
	rest 7
	note E_, 6
	rest 7
	inc_octave
;	cutoff 4
	note G_, 13
	dec_octave
;	cutoff 8
	note E_, 6
	rest 7
	sound_loop 2, .Loop22
	sound_ret

Branch_fbe23:
	octave 3
.Loop23
	note C_, 6
	rest 7
	sound_loop 2, .Loop23
;	cutoff 4
	note A_, 13
;	cutoff 8
	note C_, 6
	rest 7
.Loop24
	note C_, 6
	rest 7
	sound_loop 2, .Loop24
;	cutoff 4
	note F_, 13
;	cutoff 8
	note C_, 6
	rest 7
	sound_ret

Branch_fbe3d:
	octave 2
.Loop25
	note G_, 6
	rest 7
	sound_loop 2, .Loop25
	inc_octave
;	cutoff 4
	note F_, 13
	dec_octave
;	cutoff 8
	note G_, 6
	rest 7
	note G_, 6
	rest 7
	note G_, 13
	note A_, 13
	sound_ret


Music_TCGCredits_Ch4:
	toggle_noise 6
	drum_speed 1
	octave 1
.Loop1
	drum_note 3, 13
	sound_loop 8, .Loop1
.Loop2
	drum_note 2, 13
	sound_loop 4, .Loop2
.Loop3
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 4, .Loop3
	sound_call Branch_fbe86
.Loop4
	sound_call Branch_fbed1
	sound_loop 7, .Loop4
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 3, 4
	drum_note 3, 3
.Loop5
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 4, .Loop5
	sound_call Branch_fbe86
.Loop6
	sound_call Branch_fbed1
	sound_loop 2, .Loop6
	sound_call Branch_fbeea
	drum_speed 13
	drum_note 6, 8
	rest 3
	sound_ret

Branch_fbe86:
.Loop7
;	sound_call Branch_fbed1
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 5, 13
;	sound_ret
	sound_loop 6, .Loop7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_speed 13
	drum_note 6, 7
	drum_note 2, 2
	drum_speed 1
.Loop8
;	sound_call Branch_fbed1
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 5, 13
;	sound_ret
	sound_loop 15, .Loop8
;	sound_call Branch_fbedb
	drum_note 1, 13
	drum_note 4, 6
	drum_note 3, 7
	drum_note 2, 6
	drum_note 2, 7
.Loop9
	drum_note 2, 6
	drum_note 3, 4
	drum_note 3, 3
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 2, .Loop9
	drum_note 2, 13
;	sound_ret
.Loop10
;	sound_call Branch_fbed1
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 5, 13
;	sound_ret
	sound_loop 7, .Loop10
;	sound_call Branch_fbedb
	drum_note 1, 13
	drum_note 4, 6
	drum_note 3, 7
	drum_note 2, 6
	drum_note 2, 7
.Loop11
	drum_note 2, 6
	drum_note 3, 4
	drum_note 3, 3
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 2, .Loop11
	drum_note 2, 13
;	sound_ret
.Loop12
;	sound_call Branch_fbed1
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 5, 13
;	sound_ret
	sound_loop 7, .Loop12
;	sound_call Branch_fbeea
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 3, 4
	drum_note 3, 3
.Loop13
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 3, .Loop13
	drum_note 2, 13
;	sound_ret
.Loop14
;	sound_call Branch_fbed1
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 5, 13
;	sound_ret
	sound_loop 7, .Loop14
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 6
	drum_note 3, 4
	drum_note 3, 3
	drum_note 2, 6
	drum_note 2, 7
	drum_note 2, 13
.Loop15
;	sound_call Branch_fbed1
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 5, 13
;	sound_ret
	sound_loop 5, .Loop15
;	sound_call Branch_fbeea
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 3, 4
	drum_note 3, 3
.Loop16
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 3, .Loop16
	drum_note 2, 13
;	sound_ret
	sound_ret

Branch_fbed1:
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 4, 7
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 5, 13
	sound_ret

Branch_fbedb:
	drum_note 1, 13
	drum_note 4, 6
	drum_note 3, 7
	drum_note 2, 6
	drum_note 2, 7
.Loop13
	drum_note 2, 6
	drum_note 3, 4
	drum_note 3, 3
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 2, .Loop13
	drum_note 2, 13
	sound_ret

Branch_fbeea:
	drum_note 1, 13
	drum_note 4, 13
	drum_note 2, 13
	drum_note 4, 6
	drum_note 3, 4
	drum_note 3, 3
.Loop14
	drum_note 2, 6
	drum_note 2, 7
	sound_loop 3, .Loop14
	drum_note 2, 13
	sound_ret
