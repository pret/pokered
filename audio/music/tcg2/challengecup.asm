Music_GRChallengeCup::
	channel_count 4
	channel 1, Music_GRChallengeCup_Ch1
	channel 2, Music_GRChallengeCup_Ch2
	channel 3, Music_GRChallengeCup_Ch3
	channel 4, Music_GRChallengeCup_Ch4

Music_GRChallengeCup_Ch2::
	speed 1
	stereo_panning2 TRUE, TRUE
;	preset 0
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 4
	vibrato 24, 3, 3
;	musicef -1
	note C_, 4
	note C#, 4
	note D_, 4
	note D#, 4
;	musicf1 69
	;note E_, 15
;	tie
	;note E_, 15
;	tie
	;note E_, 8
	speed 4 ;
	note E_, 9 ;
	speed 1 ;
	rest 9 ;
	;note E_, 7
	note E_, 5
	;note E_, 3
	rest 3 ;
	note F_, 5
	rest 2 ;
	;note E_, 2
	note G_, 15
	note G_, 5
	note F_, 15
	note F_, 5
	note D_, 15
	note D_, 5
	speed 4 ;
	note E_, 9 ;
	speed 1 ;
	rest 9 ;
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 8
;	note E_, 7
	note E_, 5
	;note E_, 3
	rest 3 ;
	note E_, 5
	;note E_, 2
	rest 2 ;
	note D_, 15
	note D_, 5
	dec_octave
	note B_, 15
	note B_, 5
	inc_octave
	note D_, 15
	note D_, 5
	speed 2 ;
	note E_, 11 ;
	speed 1 ;
	rest 8 ;
;	note E_, 15
;	tie
;	note E_, 8
;	note E_, 7
	note A_, 5
	rest 5 ;
	note E_, 5
	rest 5 ;
	;note E_, 5
	note A_, 5
	rest 5 ;
	;note A_, 5
	;note E_, 5
	note B_, 15
	note B_, 5
	note G_, 15
	note G_, 5
	note B_, 15
	note B_, 5
;	musicef -6
	volume_envelope 1, -6
;	musicf3
	speed 6 ;
	note A_, 14 ;
	speed 1 ;
	rest 1 ;
;	note A_, 10
;	tie
;	speed 1
;	note A_, 15
;	tie
;	note A_, 10
	volume_envelope 10, 0
;	musicf1 54
	rest 5
	;note A_, 5
	speed 2 ;
	rest 15 ;
	;note A_, 15 ;
	speed 1 ;
;	tie
;   note A_, 15
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicef -1
;	musicf1 67
.Loop1
	octave 2
;	musicf2
;	cutoff 8
	;note E_, 5
	note E_, 10
	rest 5 ;
	note E_, 5
	;note E_, 3
	rest 3
	note E_, 5
	;note E_, 2
	rest 2
;	musicf3
	note E_, 15
;	musicf2
	note E_, 5
	;note E_, 3
	rest 3
	note E_, 5
	;note E_, 2
	rest 2
	sound_loop 2, .Loop1
.MainLoop
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicef -1
;	musicf1 67
.Loop2
	octave 2
;	musicf2
;	cutoff 8
	;note F_, 5
	note F_, 10
	rest 5 ;
	note F_, 5
	;note F_, 3
	rest 3 ;
	note F_, 5
	;note F_, 2
	rest 2 ;
;	musicf3
	note F_, 15
;	musicf2
	note F_, 5
	;note F_, 3
	rest 3 ;
	note F_, 5
	;note F_, 2
	rest 2 ;
	sound_loop 2, .Loop2
.Loop3
	octave 2
;	musicf2
;	cutoff 8
	;note F#, 5
	note F#, 10
	rest 5 ;
	note F#, 5
	;note F#, 3
	rest 3 ;
	note F#, 5
	;note F#, 2
	rest 2 ;
;	musicf3
	note F#, 15
;	musicf2
	note F#, 5
	;note F#, 3
	rest 3 ;
	note F#, 5
	;note F#, 2
	rest 2 ;
	sound_loop 2, .Loop3
	octave 2
