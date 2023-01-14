Music_TCG2GameCorner:
	channel_count 4
	channel 1, Music_TCG2GameCorner_Ch1
	channel 2, Music_TCG2GameCorner_Ch2
	channel 3, Music_TCG2GameCorner_Ch3
	channel 4, Music_TCG2GameCorner_Ch4

Music_TCG2GameCorner_Ch2:
.MainLoop
;	preset 17
	volume_envelope 15, 1
	duty_cycle 1
	vibrato 28, 3, 3
	octave 1
;	musicf3
	vibrato 1, 3, 3
	speed 1
.Loop1
	note A_, 1
;	tie
	note G#, 1
;	tie
	note G_, 1
;	tie
	note F#, 1
;	tie
	note F_, 1
;	tie
	note E_, 1
;	tie
	note D#, 1
;	tie
	note D_, 1
;	tie
	note D#, 1
;	tie
	note D_, 1
;	tie
	note C#, 1
;	tie
	note C_, 1
	rest 12
	rest 3
	sound_loop 14, .Loop1
	rest 16
	rest 11
	sound_call Branch_1e75c7
;	preset 20
	volume_envelope 12, 1
	duty_cycle 1
	vibrato 1, 3, 3
	octave 4
	note A_, 7
	rest 6
;	musicf1 33
.Loop2
	rest 14
	octave 2
	note A_, 7
	note A_, 6
	sound_loop 14, .Loop2
	note A_, 7
	note A_, 7
	rest 13
	sound_call Branch_1e75c7
;	preset 20
	volume_envelope 12, 1
	duty_cycle 1
	vibrato 1, 3, 3
	octave 4
	note A_, 7
;	preset 18
	volume_envelope 7, -4
	duty_cycle 2
	vibrato 1, 3, 3
	octave 4
;	vibrato_type 18
	vibrato 1, 3, 3
;	musicef 1
	note C_, 6
;	musicf1 39
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	dec_octave
	note A_, 7
	note A_, 7
	note F#, 7
	note F#, 6
	note F_, 7
	note F_, 7
	inc_octave
	note D_, 7
	note D_, 6
	note C#, 14
	note C#, 7
;	musicf3
	note C_, 6
;	musicf2
	note C#, 7
	note C#, 7
	dec_octave
	note A_, 7
	note A_, 6
	note G#, 7
	note G#, 7
	note A_, 7
	note A_, 6
	note E_, 14
;	tie
	note E_, 13
	note E_, 7
;	musicf3
	note A_, 7
;	tie
	note B_, 7
	inc_octave
	note C_, 6
;	musicf2
	note C#, 7
	note C#, 7
	note C#, 7
	note C#, 6
	dec_octave
	note A_, 7
	note A_, 7
	note F#, 7
	note F#, 6
	note F_, 7
	note F_, 7
	inc_octave
	note D_, 7
	note D_, 6
	note C#, 14
	note C#, 7
;	musicf3
	note C_, 6
;	musicf2
;	musicef -1
;	musicf1 146
	note C#, 14
;	tie
	note C#, 13
;	tie
	note C#, 14
;	tie
	note C#, 13
;	tie
	note C#, 14
;	tie
	note C#, 7
	note C#, 13
;	musicef 1
;	musicf3
;	musicef 1
	note C#, 7
;	tie
	note D_, 7
;	musicef -1
	note D#, 6
;	musicf1 39
	note E_, 7
	note E_, 7
	note E_, 7
	note E_, 6
	note D#, 7
	note D#, 7
	note E_, 7
	note E_, 6
	note E_, 7
	note E_, 7
	note G_, 7
	note G_, 6
	note F#, 14
	note F#, 7
	note E_, 4
	note E_, 2
	note E_, 7
	note E_, 7
	note D_, 7
	note D_, 6
	note C#, 7
	note C#, 7
	note D_, 7
	note D_, 6
;	musicf3
	note F_, 14
;	tie
	note F_, 13
;	musicf2
	note E_, 7
	note E_, 7
	note D_, 7
	note D_, 6
	note C#, 7
	note C#, 7
	dec_octave
	note A_, 7
	note A_, 6
	note E_, 14
	note E_, 7
;	musicf3
	inc_octave
	note C#, 6
	dec_octave
;	musicf2
	note B_, 7
	note B_, 7
	note G#, 7
	note G#, 6
	note E_, 7
	note E_, 7
	note B_, 7
	note B_, 6
;	musicef 1
	note A_, 12
	note A_, 2
