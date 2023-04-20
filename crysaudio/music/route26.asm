Music_Route26:
	channel_count 4
	channel 1, Music_Route26_Ch1
	channel 2, Music_Route26_Ch2
	channel 3, Music_Route26_Ch3
	channel 4, Music_Route26_Ch4

Music_Route26_Ch1:
	stereo_panning FALSE, TRUE
	vibrato 18, 2, 3
	tempo 151
	volume 7, 7
	vibrato 20, 2, 3
	duty_cycle 0
	note_type 12, 10, 7
	octave 3
	note D_, 4
	rest 4
	note D#, 4
	rest 4
	note F#, 4
	rest 4
	note G#, 12
	note_type 8, 10, 7
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note F#, 2
.mainloop:
	duty_cycle 0
	note_type 12, 10, 7
	octave 3
	note F_, 1
	rest 2
	note C#, 1
	note F_, 3
	note G_, 1
	note G#, 1
	rest 2
	note F_, 1
	octave 4
	note C#, 4
	note D#, 4
	octave 3
	note B_, 4
	note A_, 4
	note F#, 4
	note F_, 1
	rest 1
	note C#, 1
	note F_, 1
	note G#, 3
	note G_, 1
	note G#, 1
	rest 1
	note F_, 1
	note G#, 1
	octave 4
	note C#, 4
	note E_, 4
	note D#, 4
	octave 3
	note A_, 4
	note B_, 4
	note A#, 1
	rest 1
	note F_, 1
	note A#, 1
	octave 4
	note C#, 1
	rest 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note F_, 4
	note C#, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	note A#, 4
	rest 2
	note_type 6, 10, 7
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	rest 2
	note A#, 2
	rest 2
	note G_, 2
	rest 2
	note G_, 2
	rest 2
	note_type 8, 10, 5
	note G#, 2
	octave 4
	note C#, 2
	note D#, 2
	note G#, 6
	note F#, 6
	note D#, 6
	note C#, 6
	octave 3
	note A#, 6
	octave 4
	note C_, 6
	octave 3
	note G#, 6
	duty_cycle 2
	note_type 12, 10, 5
	note A_, 3
	note G#, 3
	note F#, 4
	note C#, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note B_, 4
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note G#, 4
	note F#, 4
	note E_, 4
	note D#, 4
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note G#, 2
	note F_, 4
	note F#, 2
	note_type 6, 10, 5
	note G#, 7
	octave 4
	note C_, 1
	note C#, 8
	note_type 8, 10, 5
	octave 3
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 6
	note_type 6, 10, 5
	rest 7
	octave 4
	note D#, 1
	note E_, 8
	note_type 8, 10, 5
	octave 3
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 6
	rest 6
	note_type 12, 10, 5
	octave 2
	note B_, 1
	note F#, 1
	note B_, 1
	octave 3
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note E_, 1
	octave 3
	note B_, 1
	note F#, 4
	note D#, 4
	octave 2
	note B_, 4
	rest 4
	sound_loop 0, .mainloop

Music_Route26_Ch2:
	stereo_panning TRUE, FALSE
	vibrato 20, 2, 3
	duty_cycle 2
	note_type 12, 12, 7
	octave 1
	note A#, 4
	rest 2
	note_type 6, 12, 7
	note A#, 1
	rest 1
	octave 2
	note A#, 1
	rest 1
	octave 1
	note G#, 8
	rest 4
	note G#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	octave 1
	note F#, 8
	rest 4
	note F#, 1
	rest 1
	octave 2
	note F#, 1
	rest 1
	note_type 12, 12, 7
	octave 1
	note G#, 12
	note_type 8, 12, 7
	note G#, 2
	octave 2
	note C_, 2
	note D#, 2
.mainloop:
	duty_cycle 2
	note_type 12, 12, 2
	octave 2
	note C#, 6
	note C#, 1
	note G#, 1
	note C#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	octave 1
	note B_, 6
	note B_, 1
	octave 2
	note A_, 1
	octave 1
	note B_, 2
	note B_, 2
	note B_, 2
	note B_, 2
	sound_call .sub1
	note A_, 6
	note A_, 1
	octave 2
	note B_, 1
	note_type 8, 12, 2
	octave 1
	note B_, 2
	note B_, 2
	note B_, 2
	octave 2
	note B_, 2
	note B_, 2
	note B_, 2
	note_type 12, 12, 2
	sound_call .sub1
	volume_envelope 12, 7
	octave 2
	note F#, 4
	rest 2
	note_type 6, 12, 2
	note F#, 2
	note F#, 2
	note F#, 4
	note F#, 4
	note D#, 4
	note D#, 4
	note_type 8, 12, 2