;	musicf2
;	cutoff 8
	;note F_, 5
	note F_, 10
	rest 5 ;
	note F_, 5
	;note F_, 3
	rest 3 ;
	note F_, 5
	;note F_, 2
	rest 2 ;
;	musicf3
	note F_, 15
;	musicf2
	note F_, 5
	;note F_, 3
	rest 3 ;
	note F_, 5
	;note F_, 2
	rest 2 ;
	octave 2
;	musicf2
;	cutoff 8
	;note F_, 5
	note F_, 10
	rest 5 ;
	note F_, 5
	;note F_, 3
	rest 3 ;
	note F_, 5
	;note F_, 2
	rest 2 ;
;	musicf3
;	preset 0
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicef 1
;	vibrato_type 1
	vibrato 15, 3, 3
	octave 3
;	frequency_offset 0
;	musicf1 70
	note E_, 15
	;note E_, 8
	rest 8 ;
	note E_, 5
	;note E_, 2
	rest 2 ;
	inc_octave
	vibrato 30, 3, 3
	speed 15 ;
	note E_, 5 ;
	speed 1 ;
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 8
;	note E_, 7
	dec_octave
;	musicf3
	note A_, 15
	note B_, 15
	inc_octave
	note C_, 15
;	musicf1 70
	vibrato 15, 3, 3
	speed 15 ;
	note D_, 3 ;
	speed 1 ;
;	note D_, 15
;	tie
;	note D_, 15
;	note D_, 15
	note C_, 8
	note D_, 7
;	note C_, 15
;	tie
;	note C_, 15
;	note C_, 15
	speed 15 ;
	note C_, 3 ;
	speed 1 ;
	dec_octave
;	musicf3
	note A_, 8
	note B_, 7
;	musicf1 70
	inc_octave
;	note C_, 15
;	tie
;	note C_, 15
;	note C_, 15
	speed 15 ;
	note C_, 3 ;
	speed 1 ;
	vibrato 0, 3, 3
;	note C_, 8
;	note C_, 7
	note C_, 15
	dec_octave
;	musicf3
	note B_, 15
;	musicf1 70
	note A_, 8
	note B_, 7
	note G_, 8
	note A_, 7
	note B_, 8
	note G_, 7
	vibrato 30, 3, 3
	speed 15 ;
	note A_, 5 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
;	tie
;	note A_, 15
;	tie
;	note A_, 15
;	tie
;	note A_, 15
	note A_, 15
	note E_, 15
	note E_, 8
	note E_, 5
	note E_, 2
	inc_octave
	speed 15
	note E_, 4
	speed 1
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
	note E_, 8
	note E_, 7
;	musicf3
	dec_octave
	note A_, 15
	note B_, 15
	inc_octave
	note C_, 15
;	musicf1 70
	vibrato 15, 3, 3
	note D_, 15
;	tie
	note D_, 15
	note D_, 15
	note C_, 8
	note D_, 7
	note C_, 15
;	tie
	note C_, 15
	note C_, 15
	dec_octave
;	musicf3
	note A_, 8
	note B_, 7
;	musicf1 70
	vibrato 0, 3, 3
	inc_octave
	note C_, 15
;	tie
	note C_, 8
	note C_, 7
	note E_, 15
;	tie
	note E_, 8
	note E_, 7
	note D_, 15
	note D_, 5
	note G_, 15
	note G_, 5
	note D_, 15
	note D_, 5
	vibrato 15, 3, 3
;	musicf3
	speed 15 ;
	note F_, 3 ;
	speed 1 ;
;	note F_, 15
;	tie
;	note F_, 15
;	tie
;	note F_, 15
;	musicf1 70
	note E_, 8
	note F_, 7
	note E_, 15
;	tie
	note E_, 15
	note E_, 15
;	musicf3
	note F_, 8
	note G_, 7
;	musicf1 70
	note A_, 15
;	tie
	note A_, 15
	note A_, 15
	note A_, 8
	note A_, 7
;	musicf3
	note A_, 15