;	preset 20
	volume_envelope 12, 1
	duty_cycle 1
	vibrato 1, 3, 3
;	musicf3
	octave 3
	note A_, 7
	note C_, 6
	note C#, 7
	note E_, 7
	note F#, 7
	rest 6
	note A_, 6
	rest 8
	dec_octave
	note A_, 7
	inc_octave
	note E_, 6
	inc_octave
	note A_, 7
	rest 7
	rest 13
	sound_loop 0, .MainLoop

Branch_1e75c7:
;	preset 18
	volume_envelope 7, -4
	duty_cycle 2
	vibrato 1, 3, 3
;	musicf1 39
;	musicf3
;	vibrato_type 18
	vibrato 1, 3, 3
	octave 4
	rest 7
	note C#, 7
	note D_, 7
	note D#, 6
.Loop3
;	musicf2
	note E_, 7
	note E_, 7
	note E_, 7
	note E_, 6
;	musicf3
	note F#, 7
;	tie
	note E_, 7
	note D#, 7
;	tie
	note F#, 6
	sound_loop 2, .Loop3
;	musicf2
	note E_, 7
	note E_, 7
	note A_, 7
	note A_, 6
	note G#, 14
	note G#, 7
;	musicf3
	note F#, 6
;	musicf2
	note D_, 14
;	tie
	note D_, 13
	note D_, 14
;	musicf3
	dec_octave
	note B_, 7
	inc_octave
	note C#, 6
.Loop4
;	musicf2
	note D_, 7
	note D_, 7
	note D_, 7
	note D_, 6
;	musicf3
	note E_, 7
;	tie
	note D_, 7
	note C#, 7
;	tie
	note E_, 6
	sound_loop 2, .Loop4
;	musicf2
	note D_, 7
	note D_, 7
	note G#, 7
	note G#, 6
	note F#, 14
	note F#, 7
;	musicf3
	note E_, 6
;	musicf2
	note C#, 14
;	tie
	note C#, 13
	note C#, 7
;	musicf3
	note C#, 7
;	tie
	note D_, 7
	note D#, 6
.Loop5
;	musicf2
	note E_, 7
	note E_, 7
	note E_, 7
	note E_, 6
;	musicf3
	note F#, 7
;	tie
	note E_, 7
	note D#, 7
;	tie
	note F#, 6
	sound_loop 2, .Loop5
;	musicf2
	note E_, 7
	note E_, 7
	note A_, 7
	note A_, 6
	note B_, 14
	note B_, 7
;	musicf3
	note A_, 6
;	musicf2
	note F#, 14
;	tie
	note F#, 13
	note F#, 14
;	musicf3
	note F#, 7
;	tie
	note G#, 6
;	musicf2
	note A_, 7
	note A_, 7
	note A_, 7
	note A_, 6
	note G#, 7
	note G#, 7
	note F#, 7
	note F#, 6
	note E_, 7
	note E_, 7
	note C#, 7
	note C#, 6
	dec_octave
	note A_, 7
	note A_, 7
	inc_octave
	note D_, 7
	note D_, 6
	note C#, 7
	note C#, 7
	dec_octave
	note A_, 7
	note A_, 6
	note B_, 7
	note B_, 7
	note G#, 7
	note G#, 6
	note A_, 14
;	tie
	note A_, 13
	note A_, 14
;	musicf3
	sound_ret


Music_TCG2GameCorner_Ch1:
.MainLoop
	volume_envelope 12, 2
	duty_cycle 2
;	musicee 30
	stereo_panning TRUE, TRUE
	vibrato 0, 3, 3
	speed 1
.Loop1
	octave 4
	rest 16
	rest 11
	rest 7
	rest 7
	rest 7
	note D_, 6
;	tie
	note D_, 7
	note D_, 7
;	tie
	note D_, 7
	dec_octave
	note G_, 6
	inc_octave
	note C_, 14
	dec_octave
	note D_, 13
	sound_loop 3, .Loop1
	rest 16
	rest 11
	rest 16
	rest 11
	rest 16
	rest 11
	rest 16
	rest 11
;	musicee 0
;	preset 20
	volume_envelope 12, 1
	duty_cycle 1
	vibrato 1, 3, 3
;	musicf3
	sound_call Branch_1e778f
	octave 3
	note D#, 7
	dec_octave
	note A_, 7
	inc_octave
	note D#, 7
	note F#, 6
	note D_, 7
	dec_octave
	note B_, 7
	inc_octave
	note D_, 7
	note G#, 6
	note A_, 7
	note E_, 7
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	inc_octave
	note E_, 7
	rest 6
