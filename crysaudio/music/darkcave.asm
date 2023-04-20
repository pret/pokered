Music_DarkCave:
	channel_count 4
	channel 1, Music_DarkCave_Ch1
	channel 2, Music_DarkCave_Ch2
	channel 3, Music_DarkCave_Ch3
	channel 4, Music_DarkCave_Ch4

Music_DarkCave_Ch1:
	tempo 128
	volume 7, 7
	duty_cycle 3
	pitch_offset 1
	vibrato 17, 1, 5
	stereo_panning TRUE, FALSE
	note_type 12, 10, 7
.loop1:
	rest 16
	sound_loop 4, .loop1
	octave 3
	note D#, 16
	note D_, 16
	note C#, 16
	note C_, 16
	volume_envelope 10, 3
.mainloop:
.loop2:
	sound_call .sub1
	sound_loop 3, .loop2
	volume_envelope 11, 7
	note G#, 8
	note D#, 8
	note G_, 8
	note D_, 8
	note F_, 8
	note C#, 8
	note D#, 8
	note G_, 8
	note G#, 8
	note D#, 8
	note G_, 8
	note D_, 8
	note F_, 8
	note C#, 8
	note D#, 8
	note C_, 8
	volume_envelope 10, 3
.loop3:
	sound_call .sub1
	sound_loop 2, .loop3
	rest 16
	rest 8
	volume_envelope 11, 7
	octave 2
	note F_, 2
	note G_, 2
	note G#, 4
	octave 3
	note D#, 16
	rest 8
	octave 2
	note G#, 2
	note G_, 2
	note G#, 4
	octave 3
	note D#, 16
	note G_, 2
	rest 6
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 16
	note F_, 2
	rest 6
	note G#, 2
	note G_, 2
	note G#, 4
	volume_envelope 10, 3
.loop4:
	sound_call .sub1
	sound_loop 2, .loop4
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	sound_ret

Music_DarkCave_Ch2:
	duty_cycle 1
	vibrato 18, 3, 6
	stereo_panning FALSE, TRUE
	note_type 12, 10, 7
.loop1:
	rest 16
	sound_loop 4, .loop1
	octave 3
	note G_, 16
	note A#, 16
	note F_, 16
	note G_, 16
.mainloop:
.loop2:
	rest 16
	sound_loop 4, .loop2
	rest 8
	stereo_panning TRUE, TRUE
	volume_envelope 12, 7
	octave 5
	note C_, 8
	volume_envelope 12, 4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 4
	note A#, 2
	octave 5
	note D_, 4
	volume_envelope 11, 0
	note C#, 4
	volume_envelope 11, 7
	note C#, 12
	volume_envelope 5, -1
	note C_, 8
	volume_envelope 12, 7
	note C_, 8
	rest 8
	volume_envelope 12, 7
	note C_, 8
	volume_envelope 12, 4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note D_, 4
	volume_envelope 12, 7
	note C#, 12
	volume_envelope 12, 3
	note C_, 2
	note C#, 2
	volume_envelope 11, 0
	note D#, 10
	volume_envelope 11, 7
	note D#, 6
	stereo_panning FALSE, TRUE
	volume_envelope 12, 4
	octave 4
	note F_, 4
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 8
	octave 3
	note A#, 8
	volume_envelope 11, 0
	octave 4
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 8
	note F_, 4
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 4
	note C_, 2
	note C#, 2
	note C_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	volume_envelope 11, 0
	note C_, 8
	volume_envelope 11, 7
	note C_, 8
	volume_envelope 12, 7
	stereo_panning TRUE, TRUE
	rest 8
	octave 5
	note C_, 8
	volume_envelope 12, 4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 4
	note A#, 2
	octave 5
	note D_, 4
	volume_envelope 4, -1
	note C#, 8
	volume_envelope 12, 7
	note C#, 8
	volume_envelope 11, 0
	note C_, 8
	volume_envelope 11, 7
	note C_, 8
	rest 8
	volume_envelope 12, 7
	note C_, 8
	volume_envelope 12, 4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note D_, 4
	volume_envelope 11, 0
	note C#, 8
	volume_envelope 11, 7
	note C#, 8
	volume_envelope 11, 0
	note C_, 8
	volume_envelope 11, 7
	note C_, 8
	volume_envelope 12, 7
	rest 16
	stereo_panning FALSE, TRUE
	rest 8
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 4
	note C_, 16
	rest 8
	note C#, 2
	note C_, 2
	note C#, 4
	note C_, 16
	volume_envelope 12, 2
	note D#, 8
	volume_envelope 12, 7
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 4
	note C_, 16
	volume_envelope 12, 2
	octave 3
	note A#, 8
	volume_envelope 12, 7
	octave 4
	note C#, 2
	note C_, 2
	volume_envelope 12, 4
	note C#, 16
	rest 4
	rest 16
	rest 16
	rest 16
	volume_envelope 11, 7
	octave 5
	note D#, 16
	note D_, 16
	note F_, 16
	note D#, 16
	sound_loop 0, .mainloop

Music_DarkCave_Ch3:
	note_type 12, 2, 7
.loop1:
	sound_call .sub3
	sound_loop 2, .loop1
.mainloop:
.loop2:
	sound_call .sub3
	sound_loop 7, .loop2
	sound_call .sub2
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	rest 2
	octave 2
	note A#, 12
	sound_call .sub2
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	rest 2
	octave 2
	note A#, 4
	octave 3
	note C#, 2
	note C_, 2
	note C#, 4
	sound_call .sub1
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	rest 2
	octave 2
	note A#, 4
	note A#, 2
	octave 3
	note C_, 2
	note C#, 4
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	rest 2
	octave 2
	note A#, 4
	octave 3
	note C#, 2
	note C_, 2
	note C#, 4
	sound_ret

.sub2:
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	rest 2
	octave 2
	note A#, 12
	sound_ret

.sub3:
	octave 2
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	rest 2
	octave 1
	note A#, 4
	note A#, 2
	octave 2
	note C_, 2
	note C#, 4
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	rest 2
	octave 1
	note A#, 4
	octave 2
	note C#, 2
	note C_, 2
	note C#, 4
	sound_ret

Music_DarkCave_Ch4:
	toggle_noise 3
	drum_speed 12
.mainloop:
	stereo_panning TRUE, TRUE
	drum_note 4, 8
	drum_note 4, 8
	drum_note 4, 4
	stereo_panning TRUE, FALSE
	drum_note 2, 4
	stereo_panning FALSE, TRUE
	drum_note 2, 2
	drum_note 2, 2
	stereo_panning TRUE, FALSE
	drum_note 2, 4
	stereo_panning TRUE, TRUE
	drum_note 4, 8
	drum_note 4, 8
	drum_note 4, 4
	stereo_panning FALSE, TRUE
	drum_note 2, 8
	stereo_panning TRUE, FALSE
	drum_note 2, 2
	drum_note 2, 2
	sound_loop 0, .mainloop
