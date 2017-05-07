Music_RBYHallOfFame:
	dbw $80, Music_RBYHallOfFame_Ch1
	dbw $01, Music_RBYHallOfFame_Ch2
	dbw $02, Music_RBYHallOfFame_Ch3

Music_RBYHallOfFame_Ch1: ; 7fbaf (1f:7baf)
	tempo 112
	volume 119
	dutycycle 3
	vibrato 12, 34
	
	notetype 12, 179
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1

Music_RBYHallOfFame_branch_7fbc5:
	notetype 12, 128
	octave 4
	note C_, 16
	note E_, 16
	note F#, 16
	notetype 12, 96
	note F_, 16
	loopchannel 3, Music_RBYHallOfFame_branch_7fbc5
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_RBYHallOfFame_branch_7fbc5


Music_RBYHallOfFame_Ch2: ; 7fbda (1f:7bda)
	vibrato 8, 37
	dutycycle 3

Music_RBYHallOfFame_branch_7fbdf:
	notetype 12, 196
	octave 3
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note G_, 2
	note D_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note F_, 2
	note C_, 2
	note F_, 2
	note A#, 4
	note A_, 4
	note F_, 2
	loopchannel 0, Music_RBYHallOfFame_branch_7fbdf


Music_RBYHallOfFame_Ch3: ; 7fbfc (1f:7bfc)
	notetype 12, 18

Music_RBYHallOfFame_branch_7fbfe:
	octave 4
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	loopchannel 12, Music_RBYHallOfFame_branch_7fbfe
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F#, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	loopchannel 0, Music_RBYHallOfFame_Ch3
; 0x7fc1f