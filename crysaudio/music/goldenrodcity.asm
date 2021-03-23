Music_GoldenrodCity:
	channel_count 4
	channel 1, Music_GoldenrodCity_Ch1
	channel 2, Music_GoldenrodCity_Ch2
	channel 3, Music_GoldenrodCity_Ch3
	channel 4, Music_GoldenrodCity_Ch4

Music_GoldenrodCity_Ch1:
	stereo_panning FALSE, TRUE
	tempo 176
	volume 7, 7
	note_type 12, 9, 7
	rest 16
	rest 16
	rest 16
	rest 16
.mainloop:
	duty_cycle 0
	sound_call .sub1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	octave 5
	note C_, 1
	volume_envelope 7, 1
	duty_cycle 0
	sound_call .sub2
	volume_envelope 7, 7
	note D#, 2
	note F_, 2
	note F#, 2
	note G#, 4
	volume_envelope 7, 1
	sound_call .sub2
	note D#, 1
	note F#, 1
	volume_envelope 7, 7
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 2
	note D#, 2
	duty_cycle 2
	volume_envelope 9, 7
	sound_call .sub1
	note C_, 4
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note C#, 2
	octave 3
	note G#, 1
	rest 3
	note G#, 1
	rest 1
	octave 4
	note C_, 2
	octave 3
	note G#, 1
	rest 3
	note G#, 1
	rest 1
	note A#, 2
	note F_, 1
	rest 1
	note C#, 2
	note F_, 1
	rest 1
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note F#, 2
	note C#, 1
	rest 3
	note C#, 1
	rest 1
	note F#, 2
	note C#, 1
	rest 1
	note F#, 2
	note A#, 2
	note C#, 2
	note D#, 2
	note G#, 2
	octave 4
	note C#, 2
	sound_ret

.sub2:
	octave 4
	note F_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note C#, 1
	octave 3
	note G#, 1
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note C_, 1
	octave 3
	note G#, 1
	note F#, 1
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	octave 3
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	sound_ret

Music_GoldenrodCity_Ch2:
	stereo_panning TRUE, FALSE
	vibrato 18, 2, 3
	duty_cycle 2
	note_type 12, 9, 7
.mainloop:
	volume_envelope 9, 7
	sound_call .sub1
	octave 4
	note F_, 2
	note F#, 2
	note G#, 2
	note F_, 2
	note D#, 8
	sound_call .sub1
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note D#, 8
	duty_cycle 2
	volume_envelope 7, 7
	sound_call .sub2
	octave 4
	note G#, 2
	note A#, 2
	note B_, 2
	octave 5
	note C_, 4
	duty_cycle 3
	volume_envelope 7, 7
	sound_call .sub2
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 4
	note G#, 2
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note F_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 6
	octave 3
	note G#, 1
	octave 3
	note A_, 1
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 2
	octave 4
	note A#, 2
	note G#, 2
	note F#, 2
	duty_cycle 1
	sound_ret

.sub2:
	note C#, 6
	note F_, 6
	note C#, 4
	note C_, 6
	note D#, 6
	note C_, 2
	octave 4
	note G#, 1
	note A_, 1
	note A#, 6
	octave 5
	note C#, 6
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note D#, 2
	sound_ret

Music_GoldenrodCity_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 8, 2, 3
	note_type 12, 2, 5
.mainloop:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	rest 3
	octave 3
	note C_, 1
	note D#, 1
	note G_, 1
	note G#, 1
	note D#, 2
	sound_call .sub2
	rest 1
	octave 3
	note G#, 2
	note F#, 2
	note D#, 2
	octave 2
	note G#, 2
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note C#, 4
	rest 2
	note C#, 1
	rest 1
	note C_, 4
	rest 2
	note C_, 1
	rest 1
	octave 2
	note A#, 4
	rest 2
	note A#, 1
	rest 1
	note G#, 4
	rest 2
	note G#, 1
	rest 1
	note F#, 4
	rest 2
	note F#, 1
	rest 1
	octave 3
	note D#, 4
	rest 2
	note D#, 1
	rest 1
	note G#, 4
	rest 2
	note G#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	note G#, 3
	rest 1
	octave 3
	note G#, 1
	rest 1
	sound_ret

.sub2:
	note C#, 1
	rest 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	rest 2
	note C#, 1
	rest 5
	octave 4
	note C_, 1
	note C#, 1
	octave 3
	note G#, 2
	note C_, 1
	rest 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	rest 2
	note C_, 1
	rest 5
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 2
	octave 2
	note A#, 1
	rest 1
	octave 3
	note A#, 1
	octave 2
	note A#, 1
	rest 2
	note A#, 1
	rest 5
	octave 3
	note A_, 1
	note A#, 1
	note F#, 2
	octave 2
	note G#, 1
	rest 1
	octave 3
	note G#, 1
	octave 2
	note G#, 1
	rest 2
	note G#, 1
	sound_ret

Music_GoldenrodCity_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 8
	drum_note 3, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
.mainloop:
.loop1:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, .loop1
	sound_call .sub1
	sound_call .sub2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 7, 2
	sound_call .sub2
	drum_note 3, 2
	drum_note 7, 2
	sound_call .sub2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_call .sub2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_call .sub2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 7, 2
	sound_call .sub2
	drum_note 3, 2
	drum_note 7, 2
	sound_call .sub2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_call .sub2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.loop2:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, .loop2
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_ret

.sub2:
	drum_note 4, 2
	drum_note 3, 1
	drum_note 4, 3
	drum_note 4, 2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	sound_ret
