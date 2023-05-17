;
;;	Victory01
;
;;	Converting on Sat Mar 11 14:49:42 1995
;
;;				by ver 1.02
;



Music_Victory4::
	channel_count 2
	channel 1, Music_Victory4_Ch1
	channel 2, Music_Victory4_Ch2

;;----------------------------------------
Music_Victory4_Ch1:
;;----------------------------------------

	tempo 112
	volume 7, 7
	duty_cycle 2
	toggle_perfect_pitch
	rest 1
.loop10
	note_type 12, 4, 4
.loop11
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	sound_loop 2, .loop11
.loop12
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	sound_loop 2, .loop12
.loop13
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	sound_loop 2, .loop13
.loop14
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	sound_loop 2, .loop14
	sound_loop 0, .loop10

;;----------------------------------------
Music_Victory4_Ch2:
;;----------------------------------------

	duty_cycle 2
	vibrato 24, 2, 4
.loop20
	note_type 12, 8, 2
.loop21
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	note_type 12, 6, 2
	sound_loop 2, .loop21
	note_type 12, 8, 2
.loop22
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	note_type 12, 6, 2
	sound_loop 2, .loop22
	note_type 12, 8, 2
.loop23
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	note_type 12, 6, 2
	sound_loop 2, .loop23
	note_type 12, 8, 2
.loop24
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	note_type 12, 6, 2
	sound_loop 2, .loop24
	sound_loop 0, .loop20
