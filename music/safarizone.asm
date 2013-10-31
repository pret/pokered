Music_SafariZone_Ch1: ; bc2e (2:7c2e)
	tempo 0, 132
	stereopanning 119
	vibrato 6, 3, 4
	togglecall
	duty 2
	notetype 12, 9, 2
	octave 3
	pitchbend 0, 73
	note C_, 1
	pitchbend 0, 73
	note G_, 1
	pitchbend 0, 73
	note C_, 1
	pitchbend 0, 73
	note G_, 1
	rest 4
	duty 3

Music_SafariZone_branch_bc4f:
	callchannel Music_SafariZone_branch_bc5f
	notetype 12, 10, 4
	note F#, 4
	callchannel Music_SafariZone_branch_bc5f
	notetype 12, 10, 4
	note F#, 4
	loopchannel 0, Music_SafariZone_branch_bc4f

Music_SafariZone_branch_bc5f:
	notetype 12, 10, 2
	octave 3
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	endchannel


Music_SafariZone_Ch2: ; bc6a (2:7c6a)
	duty 2
	vibrato 8, 2, 5
	notetype 12, 10, 2
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	rest 4
	duty 3

Music_SafariZone_branch_bc79:
	callchannel Music_SafariZone_branch_bc89
	notetype 12, 11, 5
	note A_, 4
	callchannel Music_SafariZone_branch_bc89
	notetype 12, 11, 5
	note B_, 4
	loopchannel 0, Music_SafariZone_branch_bc79

Music_SafariZone_branch_bc89:
	notetype 12, 11, 2
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	endchannel


Music_SafariZone_Ch3: ; bc94 (2:7c94)
	notetype 12, 1, 0
	rest 8

Music_SafariZone_branch_bc97:
	callchannel Music_SafariZone_branch_bca5
	octave 4
	note A_, 4
	callchannel Music_SafariZone_branch_bca5
	octave 4
	note B_, 4
	loopchannel 0, Music_SafariZone_branch_bc97

Music_SafariZone_branch_bca5:
	octave 3
	note A_, 2
	rest 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	endchannel
; 0xbcbb