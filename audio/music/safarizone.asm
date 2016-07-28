Music_SafariZone_Ch0::
	tempo 132
	volume 7, 7
	vibrato 6, 3, 4
	toggleperfectpitch
	duty 2
	notetype 12, 9, 2
	octave 3
	pitchbend 0, 73
	C_ 1
	pitchbend 0, 73
	G_ 1
	pitchbend 0, 73
	C_ 1
	pitchbend 0, 73
	G_ 1
	rest 4
	duty 3

Music_SafariZone_branch_bc4f::
	callchannel Music_SafariZone_branch_bc5f
	notetype 12, 10, 4
	F# 4
	callchannel Music_SafariZone_branch_bc5f
	notetype 12, 10, 4
	F# 4
	loopchannel 0, Music_SafariZone_branch_bc4f

Music_SafariZone_branch_bc5f::
	notetype 12, 10, 2
	octave 3
	C_ 4
	G_ 4
	C_ 4
	G_ 4
	C_ 4
	G_ 4
	C_ 4
	endchannel


Music_SafariZone_Ch1::
	duty 2
	vibrato 8, 2, 5
	notetype 12, 10, 2
	octave 4
	G_ 1
	D_ 1
	G_ 1
	D_ 1
	rest 4
	duty 3

Music_SafariZone_branch_bc79::
	callchannel Music_SafariZone_branch_bc89
	notetype 12, 11, 5
	A_ 4
	callchannel Music_SafariZone_branch_bc89
	notetype 12, 11, 5
	B_ 4
	loopchannel 0, Music_SafariZone_branch_bc79

Music_SafariZone_branch_bc89::
	notetype 12, 11, 2
	octave 3
	G_ 4
	D_ 4
	G_ 4
	D_ 4
	G_ 4
	D_ 4
	G_ 4
	endchannel


Music_SafariZone_Ch2::
	notetype 12, 1, 0
	rest 8

Music_SafariZone_branch_bc97::
	callchannel Music_SafariZone_branch_bca5
	octave 4
	A_ 4
	callchannel Music_SafariZone_branch_bca5
	octave 4
	B_ 4
	loopchannel 0, Music_SafariZone_branch_bc97

Music_SafariZone_branch_bca5::
	octave 3
	A_ 2
	rest 2
	octave 4
	D_ 2
	rest 2
	octave 3
	A_ 2
	rest 2
	octave 4
	D_ 2
	rest 2
	octave 3
	A_ 2
	rest 2
	octave 4
	D_ 2
	rest 2
	octave 3
	A_ 2
	rest 2
	endchannel
