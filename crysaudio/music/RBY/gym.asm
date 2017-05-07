Music_RBYGym:
	dbw $80, Music_RBYGym_Ch1
	dbw $01, Music_RBYGym_Ch2
	dbw $02, Music_RBYGym_Ch3

Music_RBYGym_Ch1: ; bcbb (2:7cbb)
	tempo 138
	volume 119
	dutycycle 3
	vibrato 8, 34
	
	notetype 12, 181
	octave 3
	note G_, 6
	note C_, 1
	note G_, 1
	note F_, 6
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note E_, 6
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note F_, 4
	note G_, 4

Music_RBYGym_branch_bcd8:
	note E_, 4
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	notetype 12, 177
	note D_, 3
	notetype 12, 181
	note E_, 1
	note F_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 4
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D_, 1
	note E_, 1
	note F_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	notetype 12, 177
	note A#, 3
	notetype 12, 181
	note F_, 1
	note F_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note D_, 1
	note E_, 1
	note F_, 4
	note A#, 2
	note F_, 1
	note A#, 1
	octave 4
	note D_, 4
	octave 3
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note C_, 1
	note D_, 1
	note E_, 4
	note C_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note C_, 1
	note E_, 1
	note F_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note C_, 1
	note D_, 1
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 2
	note F_, 2
	note G_, 2
	note E_, 1
	note G_, 1
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	loopchannel 0, Music_RBYGym_branch_bcd8


Music_RBYGym_Ch2: ; bd6b (2:7d6b)
	dutycycle 3
	vibrato 10, 37
	notetype 12, 199
	octave 4
	note C_, 6
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 6
	note F_, 1
	note A#, 1
	notetype 12, 160
	note A_, 12
	notetype 12, 199
	note B_, 4

Music_RBYGym_branch_bd82:
	octave 4
	note C_, 12
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	notetype 12, 194
	note D_, 3
	octave 3
	note A#, 1
	notetype 12, 199
	note A#, 12
	octave 4
	note C_, 12
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	notetype 12, 196
	octave 3
	note A#, 2
	notetype 12, 199
	note A#, 1
	octave 4
	note C_, 1
	note D_, 12
	note E_, 12
	note D_, 2
	note E_, 2
	notetype 12, 194
	note F_, 3
	note D_, 1
	notetype 12, 199
	note D_, 4
	notetype 12, 194
	note A#, 3
	note F_, 1
	notetype 12, 199
	note F_, 4
	note E_, 12
	note D_, 2
	note E_, 2
	note F_, 2
	note D_, 1
	note F_, 1
	note A#, 12
	octave 3
	note G_, 6
	octave 4
	note C_, 6
	octave 3
	note G_, 4
	note A#, 4
	note A_, 4
	note G_, 4
	note F_, 4
	notetype 12, 195
	note E_, 2
	notetype 12, 199
	note E_, 1
	note F_, 1
	note G_, 6
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A#, 4
	note A_, 4
	note G_, 4
	note C_, 2
	note D_, 2
	note G_, 6
	octave 4
	note C_, 6
	octave 3
	note G_, 4
	note A#, 4
	note A_, 4
	note G_, 4
	note F_, 4
	notetype 12, 195
	note E_, 2
	notetype 12, 199
	note E_, 1
	note F_, 1
	note G_, 4
	notetype 12, 195
	note G_, 2
	notetype 12, 199
	note G_, 1
	note A_, 1
	note A#, 4
	notetype 12, 196
	octave 4
	note C_, 2
	notetype 12, 199
	note C_, 1
	note D_, 1
	note E_, 12
	loopchannel 0, Music_RBYGym_branch_bd82


Music_RBYGym_Ch3: ; bdfa (2:7dfa)
	notetype 12, 17
	note __, 16
	note __, 10
	octave 4
	note G_, 2
	note F_, 2
	note D_, 2

Music_RBYGym_branch_be02:
	callchannel Music_RBYGym_branch_be3b
	callchannel Music_RBYGym_branch_be44
	callchannel Music_RBYGym_branch_be3b
	callchannel Music_RBYGym_branch_be44
	callchannel Music_RBYGym_branch_be3b
	callchannel Music_RBYGym_branch_be44
	callchannel Music_RBYGym_branch_be3b
	callchannel Music_RBYGym_branch_be44
	callchannel Music_RBYGym_branch_be3b
	callchannel Music_RBYGym_branch_be4d
	callchannel Music_RBYGym_branch_be3b
	callchannel Music_RBYGym_branch_be4d
	callchannel Music_RBYGym_branch_be3b
	callchannel Music_RBYGym_branch_be4d
	callchannel Music_RBYGym_branch_be3b
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note F_, 2
	loopchannel 0, Music_RBYGym_branch_be02

Music_RBYGym_branch_be3b:
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	endchannel

Music_RBYGym_branch_be44:
	note D_, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	note F_, 2
	endchannel

Music_RBYGym_branch_be4d:
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	endchannel
; 0xbe56