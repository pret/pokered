Music_PokemonChannel:
	channel_count 4
	channel 1, Music_PokemonChannel_Ch1
	channel 2, Music_PokemonChannel_Ch2
	channel 3, Music_PokemonChannel_Ch3
	channel 4, Music_PokemonChannel_Ch4

Music_PokemonChannel_Ch1:
	tempo 128
	volume 7, 7
	vibrato 8, 3, 8
	duty_cycle 1
	stereo_panning FALSE, TRUE
	note_type 12, 11, 3
	octave 2
	note B_, 1
	rest 2
	note F#, 1
	note B_, 1
	rest 1
	octave 3
	note F#, 4
	duty_cycle 0
	octave 2
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note_type 6, 11, 3
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	duty_cycle 1
	octave 3
	note C_, 2
	rest 4
	note G_, 2
	note C_, 2
	rest 2
	note B_, 8
	duty_cycle 0
	note C_, 4
	note C_, 4
	octave 2
	note G_, 2
	rest 2
	duty_cycle 3
	octave 4
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note G_, 2
	rest 2
	note D#, 2
	rest 2
	note C_, 2
	rest 2
	note D#, 2
	rest 2
	rest 8
	octave 3
	note G_, 2
	rest 6
	note B_, 2
	rest 6
	note D_, 2
	rest 6
	sound_ret

Music_PokemonChannel_Ch2:
	duty_cycle 1
	vibrato 8, 3, 8
	stereo_panning TRUE, TRUE
	note_type 12, 11, 3
	octave 3
	note G_, 3
	note A_, 1
	note B_, 1
	rest 1
	octave 4
	note D_, 4
	duty_cycle 0
	octave 3
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note_type 6, 11, 3
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	duty_cycle 1
	octave 4
	note C_, 6
	note D_, 2
	note E_, 2
	rest 2
	note G_, 8
	duty_cycle 0
	octave 3
	note G_, 4
	note F#, 4
	note E_, 2
	rest 2
	duty_cycle 3
	octave 4
	note B_, 2
	rest 2
	note A#, 2
	rest 2
	note B_, 8
	octave 5
	note C_, 2
	rest 2
	note C_, 2
	rest 2
	octave 4
	note A#, 2
	rest 2
	note G#, 2
	rest 2
	rest 8
	note D_, 2
	octave 3
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	note D_, 1
	rest 1
	octave 4
	note G_, 2
	rest 6
	octave 3
	note G_, 2
	rest 6
	sound_ret

Music_PokemonChannel_Ch3:
	vibrato 8, 3, 8
	note_type 12, 2, 5
	stereo_panning TRUE, FALSE
	octave 2
	note G_, 1
	rest 2
	note B_, 1
	octave 3
	note D_, 1
	rest 1
	note G_, 6
	rest 4
	note C_, 1
	rest 2
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	rest 1
	note E_, 6
	rest 4
	octave 4
	note G_, 1
	rest 1
	note D_, 1
	rest 1
	octave 3
	note G_, 4
	note G#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note D#, 1
	rest 1
	note G#, 1
	rest 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	sound_ret

Music_PokemonChannel_Ch4:
	toggle_noise 3
	drum_speed 12
.loop1:
	drum_note 11, 3
	drum_note 11, 1
	drum_note 3, 2
	drum_note 1, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 11, 1
	drum_note 3, 1
	sound_loop 2, .loop1
	drum_note 9, 2
	drum_note 11, 2
	drum_note 9, 1
	drum_note 9, 1
	drum_note 9, 1
	drum_note 9, 1
	drum_note 1, 4
	drum_note 9, 1
	drum_note 9, 1
	drum_note 9, 1
	drum_note 9, 1
	drum_note 12, 4
	drum_note 3, 4
	drum_note 11, 4
	drum_note 11, 4
	sound_ret