.Loop2
	rest 14
	octave 2
	note E_, 7
	rest 6
	sound_loop 14, .Loop2
;	musicf3
	note E_, 7
	note E_, 7
;	tie
	note E_, 7
;	tie
	note E_, 6
;	musicf1 33
	note F#, 7
	note F#, 7
	note G#, 7
	note G#, 6
;	musicf3
	sound_call Branch_1e778f
	octave 3
	note D#, 7
	octave 2
	note A_, 7
	octave 3
	note D#, 7
	note F#, 6
	note D_, 7
	octave 2
	note B_, 7
	octave 3
	note D_, 7
	note G#, 6
	note A_, 7
	note E_, 7
	note C#, 7
	note E_, 6
	octave 2
	note A_, 7
	octave 4
	note C#, 3
	note E_, 4
	note E_, 7
	rest 6
	dec_octave
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note F#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note C#, 6
	dec_octave
	note G#, 6
	rest 8
	note B_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G#, 7
	inc_octave
	note G#, 7
	note E_, 7
	dec_octave
	note B_, 6
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note D#, 7
	note F#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note D#, 6
	dec_octave
	note G#, 6
	rest 8
	note B_, 7
	inc_octave
	note E_, 6
	dec_octave
	note G#, 7
	inc_octave
	note G#, 7
	note E_, 7
	dec_octave
	note B_, 6
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note E_, 6
	note C#, 7
	dec_octave
	note A_, 7
	note G_, 7
	note A_, 6
	note A#, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A#, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A#, 7
	inc_octave
	note G_, 7
	note F#, 7
	note C#, 6
	dec_octave
	note A#, 7
	inc_octave
	note C#, 7
	note F#, 7
	note C#, 6
	dec_octave
	note B_, 6
	rest 8
	inc_octave
	note D_, 7
	note F#, 6
	dec_octave
	note B_, 7
	inc_octave
	note F#, 7
	note D_, 7
	dec_octave
	note B_, 6
	inc_octave
	note D_, 6
	rest 8
	note F_, 7
	note A_, 6
	note D_, 7
	note B_, 7
	note A_, 7
	note F_, 6
	dec_octave
	note E_, 6
	rest 8
	note E_, 7
	inc_octave
	note C_, 6
	dec_octave
	note E_, 7
	inc_octave
	note E_, 7
	note A_, 7
	rest 6
	dec_octave
	note E_, 6
	rest 8
	note E_, 7
	note G_, 6
	note E_, 7
	note B_, 7
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note E_, 7
	rest 6
	rest 7
	rest 7
	rest 7
	rest 6
	note E_, 6
	rest 8
	rest 3
	octave 3
	note C#, 7
	note A_, 3
	octave 4
	note E_, 7
	rest 7
	rest 7
	rest 6
	sound_loop 0, .MainLoop

Branch_1e778f:
;	preset 20
	volume_envelope 12, 1
	duty_cycle 1
	vibrato 1, 3, 3
;	musicf3
	octave 2
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note B_, 6
	rest 8
	inc_octave
	note F#, 7
	note D_, 6
	dec_octave
	note B_, 7
	inc_octave
	note G#, 7
	note F#, 7
	note D_, 6
	dec_octave
	note E_, 6
	rest 8
	note G#, 7
	note B_, 6
	note E_, 7
	inc_octave
	note C#, 7
	dec_octave
	note B_, 7
	note G#, 6
	note E_, 6
	rest 8
	note G#, 7
	note B_, 6
	note E_, 7
	inc_octave
	note C#, 7
	dec_octave
	note B_, 7
	note G#, 6
	note E_, 6
	rest 8
	note G#, 7
	note B_, 6
	note E_, 7
	inc_octave
	note C#, 7
	dec_octave
	note B_, 7
	note G#, 6
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	note A_, 7
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note F#, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note C#, 7
	note E_, 6
	dec_octave
	note A_, 7
	inc_octave
	note G_, 7
	note E_, 7
	note C#, 6
	dec_octave
	note A_, 6
	rest 8
	inc_octave
	note D_, 7
	note F#, 6
	dec_octave
	note A_, 7
	inc_octave
	note A_, 7
	note F#, 7
	note D_, 6
	note D_, 7
	dec_octave
	note A_, 7
	inc_octave
	note D_, 7
	note F#, 6
	note D#, 7
	dec_octave
	note A_, 7
	inc_octave
	note D#, 7
	note F#, 6
	note E_, 7
	note C#, 7
	note E_, 7
	note A_, 6
	note F#, 7
	note C#, 7
	note F#, 7
	note A_, 6
	sound_ret


