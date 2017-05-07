Music_CinnabarMansion:
	dbw $C0, Music_CinnabarMansion_Ch1
	dbw $01, Music_CinnabarMansion_Ch2
	dbw $02, Music_CinnabarMansion_Ch3
	dbw $03, Music_CinnabarMansion_Ch4

Music_CinnabarMansion_Ch1: ; 7ed0f (1f:6d0f)
	tempo 144
	volume 119
	vibrato 11, 37
	dutycycle 2

Music_CinnabarMansion_branch_7ed19:
	notetype 12, 98
	octave 5
	note E_, 1
	note E_, 1
	octave 4
	note B_, 1
	note B_, 1
	note C_, 1
	note __, 2
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
	note __, 2
	loopchannel 14, Music_CinnabarMansion_branch_7ed19
	notetype 12, 165
	note __, 16
	note __, 16
	note __, 15
	octave 4
	note C_, 1
	octave 5
	note B_, 1
	note B_, 2
	loopchannel 0, Music_CinnabarMansion_branch_7ed19


Music_CinnabarMansion_Ch2: ; 7ed40 (1f:6d40)
	dutycycle 2
	
	vibrato 10, 36
	notetype 12, 194

Music_CinnabarMansion_branch_7ed48:
	note __, 16
	note __, 16
	loopchannel 4, Music_CinnabarMansion_branch_7ed48

Music_CinnabarMansion_branch_7ed4e:
	notetype 12, 194

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
	note __, 4
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
	note __, 4
	note A#, 4
	endchannel


Music_CinnabarMansion_Ch3: ; 7ed7e (1f:6d7e)
	notetype 12, 17

Music_CinnabarMansion_branch_7ed80:
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	loopchannel 8, Music_CinnabarMansion_branch_7ed80
	note E_, 16
	note D#, 16
	note G_, 16
	note G#, 8
	note D#, 8
	loopchannel 0, Music_CinnabarMansion_branch_7ed80


Music_CinnabarMansion_Ch4: ; 7edb0 (1f:6db0)
	notetype 6
	togglenoise 1
	note __, 16
	note __, 16
	note __, 16
	note __, 16

Music_CinnabarMansion_branch_7edb5:
	note E_, 2
	note E_, 2
	note F_, 4
	note E_, 2
	note E_, 2
	note F_, 4
	note E_, 2
	note E_, 2
	note F_, 4
	note E_, 2
	note E_, 2
	note F#, 4
	note E_, 2
	note E_, 2
	note __, 2
	note __, 10
	note __, 8
	note F#, 8
	loopchannel 0, Music_CinnabarMansion_branch_7edb5
; 0x7edda