;	musicf1 70
	note G_, 8
	note A_, 7
	note F_, 8
	note G_, 7
	note A_, 8
	note F_, 7
	note G_, 15
	note G_, 8
	note C_, 5
	note G_, 2
	vibrato 0, 3, 3
	speed 15 ;
	note C_, 3 ;
	speed 1 ;
;	note C_, 15
;	tie
;	note C_, 15
;	tie
;	note C_, 15
;	tie
	note C_, 15
	note C_, 15
;	musicf3
	note D_, 8
	note E_, 7
;	musicf1 70
	vibrato 15, 3, 3
	note F_, 15
;	tie
	note F_, 15
	note F_, 15
	note F_, 8
	note F_, 7
;	musicf3
	note F_, 15
;	musicf1 70
	note E_, 8
	note F_, 7
	note D_, 8
	note E_, 7
	note F_, 8
	note D_, 7
	speed 15 ;
	note E_, 6 ;
	speed 1 ;
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
	note E_, 15
	dec_octave
;	musicf3
	note A_, 8
	note B_, 7
;	musicf1 70
	inc_octave
	note C_, 15
;	tie
	note C_, 15
	note C_, 15
	note C_, 8
	note C_, 7
;	musicf1 70
	note D_, 15
;	musicf1 70
	note C_, 8
	note D_, 7
	dec_octave
	note B_, 8
	inc_octave
	note C_, 7
	dec_octave
	note A_, 8
	note B_, 7
	note G_, 15
	note G_, 15
	inc_octave
;	musicf3
	speed 15 ;
	note G_, 4 ;
	speed 1 ; 
;	note G_, 15
;	tie
;	note G_, 15
;	tie
;	note G_, 15
;	tie
;	note G_, 15
;	musicf1 70
	note F_, 15
	note F_, 8
	note E_, 5
	note F_, 2
	note E_, 15
;	tie
	note E_, 15
	note E_, 8
;	musicf3
	note F_, 7
;	musicf1 70
	note E_, 5
	note F_, 3
	note C_, 5
	note E_, 2
	dec_octave
	note A_, 15
	note A_, 5
	inc_octave
	note C_, 15
	note D_, 5
	note D_, 15
	note D_, 5
;	musicf3
	speed 15 ;
	note C_, 3 ;
	speed 1 ;
;	note C_, 15
;	tie
;	note C_, 15
;	tie
;	note C_, 15
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	note A_, 3
;	musicf1 70
	note B_, 15
;	tie
	note B_, 15
	note B_, 15
	inc_octave
;	musicf3
	note C_, 8
	note D_, 7
	vibrato 30, 3, 3
;	musicef -1
	speed 15 ;
	note E_, 8 ;
	speed 1 ;
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
;	tie
;	note E_, 15
	sound_loop 0, .MainLoop


Music_GRChallengeCup_Ch1::
	speed 1
	stereo_panning2 TRUE, TRUE
;	preset 1
	volume_envelope 8, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicef -1
	octave 3
	vibrato 24, 3, 3
	note G_, 4
	note G#, 4
	note A_, 4
	note A#, 4
	inc_octave
;	musicf1 53
;	note C#, 15
;	tie
;	note C#, 15
;	tie
;	note C#, 8
	speed 4 ;
	note C#, 9 ;
	speed 1 ;
	rest 9 ;
	;note C#, 7
	note C#, 5
	rest 3 ;
	;note C#, 3
	note C#, 5
	rest 2 ;
	;note C#, 2
	note D_, 15
	note D_, 5
	note D_, 15
	note D_, 5
	dec_octave
	note A#, 15
	note A#, 5
	inc_octave
;	note C#, 15
;	tie
;	note C#, 15
;	tie
;	note C#, 8
	speed 4 ;
	note C#, 9 ;
	speed 1 ;
	rest 9 ;
	;note C#, 7
	note C#, 5
	note C#, 3
	note C#, 5
	note C#, 2
	dec_octave
	note B_, 15
	note B_, 5
	note G_, 15
	note G_, 5
	note B_, 15
	note B_, 5
	inc_octave
