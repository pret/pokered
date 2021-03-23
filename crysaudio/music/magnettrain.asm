Music_MagnetTrain:
	channel_count 4
	channel 1, Music_MagnetTrain_Ch1
	channel 2, Music_MagnetTrain_Ch2
	channel 3, Music_MagnetTrain_Ch3
	channel 4, Music_MagnetTrain_Ch4

Music_MagnetTrain_Ch1:
	tempo 110
	volume 7, 7
	stereo_panning FALSE, TRUE
	vibrato 20, 2, 3
	duty_cycle 2
	note_type 12, 11, 2
	rest 16
	rest 16
	volume_envelope 11, 7
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	note_type 6, 11, 7
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note_type 12, 11, 7
	note D_, 16
	sound_ret

Music_MagnetTrain_Ch2:
	vibrato 20, 2, 3
	duty_cycle 1
	note_type 12, 13, 2
	stereo_panning TRUE, FALSE
	note_type 12, 13, 8
	octave 1
	note F_, 12
	rest 2
	note_type 6, 13, 7
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	octave 2
	note F_, 4
	rest 4
	note F_, 4
	rest 4
	note F_, 4
	rest 4
	note F_, 4
	rest 4
	duty_cycle 3
	note_type 12, 13, 7
	octave 4
	note G_, 16
	note A_, 13
	rest 1
	note_type 6, 13, 7
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note_type 12, 13, 7
	note A_, 16
	sound_ret

Music_MagnetTrain_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 16, 2, 3
	note_type 12, 1, 5
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	note D#, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D#, 1
	note G_, 1
	note C_, 1
	note D#, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note G_, 1
	note C_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 16
	sound_ret

Music_MagnetTrain_Ch4:
	toggle_noise 3
	drum_speed 12
	drum_note 12, 12
	drum_note 3, 2
	drum_note 11, 1
	drum_note 11, 1
	drum_speed 6
	drum_note 4, 4
	drum_note 7, 4
	drum_note 4, 4
	drum_note 7, 4
	drum_note 11, 4
	drum_note 7, 4
	drum_note 11, 4
	drum_note 3, 2
	drum_note 3, 2
	sound_call .sub2
	sound_call .sub2
	drum_speed 12
	drum_note 12, 16
	sound_ret

.sub1: ; unreferenced
	drum_note 9, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 9, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 9, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 9, 1
	drum_note 8, 1
	drum_note 8, 1
	sound_ret

.sub2:
	drum_note 9, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 9, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 9, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 9, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 8, 2
	sound_ret
