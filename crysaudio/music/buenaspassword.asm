Music_BuenasPassword:
	channel_count 4
	channel 1, Music_BuenasPassword_Ch1
	channel 2, Music_BuenasPassword_Ch2
	channel 3, Music_BuenasPassword_Ch3
	channel 4, Music_BuenasPassword_Ch4

Music_BuenasPassword_Ch1:
	tempo 136
	volume 7, 7
	pitch_offset 1
	note_type 12, 11, 3
	rest 8
.mainloop:
	stereo_panning TRUE, TRUE
	rest 16
	rest 16
	duty_cycle 3
	note_type 6, 9, 7
	stereo_panning FALSE, TRUE
	octave 4
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 2
	note G#, 2
	rest 10
	rest 10
	stereo_panning TRUE, FALSE
	note C#, 2
	note F_, 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 2
	note G#, 2
	rest 12
	duty_cycle 2
	sound_call .sub1
	stereo_panning TRUE, TRUE
	sound_call Music_BuenasPassword_Ch2.sub3
	sound_call .sub2
	sound_call .sub1
	stereo_panning TRUE, TRUE
	sound_call Music_BuenasPassword_Ch2.sub3
	sound_call .sub2
	sound_call .sub1
	duty_cycle 1
	note C#, 2
	rest 2
	note D#, 2
	rest 2
	note F#, 2
	rest 1
	note G#, 2
	rest 1
	note A#, 2
	note B_, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	note D#, 1
	rest 1
	octave 3
	note B_, 2
	rest 2
	note B_, 2
	note G#, 2
	note B_, 2
	note A#, 2
	note G#, 2
	note G_, 1
	note D#, 3
	note C#, 2
	octave 2
	note B_, 2
	note A#, 1
	note G#, 3
	note A#, 2
	note G_, 2
	note A#, 1
	octave 3
	note C#, 3
	note D#, 2
	note C#, 2
	note D#, 1
	note G_, 3
	note B_, 2
	rest 2
	note A#, 2
	rest 2
	note G#, 2
	rest 1
	note F#, 2
	rest 1
	note D#, 2
	note C#, 1
	rest 1
	note D#, 1
	rest 1
	note F_, 1
	rest 1
	note C#, 2
	rest 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	note G#, 1
	note F#, 3
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	octave 3
	note B_, 1
	note G#, 3
	note F#, 1
	rest 1
	note D#, 1
	rest 1
	note G#, 1
	note D#, 2
	note F#, 1
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	note F#, 1
	rest 1
	note G_, 1
	rest 1
	sound_loop 0, .mainloop

.sub1:
	stereo_panning FALSE, TRUE
	note_type 6, 8, 4
	octave 4
	note D#, 2
	volume_envelope 7, 1
	note C#, 1
	note C_, 1
	volume_envelope 5, 1
	octave 3
	note A#, 1
	note G#, 1
	volume_envelope 3, 1
	note G_, 1
	note F_, 1
	volume_envelope 1, 1
	note D#, 1
	note C#, 1
	note C_, 1
	rest 1
	note_type 12, 8, 4
	sound_ret

.sub2:
	octave 3
	note D#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note D#, 1
	rest 2
	sound_ret

Music_BuenasPassword_Ch2:
	vibrato 18, 3, 4
	duty_cycle 2
	note_type 12, 10, 5
	rest 7
	octave 3
	note F#, 1
.mainloop:
	stereo_panning TRUE, TRUE
	sound_call .sub3
	sound_call .sub1
	stereo_panning TRUE, TRUE
	sound_call .sub2
	octave 3
	note B_, 2
	note A#, 2
	note B_, 2
	note G#, 16
	sound_call .sub1
	stereo_panning TRUE, TRUE
	sound_call .sub2
	note B_, 2
	note A#, 2
	note B_, 2
	note G#, 16
	sound_call .sub1
	note F#, 2
	rest 2
	note G#, 2
	rest 2
	note A#, 2
	rest 1
	note B_, 2
	rest 1
	octave 4
	note C#, 2
	note D#, 1
	rest 1
	note F_, 1
	rest 1
	note F#, 1
	rest 1
	note D#, 2
	rest 2
	note G#, 2
	note F#, 2
	note G#, 2
	note D#, 14
	note C#, 1
	note D#, 1
	note C#, 6
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 8
	note F#, 2
	rest 2
	note F_, 2
	rest 2
	note D#, 2
	rest 1
	note C#, 2
	rest 1
	octave 3
	note B_, 2
	note G#, 1
	rest 1
	note A#, 1
	rest 1
	note B_, 1
	rest 1
	note G#, 2
	rest 2
	octave 4
	note C#, 2
	note F_, 2
	note G#, 2
	note B_, 14
	note A#, 1
	note B_, 1
	note G#, 10
	volume_envelope 8, 4
	octave 2
	note D#, 1
	rest 1
	note F#, 1
	rest 1
	note G_, 1
	rest 1
	volume_envelope 10, 5
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	note F#, 1
	note D#, 1
	rest 1
	note F#, 1
	rest 2
	stereo_panning TRUE, FALSE
	octave 4
	note G#, 1
	note_type 6, 8, 1
	note G_, 1
	note F_, 1
	volume_envelope 7, 1
	note D#, 1
	note C#, 1
	volume_envelope 6, 1
	note C_, 1
	octave 3
	note A#, 1
	volume_envelope 4, 1
	note G#, 1
	volume_envelope 2, 1
	note G_, 1
	note F_, 1
	rest 1
	note_type 12, 10, 5
	sound_ret