;	note C_, 15
;	tie
;	note C_, 8
	speed 2 ;
	note C_, 11 ;
	speed 1 ;
	rest 8 ;
	;note C_, 7
	note C_, 5
	;note C_, 5
	rest 5;
	note C_, 5
	;note C_, 5
	rest 5;
	note C_, 5
	;note C_, 5
	rest 5;
	note D_, 15
	note D_, 5
	dec_octave
	note B_, 15
	note B_, 5
	inc_octave
	note D_, 15
	note D_, 5
;	musicef -6
	volume_envelope 1, -6
;	musicf3
	speed 6 ;
	note C#, 14 ;
	speed 1 ;
	rest 1 ;
;	speed 6
;	note C#, 10
;	tie
;	speed 1
;	note C#, 15
;	tie
;	note C#, 10
	volume_envelope 9, 0
;	musicf1 54
	;note C#, 5
	rest 5 ;
	speed 2 ;
	rest 15 ;
	;note C#, 15 ;
	speed 1 ;
;	note C#, 15
;	tie
;	note C#, 15
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicf1 67
.Loop1
	octave 1
;	musicf2
;	cutoff 8
	;note A_, 5
	note A_, 10
	rest 5 ;
	note A_, 5
	;note A_, 3
	rest 3 ;
	note A_, 5
	;note A_, 2
	rest 2 ;
;	musicf3
	inc_octave
	note B_, 15
	dec_octave
;	musicf2
	note A_, 5
	;note A_, 3
	rest 3 ;
	note A_, 5
	;note A_, 2
	rest 2 ;
	sound_loop 2, .Loop1
.MainLoop
;	musicf1 67
.Loop2
	octave 1
;	musicf2
;	cutoff 8
	;note A_, 5
	note A_, 10
	rest 5 ;
	note A_, 5
	;note A_, 3
	rest 3 ;
	note A_, 5
	;note A_, 2
	rest 2 ;
;	musicf3
	inc_octave
	note B_, 15
	dec_octave
;	musicf2
	note A_, 5
	;note A_, 3
	rest 3 ;
	note A_, 5
	;note A_, 2
	rest 2 ;
	sound_loop 5, .Loop2
	octave 1
;	musicf2
;	cutoff 8
	;note A_, 5
	note A_, 10
	rest 5 ;
	note A_, 5
	;note A_, 3
	rest 3 ;
	note A_, 5
	;note A_, 2
	rest 2 ;
;	musicf3
	inc_octave
	note B_, 15
;	tie
	note B_, 8
	dec_octave
;	preset 21
	volume_envelope 8, 7
	duty_cycle 2
	vibrato 15, 3, 3
	volume_envelope 8, 0
	octave 2
	note A_, 5
	rest 2
	inc_octave
	speed 15 ;
	note A_, 2 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
	sound_call Branch_1f3140
	rest 15
	rest 15
	note E_, 15
;	pitch_offset 3
	sound_call Branch_1f3140
	note G_, 15
	speed 15 ;
	note F#, 2 ;
	speed 1 ;
;	note F#, 15
;	tie
;	note F#, 15
;	pitch_offset 2
	sound_call Branch_1f3140
	note F#, 8
	rest 7
	speed 15 ;
	note F#, 2 ;
	speed 1 ;
;	note F#, 15
;	tie
;	note F#, 15
;	pitch_offset 2
	sound_call Branch_1f3140
	note F#, 5
	rest 3
	note F#, 5
	rest 2
	speed 15 ;
	note F_, 2 ;
	speed 1 ;
;	note F_, 15
;	tie
;	note F_, 15
;	pitch_offset 1
	sound_call Branch_1f3140
	note F_, 8
	rest 7
	note D_, 15
	note C_, 8
	rest 7
;	pitch_offset 3
	sound_call Branch_1f3140
	note D_, 8
	rest 7
	speed 15 ;
	note E_, 2 ;
	speed 1 ;
;	note E_, 15
;	tie
;	note E_, 15
	sound_call Branch_1f3140
	rest 15
	rest 8
	sound_call Branch_1f3150
	rest 15
	dec_octave
	note A_, 15
	rest 8
	note A_, 7
	inc_octave
	speed 15 ;
	note A_, 2 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
	sound_call Branch_1f3140
	rest 15
	rest 15
	note E_, 15