Music_TCG2GameCorner_Ch3:
	fade_wave 11
	channel_volume 1
;	echo 64
	speed 1
	stereo_panning TRUE, TRUE
.MainLoop
	octave 2
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 4
	rest 3
	note E_, 16
;	tie
	note E_, 4
	note F#, 7
	rest 7
	note G#, 7
	rest 6
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note B_, 11
	rest 3
	inc_octave
	note B_, 7
	rest 6
	dec_octave
	note F#, 11
	rest 3
	inc_octave
	note B_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note B_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note B_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note G#, 11
	rest 2
	note A_, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note G#, 11
	rest 2
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	note C#, 11
	rest 3
	note A_, 7
	rest 6
	note D_, 11
	rest 3
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note D_, 11
	rest 3
	note D_, 11
	rest 2
	note D#, 11
	rest 3
	note D#, 11
	rest 2
	note E_, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note F#, 11
	rest 2
	note B_, 11
	rest 3
	note B_, 11
	rest 2
	note E_, 11
	rest 3
	note E_, 11
	rest 2
	note A_, 11
	rest 3
	note E_, 11
	rest 2
	note A_, 11
	rest 3
	inc_octave
	note A_, 5
	rest 8
	dec_octave
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 14
	note E_, 13
	note F#, 14
	note G#, 13
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 11
	rest 16
	note E_, 11
	rest 16
	note A_, 4
	rest 3
	note E_, 16
;	tie
	note E_, 4
	note F#, 7
	rest 7
	note G#, 7
	rest 6
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note B_, 11
	rest 3
	inc_octave
	note B_, 7
	rest 6
	dec_octave
	note F#, 11
	rest 3
	inc_octave
	note B_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note B_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note B_, 11
	rest 3
	inc_octave
	note E_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note G#, 11
	rest 2
	note A_, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note G#, 11
	rest 2
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note E_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	note C#, 11
	rest 3
	note A_, 7
	rest 6
	note D_, 11
	rest 3
	note A_, 7
	rest 6
	dec_octave
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	dec_octave
	note D_, 11
	rest 3
	note D_, 11
	rest 2
	note D#, 11
	rest 3
	note D#, 11
	rest 2
	note E_, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note F#, 11
	rest 2
	note B_, 11
	rest 3
	note B_, 11
	rest 2
	note E_, 11
	rest 3
	note E_, 11
	rest 2
	note A_, 11
	rest 3
	note E_, 11
	rest 2
	note A_, 11
	rest 3
	inc_octave
	note A_, 7
	rest 6
	note D_, 11
	rest 3
	dec_octave
	note A_, 11
	rest 2
	note F#, 11
	rest 3
	note D_, 11
	rest 2
	note E_, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note G#, 11
	rest 2
	note A_, 11
	rest 3
	inc_octave
	note C#, 11
	rest 2
	note E_, 11
	rest 3
	note F#, 11
	rest 2
	note A_, 11
	rest 3
	note F#, 11
	rest 2
	note E_, 11
	rest 3
	note C#, 11
	rest 2
	dec_octave
	note B_, 11
	rest 3
	inc_octave
	note C#, 11
	rest 2
	note D_, 11
	rest 3
	note D#, 11
	rest 2
	note E_, 11
	rest 3
	dec_octave
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	note G#, 11
	rest 2
	note A_, 11
	rest 3
	inc_octave
	note C#, 11
	rest 2
	note E_, 11
	rest 3
	note F#, 11
	rest 2
	note A_, 11
	rest 3
	dec_octave
	note A_, 11
	rest 2
	note G_, 11
	rest 3
	note F_, 11
	rest 2
	note F#, 11
	rest 3
	note A#, 11
	rest 2
	inc_octave
	note C#, 11
	rest 3
	note E_, 11
	rest 2
	note F#, 11
	rest 3
	dec_octave
	note F#, 11
	rest 2
	note G#, 11
	rest 3
	note A#, 11
	rest 2
	note B_, 11
	rest 3
	inc_octave
	note F#, 11
	rest 2
	note B_, 11
	rest 3
	note F#, 11
	rest 2
	dec_octave
	note B_, 11
	rest 3
	note A_, 11
	rest 2
	note G#, 11
	rest 3
	note F#, 11
	rest 2
	note E_, 11
	rest 3
	note E_, 11
	rest 16
	rest 14
	note E_, 11
	rest 2
	note E_, 11
	rest 16
	rest 13
	note A_, 14
	rest 7
	inc_octave
	note C_, 6
	note C#, 7
	note E_, 7
	note F#, 7
	rest 6
	note A_, 7
	rest 7
	dec_octave
	note E_, 7
	rest 6
	note A_, 7
	rest 7
	rest 7
	rest 6
	sound_loop 0, .MainLoop


