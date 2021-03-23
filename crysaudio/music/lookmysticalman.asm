Music_LookMysticalMan:
	channel_count 4
	channel 1, Music_LookMysticalMan_Ch1
	channel 2, Music_LookMysticalMan_Ch2
	channel 3, Music_LookMysticalMan_Ch3
	channel 4, Music_LookMysticalMan_Ch4

Music_LookMysticalMan_Ch1:
	tempo 136
	volume 7, 7
	vibrato 10, 3, 4
	pitch_offset 1
	stereo_panning FALSE, TRUE
	note_type 12, 11, 3
	rest 8
.mainloop:
	duty_cycle 3
	note_type 6, 9, 6
	octave 3
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note E_, 2
	note F#, 2
	rest 4
	note F#, 2
	rest 9
	rest 9
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note D_, 2
	note E_, 2
	rest 4
	note E_, 2
	rest 9
	rest 9
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note C#, 2
	note E_, 2
	rest 4
	note E_, 2
	rest 9
	rest 9
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note C#, 2
	note E_, 2
	rest 3
	note F_, 1
	note F#, 4
	rest 4
	note E_, 4
	rest 4
	note C#, 4
	duty_cycle 2
	sound_call .sub1
	octave 4
	note C#, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	note A#, 2
	octave 4
	note C#, 6
	rest 4
	octave 3
	note F#, 4
	rest 4
	note E_, 4
	sound_call .sub1
	octave 4
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	octave 3
	note A#, 2
	note B_, 6
	note A#, 4
	note F#, 4
	volume_envelope 10, 5
	duty_cycle 0
	octave 4
	note F#, 2
	note A#, 6
	duty_cycle 2
	volume_envelope 7, 2
.loop1:
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note F#, 2
	note D_, 2
	sound_loop 4, .loop1
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note B_, 2
.loop2:
	octave 5
	note D_, 2
	octave 4
	note G#, 2
	note E_, 2
	octave 3
	note B_, 2
	sound_loop 4, .loop2
	octave 5
	note C#, 2
	octave 4
	note A#, 2
	note F#, 2
	note C#, 2
	octave 3
	note A#, 2
	note F#, 2
	note C#, 2
	octave 2
	note A#, 2
	octave 3
	note C#, 2
	note E_, 2
	note F#, 2
	note A#, 2
	octave 4
	note C#, 2
	note E_, 2
	note F#, 2
	note A#, 2
	sound_loop 0, .mainloop

.sub1:
	note D_, 16
	octave 4
	note D_, 2
	rest 2
	note E_, 2
	rest 2
	note F#, 2
	note D_, 6
	octave 3
	note E_, 16
	note B_, 2
	rest 2
	octave 4
	note C#, 2
	rest 2
	note D_, 2
	octave 3
	note B_, 6
	octave 4
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note D_, 2
	note C#, 6
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	octave 3
	note B_, 2
	note A_, 6
	sound_ret

Music_LookMysticalMan_Ch2:
	duty_cycle 3
	vibrato 10, 3, 4
	note_type 12, 11, 3
	rest 8
.mainloop:
	stereo_panning TRUE, FALSE
	note_type 6, 11, 8
	octave 3
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note A_, 2
	note B_, 2
	rest 4
	note B_, 2
	rest 6
	stereo_panning TRUE, TRUE
	note B_, 8
	note A_, 4
	stereo_panning TRUE, FALSE
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 2
	note G#, 2
	rest 4
	note G#, 2
	rest 6
	stereo_panning TRUE, TRUE
	note F#, 8
	note G#, 4
	stereo_panning TRUE, FALSE
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 2
	note A_, 2
	rest 4
	note A_, 2
	rest 6
	stereo_panning TRUE, TRUE
	note A_, 8
	note G_, 4
	stereo_panning TRUE, FALSE
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note E_, 2
	note F#, 2
	rest 3
	note A_, 1
	note A#, 4
	rest 4
	note F#, 4
	rest 4
	note E_, 4
	sound_call .sub1
	note F#, 2
	rest 2
	note E_, 2
	rest 2
	note D_, 2
	note E_, 6
	sound_call .sub2
	sound_call .sub1
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note E_, 2
	note D_, 6
	sound_call .sub2
	note_type 12, 11, 7
	note B_, 2
	rest 2
	note B_, 2
	rest 2
	octave 4
	note D_, 2
	rest 1
	note C#, 2
	rest 1
	octave 3
	note B_, 16
	rest 2
	note B_, 2
	rest 2
	octave 4
	note D_, 2
	rest 2
	note C#, 2
	rest 1
	octave 3
	note B_, 2
	rest 1
	note A#, 16
	rest 2
	sound_loop 0, .mainloop