;	pitch_offset 3
	sound_call Branch_1f3140
	note G_, 15
	speed 15 ;
	note F#, 2 ;
	speed 1 ;
;	note F#, 15
;	tie
;	note F#, 15
;	pitch_offset 2
	sound_call Branch_1f3140
	note F#, 8
	rest 7
	speed 15 ;
	note F#, 2 ;
	speed 1 ;
;	note F#, 15
;	tie
;	note F#, 15
;	pitch_offset 2
	sound_call Branch_1f3140
	note F#, 5
	rest 3
	note F#, 5
	rest 2
	note F_, 15
;	tie
	note F_, 8
	rest 7
;	pitch_offset 1
	sound_call Branch_1f3140
	rest 8
	rest 7
	note B_, 15
	rest 5
	note B_, 10
;	pitch_offset 3
	sound_call Branch_1f3140
	rest 15
	inc_octave
	speed 15 ;
	note C_, 2 ;
	speed 1 ;
;	note C_, 15
;	tie
;	note C_, 15
;	pitch_offset 8
	sound_call Branch_1f3140
	octave 3
	note G_, 8
	note F_, 7
	speed 15 ;
	note G_, 2 ;
	speed 1 ;
;	note G_, 15
;	tie
;	note G_, 15
;	pitch_offset 6
	sound_call Branch_1f3140
	note A_, 8
	note A#, 7
	inc_octave
	speed 15 ;
	note C_, 2 ;
	speed 1 ;
;	note C_, 15
;	tie
;	note C_, 15
;	pitch_offset 1
	sound_call Branch_1f3140
	octave 4
	note C_, 8
	rest 7
	dec_octave
	note B_, 15
	note B_, 8
	rest 7
;	pitch_offset 1
	sound_call Branch_1f3140
	octave 4
	note D_, 8
	rest 7
	note C_, 15
	rest 8
	dec_octave
	note G_, 5
	rest 2
	speed 4 ;
	note G_, 9 ;
	speed 1 ;
	rest 2 ;
;	note G_, 15
;	tie
;	note G_, 15
;	tie
;	note G_, 8
	sound_call Branch_1f3150
	rest 8
	rest 7
;	pitch_offset 3
	sound_call Branch_1f3140
	octave 3
	note F_, 8
	note G_, 7
	speed 15 ;
	note A_, 2 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
;	pitch_offset 5
	sound_call Branch_1f3140
	note A_, 8
	rest 7
	note G#, 13
	rest 2
	note G#, 8
	rest 7
;	pitch_offset 4
	sound_call Branch_1f3140
	note G#, 8
	rest 7
	speed 15 ;
	note A_, 2 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
	sound_call Branch_1f3140
	rest 15
	rest 8
	sound_call Branch_1f3150
	rest 15
;	pitch_offset 3
	sound_call Branch_1f3140
	note E_, 8
	note G_, 7
	speed 15 ;
	note A_, 2 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
;	pitch_offset 1
	sound_call Branch_1f3140
	note A_, 8
	rest 7
	note B_, 15
	note A_, 5
	rest 10
;	pitch_offset 3
	sound_call Branch_1f3140
	note F_, 8
	rest 7
	speed 15 ;
	note E_, 2 ;
;	note E_, 15
;	tie
;	note E_, 15
	inc_octave
	volume_envelope 5, -7
	note D_, 2 ;
;	note D_, 15
;	tie
;	note D_, 15
	volume_envelope 6, 0
	note C#, 2
;	note C#, 15
;	tie
;	note C#, 15
	speed 1 ;
;	pitch_offset 3
	sound_call Branch_1f3140
	rest 8
	dec_octave
	note G_, 5
	rest 2
	speed 15 ;
	note A_, 2 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
;	pitch_offset 1
	sound_call Branch_1f3140
	note A_, 8
	note F_, 7
	note D_, 15
	rest 5
	note F_, 10
;	pitch_offset 4
	sound_call Branch_1f3140
	rest 15
	speed 15 ;
	note G_, 2 ;
	speed 1 ;
