Music_HallOfFame:
	channel_count 4
	channel 1, Music_HallOfFame_Ch1
	channel 2, Music_HallOfFame_Ch2
	channel 3, Music_HallOfFame_Ch3
	channel 4, Music_HallOfFame_Ch4

Music_HallOfFame_Ch1:
	tempo 112
	volume 7, 7
	duty_cycle 2
	vibrato 12, 2, 2
	pitch_offset 1
	stereo_panning TRUE, FALSE
	note_type 12, 9, 3
	rest 16
	rest 16
	rest 16
	rest 12
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1
.mainloop:
.loop1:
	volume_envelope 9, 7
	octave 4
	note C_, 8
	volume_envelope 7, 7
	note C_, 8
	volume_envelope 9, 7
	note E_, 8
	volume_envelope 7, 7
	note E_, 8
	volume_envelope 9, 7
	note F#, 8
	volume_envelope 7, 7
	note F#, 8
	volume_envelope 7, 7
	note F_, 8
	volume_envelope 5, 7
	note F_, 8
	sound_loop 3, .loop1
	rest 16
	rest 16
	rest 16
	rest 16
	sound_loop 0, .mainloop

Music_HallOfFame_Ch2:
	vibrato 8, 2, 5
	duty_cycle 3
.mainloop:
	note_type 12, 12, 4
	octave 3
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note G_, 2
	note D_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note F_, 2
	note C_, 2
	note F_, 2
	note A#, 4
	note A_, 4
	note F_, 2
	sound_loop 0, .mainloop

Music_HallOfFame_Ch3:
.mainloop:
	note_type 12, 2, 8
.loop1:
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	sound_loop 3, .loop1
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F#, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	sound_loop 0, .mainloop

Music_HallOfFame_Ch4:
	toggle_noise 5
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 16
	drum_speed 6
.mainloop:
	stereo_panning FALSE, TRUE
	drum_note 11, 4
	drum_note 11, 8
	drum_note 11, 4
	drum_note 11, 4
	drum_note 11, 4
	stereo_panning TRUE, FALSE
	drum_note 10, 2
	drum_note 10, 2
	drum_note 11, 2
	drum_note 11, 2
	drum_note 11, 4
	drum_note 11, 4
	drum_note 11, 8
	drum_note 11, 4
	drum_note 11, 4
	stereo_panning FALSE, TRUE
	drum_note 11, 1
	drum_note 11, 1
	drum_note 10, 1
	drum_note 10, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1
	sound_loop 0, .mainloop
