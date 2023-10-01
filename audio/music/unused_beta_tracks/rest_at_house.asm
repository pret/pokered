Music_RestPallet::
	channel_count 3
	channel 1, Music_RestPallet_Ch1
	channel 2, Music_RestPallet_Ch2
	channel 3, Music_RestPallet_Ch3

Music_RestPallet_Ch1::
	tempo 144
	volume 7, 7
	vibrato		8, 2, 4
	;note_type	12, 8, 2
    ;duty_cycle	2
	;octave		4
	;note		B_, 2
	;note		A_, 2
	;note		G#, 2
	;note		E_, 2
	note_type	12, 12, 5
	rest 8
	duty_cycle	3
	octave		3
	note		G#, 2
	note		E_, 2
	note		F#, 2
	note		G#, 2
	note		E_, 8
	sound_ret

Music_RestPallet_Ch2::
	vibrato		5, 1, 5
	note_type	12, 13, 4
	octave		4
    duty_cycle	2
	note		B_, 2
	note		A_, 2
	note		G#, 2
	note		E_, 2
	octave		5
	note		E_, 2
	octave		4
	note		C#, 2
	octave		3
	note		B_, 2
	note		A_, 2
	note		G#, 8
	sound_ret

Music_RestPallet_Ch3::
	note_type	12, 1, 0
	octave		4
	note		E_, 2
	note		F#, 2
	note		G#, 2
	note		A_, 2
	note		G#, 4
	note		E_, 2
	note		F#, 2
	note		E_, 6
	rest 2
	sound_ret