;	note G_, 15
;	tie
;	note G_, 15
;	pitch_offset 1
	sound_call Branch_1f3140
	note G_, 4
	note D_, 4
	note C_, 4
	note D_, 3
	speed 15 ;
	note D_, 2 ;
	speed 1 ;
;	note D_, 15
;	tie
;	note D_, 15
	rest 15
	note G#, 8
	note B_, 7
	speed 15 ;
	note A_, 2 ;
	speed 1 ;
;	note A_, 15
;	tie
;	note A_, 15
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicef -1
	octave 2
;	musicf1 67
;	musicf3
	note B_, 15
;	musicf2
;	cutoff 8
	note E_, 5
	;note E_, 3
	rest 3 ;
	note E_, 5
	;note E_, 2
	rest 2 ;
	;note E_, 5
	note E_, 10
	rest 5 ;
	note E_, 5
	;note E_, 3
	rest 3 ;
	note E_, 5
	;note E_, 2
	rest 2 ; 
;	musicf3
	note B_, 15
	note E_, 5
	;note E_, 3
	rest 3 ;
	note E_, 5
	;note E_, 2
	rest 2 ;
	sound_loop 0, .MainLoop

Branch_1f3140:
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	musicef -1
	note E_, 15
;	musicef 1
;	preset 21
	volume_envelope 8, 7
	duty_cycle 2
	vibrato 15, 3, 3
;	musicf1 128
	octave 3
;	pitch_offset 0
	sound_ret

Branch_1f3150:
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	musicf2
	note G_, 4
	note G_, 3
;	preset 21
	volume_envelope 8, 7
	duty_cycle 2
	vibrato 15, 3, 3
	volume_envelope 8, 0
	octave 3
;	musicf3
	sound_ret


Music_GRChallengeCup_Ch3::
	speed 1
	fade_wave 11
	channel_volume 4
;	echo 96
	stereo_panning2 TRUE, TRUE
	octave 5
	rest 16
	octave 2
	speed 4 ;
	note A_, 9 ;
	speed 1 ;
	rest 9 ; 
;	note A_, 15
;	tie
;	note A_, 15
;	tie
;	note A_, 8
;	rest 7
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	note A#, 15
	rest 5
	note A#, 15
	rest 5
	note A#, 15
	rest 5
	speed 4 ;
	note A_, 9 ;
	speed 1 ;
	rest 9 ; 
;	note A_, 15
;	tie
;	note A_, 15
;	tie
;	note A_, 8
;	rest 7
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	speed 4 ;
	note F_, 9 ;
	speed 1 ;
	rest 9 ; 
;	note F_, 15
;	tie
;	note F_, 15
;	tie
;	note F_, 8
;	rest 7
	note F_, 5
	rest 3
	note F_, 5
	rest 2
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	note G_, 15
	rest 5
	speed 10 ;
	note A_, 9 ;
	speed 1 ;
;	note A_, 16
;	tie
;	note A_, 16
;	tie
;	note A_, 16
;	tie
;	note A_, 16
;	tie
;	note A_, 16
;	tie
;	note A_, 10
	rest 16
	rest 14
;	cutoff 4
	sound_call Branch_Bup1_short
	sound_call Branch_1f333b
	octave 2
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	octave 2
	note A_, 5
	rest 3
	note A_, 5
	rest 2
.MainLoop
;	cutoff 4
	octave 2
.Loop1
	sound_call Branch_Bup1_short
	sound_call Branch_1f333b
	octave 2
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	octave 2
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	sound_loop 3, .Loop1
	sound_call Branch_Bup1_short
	sound_call Branch_1f333b
	sound_call Branch_Bup1
;	pitch_offset 3
	sound_call Branch_1f333b
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	sound_call Branch_Bup1
;	pitch_offset 3
	sound_call Branch_1f333b
	sound_call Branch_Bup1
;	pitch_offset 5
	sound_call Branch_1f333b
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 8
	octave 4
;	cutoff 4
	note C_, 4
	rest 3
;	cutoff 8
	octave 2
;	cutoff 8
	note F#, 15
	note G_, 15
	note G#, 15
;	cutoff 4
	sound_call Branch_Bup1_short
	sound_call Branch_1f333b
	sound_call Branch_Bup1
