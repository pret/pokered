Music_PokemonLullaby:
	channel_count 3
	channel 1, Music_PokemonLullaby_Ch1
	channel 2, Music_PokemonLullaby_Ch2
	channel 3, Music_PokemonLullaby_Ch3

Music_PokemonLullaby_Ch1:
	tempo 224
	volume 7, 7
	duty_cycle 3
	pitch_offset 1
.mainloop:
	note_type 12, 10, 7
	octave 3
	note G_, 16
	octave 4
	note C_, 16
	stereo_panning TRUE, FALSE
	octave 3
	note G_, 16
	stereo_panning FALSE, TRUE
	octave 4
	note C_, 8
	stereo_panning TRUE, FALSE
	octave 3
	note B_, 8
	stereo_panning FALSE, TRUE
	note G_, 16
	stereo_panning TRUE, FALSE
	octave 4
	note C_, 8
	stereo_panning FALSE, TRUE
	octave 3
	note B_, 8
	stereo_panning TRUE, FALSE
	note G_, 8
	stereo_panning TRUE, TRUE
	rest 2
	note G_, 2
	note G_, 2
	note B_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note G_, 16
	octave 4
	note C_, 8
	octave 3
	note B_, 8
	sound_loop 0, .mainloop

Music_PokemonLullaby_Ch2:
	vibrato 16, 1, 4
	duty_cycle 0
	note_type 12, 11, 4
.mainloop:
	rest 16
	rest 10
	octave 4
	note G_, 2
	note F#, 2
	note G_, 2
	volume_envelope 11, 7
	note E_, 12
	note D_, 2
	note E_, 2
	note F_, 4
	note G_, 4
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note E_, 10
	volume_envelope 11, 5
	note D_, 2
	note D_, 2
	volume_envelope 12, 7
	note E_, 2
	note F_, 4
	note E_, 4
	note F_, 4
	volume_envelope 11, 5
	note G_, 2
	note G_, 2
	note D#, 2
	volume_envelope 11, 7
	note E_, 14
	volume_envelope 8, 7
	octave 3
	note F_, 8
	note G_, 4
	volume_envelope 11, 5
	octave 4
	note G_, 2
	note G_, 2
	volume_envelope 11, 7
	note D#, 2
	note E_, 16
	rest 14
	sound_loop 0, .mainloop

Music_PokemonLullaby_Ch3:
	note_type 12, 1, 1
.mainloop:
	stereo_panning TRUE, FALSE
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	stereo_panning FALSE, TRUE
	note D_, 2
	note F_, 2
	note A_, 2
	octave 5
	note C_, 2
	note D_, 2
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	sound_loop 0, .mainloop
