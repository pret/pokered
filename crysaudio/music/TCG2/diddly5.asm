Music_Diddly5:
	channel_count 2
	channel 1, Music_Diddly5_Ch1
	channel 2, Music_Diddly5_Ch2

Music_Diddly5_Ch2: ; 1ebefa (7a:7efa)
	channel_volume 10
	;musicf0 2
	speed 1
	;musicdc 255
	octave 3
	note G_, 2
	note B_, 3
	inc_octave
	note D_, 3
	note G_, 3
	dec_octave
	note B_, 2
	inc_octave
	note D_, 3
	note G_, 3
	note B_, 3
	note D_, 2
	note G_, 3
	note B_, 3
	inc_octave
	note D_, 3
	dec_octave
	note G_, 2
	note B_, 3
	inc_octave
	note D_, 3
	note G_, 3
	;musicef 252
	note G_, 3
	sound_ret


Music_Diddly5_Ch1: ; 1ebf1b (7a:7f1b)
	channel_volume 10
	;musicf0 2
	speed 1
	;musicdc 255
	;musicef 254
	octave 2
	note B_, 2
	inc_octave
	note D_, 3
	note G_, 3
	dec_octave
	note B_, 3
	inc_octave
	note D_, 2
	note G_, 3
	note B_, 3
	note D_, 3
	note G_, 2
	note B_, 3
	inc_octave
	note D_, 3
	dec_octave
	note G_, 3
	note B_, 2
	inc_octave
	note D_, 3
	note G_, 3
	note B_, 3
	;musicef 252
	note B_, 3
	sound_ret
; 0x1ebf3e