;	pitch_offset 3
	sound_call Branch_1f333b
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	sound_call Branch_Bup1
;	pitch_offset 3
	sound_call Branch_1f333b
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	note B_, 10
	rest 5
	note B_, 5
	rest 3
	note B_, 5
	rest 2
;	pitch_offset 5
	sound_call Branch_1f333b
	note B_, 5
	rest 3
	note B_, 5
	rest 2
	inc_octave
	note C_, 10
	rest 5
	note C_, 5
	rest 3
	note C_, 5
	rest 2
;	pitch_offset 8
	sound_call Branch_1f333b
	octave 3
	note C_, 8
	dec_octave
	note G_, 7
	note C_, 8
	inc_octave
	inc_octave
;	cutoff 4
	note E_, 4
	rest 3
;	cutoff 4
	dec_octave
	dec_octave
	note C_, 8
	note C_, 7
;	cutoff 8
	note D_, 15
	note E_, 15
;	cutoff 4
	note F_, 10
	rest 5
	note F_, 5
	rest 3
	note F_, 5
	rest 2
;	pitch_offset 3
	sound_call Branch_1f333b
	note F_, 5
	rest 3
	note F_, 5
	rest 2
	note F_, 10
	rest 5
	note F_, 5
	rest 3
	note F_, 5
	rest 2
	sound_call Branch_1f333b
	note F_, 5
	rest 3
	note F_, 5
	rest 2
	note E_, 10
	rest 5
	note E_, 5
	rest 3
	note E_, 5
	rest 2
;	pitch_offset 254
	sound_call Branch_1f333b
	note E_, 5
	rest 3
	note E_, 5
	rest 2
	note E_, 8
	inc_octave
	inc_octave
;	cutoff 4
	note C_, 4
	rest 3
	dec_octave
	dec_octave
	note E_, 5
	rest 3
	note E_, 5
	rest 2
;	pitch_offset 5
	sound_call Branch_1f333b
	note E_, 5
	rest 3
	note E_, 5
	rest 2
	note D_, 10
	rest 5
	note D_, 5
	rest 3
	note D_, 5
	rest 2
;	pitch_offset 5
	sound_call Branch_1f333b
	note D_, 5
	rest 3
	note D_, 5
	rest 2
	note E_, 10
	rest 5
	note E_, 5
	rest 3
	note E_, 5
	rest 2
;	pitch_offset 7
	sound_call Branch_1f333b
	note E_, 5
	rest 3
	note E_, 5
	rest 2
	note A_, 10
	rest 5
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	sound_call Branch_1f333b
	note A_, 8
	note A_, 7
	note G_, 8
	inc_octave
	inc_octave
	note C_, 4
	rest 3
	dec_octave
	dec_octave
	note G_, 5
	rest 3
	note G_, 5
	rest 2
;	pitch_offset 3
	sound_call Branch_1f333b
	note G_, 5
	rest 3
	note G_, 5
	rest 2
	note F_, 10
	rest 5
	note F_, 5
	rest 3
	note F_, 5
	rest 2
;	pitch_offset 3
	sound_call Branch_1f333b
	note F_, 5
	rest 3
	note F_, 5
	rest 2
	note F_, 10
	rest 5
	note F_, 5
	rest 3
	note F_, 5
	rest 2
;	pitch_offset 5
	sound_call Branch_1f333b
	note F_, 5
	rest 3
	note F_, 5
	rest 2
	note E_, 10
	rest 5
	note E_, 5
	rest 3
	note E_, 5
	rest 2
;	pitch_offset 254
	sound_call Branch_1f333b
	note E_, 5
	rest 3
	note E_, 5
	rest 2
	note D#, 8
	inc_octave
	inc_octave
	note C#, 4
	rest 3
	dec_octave
	dec_octave
	note D#, 5
	rest 3
	note D#, 5
	rest 2
;	pitch_offset 4
	sound_call Branch_1f333b
	note D#, 5
	rest 3
	note D#, 5
	rest 2
	note D_, 10
	rest 5
	note D_, 5
	rest 3
	note D_, 5
	rest 2
