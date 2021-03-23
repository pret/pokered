Music_GoldSilverOpening2:
	channel_count 4
	channel 1, Music_GoldSilverOpening2_Ch1
	channel 2, Music_GoldSilverOpening2_Ch2
	channel 3, Music_GoldSilverOpening2_Ch3
	channel 4, Music_GoldSilverOpening2_Ch4

Music_GoldSilverOpening2_Ch1:
	tempo 92
	volume 7, 7
	duty_cycle 3
	pitch_offset 2
	stereo_panning FALSE, TRUE
	note_type 12, 3, -5
	octave 3
	note D#, 8
.loop1:
	note_type 12, 12, 1
	octave 3
	note D_, 2
	note D_, 2
	note D_, 2
	volume_envelope 11, 7
	note D#, 10
	volume_envelope 12, 1
	note D_, 2
	note D_, 2
	note D_, 2
	volume_envelope 11, 7
	note F_, 4
	note D#, 4
	note C_, 2
	sound_loop 2, .loop1
	volume_envelope 12, 1
	note D_, 2
	note D_, 2
	note D_, 2
	volume_envelope 11, 7
	note D#, 10
	volume_envelope 12, 1
	note D_, 2
	note D_, 2
	note D_, 2
	volume_envelope 11, 7
	note F_, 4
	note G_, 4
	note A#, 2
	volume_envelope 11, 0
	note A_, 16
	note A_, 16
	volume_envelope 11, 2
	octave 4
	note D_, 16
	sound_ret

Music_GoldSilverOpening2_Ch2:
	duty_cycle 3
	vibrato 20, 1, 4
	stereo_panning TRUE, FALSE
	note_type 12, 3, -7
	octave 3
	note A#, 8
	note_type 12, 13, 1
	octave 3
	note A_, 2
	note A_, 2
	note A_, 2
	volume_envelope 12, 7
	note A#, 10
	volume_envelope 13, 1
	note A_, 2
	note A_, 2
	note A_, 2
	volume_envelope 12, 7
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note G_, 2
	volume_envelope 13, 1
	note A_, 2
	note A_, 2
	note A_, 2
	volume_envelope 12, 7
	note A#, 10
	volume_envelope 13, 1
	note A_, 2
	note A_, 2
	note A_, 2
	volume_envelope 12, 7
	octave 4
	note C_, 4
	note C#, 4
	note D#, 2
	volume_envelope 12, 7
	note D_, 8
	note D#, 8
	note F_, 8
	note A#, 8
	volume_envelope 11, 0
	octave 5
	note D_, 16
	note D_, 16
	volume_envelope 12, 2
	note D_, 16
	sound_ret

Music_GoldSilverOpening2_Ch3:
	note_type 12, 1, 7
	rest 8
	octave 2
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A#, 8
	rest 2
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 4
	note F_, 4
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note D#, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note D#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	octave 3
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	note F#, 2
	note D#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	octave 3
	note D_, 2
	octave 2
	note A#, 2
	note F#, 2
	note A#, 2
	octave 3
	note C#, 2
	note D_, 2
	rest 14
	sound_ret

Music_GoldSilverOpening2_Ch4:
	toggle_noise 0
	drum_speed 6
	drum_note 4, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_speed 12
.loop1:
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 2, 4
	drum_note 4, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 2, 6
	drum_speed 6
	drum_note 4, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_speed 12
	sound_loop 4, .loop1
	drum_note 1, 16
	sound_ret
