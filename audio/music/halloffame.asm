Music_HallOfFame_Ch1::
	tempo 112
	volume 7, 7
	duty_cycle 3
	vibrato 12, 2, 2
	toggle_perfect_pitch
	note_type 12, 11, 3
	rest 16
	rest 16
	rest 16
	rest 12
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1
.mainloop:
.loop1:
	note_type 12, 8, 0
	octave 4
	note C_, 16
	note E_, 16
	note F#, 16
	note_type 12, 6, 0
	note F_, 16
	sound_loop 3, .loop1
	rest 16
	rest 16
	rest 16
	rest 16
	sound_loop 0, .mainloop

Music_HallOfFame_Ch2::
	vibrato 8, 2, 5
	duty_cycle 3
.mainloop:
	note_type 12, 12, 4
	octave 3
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note G_, 2
	note D_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note F_, 2
	note C_, 2
	note F_, 2
	note A#, 4
	note A_, 4
	note F_, 2
	sound_loop 0, .mainloop

Music_HallOfFame_Ch3::
.mainloop:
	note_type 12, 1, 2
.loop1:
	octave 4
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	sound_loop 12, .loop1
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F#, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	sound_loop 0, .mainloop