.loop1:
	octave 2
	note G#, 2
	note G#, 2
	note G#, 2
	octave 1
	note G#, 6
	sound_loop 3, .loop1
	octave 2
	note G#, 2
	note G#, 2
	note G#, 2
	note_type 12, 12, 7
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note G#, 1
	duty_cycle 3
	octave 4
	note C#, 6
	note D#, 6
	note E_, 4
	note F#, 6
	note B_, 4
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 6
	note D#, 2
	rest 2
	note D#, 2
	note G#, 2
	note D#, 2
	note F_, 2
	rest 2
	note F_, 2
	note F#, 6
	note G#, 4
	note A_, 8
	rest 2
	note A_, 2
	note G#, 2
	note F#, 2
	note A_, 8
	rest 4
	note G#, 2
	note A_, 2
	note B_, 12
	rest 4
	note D#, 12
	note D#, 1
	note C#, 1
	note C_, 1
	note D#, 1
	sound_loop 0, .mainloop

.sub1:
	note A#, 6
	note A#, 1
	octave 2
	note A#, 1
	octave 1
	note A#, 2
	note A#, 2
	octave 2
	note A#, 2
	octave 1
	note A#, 2
	sound_ret

Music_Route26_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 18, 2, 3
	note_type 12, 1, 4
	vibrato 24, 2, 3
	octave 4
	note A#, 4
	rest 2
	note_type 6, 1, 4
	note F_, 1
	rest 1
	note A#, 1
	rest 1
	octave 5
	note C_, 8
	rest 4
	octave 4
	note G#, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	note C#, 8
	rest 4
	octave 4
	note A#, 1
	rest 1
	octave 5
	note C#, 1
	rest 1
	note_type 12, 1, 4
	note D#, 12
	note_type 8, 1, 4
	note F#, 2
	note F_, 2
	note D#, 2
.mainloop:
	vibrato 24, 2, 3
	note_type 12, 1, 4
	octave 5
	note C#, 1
	rest 2
	octave 4
	note G#, 1
	sound_call .sub1
	vibrato 37, 1, 3
	note C#, 1
	rest 1
	octave 4
	note G#, 1
	octave 5
	note C#, 1
	sound_call .sub1
	note F_, 1
	rest 1
	note C#, 1
	note F_, 1
	note A#, 8
	note A#, 1
	rest 1
	octave 6
	note C_, 1
	rest 1
	note C#, 12
	note D#, 4
	note C#, 8
	note C_, 8
	octave 5
	note A#, 8
	octave 6
	note C_, 4
	note G#, 1
	note D#, 1
	note C_, 1
	octave 5
	note G#, 1
	volume_envelope 1, 5
	octave 2
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	note_type 6, 1, 5
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 2
	rest 2
	note A_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	octave 2
	note A_, 4
	note B_, 2
	rest 2
	note B_, 2
	rest 6
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note B_, 2
	rest 2
	note B_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	note A_, 4
	note G#, 2
	rest 2
	octave 2
	note G#, 2
	rest 6
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 2
	rest 2
	note G#, 2
	rest 2
	octave 3
	note G#, 2
	rest 2
	octave 2
	note G#, 2
	rest 2
	octave 3
	note C#, 2
	rest 10
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	octave 4
	note F_, 2
	rest 2
	note C#, 4
	octave 3
	note F#, 8
	note_type 8, 1, 5
	octave 2
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 6
	rest 6
	octave 4
	note C_, 6
	octave 3
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 6
	rest 6
	note_type 12, 1, 5
	octave 2
	note B_, 16
	note B_, 8
	octave 3
	note F#, 4
	note D#, 1
	rest 1
	octave 2
	note G#, 1
	octave 3
	note C_, 1
	sound_loop 0, .mainloop

.sub1:
	octave 5
	note F_, 8
	note C#, 2
	note F_, 2
	note G#, 4
	note F#, 4
	note C#, 4
	note D#, 4
	sound_ret

Music_Route26_Ch4:
	toggle_noise 4
	drum_speed 12
.loop1:
	drum_note 12, 6
	drum_note 3, 1
	drum_note 3, 1
	sound_loop 3, .loop1
	sound_call .sub3
.mainloop:
	drum_speed 6
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	drum_note 3, 12
	drum_note 3, 2
	drum_note 3, 2
	drum_speed 8
	drum_note 3, 2
	drum_note 2, 2
	drum_note 2, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 5, 2
	drum_speed 6
	sound_call .sub1
	sound_call .sub1
	drum_speed 8
.loop2:
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 12, 6
	sound_loop 4, .loop2
	drum_speed 6
	sound_call .sub2
	sound_call .sub2
	sound_call .sub1
	sound_call .sub2
.loop3:
	drum_speed 6
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_speed 8
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 12, 12
	sound_loop 2, .loop3
	drum_speed 12
	drum_note 12, 16
	sound_call .sub3
	sound_loop 0, .mainloop

.sub1:
	drum_note 5, 12
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 4
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	sound_ret

.sub2:
	drum_note 5, 12
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 4
	drum_note 5, 4
	drum_note 3, 4
	sound_ret

.sub3:
	drum_speed 6
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_speed 8
	drum_note 3, 2
	drum_note 3, 2
	drum_note 5, 2
	sound_ret
