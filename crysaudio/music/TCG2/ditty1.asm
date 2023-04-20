Music_Ditty1:
	channel_count 3
	channel 1, Music_Ditty1_Ch1
	channel 2, Music_Ditty1_Ch2
	channel 3, Music_Ditty1_Ch3

Music_Ditty1_Ch2:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	octave 2
	note D#, 2
	note E_, 3
	note D#, 3
	note E_, 3
;	musicef -2
	note D#, 2
	note E_, 3
;	musicef -1
	note D#, 3
	note E_, 3
;	musicef 1
	note D#, 2
	note E_, 3
;	musicef 1
	note D#, 3
	note E_, 3
	note D#, 2
	note E_, 3
	note D#, 3
	note E_, 3
	note F_, 2
	note G#, 3
	note F_, 3
	note G#, 3
	note B_, 2
	inc_octave
	note D_, 3
	note F_, 3
	note G#, 3
	note F_, 2
	note G#, 3
	note B_, 3
	inc_octave
	note D_, 3
	note F_, 2
	dec_octave
	note B_, 3
	inc_octave
	note D_, 3
	note F_, 2
	note G#, 3
	note B_, 3
	inc_octave
	note D_, 3
	dec_octave
	note G#, 2
;	musicef 1
	note B_, 3
	inc_octave
	note D_, 3
	note F_, 3
	dec_octave
;	musicef -3
	note G#, 2
	note B_, 3
	inc_octave
	note D_, 3
	note F_, 3
	dec_octave
	note G#, 2
;	musicef -1
	note B_, 3
	inc_octave
	note D_, 3
	note F_, 3
	dec_octave
;	musicef -2
	note G#, 2
	note B_, 3
	inc_octave
	note D_, 3
	note F_, 3
	dec_octave
;	musicef -1
	note G#, 2
	note B_, 3
	inc_octave
	note D_, 3
	note F_, 3
	sound_ret


Music_Ditty1_Ch1:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	octave 1
;	musicef 1
	note G_, 2
	note G#, 3
	note G_, 3
	note G#, 3
;	musicef -2
	note G_, 2
	note G#, 3
;	musicef -1
	note G_, 3
	note G#, 3
	note G_, 2
	note G#, 3
;	musicef 1
	note G_, 3
	note G#, 3
	note G_, 2
	note G#, 3
	note B_, 3
	inc_octave
	note D_, 3
	dec_octave
	note B_, 2
	inc_octave
	note D_, 3
	dec_octave
	note B_, 3
	inc_octave
	note D_, 3
	dec_octave
	note B_, 2
	inc_octave
	note D_, 3
	note E_, 3
	note G#, 3
	note A#, 2
	inc_octave
	note D_, 3
	dec_octave
	note A#, 3
	inc_octave
	note D_, 3
	note E_, 2
	note D_, 3
	note E_, 3
	note G#, 3
	note E_, 2
	note G#, 3
	note A#, 3
	note G#, 3
	note A#, 2
	inc_octave
	note D_, 3
	dec_octave
	note G#, 3
	note A#, 3
;	musicef -3
	note A#, 2
	inc_octave
	note D_, 3
	dec_octave
	note G#, 3
	note A#, 3
;	musicef -2
	note A#, 2
	inc_octave
	note D_, 3
	dec_octave
	note G#, 3
	note A#, 3
;	musicef -2
	note A#, 2
	inc_octave
	note D_, 3
	dec_octave
	note G#, 3
	note A#, 3
;	musicef -1
	note A#, 2
	inc_octave
	note D_, 3
	dec_octave
	note G#, 3
	note A#, 3
	sound_ret


Music_Ditty1_Ch3:
	fade_wave 15
	load_wave 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 12, 11, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	speed 1
	stereo_panning TRUE, TRUE
	octave 2
	channel_volume 1
	note C_, 2
	note C#, 3
	channel_volume 2
;	musicef -4
	note C_, 3
	note C#, 3
	note C_, 2
	note C#, 3
	note C_, 3
	note C#, 3
	note C_, 2
	note C#, 3
	note C_, 3
	note C#, 3
	note C_, 2
	note C#, 3
	note E_, 3
	note G_, 3
	note E_, 2
	note G_, 3
	note A#, 3
	channel_volume 1
	inc_octave
	note C_, 3
	dec_octave
	note G_, 2
	note A#, 3
	inc_octave
	note C_, 3
	note E_, 3
	dec_octave
	note A#, 2
	inc_octave
	note C_, 3
	note E_, 3
	note G_, 3
	note C_, 2
	note E_, 3
	note G_, 3
	note A#, 3
	note E_, 2
	note G_, 3
	note A#, 3
	inc_octave
	note C_, 3
	dec_octave
	note G_, 2
	note A#, 3
	inc_octave
	note C_, 3
	note E_, 3
	dec_octave
	channel_volume 2
	note G_, 2
	note A#, 3
	inc_octave
	note C_, 3
	note E_, 3
	dec_octave
	channel_volume 3
	note G_, 2
	note A#, 3
	inc_octave
	note C_, 3
	note E_, 3
	sound_ret
