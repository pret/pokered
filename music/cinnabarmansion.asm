Music_CinnabarMansion_Ch1: ; 7ed0f (1f:6d0f)
	tempo 0, 144
	stereopanning 119
	vibrato 11, 2, 5
	duty 2

Music_CinnabarMansion_branch_7ed19:
	notetype 12, 6, 2
	octave 5
	note E_, 1
	note E_, 1
	octave 4
	note B_, 1
	note B_, 1
	note C_, 1
	rest 2
	octave 5
	note B_, 2
	note E_, 2
	octave 4
	note C_, 2
	note B_, 2
	note E_, 2
	note C_, 1
	octave 5
	note B_, 1
	rest 2
	loopchannel 14, Music_CinnabarMansion_branch_7ed19
	notetype 12, 10, 5
	rest 16
	rest 16
	rest 15
	octave 4
	note C_, 1
	octave 5
	note B_, 1
	note B_, 2
	loopchannel 0, Music_CinnabarMansion_branch_7ed19


Music_CinnabarMansion_Ch2: ; 7ed40 (1f:6d40)
	duty 2
	togglecall
	vibrato 10, 2, 4
	notetype 12, 12, 2

Music_CinnabarMansion_branch_7ed48:
	rest 16
	rest 16
	loopchannel 4, Music_CinnabarMansion_branch_7ed48

Music_CinnabarMansion_branch_7ed4e:
	notetype 12, 12, 2

Music_CinnabarMansion_branch_7ed50:
	callchannel Music_CinnabarMansion_branch_7ed6c
	loopchannel 3, Music_CinnabarMansion_branch_7ed50
	octave 3
	note E_, 4
	note D#, 4
	note B_, 4
	note A#, 4
	note G_, 4
	note G#, 4
	rest 4
	note A#, 4
	note E_, 4
	note D#, 4
	note B_, 4
	note A#, 4
	note G_, 4
	note G#, 4
	note G_, 4
	note D#, 4
	loopchannel 0, Music_CinnabarMansion_branch_7ed4e

Music_CinnabarMansion_branch_7ed6c:
	octave 3
	note E_, 4
	note D#, 4
	note B_, 4
	note A#, 4
	note G_, 4
	note G#, 4
	note A_, 4
	note A#, 4
	note E_, 4
	note D#, 4
	note B_, 4
	note A#, 4
	note G_, 4
	note G#, 4
	rest 4
	note A#, 4
	endchannel


Music_CinnabarMansion_Ch3: ; 7ed7e (1f:6d7e)
	notetype 12, 1, 1

Music_CinnabarMansion_branch_7ed80:
	octave 2
	note B_, 2
	rest 2
	octave 3
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note C_, 2
	rest 2
	octave 3
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	loopchannel 8, Music_CinnabarMansion_branch_7ed80
	note E_, 16
	note D#, 16
	note G_, 16
	note G#, 8
	note D#, 8
	loopchannel 0, Music_CinnabarMansion_branch_7ed80


Music_CinnabarMansion_Ch4: ; 7edb0 (1f:6db0)
	dspeed 6
	rest 16
	rest 16
	rest 16
	rest 16

Music_CinnabarMansion_branch_7edb5:
	dnote 2, cymbal1
	dnote 2, cymbal1
	dnote 4, cymbal2
	dnote 2, cymbal1
	dnote 2, cymbal1
	dnote 4, cymbal2
	dnote 2, cymbal1
	dnote 2, cymbal1
	dnote 4, cymbal2
	dnote 2, cymbal1
	dnote 2, cymbal1
	dnote 4, cymbal3
	dnote 2, cymbal1
	dnote 2, cymbal1
	rest 2
	rest 10
	rest 8
	dnote 8, cymbal3
	loopchannel 0, Music_CinnabarMansion_branch_7edb5
; 0x7edda