Music_TCG2GameCorner_Ch4:
	toggle_noise 6
.MainLoop
	octave 1
	drum_speed 1
.Loop1
;	musicef -5
	drum_note 2, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
;	musicef -3
	drum_note 2, 6
	sound_loop 13, .Loop1
;	musicef -5
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
	drum_note 2, 7
;	musicef -3
	drum_note 2, 6
;	musicef 1
	drum_note 2, 14
	rest 13
	rest 14
	rest 13
;	musicef 0
.Loop2
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 7
	drum_note 2, 6
	sound_loop 3, .Loop2
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 2, 14
	drum_note 2, 7
;	musicef -1
	drum_note 2, 6
;	musicef 0
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 7
	drum_note 2, 6
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
	drum_note 2, 7
	drum_note 2, 13
.Loop3
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
;	musicef -3
	drum_note 2, 6
;	musicef 0
	sound_loop 5, .Loop3
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
;	musicef -3
	drum_note 2, 3
	drum_note 2, 3
;	musicef 0
	drum_note 2, 14
	drum_note 2, 13
	drum_note 2, 14
;	musicef 1
	drum_note 6, 13
;	musicef 0
.Loop4
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
;	musicef -3
	drum_note 2, 6
;	musicef 0
	sound_loop 14, .Loop4
	drum_note 1, 7
;	musicef -3
	drum_note 2, 3
	drum_note 2, 4
;	musicef 0
	drum_note 2, 7
	drum_note 2, 6
	drum_note 2, 14
	drum_note 2, 7
	drum_note 2, 6
.Loop5
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 7
	drum_note 2, 6
	sound_loop 3, .Loop5
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
	drum_note 2, 7
	drum_note 2, 13
	drum_note 2, 14
;	musicef -1
	drum_note 2, 7
;	musicef 0
	drum_note 2, 6
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 7
	drum_note 2, 6
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
	drum_note 2, 7
	drum_note 2, 13
.Loop6
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
;	musicef -3
	drum_note 2, 6
;	musicef 0
	sound_loop 5, .Loop6
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
;	musicef -3
	drum_note 2, 3
	drum_note 2, 3
;	musicef 0
	drum_note 2, 14
	drum_note 2, 13
	drum_note 2, 14
;	musicef 1
	drum_note 10, 13
;	musicef 0
.Loop7
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
	drum_note 2, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 6
	sound_loop 3, .Loop7
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
	drum_note 2, 7
	drum_note 2, 7
	drum_note 2, 6
	drum_note 2, 4
	drum_note 2, 5
	drum_note 2, 5
	drum_note 2, 4
;	musicef -3
	drum_note 2, 4
	drum_note 2, 5
;	musicef 0
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
;	musicef -1
	drum_note 2, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 6
	drum_note 1, 14
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 13
	drum_note 1, 7
;	musicef -1
	drum_note 2, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 6
	drum_note 2, 14
	drum_note 2, 7
;	musicef -3
	drum_note 2, 3
	drum_note 2, 3
;	musicef 0
	drum_note 2, 7
	drum_note 2, 7
	drum_note 11, 7
	drum_note 1, 6
	drum_note 2, 14
	drum_note 2, 7
;	musicef -3
	drum_note 2, 3
	drum_note 2, 3
;	musicef 0
	drum_note 2, 7
	drum_note 2, 7
	drum_note 5, 13
	drum_note 2, 14
	drum_note 2, 7
	drum_note 2, 6
	drum_note 1, 7
;	musicef -3
	drum_note 2, 7
;	musicef 0
	drum_note 2, 7
	drum_note 2, 6
	drum_note 2, 7
;	musicef -3
	drum_note 2, 3
	drum_note 2, 4
;	musicef 0
	drum_note 2, 13
	drum_note 2, 14
;	musicef 1
	drum_note 10, 13
;	musicef 0
	sound_loop 0, .MainLoop
