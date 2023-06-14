;
;;	Kinchou01
;
;;	Converting on Fri Jul 28 15:34:53 1995
;
;;				by ver 1.02
;



Music_Kinchou01::
	channel_count 3
	channel 1, Music_Kinchou01_Ch1
	channel 2, Music_Kinchou01_Ch2
	channel 3, Music_Kinchou01_Ch3

;;----------------------------------------
Music_Kinchou01_Ch1:
;;----------------------------------------

	tempo 144
	volume 7, 7
	duty_cycle 3
	note_type 12, 12, 3
	toggle_perfect_pitch
	rest 16
.loop
	rest 16
;; P1-1 --- tied
    rest 16
    rest 10
	octave 3
	note B_, 1
;; P1-2 --- tied
	octave 4
	note F#, 1
;; P1-3 --- tied
	note B_, 1
	rest 1
;; P1-4 --- tied
	note B_, 1
	note A#, 1
;; P1-5
	note B_, 8
	rest 2
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note B_, 1
	rest 1
	note B_, 1
	note A#, 1
;; P1-6
	note B_, 8
	rest 2
	octave 3
	note F#, 1
	note E_, 1
	note D#, 1
	rest 1
	note D#, 1
	note E_, 1
;; P1-7
	note F#, 1
	rest 1
	note F#, 1
	note A#, 1
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note G#, 1
	rest 7
;; P1-8
	note F#, 1
	rest 15

	sound_loop 0, .loop

;;----------------------------------------
Music_Kinchou01_Ch2:
;;----------------------------------------

;; P2-1
.loop
    duty_cycle 3
	note_type 12, 12, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	octave 2
	note B_, 2
	sound_loop 0, .loop

;;----------------------------------------
Music_Kinchou01_Ch3:
;;----------------------------------------

	note_type 12, 1, 0
;; P3-1 -
	rest 16
;; P3-2 -
.loop
	rest 16
;; P3-3
	octave 5
	note D#, 8
	rest 2
	note C#, 2
	note D#, 2
	note E_, 2
;; P3-4
	note F#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	note D#, 8
	rest 2
;; P3-5 --- tied
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 8
	rest 2
;; P3-6 --- tied
	note F#, 2
	note E_, 2
	note D#, 2
	note D#, 8
	rest 8
;; P3-7 --- tied
	note E_, 1
	rest 7
;; P3-8
	note D#, 1
	rest 15

	sound_loop 0, .loop
