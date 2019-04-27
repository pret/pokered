Music_RBYIndigoPlateau::
	musicheader 4, 1, Music_RBYIndigoPlateau_Ch0
	musicheader 1, 2, Music_RBYIndigoPlateau_Ch1
	musicheader 1, 3, Music_RBYIndigoPlateau_Ch2
	musicheader 1, 4, Music_RBYIndigoPlateau_Ch3

Music_RBYIndigoPlateau_Ch0::
	tempo 132
	volume $77
	dutycycle 3
	vibrato 6, $34
	;toggleperfectpitch
	notetype 12, $b2
	octave 2
	note A_, 8
	note A_, 8
	note A_, 8
	note A_, 4
	notetype 12, $a4
	note A#, 4

Music_RBYIndigoPlateau_branch_a605::
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, $b4
	octave 3
	note D_, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, $b4
	octave 3
	note D#, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, $b4
	octave 3
	note D_, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, $a0
	octave 2
	note A#, 4
	callchannel Music_RBYIndigoPlateau_branch_a659
	notetype 12, $b4
	octave 3
	note D_, 4
	notetype 12, $d4
	octave 3
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	notetype 12, $b4
	octave 3
	note D#, 4
	notetype 12, $d4
	octave 3
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	notetype 12, $b4
	octave 3
	note F_, 2
	notetype 12, $b4
	octave 3
	note G_, 2
	notetype 12, $b0
	note A_, 8
	octave 2
	note A_, 8
	notetype 12, $b7
	octave 3
	note F_, 8
	notetype 12, $4e
	octave 2
	note A#, 8
	loopchannel 0, Music_RBYIndigoPlateau_branch_a605

Music_RBYIndigoPlateau_branch_a659::
	notetype 12, $b2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	endchannel


Music_RBYIndigoPlateau_Ch1::
	dutycycle 3
	vibrato 8, $25
	notetype 12, $c2
	octave 3
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 4
	notetype 12, $5a
	note D#, 4

Music_RBYIndigoPlateau_branch_a673::
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, $c5
	note A_, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, $c5
	note A#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, $c5
	note A_, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, $c7
	note C#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, $c5
	note A_, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, $c5
	note A#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6af
	notetype 12, $c5
	octave 4
	note C_, 2
	notetype 12, $c7
	octave 4
	note C#, 2
	note D_, 8
	octave 3
	note D_, 8
	octave 4
	note C_, 8
	notetype 12, $4d
	octave 4
	note D#, 8
	loopchannel 0, Music_RBYIndigoPlateau_branch_a673

Music_RBYIndigoPlateau_branch_a6af::
	notetype 12, $c2
	octave 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	endchannel


Music_RBYIndigoPlateau_Ch2::
	notetype 12, $10
	octave 4
	note D_, 2
	note __, 6
	note D_, 2
	note __, 6
	note D_, 2
	note __, 6
	note D_, 2
	note __, 2
	note D#, 4

Music_RBYIndigoPlateau_branch_a6c6::
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note F#, 4
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	callchannel Music_RBYIndigoPlateau_branch_a6fe
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 8
	note D_, 8
	note A#, 8
	note D#, 8
	loopchannel 0, Music_RBYIndigoPlateau_branch_a6c6

Music_RBYIndigoPlateau_branch_a6fe::
	octave 4
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note A_, 4
	endchannel


Music_RBYIndigoPlateau_Ch3::
	togglenoise 1
	notetype 6
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 8
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1

Music_RBYIndigoPlateau_branch_a728::
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a791
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	callchannel Music_RBYIndigoPlateau_branch_a77e
	callchannel Music_RBYIndigoPlateau_branch_a7a8
	note A_, 16
	note A_, 8
	note A#, 8
	note A_, 16
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	loopchannel 0, Music_RBYIndigoPlateau_branch_a728

Music_RBYIndigoPlateau_branch_a77e::
	note A_, 4
	note A#, 4
	note B_, 4
	note A#, 4
	note A_, 4
	note A#, 4
	note B_, 4
	note B_, 2
	note A#, 2
	endchannel

Music_RBYIndigoPlateau_branch_a791::
	note A_, 4
	note A#, 4
	note B_, 4
	note A#, 4
	note A_, 4
	note A#, 4
	note B_, 4
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	endchannel

Music_RBYIndigoPlateau_branch_a7a8::
	note A_, 4
	note A#, 4
	note A_, 4
	note A#, 4
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
	endchannel
