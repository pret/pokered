Music_ContestResults:
	channel_count 4
	channel 1, Music_ContestResults_Ch1
	channel 2, Music_ContestResults_Ch2
	channel 3, Music_ContestResults_Ch3
	channel 4, Music_ContestResults_Ch4

Music_ContestResults_Ch1:
	tempo 144
	volume 7, 7
	note_type 12, 5, 1
.mainloop:
	rest 2
	octave 2
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 1
	rest 2
	note A_, 1
	rest 3
	note A_, 1
	rest 3
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	rest 2
	note A_, 1
	rest 3
	note A_, 1
	rest 3
	note A_, 1
	rest 3
	note A_, 1
	rest 1
	rest 2
	note B_, 1
	rest 3
	note A#, 1
	rest 3
	note A_, 1
	rest 3
	note G_, 1
	rest 1
	sound_loop 0, .mainloop

Music_ContestResults_Ch2:
	note_type 12, 6, 1
.mainloop:
	octave 2
	note C_, 2
	octave 3
	note E_, 1
	rest 1
	octave 1
	note G_, 2
	octave 3
	note E_, 1
	rest 1
	octave 1
	note A_, 2
	octave 3
	note E_, 1
	rest 1
	octave 1
	note B_, 2
	octave 3
	note E_, 1
	rest 1
	octave 2
	note D_, 2
	octave 3
	note F_, 1
	rest 1
	octave 1
	note A_, 2
	octave 3
	note F_, 1
	rest 1
	octave 1
	note B_, 2
	octave 3
	note F_, 1
	rest 1
	octave 2
	note C#, 2
	octave 3
	note F_, 1
	rest 1
.loop1:
	octave 2
	note D_, 2
	octave 3
	note F_, 1
	rest 1
	octave 1
	note A_, 2
	octave 3
	note F_, 1
	rest 1
	sound_loop 2, .loop1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	rest 1
	octave 2
	note D_, 2
	octave 3
	note F#, 1
	rest 1
	octave 2
	note G_, 2
	octave 3
	note F_, 1
	rest 1
	octave 2
	note D_, 2
	octave 3
	note D_, 1
	rest 1
	sound_loop 0, .mainloop

Music_ContestResults_Ch3:
	vibrato 8, 2, 4
	note_type 12, 2, 3
.mainloop:
	octave 4
	note E_, 5
	rest 1
	note E_, 1
	note F_, 1
	note G_, 4
	octave 5
	note C_, 4
	octave 4
	note B_, 8
	note A_, 8
	note D_, 5
	rest 1
	note D_, 1
	note E_, 1
	note F_, 4
	note B_, 4
	note A_, 8
	note G_, 8
	sound_loop 0, .mainloop

Music_ContestResults_Ch4:
	toggle_noise 4
	drum_speed 6
.mainloop:
	drum_note 2, 4
	drum_note 2, 4
	drum_note 2, 2
	drum_note 2, 2
	drum_note 2, 2
	drum_note 2, 2
	drum_note 2, 4
	drum_note 2, 4
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	drum_note 8, 1
	sound_loop 0, .mainloop