.sub1:
	note B_, 2
	rest 2
	octave 4
	note D_, 2
	rest 2
	note F#, 2
	note A_, 6
	note B_, 8
	rest 2
	note A_, 2
	note B_, 2
	octave 5
	note C#, 2
	note D_, 2
	rest 2
	note C#, 2
	rest 2
	note D_, 2
	note C#, 6
	octave 4
	note B_, 12
	volume_envelope 8, 8
	note A#, 1
	note A_, 1
	volume_envelope 6, 8
	note G#, 1
	note F#, 1
	volume_envelope 11, 8
	octave 5
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	octave 4
	note B_, 2
	note A_, 6
	note G_, 2
	rest 2
	note G_, 2
	rest 2
	note F#, 2
	note E_, 6
	sound_ret

.sub2:
	note C#, 8
	volume_envelope 8, 8
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	volume_envelope 6, 8
	note G#, 1
	note F#, 1
	volume_envelope 4, 8
	note E_, 1
	note C#, 1
	rest 1
	volume_envelope 11, 8
	sound_ret

Music_LookMysticalMan_Ch3:
	note_type 6, 1, 6
	rest 16
.mainloop:
	octave 2
	note B_, 4
	octave 3
	note A_, 2
	rest 2
	note F#, 4
	octave 2
	note B_, 1
	rest 1
	note B_, 4
	note A_, 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note A_, 2
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note E_, 4
	note G#, 2
	rest 2
	note B_, 4
	note E_, 1
	rest 1
	note E_, 6
	octave 2
	note A#, 2
	note B_, 6
	note G#, 4
	note A_, 4
	octave 3
	note G_, 2
	rest 2
	note E_, 4
	octave 2
	note A_, 1
	rest 1
	note A_, 4
	note G_, 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
.loop1:
	octave 2
	note F#, 4
	note A#, 2
	rest 2
	octave 3
	note C#, 4
	octave 2
	note F#, 1
	rest 1
	note F#, 6
	note G#, 4
	rest 4
	note A#, 4
	note B_, 4
	octave 3
	note A_, 2
	rest 2
	note F#, 4
	octave 2
	note B_, 1
	rest 1
	note B_, 6
	octave 3
	note D_, 2
	rest 2
	note F#, 2
	note D_, 6
	note E_, 4
	note G#, 2
	rest 2
	note B_, 4
	note E_, 1
	rest 1
	note E_, 6
	note D_, 2
	rest 2
	octave 2
	note B_, 2
	note G#, 6
	note A_, 4
	octave 3
	note C#, 2
	rest 2
	note E_, 4
	octave 2
	note A_, 1
	rest 1
	note A_, 6
	octave 3
	note E_, 4
	note C#, 2
	octave 2
	note E_, 6
	sound_loop 2, .loop1
	note F#, 4
	note A#, 2
	rest 2
	octave 3
	note C#, 2
	note F#, 6
	octave 2
	note F#, 2
	rest 2
	octave 3
	note C#, 4
	octave 2
	note A#, 2
	octave 3
	note F#, 6
	octave 2
	note B_, 4
	octave 3
	note B_, 4
	octave 2
	note B_, 4
	octave 3
	note F#, 2
	note A_, 6
	octave 2
	note B_, 4
	octave 3
	note F#, 4
	octave 2
	note B_, 4
	note A_, 4
	rest 2
	note A#, 4
	rest 2
	note B_, 6
	rest 2
	note B_, 4
	note A_, 4
	note F#, 4
	note E_, 4
	octave 3
	note E_, 4
	octave 2
	note E_, 4
	note G#, 2
	octave 3
	note D_, 6
	octave 2
	note E_, 4
	note B_, 4
	octave 3
	note E_, 4
	note F#, 4
	rest 2
	note E_, 4
	rest 2
	note C#, 8
	octave 2
	note B_, 8
	note A#, 4
	sound_loop 0, .mainloop

Music_LookMysticalMan_Ch4:
	toggle_noise 3
	drum_speed 12
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.mainloop:
.loop1:
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	sound_call .sub3
	sound_loop 2, .loop1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	drum_note 3, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 4, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.loop2:
	drum_note 3, 2
	drum_note 4, 2
	drum_note 3, 3
	drum_note 4, 1
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 3, 3
	drum_note 4, 1
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_loop 2, .loop2
	sound_loop 0, .mainloop

.sub1:
	drum_note 4, 4
	drum_note 3, 3
	drum_note 4, 3
	drum_note 4, 2
	drum_note 3, 4
	sound_ret

.sub2:
	drum_note 4, 4
	drum_note 3, 3
	drum_note 3, 3
	drum_note 4, 2
	drum_note 3, 4
	sound_ret

.sub3:
	drum_note 4, 4
	drum_note 3, 2
	drum_note 4, 1
	drum_note 3, 3
	drum_note 3, 2
	drum_note 4, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_ret