.sub2:
	octave 4
	note G#, 2
	rest 2
	note F#, 2
	rest 2
	note F_, 2
	rest 1
	note D#, 2
	rest 1
	note C#, 2
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note C#, 1
	rest 1
	note D#, 2
	rest 2
	sound_ret

.sub3:
	octave 3
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	note F#, 1
	note D#, 1
	rest 1
	note F#, 1
	note F_, 1
	rest 1
	note C#, 1
	rest 1
	octave 2
	note B_, 1
	note G#, 3
	octave 3
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	note F#, 1
	note D#, 1
	rest 1
	note F#, 1
	note F_, 1
	rest 1
	note C#, 1
	rest 1
	octave 2
	note B_, 1
	note G#, 2
	octave 3
	note F#, 1
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	note F#, 1
	note D#, 1
	rest 1
	note F#, 1
	note F_, 1
	rest 1
	note C#, 1
	rest 1
	octave 2
	note B_, 1
	note G#, 3
	sound_ret

Music_BuenasPassword_Ch3:
	note_type 12, 1, 4
	rest 8
.mainloop:
.loop1:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note F#, 1
	rest 1
	octave 2
	note G#, 1
	octave 3
	note D#, 2
	octave 2
	note G#, 1
	rest 2
	note B_, 1
	rest 1
	note G#, 4
	sound_loop 3, .loop1
	note F#, 1
	rest 1
	note A#, 1
	rest 1
	octave 3
	note C#, 1
	octave 2
	note F#, 1
	rest 1
	octave 3
	note C#, 1
	octave 2
	note F#, 1
	rest 1
	note A#, 2
	octave 3
	note C#, 1
	rest 1
	octave 2
	note F#, 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note B_, 1
	note G#, 1
	rest 1
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note G#, 2
	octave 2
	note G#, 1
	rest 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note G#, 1
	note D#, 1
	rest 1
	note A#, 1
	note D#, 1
	rest 1
	note G#, 2
	note A#, 1
	rest 1
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note G_, 1
	note D#, 1
	rest 1
	note A#, 1
	note D#, 1
	rest 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	rest 1
	note G_, 2
	sound_call .sub2
	octave 3
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note F_, 1
	note C#, 1
	rest 1
	note G#, 1
	octave 2
	note G#, 1
	rest 1
	octave 3
	note F_, 2
	octave 2
	note G#, 1
	rest 1
	octave 3
	note C#, 2
	sound_call .sub2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note B_, 1
	note G#, 2
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	note F#, 1
	rest 1
	note G_, 1
	rest 1
	sound_loop 0, .mainloop

.sub1:
	octave 2
	note G#, 1
	rest 1
	octave 3
	note F#, 1
	rest 1
	octave 2
	note G#, 1
	octave 3
	note D#, 2
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	rest 1
	note B_, 1
	rest 1
	note C#, 1
	note F_, 2
	note C#, 1
	sound_ret

.sub2:
	octave 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note B_, 1
	note G#, 1
	rest 1
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	rest 1
	note B_, 2
	octave 3
	note D#, 1
	rest 1
	octave 2
	note G#, 2
	sound_ret

Music_BuenasPassword_Ch4:
	toggle_noise 3
	drum_speed 12
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.mainloop:
.loop1:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_loop 4, .loop1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	stereo_panning TRUE, TRUE
	drum_note 4, 2
	stereo_panning TRUE, FALSE
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 3, 2
	stereo_panning FALSE, TRUE
	drum_note 8, 1
	drum_note 8, 1
	stereo_panning TRUE, FALSE
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_loop 0, .mainloop

.sub1:
	stereo_panning TRUE, TRUE
	drum_note 4, 2
	stereo_panning TRUE, FALSE
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 3, 2
	stereo_panning FALSE, TRUE
	drum_note 8, 1
	drum_note 8, 1
	stereo_panning TRUE, FALSE
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 4, 2
	drum_note 3, 2
	stereo_panning FALSE, TRUE
	drum_note 8, 2
	sound_ret

.sub2:
	stereo_panning TRUE, TRUE
	drum_note 4, 2
	stereo_panning TRUE, FALSE
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 3, 2
	stereo_panning FALSE, TRUE
	drum_note 8, 1
	drum_note 8, 1
	stereo_panning TRUE, FALSE
	drum_note 8, 2
	stereo_panning TRUE, TRUE
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_ret
