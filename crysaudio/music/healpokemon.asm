Music_HealPokemon:
	channel_count 3
	channel 1, Music_HealPokemon_Ch1
	channel 2, Music_HealPokemon_Ch2
	channel 3, Music_HealPokemon_Ch3

Music_HealPokemon_Ch1:
	tempo 144
	volume 7, 7
	duty_cycle 2
	pitch_offset 1
	note_type 12, 8, 1
	rest 2
	pitch_slide 1, 4, B_
	note B_, 2
	pitch_slide 1, 3, E_
	note B_, 2
	pitch_slide 1, 4, E_
	note E_, 2
	rest 4
	pitch_slide 1, 5, B_
	note E_, 4
	pitch_slide 1, 4, B_
	note B_, 4
	sound_ret

Music_HealPokemon_Ch2:
	duty_cycle 2
	note_type 12, 12, 3
	octave 4
	note B_, 4
	note B_, 4
	note B_, 2
	note G#, 2
	note_type 12, 12, 4
	octave 5
	note E_, 8
	sound_ret

Music_HealPokemon_Ch3:
	note_type 12, 1, 0
	octave 4
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	note G#, 2
	note E_, 6
	rest 2
	sound_ret
