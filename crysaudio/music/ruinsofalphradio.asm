Music_RuinsOfAlphRadio:
	channel_count 3
	channel 1, Music_RuinsOfAlphRadio_Ch1
	channel 2, Music_RuinsOfAlphRadio_Ch2
	channel 3, Music_RuinsOfAlphRadio_Ch3

Music_RuinsOfAlphRadio_Ch1:
	tempo 160
	volume 7, 7
	duty_cycle 0
	pitch_offset 280
	vibrato 0, 15, 0
	stereo_panning TRUE, FALSE
.mainloop:
	note_type 6, 7, 1
	sound_call .sub1
	note_type 12, 10, 1
	rest 16
	rest 16
	sound_call .sub2
	note_type 12, 10, 1
	rest 16
	rest 16
	sound_call .sub1
	note_type 12, 10, 1
	rest 16
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note C_, 8
	sound_ret

.sub2:
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note C_, 4
	note G_, 1
	octave 5
	note C_, 8
	sound_ret

Music_RuinsOfAlphRadio_Ch2:
	duty_cycle 1
	vibrato 1, 14, 0
.mainloop:
	stereo_panning FALSE, TRUE
	note_type 6, 8, 1
	sound_call Music_RuinsOfAlphRadio_Ch1.sub1
	note_type 12, 10, 1
	rest 16
	rest 16
	note_type 6, 8, 1
	sound_call Music_RuinsOfAlphRadio_Ch1.sub2
	note_type 12, 10, 1
	rest 16
	sound_loop 0, .mainloop

Music_RuinsOfAlphRadio_Ch3:
	note_type 6, 2, 6
.mainloop:
	octave 2
	note C_, 1
	note C#, 1
	note C_, 1
	rest 16
	sound_loop 0, .mainloop
