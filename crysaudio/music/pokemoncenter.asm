Music_PokemonCenter:
	channel_count 4
	channel 1, Music_PokemonCenter_Ch1
	channel 2, Music_PokemonCenter_Ch2
	channel 3, Music_PokemonCenter_Ch3
	channel 4, Music_PokemonCenter_Ch4

Music_PokemonCenter_Ch1:
	tempo 152
	volume 7, 7
	duty_cycle 2
	vibrato 10, 1, 4
	pitch_offset 1
.mainloop:
	stereo_panning FALSE, TRUE
	note_type 12, 8, 3
	octave 3
	note F#, 2
	note F_, 2
	note F#, 2
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note F#, 2
	note F_, 2
	note F#, 2
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note_type 12, 11, 4
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	stereo_panning TRUE, FALSE
	note F#, 2
	note E_, 2
	note D_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 4
	note C#, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 8
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 4
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 4
	note G_, 2
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	sound_loop 0, .mainloop

Music_PokemonCenter_Ch2:
	vibrato 16, 2, 5
.mainloop:
	stereo_panning TRUE, TRUE
	sound_call .sub1
	stereo_panning FALSE, TRUE
	note_type 12, 10, 5
	octave 3
	note A_, 4
	note E_, 4
	stereo_panning TRUE, TRUE
	sound_call .sub2
	note D_, 2
	note F#, 6
	stereo_panning FALSE, TRUE
	note_type 12, 10, 5
	octave 3
	note A_, 4
	note E_, 4
	stereo_panning TRUE, TRUE
	sound_call .sub1
	stereo_panning FALSE, TRUE
	note_type 12, 10, 5
	octave 3
	note A_, 4
	note E_, 4
	stereo_panning TRUE, TRUE
	sound_call .sub2
	note D_, 8
	stereo_panning FALSE, TRUE
	note_type 12, 10, 5
	octave 3
	note D_, 4
	note E_, 4
	note_type 12, 12, 6
	octave 4
	note F#, 8
	note A_, 8
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 8
	note C#, 8
	note E_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	note F#, 8
	note A_, 8
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 8
	note A_, 4
	note G_, 2
	note F#, 2
	note G_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	sound_loop 0, .mainloop

.sub1:
	duty_cycle 2
	note_type 12, 12, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	volume_envelope 12, 3
	note A_, 4
	note G_, 4
	note F#, 2
	note E_, 2
	note C#, 6
	sound_ret

.sub2:
	note_type 12, 12, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	volume_envelope 12, 3
	note F#, 4
	note E_, 4
	note C#, 2
	sound_ret

Music_PokemonCenter_Ch3:
	note_type 12, 2, 8
.mainloop:
	stereo_panning TRUE, FALSE
	octave 3
	note D_, 1
	rest 5
	note F#, 1
	rest 3
	note F#, 1
	rest 1
	note G_, 1
	rest 1
	note F#, 1
	rest 1
	sound_call .sub1
	sound_call .sub2
	note F#, 1
	rest 5
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 5
	note F#, 1
	rest 3
	note F#, 1
	rest 1
	note G_, 1
	rest 1
	note F#, 1
	rest 1
	sound_call .sub1
	sound_call .sub2
	note D_, 1
	rest 5
	note F#, 1
	rest 3
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	stereo_panning TRUE, TRUE
	sound_call .sub3
	note G_, 1
	rest 5
	note B_, 1
	rest 3
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	note E_, 1
	rest 5
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 1
	note F#, 1
	rest 5
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	note G#, 1
	rest 1
	note A_, 1
	rest 1
	sound_call .sub3
	note G_, 1
	rest 5
	note B_, 1
	rest 3
	note B_, 1
	rest 3
	note B_, 1
	rest 1
	note E_, 1
	rest 5
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 1
	note F#, 1
	rest 5
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note E_, 1
	rest 1
	sound_loop 0, .mainloop

.sub1:
	note E_, 1
	rest 5
	note A_, 1
	rest 3
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	sound_ret

.sub2:
	note E_, 1
	rest 5
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note A_, 1
	rest 1
	sound_ret

.sub3:
	note F#, 1
	rest 5
	note A_, 1
	rest 3
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	sound_ret

Music_PokemonCenter_Ch4:
	toggle_noise 3
	drum_speed 12
	stereo_panning TRUE, TRUE
.mainloop:
	drum_note 8, 6
	drum_note 8, 4
	drum_note 8, 2
	drum_note 8, 2
	drum_note 8, 2
	sound_loop 0, .mainloop