;	pitch_offset 3
	sound_call Branch_1f333b
	note D_, 5
	rest 3
	note D_, 5
	rest 2
	note D_, 10
	rest 5
	note D_, 5
	rest 3
	note D_, 5
	rest 2
;	pitch_offset 3
	sound_call Branch_1f333b
	note D_, 5
	rest 3
	note D_, 5
	rest 2
	note G_, 10
	rest 5
	note G_, 5
	rest 3
	note G_, 5
	rest 2
;	pitch_offset 3
	sound_call Branch_1f333b
	inc_octave
	note D_, 5
	rest 3
	note D_, 5
	rest 2
;	cutoff 8
	note G_, 15
	dec_octave
	note G_, 15
	note G#, 15
	inc_octave
	note G#, 15
;	cutoff 4
	dec_octave
	sound_call Branch_Bup1_short
	sound_call Branch_1f333b
	sound_call Branch_Bup1
	sound_call Branch_1f333b
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	sound_loop 0, .MainLoop

Branch_1f333b:
	octave 3
	channel_volume 4
;	cutoff 8
	note A_, 15
	channel_volume 3
;	cutoff 4
;	pitch_offset 0
	octave 2
	sound_ret


Music_GRChallengeCup_Ch4::
	toggle_noise 6
	drum_speed 1
	octave 1
	rest 16
.Loop1
	drum_note 2, 16
	rest 16
	rest 13
	drum_note 2, 5
;	musicef -2
	drum_note 2, 5
	drum_note 2, 5
;	musicef 0
	drum_note 2, 16
	rest 4
	drum_note 2, 16
	rest 4
	drum_note 2, 16
	rest 4
	sound_loop 3, .Loop1
	drum_speed 5
	drum_note 6, 16
	drum_speed 1
	rest 10
	drum_note 2, 8
	drum_note_short 1, 15
	drum_note 2, 7
	sound_call Branch_1f33e9
.MainLoop
	sound_call Branch_1f33fd
	sound_call Branch_1f33e9
	drum_note_short 1, 8
	drum_note 2, 7
	drum_note_short 4, 8
	drum_note_short 1, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
;	musicef -3
	drum_note 2, 4
	drum_note 2, 3
;	musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note_short 4, 8
;	musicef -3
	drum_note 2, 4
	drum_note 2, 3
;	musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note_short 5, 7
	sound_call Branch_1f33e9
	sound_call Branch_1f33fd
	sound_call Branch_1f33e9
	drum_note_short 1, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note_short 1, 8
	drum_note 2, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note 2, 8
	drum_note_short 1, 7
	drum_note_short 5, 8
	drum_note 2, 7
	sound_call Branch_1f33e9
	sound_call Branch_1f33fd
	sound_call Branch_1f33e9
	drum_note_short 1, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note_short 1, 8
	drum_note 2, 7
	drum_note_short 4, 8
;	musicef -3
	drum_note 2, 4
	drum_note 2, 3
;	musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
.Loop2
	sound_call Branch_1f33e9
	sound_call Branch_1f33fd
	sound_loop 3, .Loop2
	sound_call Branch_1f33e9
	drum_note_short 1, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
;	musicef -3
	drum_note 2, 4
	drum_note 2, 3
;	musicef 0
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	drum_note 2, 8
	drum_note 2, 7
	sound_call Branch_1f33e9
	sound_loop 0, .MainLoop

Branch_1f33e9:
	octave 1
	drum_speed 1
	drum_note_short 1, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note_short 1, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 1, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 5, 7
	sound_ret

Branch_1f33fd:
	octave 1
	drum_speed 1
	drum_note_short 1, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note_short 1, 8
	drum_note 2, 7
	drum_note_short 4, 8
	drum_note_short 4, 7
	drum_note 2, 8
	drum_note_short 4, 7
	drum_note_short 5, 8
	drum_note 2, 7
	sound_ret

Branch_Bup1:
	note A_, 5
	rest 3
	note A_, 5
	rest 2
Branch_Bup1_short:
	note A_, 10
	rest 5
	note A_, 5
	rest 3
	note A_, 5
	rest 2
	sound_ret