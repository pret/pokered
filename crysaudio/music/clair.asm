Music_Clair:
	channel_count 4
	channel 1, Music_Clair_Ch1
	channel 2, Music_Clair_Ch2
	channel 3, Music_Clair_Ch3
	channel 4, Music_Clair_Ch4

Music_Clair_Ch1:
	tempo 136
	volume 7, 7
	pitch_offset 1
	vibrato 18, 3, 4
	stereo_panning FALSE, TRUE
	note_type 12, 9, 3
	duty_cycle 3
.loop1:
	octave 4
	note F_, 1
	note F#, 1
	note F_, 1
	rest 1
	note C#, 1
	rest 1
	sound_loop 2, .loop1
	octave 3
	note B_, 1
	rest 1
	note G#, 1
	duty_cycle 2
	volume_envelope 9, 2
	octave 5
	note F_, 1
	note G_, 4
	volume_envelope 10, 7
	duty_cycle 3
	octave 3
	note D#, 4
	note F_, 4
	note G_, 4
.mainloop:
	volume_envelope 9, 3
	sound_call .sub1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 2
	octave 2
	note G_, 1
	note A#, 1
	octave 3
	note C#, 2
	octave 2
	note A#, 1
	note G_, 1
	sound_call .sub1
	note D#, 1
	note C#, 1
	note D#, 2
	octave 4
	note A#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note A#, 1
	octave 5
	note D#, 1
	sound_call .sub2
	duty_cycle 3
	note G#, 3
	note F_, 2
	rest 1
	note A#, 4
	duty_cycle 2
	note D#, 1
	note C#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 5
	note D#, 1
	sound_call .sub2
	duty_cycle 3
	note D#, 3
	note C#, 2
	rest 1
	octave 3
	note B_, 4
	duty_cycle 2
	note G#, 1
	note C#, 1
	note D#, 1
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	sound_loop 0, .mainloop

.sub1:
	duty_cycle 3
	stereo_panning TRUE, TRUE
	octave 3
	note B_, 1
	rest 2
	note G#, 5
	duty_cycle 2
	stereo_panning FALSE, TRUE
	octave 2
	note B_, 2
	note G#, 1
	note B_, 1
	octave 3
	note D#, 1
	rest 1
	note D#, 1
	note F#, 1
	note F_, 1
	note C#, 1
	rest 1
	note F_, 1
	note C#, 1
	rest 1
	sound_ret

.sub2:
	octave 4
	note F#, 1
	note D#, 1
	rest 1
	note F#, 1
	note D#, 1
	rest 1
	octave 3
	note D#, 1
	note G#, 1
	note B_, 2
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	rest 1
	note D#, 1
	note F#, 1
	sound_ret

Music_Clair_Ch2:
	duty_cycle 3
	vibrato 18, 3, 4
	note_type 6, 11, 7
.loop1:
	octave 3
	note A#, 2
	note B_, 2
	note A#, 2
	rest 2
	note G#, 2
	rest 2
	sound_loop 2, .loop1
	note F_, 2
	rest 2
	note C#, 2
	rest 2
	volume_envelope 8, 2
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	volume_envelope 9, 2
	note G_, 2
	octave 4
	note C#, 2
	note D#, 2
	octave 3
	note A#, 2
	volume_envelope 11, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	volume_envelope 12, 2
	note C#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	volume_envelope 11, 7
.mainloop:
	sound_call .sub1
	note F#, 2
	rest 4
	note D#, 12
	rest 2
	note D#, 4
	note C#, 4
	octave 3
	note B_, 3
	note A#, 1
	note B_, 6
	octave 4
	note C#, 4
	rest 2
	octave 3
	note A#, 16
	rest 4
	transpose 0, 12
	sound_call .sub1
	transpose 0, 0
	octave 5
	note F#, 2
	rest 4
	note D#, 12
	rest 2
	octave 4
	note G#, 4
	note A#, 4
	note B_, 3
	octave 5
	note C_, 1
	note C#, 6
	octave 4
	note A#, 4
	rest 2
	note G#, 16
	rest 4
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note F#, 2
	rest 4
	note D#, 12
	rest 2
	octave 3
	note G#, 4
	note A#, 4
	note B_, 3
	octave 4
	note C_, 1
	note C#, 6
	octave 3
	note B_, 4
	rest 2
	octave 4
	note D#, 16
	rest 4
	sound_ret

