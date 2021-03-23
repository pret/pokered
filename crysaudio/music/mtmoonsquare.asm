Music_MtMoonSquare:
	channel_count 2
	channel 1, Music_MtMoonSquare_Ch1
	channel 2, Music_MtMoonSquare_Ch2

Music_MtMoonSquare_Ch1:
	tempo 112
	volume 7, 7
	duty_cycle 2
	pitch_offset 1
	rest 1
.mainloop:
	note_type 12, 4, 4
.loop1:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	sound_loop 2, .loop1
.loop2:
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	sound_loop 2, .loop2
.loop3:
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	sound_loop 2, .loop3
.loop4:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	sound_loop 2, .loop4
	sound_loop 0, .mainloop

Music_MtMoonSquare_Ch2:
	duty_cycle 2
	vibrato 24, 2, 4
.mainloop:
	note_type 12, 8, 2
.loop1:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	note_type 12, 6, 2
	sound_loop 2, .loop1
	note_type 12, 8, 2
.loop2:
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	note_type 12, 6, 2
	sound_loop 2, .loop2
	note_type 12, 8, 2
.loop3:
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	note_type 12, 6, 2
	sound_loop 2, .loop3
	note_type 12, 8, 2
.loop4:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	note_type 12, 6, 2
	sound_loop 2, .loop4
	sound_loop 0, .mainloop
