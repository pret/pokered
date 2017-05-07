Music_Routes3:
	dbw $C0, Music_Routes3_Ch1
	dbw $01, Music_Routes3_Ch2
	dbw $02, Music_Routes3_Ch3
	dbw $03, Music_Routes3_Ch4

Music_Routes3_Ch1: ; 9fad (2:5fad)
	tempo 148
	volume 119
	dutycycle 3
	vibrato 6, 52
	
	notetype 12, 181
	octave 3
	note E_, 1
	note F#, 1
	note G_, 6
	note F_, 1
	note G_, 1
	note E_, 1
	note __, 16
	note __, 15

Music_Routes3_branch_9fc3:
	notetype 12, 181
	note E_, 6
	note D_, 1
	note E_, 1
	note C_, 4
	note E_, 4
	note C_, 6
	note D_, 1
	note E_, 1
	note F_, 2
	note G_, 2
	note G_, 2
	note A_, 2
	notetype 12, 167
	note A#, 8
	note F_, 8
	note D_, 8
	note F_, 8
	notetype 12, 181
	note E_, 6
	note D_, 1
	note E_, 1
	note C_, 4
	note E_, 4
	note C_, 6
	note D_, 1
	note E_, 1
	note F_, 2
	note G_, 2
	note G_, 2
	note A_, 2
	notetype 12, 167
	note A#, 8
	note A#, 8
	note D_, 8
	note F_, 8
	notetype 12, 181
	note E_, 4
	note E_, 2
	note F_, 2
	note G_, 4
	note F_, 2
	note E_, 2
	note B_, 2
	octave 2
	note G_, 4
	octave 3
	note B_, 8
	note A_, 2
	notetype 8, 195
	note A_, 4
	note F_, 4
	note A_, 4
	notetype 8, 79
	note A_, 12
	notetype 8, 144
	note F_, 12
	note G_, 12
	loopchannel 0, Music_Routes3_branch_9fc3


Music_Routes3_Ch2: ; a009 (2:6009)
	vibrato 8, 35
	dutycycle 2
	notetype 12, 199
	octave 3
	note G_, 1
	note A#, 1
	note B_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note __, 15
	note __, 16

Music_Routes3_branch_a01a:
	notetype 12, 199
	dutycycle 2
	octave 4
	note C_, 6
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 10
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 8
	note F_, 8
	notetype 12, 197
	dutycycle 3
	octave 3
	note A#, 8
	note A_, 8
	notetype 12, 199
	dutycycle 2
	octave 4
	note C_, 6
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 10
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 8
	note F_, 8
	notetype 12, 197
	dutycycle 3
	octave 3
	note A#, 8
	octave 4
	note D_, 6
	notetype 12, 199
	dutycycle 2
	note C_, 1
	note D_, 1
	note E_, 2
	note D_, 2
	note E_, 2
	note C_, 8
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 2
	octave 3
	note G_, 4
	octave 4
	note G_, 8
	note F_, 1
	note E_, 1
	notetype 8, 211
	note F_, 4
	note E_, 4
	notetype 8, 196
	note C_, 4
	notetype 8, 197
	note C_, 12
	notetype 12, 160
	dutycycle 3
	octave 3
	note A_, 8
	note B_, 8
	loopchannel 0, Music_Routes3_branch_a01a


Music_Routes3_Ch3: ; a07f (2:607f)
	vibrato 4, 16
	notetype 6, 18
	octave 4
	note G_, 2
	note A#, 2
	note B_, 8
	note A_, 8
	note G_, 2
	note __, 2
	note G_, 7
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 8
	note G_, 2
	note __, 2
	note G_, 7
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 8

Music_Routes3_branch_a0a3:
	notetype 12, 18
	note E_, 1
	note __, 1
	note G_, 4
	note E_, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 4
	note E_, 1
	note __, 1
	note G_, 4
	note E_, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 2
	note A_, 2
	note F_, 1
	note __, 1
	note A#, 4
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 4
	note F_, 1
	note __, 1
	note A#, 4
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 2
	note F_, 2
	note E_, 1
	note __, 1
	note G_, 4
	note E_, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 4
	note E_, 1
	note __, 1
	note G_, 4
	note E_, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 2
	note A_, 2
	note F_, 1
	note __, 1
	note A#, 4
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 4
	note F_, 1
	note __, 1
	note A#, 4
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 2
	note A_, 2
	note G_, 1
	note __, 1
	octave 5
	note C_, 4
	octave 4
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note C_, 4
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note D_, 4
	octave 4
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note D_, 4
	octave 4
	note F_, 1
	note __, 1
	octave 5
	note C_, 4
	octave 4
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 5
	note C_, 4
	octave 4
	note F_, 1
	note __, 1
	note A_, 4
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 4
	loopchannel 0, Music_Routes3_branch_a0a3


Music_Routes3_Ch4: ; a131 (2:6131)
	notetype 6
	togglenoise 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 8
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A#, 2
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A#, 2
	note A_, 4
	note A#, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1

Music_Routes3_branch_a17a:
	note A_, 12
	note A_, 2
	note A#, 2
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 8
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A#, 2
	note A_, 4
	note A_, 10
	note B_, 1
	note B_, 1
	note A_, 12
	note A_, 2
	note B_, 2
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 8
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 10
	note B_, 1
	note B_, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 8
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 10
	note B_, 1
	note B_, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 8
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 8
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 12
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	loopchannel 0, Music_Routes3_branch_a17a
; 0xa26a