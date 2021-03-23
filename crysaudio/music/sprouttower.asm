Music_SproutTower:
	channel_count 4
	channel 1, Music_SproutTower_Ch1
	channel 2, Music_SproutTower_Ch2
	channel 3, Music_SproutTower_Ch3
	channel 4, Music_SproutTower_Ch4

Music_SproutTower_Ch1:
	tempo 176
	volume 7, 7
	duty_cycle 3
	pitch_offset 2
	vibrato 8, 4, 5
	stereo_panning FALSE, TRUE
	note_type 12, 10, 3
	rest 16
	rest 16
.mainloop:
	rest 6
	octave 3
	note F_, 2
	note F#, 4
	note F#, 4
	note F_, 4
	note C_, 4
	note C#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note F#, 4
	note F#, 4
	note F_, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note F_, 4
	note F#, 2
	note D#, 10
	note F#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	volume_envelope 10, 5
	note C_, 8
	volume_envelope 10, 3
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C#, 2
	volume_envelope 10, 7
	note C_, 16
	volume_envelope 10, 3
	note F_, 4
	note F_, 4
	note F#, 4
	note F#, 4
	note F_, 4
	note F_, 4
	note D#, 4
	note D#, 4
	sound_loop 0, .mainloop

Music_SproutTower_Ch2:
	duty_cycle 3
	pitch_offset 1
	vibrato 8, 4, 8
	note_type 12, 11, 2
	octave 3
	note F_, 4
	note F_, 4
	note F#, 4
	note F#, 4
	note F_, 4
	note F_, 4
	note D#, 4
	note D#, 4
.mainloop:
	volume_envelope 11, 5
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note F#, 4
	volume_envelope 11, 7
	note F_, 8
	volume_envelope 11, 5
	note F#, 4
	note A#, 4
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 8
	volume_envelope 11, 5
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note F#, 2
	volume_envelope 11, 7
	note A#, 8
	volume_envelope 11, 5
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note F#, 2
	note D#, 2
	volume_envelope 11, 7
	note F_, 8
	volume_envelope 11, 3
	note F_, 4
	note F_, 4
	note F#, 4
	note A#, 2
	note F_, 1
	note A#, 1
	volume_envelope 11, 7
	octave 4
	note C_, 16
	rest 16
	sound_loop 0, .mainloop

Music_SproutTower_Ch3:
	vibrato 20, 14, 8
	note_type 12, 1, 4
	octave 3
	note F_, 2
	rest 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	rest 2
	note F#, 2
	note F_, 2
	rest 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	rest 2
	note F#, 2
	stereo_panning TRUE, FALSE
.mainloop:
	rest 4
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	rest 2
	note F#, 2
	note F_, 2
	rest 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	rest 2
	note F_, 2
	note D#, 2
	rest 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	rest 2
	note F#, 2
	note F_, 2
	rest 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	rest 2
	note F#, 2
	note F_, 8
	note F#, 4
	note A#, 4
	note D#, 8
	note F_, 4
	note F#, 4
	note F_, 16
	note F_, 2
	rest 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	rest 2
	note F_, 2
	note F_, 2
	rest 2
	note C_, 2
	note F_, 2
	note F#, 2
	note D#, 2
	rest 2
	note F_, 2
	sound_loop 0, .mainloop

Music_SproutTower_Ch4:
	toggle_noise 0
	drum_speed 12
	rest 4
.mainloop:
	drum_note 7, 4
	stereo_panning TRUE, FALSE
	drum_note 4, 4
	drum_note 7, 2
	stereo_panning FALSE, TRUE
	drum_note 4, 2
	stereo_panning TRUE, TRUE
	drum_note 7, 4
	drum_note 7, 4
	stereo_panning FALSE, TRUE
	drum_note 4, 4
	drum_note 7, 2
	stereo_panning TRUE, FALSE
	drum_note 4, 2
	stereo_panning TRUE, TRUE
	drum_note 7, 4
	sound_loop 0, .mainloop