Music_Clair_Ch3:
	note_type 12, 1, 4
	transpose 0, 12
	octave 3
	note C#, 2
	rest 4
	octave 2
	note G#, 1
	note B_, 1
	octave 3
	note C#, 2
	rest 4
	octave 2
	note G#, 1
	note B_, 1
	octave 3
	note D#, 2
	rest 2
	octave 2
	note A#, 4
	note G#, 4
	note G_, 4
.mainloop:
	sound_call .sub1
	octave 2
	note C#, 2
	rest 1
	note G#, 2
	rest 1
	note C#, 2
	rest 2
	note D#, 2
	note A#, 2
	note D#, 2
	sound_call .sub1
	octave 2
	note G#, 2
	rest 1
	note C#, 2
	rest 1
	note D#, 2
	rest 2
	note D#, 1
	note C#, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A#, 1
	octave 1
	note G#, 2
	rest 1
	octave 2
	note D#, 2
	rest 1
	octave 1
	note G#, 2
	octave 3
	note F#, 1
	rest 1
	octave 1
	note G#, 1
	octave 3
	note D#, 1
	octave 2
	note D#, 2
	octave 1
	note G#, 2
	octave 2
	note C#, 2
	rest 1
	note G#, 2
	rest 1
	note C#, 2
	octave 3
	note D#, 1
	rest 1
	octave 2
	note D#, 1
	octave 3
	note A#, 1
	octave 2
	note A#, 2
	octave 3
	note G_, 1
	octave 2
	note D#, 1
	octave 1
	note G#, 2
	rest 1
	octave 2
	note D#, 2
	rest 1
	octave 1
	note G#, 2
	octave 3
	note F#, 1
	rest 1
	octave 1
	note G#, 1
	octave 3
	note D#, 1
	octave 2
	note D#, 2
	octave 1
	note G#, 2
	octave 2
	note D#, 2
	rest 1
	note G_, 2
	rest 1
	note G#, 2
	octave 2
	note B_, 1
	rest 1
	octave 1
	note G#, 1
	octave 2
	note A#, 1
	note D#, 2
	note G#, 1
	octave 1
	note G#, 1
	sound_loop 0, .mainloop

.sub1:
	octave 1
	note G#, 2
	rest 1
	octave 2
	note D#, 2
	rest 1
	octave 1
	note G#, 2
	rest 2
	note G#, 2
	octave 2
	note D#, 2
	octave 1
	note G#, 2
	sound_ret

Music_Clair_Ch4:
	toggle_noise 3
	drum_speed 12
	stereo_panning TRUE, FALSE
	drum_note 12, 8
	drum_note 12, 8
	drum_note 12, 6
	stereo_panning TRUE, TRUE
	drum_note 4, 1
	drum_note 4, 1
	drum_note 3, 2
	drum_note 4, 1
	drum_note 4, 1
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.mainloop:
	stereo_panning TRUE, TRUE
	sound_call .sub1
	drum_note 8, 1
	stereo_panning TRUE, TRUE
	sound_call .sub1
	drum_note 7, 1
	sound_loop 0, .mainloop

.sub1:
	drum_note 4, 2
	stereo_panning TRUE, FALSE
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 3, 2
	stereo_panning TRUE, FALSE
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 4, 1
	stereo_panning TRUE, FALSE
	drum_note 8, 1
	stereo_panning TRUE, TRUE
	drum_note 3, 2
	stereo_panning TRUE, FALSE
	drum_note 8, 1
	sound_ret
