;
;;	Victory013
;
;;	Converting on Tue Jun 20 00:52:07 1995
;
;;				by ver 1.02
;






;;----------------------------------------
Victory013_Ch1:
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
.loop
;; P1-2
    note_type 8, 6, 3
	octave 3
	note A_, 6
	octave 4
	note D_, 3
	note E_, 3
	note D_, 6
	note G_, 3
	note B_, 3
;; P1-3
	octave 3
	note A_, 6
	octave 4
	note D_, 3
	octave 3
	note G_, 3
	note B_, 3
	note A_, 3
	note G_, 6
;; P1-4
	note A_, 6
	octave 4
	note D_, 3
	note E_, 3
	note D_, 6
	note G_, 3
	note B_, 3
;; P1-5
	note A_, 3
	note F#, 3
	note A_, 3
	note F#, 3
	rest 3
	note A_, 3
	note A_, 3
	rest 3
	sound_loop 0, .loop

;;----------------------------------------
Victory013_Ch2:
;;----------------------------------------

;; P2-1
	duty_cycle 2
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
.loop
;; P2-2
    note_type 8, 8, 5
	octave 4
	note D_, 6
	note F#, 3
	note A_, 3
	note G_, 6
	note B_, 3
	octave 5
	note D_, 3
;; P2-3
	octave 4
	note D_, 6
	note F#, 3
	note A_, 3
	note G_, 3
	note F#, 3
	note E_, 3
	note D_, 3
;; P2-4
	note D_, 6
	note F#, 3
	note A_, 3
	note G_, 6
	note B_, 3
	octave 5
	note D_, 3
;; P2-5
	note C#, 3
	octave 4
	note B_, 3
	octave 5
	note C#, 3
	octave 4
	note A_, 3
	rest 3
	octave 5
	note D_, 3
	note D_, 3
	rest 3
	sound_loop 0, .loop

;;----------------------------------------
Victory013_Ch3:
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
.loop
;; P3-2
	octave 5
	note D_, 3
	rest 3
	note D_, 3
	rest 3
	note D_, 3
	rest 3
	note D_, 3
	rest 3
;; P3-3
	note D_, 3
	rest 3
	note D_, 3
	rest 3
	note D_, 3
	octave 4
	note B_, 3
	octave 5
	note C#, 3
	octave 4
	note A_, 3
;; P3-4
	octave 5
	note D_, 3
	rest 3
	note D_, 3
	rest 3
	note D_, 3
	rest 3
	note D_, 3
	rest 3
;; P3-5
	note D_, 3
	rest 3
	note D_, 3
	rest 3
	note D_, 3
	note F#, 3
	note D_, 3
	note C#, 3
	sound_loop 0, .loop
