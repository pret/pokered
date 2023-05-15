;
;;	Victory01
;
;;	Converting on Sat Mar 11 14:49:42 1995
;
;;				by ver 1.02
;



Music_Victory4::
	channel_count 3
	channel 1, Music_Victory4_Ch1
	channel 2, Music_Victory4_Ch2
	channel 3, Music_Victory4_Ch3

;;----------------------------------------
Music_Victory4_Ch1:
;;----------------------------------------

	tempo 112
	volume 7, 7
	duty_cycle 2
	toggle_perfect_pitch
;; P1-1
	note_type 8, 10, 2
	octave 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note_type 8, 11, 3
	note F#, 12
;; P1-2
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
;; P2-4
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

;; P2-6
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
;; P2-8
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
;; P2-1
	note_type 8, 12, 3
	octave 4
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note B_, 2
	octave 5
	note C#, 2
	note_type 8, 12, 4
	note D_, 12
;; P2-2
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
;; P2-4
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

;; P2-6
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
;; P2-8
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


;;----------------------------------------
Music_Victory4_Ch3:
;;----------------------------------------

;; P3-1
	note_type 12, 1, 0
	octave 5
	note D_, 4
	note_type 8, 1, 0
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 12
;; P3-2
	sound_ret

