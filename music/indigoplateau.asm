Music_IndigoPlateau_Ch1: ; a5f0 (2:65f0)
	tempo 0, 132
	stereopanning 119
	duty 3
	vibrato 6, 3, 4
	togglecall
	notetype 12, 11, 2
	octave 2
	note A_, 8
	note A_, 8
	note A_, 8
	note A_, 4
	notetype 12, 10, 4
	note A#, 4

Music_IndigoPlateau_branch_a605:
	callchannel Music_IndigoPlateau_branch_a659
	notetype 12, 11, 4
	octave 3
	note D_, 4
	callchannel Music_IndigoPlateau_branch_a659
	notetype 12, 11, 4
	octave 3
	note D#, 4
	callchannel Music_IndigoPlateau_branch_a659
	notetype 12, 11, 4
	octave 3
	note D_, 4
	callchannel Music_IndigoPlateau_branch_a659
	notetype 12, 10, 0
	octave 2
	note A#, 4
	callchannel Music_IndigoPlateau_branch_a659
	notetype 12, 11, 4
	octave 3
	note D_, 4
	notetype 12, 13, 4
	octave 3
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	notetype 12, 11, 4
	octave 3
	note D#, 4
	notetype 12, 13, 4
	octave 3
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	notetype 12, 11, 4
	octave 3
	note F_, 2
	notetype 12, 11, 4
	octave 3
	note G_, 2
	notetype 12, 11, 0
	note A_, 8
	octave 2
	note A_, 8
	notetype 12, 11, 7
	octave 3
	note F_, 8
	notetype 12, 4, 14
	octave 2
	note A#, 8
	loopchannel 0, Music_IndigoPlateau_branch_a605

Music_IndigoPlateau_branch_a659:
	notetype 12, 11, 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	endchannel


Music_IndigoPlateau_Ch2: ; a664 (2:6664)
	duty 3
	vibrato 8, 2, 5
	notetype 12, 12, 2
	octave 3
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 4
	notetype 12, 5, 10
	note D#, 4

Music_IndigoPlateau_branch_a673:
	callchannel Music_IndigoPlateau_branch_a6af
	notetype 12, 12, 5
	note A_, 4
	callchannel Music_IndigoPlateau_branch_a6af
	notetype 12, 12, 5
	note A#, 4
	callchannel Music_IndigoPlateau_branch_a6af
	notetype 12, 12, 5
	note A_, 4
	callchannel Music_IndigoPlateau_branch_a6af
	notetype 12, 12, 7
	note C#, 4
	callchannel Music_IndigoPlateau_branch_a6af
	notetype 12, 12, 5
	note A_, 4
	callchannel Music_IndigoPlateau_branch_a6af
	notetype 12, 12, 5
	note A#, 4
	callchannel Music_IndigoPlateau_branch_a6af
	notetype 12, 12, 5
	octave 4
	note C_, 2
	notetype 12, 12, 7
	octave 4
	note C#, 2
	note D_, 8
	octave 3
	note D_, 8
	octave 4
	note C_, 8
	notetype 12, 4, 13
	octave 4
	note D#, 8
	loopchannel 0, Music_IndigoPlateau_branch_a673

Music_IndigoPlateau_branch_a6af:
	notetype 12, 12, 2
	octave 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	endchannel


Music_IndigoPlateau_Ch3: ; a6ba (2:66ba)
	notetype 12, 1, 0
	octave 4
	note D_, 2
	rest 6
	note D_, 2
	rest 6
	note D_, 2
	rest 6
	note D_, 2
	rest 2
	note D#, 4

Music_IndigoPlateau_branch_a6c6:
	callchannel Music_IndigoPlateau_branch_a6fe
	callchannel Music_IndigoPlateau_branch_a6fe
	callchannel Music_IndigoPlateau_branch_a6fe
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note F#, 4
	callchannel Music_IndigoPlateau_branch_a6fe
	callchannel Music_IndigoPlateau_branch_a6fe
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A_, 8
	note D_, 8
	note A#, 8
	note D#, 8
	loopchannel 0, Music_IndigoPlateau_branch_a6c6

Music_IndigoPlateau_branch_a6fe:
	octave 4
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note A_, 4
	endchannel


Music_IndigoPlateau_Ch4: ; a70f (2:670f)
	dspeed 6
	dnote 16, mutedsnare2
	dnote 16, mutedsnare2
	dnote 16, mutedsnare2
	dnote 8, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3

Music_IndigoPlateau_branch_a728:
	callchannel Music_IndigoPlateau_branch_a791
	callchannel Music_IndigoPlateau_branch_a77e
	callchannel Music_IndigoPlateau_branch_a791
	callchannel Music_IndigoPlateau_branch_a7a8
	callchannel Music_IndigoPlateau_branch_a791
	callchannel Music_IndigoPlateau_branch_a77e
	callchannel Music_IndigoPlateau_branch_a791
	callchannel Music_IndigoPlateau_branch_a7a8
	callchannel Music_IndigoPlateau_branch_a791
	callchannel Music_IndigoPlateau_branch_a77e
	callchannel Music_IndigoPlateau_branch_a791
	callchannel Music_IndigoPlateau_branch_a7a8
	callchannel Music_IndigoPlateau_branch_a77e
	callchannel Music_IndigoPlateau_branch_a7a8
	dnote 16, mutedsnare2
	dnote 8, mutedsnare2
	dnote 8, mutedsnare3
	dnote 16, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 1, mutedsnare2
	dnote 1, mutedsnare2
	dnote 1, mutedsnare2
	dnote 1, mutedsnare2
	loopchannel 0, Music_IndigoPlateau_branch_a728

Music_IndigoPlateau_branch_a77e:
	dnote 4, mutedsnare2
	dnote 4, mutedsnare3
	dnote 4, mutedsnare4
	dnote 4, mutedsnare3
	dnote 4, mutedsnare2
	dnote 4, mutedsnare3
	dnote 4, mutedsnare4
	dnote 2, mutedsnare4
	dnote 2, mutedsnare3
	endchannel

Music_IndigoPlateau_branch_a791:
	dnote 4, mutedsnare2
	dnote 4, mutedsnare3
	dnote 4, mutedsnare4
	dnote 4, mutedsnare3
	dnote 4, mutedsnare2
	dnote 4, mutedsnare3
	dnote 4, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	endchannel

Music_IndigoPlateau_branch_a7a8:
	dnote 4, mutedsnare2
	dnote 4, mutedsnare3
	dnote 4, mutedsnare2
	dnote 4, mutedsnare3
	dnote 4, mutedsnare2
	dnote 4, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	endchannel
; 0xa7c5