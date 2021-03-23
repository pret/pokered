Music_RuinsOfAlphInterior:
	channel_count 3
	channel 1, Music_RuinsOfAlphInterior_Ch1
	channel 2, Music_RuinsOfAlphInterior_Ch2
	channel 3, Music_RuinsOfAlphInterior_Ch3

Music_RuinsOfAlphInterior_Ch1:
	tempo 224
	volume 7, 7
	duty_cycle 0
	stereo_panning TRUE, FALSE
	note_type 12, 4, 4
	rest 1
	sound_loop 0, Music_RuinsOfAlphInterior_Ch2.mainloop

Music_RuinsOfAlphInterior_Ch2:
	pitch_offset 2
	duty_cycle 0
	stereo_panning FALSE, TRUE
	note_type 12, 10, 4
.mainloop:
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 2
	note D#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	sound_loop 0, .mainloop

Music_RuinsOfAlphInterior_Ch3:
	note_type 12, 1, 0
.mainloop:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 2
	rest 10
	sound_loop 0, .mainloop
