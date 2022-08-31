
;;----------------------------------------
Music_Field6_Ch1:
;;----------------------------------------

	tempo 128
	volume 7, 7
	duty_cycle 3
	vibrato 6, 3, 4
	toggle_perfect_pitch

.loop10
	note_type 12, 11, 3
	octave 3
	note C_, 6
	note G_, 6
	note E_, 4
	sound_loop 0, .loop10

;;----------------------------------------
Music_Field6_Ch2:
;;----------------------------------------

	duty_cycle 1
	vibrato 8, 2, 5
.loop20
	note_type 12, 12, 7
;; P2-3
	octave 4
	note C_, 6
;; P2-4
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 10
;; P2-5
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
;; P2-6
	note D_, 6
	note_type 12, 10, 0
	note F_, 10
;; P2-7
	note_type 12, 9, 0
	note F_, 8
	note_type 12, 8, 7
	note F_, 8
;; P2-8
	note_type 12, 12, 7
	octave 4
	note C_, 6
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 10
;; P2-9
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
;; P2-10
	note D_, 8
	note_type 12, 10, 0
	note F_, 8
;; P2-11
	note_type 12, 9, 0
	note F_, 8
	note_type 12, 8, 7
	note F_, 6

	note_type 12, 12, 7
	note C_, 1
	note D_, 1
;; P2-12
	note E_, 2
	note D_, 2
	note E_, 2
	note C_, 8
	octave 3
	note B_, 1
	octave 4
	note C_, 1
;; P2-13
	note D_, 2
	octave 3
	note G_, 4
	octave 4
	note G_, 8
	note F_, 1
	note E_, 1
;; P2-14
	note_type 8, 13, 3
	note F_, 4
	note E_, 4
	note_type 8, 12, 4
	note C_, 4
	note_type 8, 10, 0
	note C_, 12
;; P2-15
	note_type 12, 10, 7
	note C_, 16

	sound_loop 0, .loop20


;;----------------------------------------
Music_Field6_Ch3:
;;----------------------------------------

	note_type 12, 1, 1
.loop30
	sound_call .sub31
	sound_loop 2, .loop30

.loop31
	sound_call .sub32
	sound_loop 2, .loop31

	sound_loop 0, .loop30

.sub31
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	sound_ret

.sub32
	octave 4
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	sound_ret

;;----------------------------------------
Music_Field6_Ch4:
;;----------------------------------------

	drum_speed 6

.loop40
	sound_call .sub42
	sound_call .sub41

	sound_call .sub42
	sound_call .sub43

	sound_call .sub41
	sound_call .sub42

	sound_call .sub42
	sound_call .sub43

	sound_loop 0, .loop40


.sub41
	drum_note 17, 4
	drum_note 18, 4
	drum_note 19, 4
	drum_note 18, 4
	drum_note 17, 4
	drum_note 18, 4
	drum_note 19, 4
	drum_note 19, 2
	drum_note 18, 2
	sound_ret

.sub42
	drum_note 17, 4
	drum_note 18, 4
	drum_note 19, 4
	drum_note 18, 4
	drum_note 17, 4
	drum_note 18, 4
	drum_note 19, 4
	drum_note 19, 1
	drum_note 19, 1
	drum_note 18, 1
	drum_note 18, 1
	sound_ret

.sub43
	drum_note 17, 4
	drum_note 18, 4
	drum_note 17, 4
	drum_note 18, 4
	drum_note 17, 4
	drum_note 17, 4
	drum_note 19, 1
	drum_note 19, 1
	drum_note 19, 1
	drum_note 19, 1
	drum_note 18, 1
	drum_note 18, 1
	drum_note 18, 1
	drum_note 18, 1
	sound_ret

