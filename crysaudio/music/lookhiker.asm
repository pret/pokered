Music_LookHiker:
	channel_count 4
	channel 1, Music_LookHiker_Ch1
	channel 2, Music_LookHiker_Ch2
	channel 3, Music_LookHiker_Ch3
	channel 4, Music_LookHiker_Ch4

Music_LookHiker_Ch1:
	tempo 132
	volume 7, 7
	pitch_offset 1
	vibrato 18, 2, 4
	duty_cycle 2
	stereo_panning FALSE, TRUE
	note_type 12, 6, 8
	octave 3
	note F#, 2
	note F_, 2
	note F#, 8
.mainloop:
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	rest 4
	note F#, 2
	rest 4
	note F#, 2
	rest 2
	note F#, 2
	rest 6
	sound_loop 0, .mainloop

Music_LookHiker_Ch2:
	duty_cycle 0
	note_type 12, 10, 1
	rest 4
	octave 1
	note B_, 1
	note B_, 5
	octave 2
	note F#, 1
	note F#, 5
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 1
	note D_, 1
	volume_envelope 10, 1
.mainloop:
	octave 1
	note B_, 1
	note B_, 2
	octave 2
	note D_, 1
	note D_, 2
	note F#, 1
	note F#, 2
	note A#, 1
	note A#, 2
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F#, 1
	note D_, 1
	sound_loop 0, .mainloop

Music_LookHiker_Ch3:
	vibrato 18, 2, 4
	stereo_panning TRUE, FALSE
	note_type 12, 1, 4
	octave 4
	note B_, 2
	note A#, 2
	note B_, 8
.mainloop:
	octave 5
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	sound_call .sub1
	note G_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note B_, 2
	rest 4
	note B_, 2
	rest 4
	note B_, 2
	rest 2
	note B_, 2
	rest 6
	sound_ret

Music_LookHiker_Ch4:
	toggle_noise 3
	drum_speed 12
	drum_note 6, 4
	rest 16
.mainloop:
	drum_note 4, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	sound_loop 0, .mainloop
