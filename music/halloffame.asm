Music_HallOfFame_Ch1: ; 7fbaf (1f:7baf)
	tempo 0, 112
	stereopanning 119
	duty 3
	vibrato 12, 2, 2
	togglecall
	notetype 12, 11, 3
	rest 16
	rest 16
	rest 16
	rest 12
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1

Music_HallOfFame_branch_7fbc5:
	notetype 12, 8, 0
	octave 4
	note C_, 16
	note E_, 16
	note F#, 16
	notetype 12, 6, 0
	note F_, 16
	loopchannel 3, Music_HallOfFame_branch_7fbc5
	rest 16
	rest 16
	rest 16
	rest 16
	loopchannel 0, Music_HallOfFame_branch_7fbc5


Music_HallOfFame_Ch2: ; 7fbda (1f:7bda)
	vibrato 8, 2, 5
	duty 3

Music_HallOfFame_branch_7fbdf:
	notetype 12, 12, 4
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
	loopchannel 0, Music_HallOfFame_branch_7fbdf


Music_HallOfFame_Ch3: ; 7fbfc (1f:7bfc)
	notetype 12, 1, 2

Music_HallOfFame_branch_7fbfe:
	octave 4
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	loopchannel 12, Music_HallOfFame_branch_7fbfe
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
	loopchannel 0, Music_HallOfFame_Ch3
; 0x7fc1f