Music_SafariZone::
	musicheader 3, 1, Music_SafariZone_Ch0
	musicheader 1, 2, Music_SafariZone_Ch1
	musicheader 1, 3, Music_SafariZone_Ch2

Music_SafariZone_Ch0::
	tempo 132
	volume $77
	vibrato 6, $34
	;toggleperfectpitch
	dutycycle 2
	notetype 12, $92
	octave 3
	slidepitchto 1, 4, G#
	note C_, 1
	slidepitchto 1, 4, G#
	note G_, 1
	slidepitchto 1, 4, G#
	note C_, 1
	slidepitchto 1, 4, G#
	note G_, 1
	note __, 4
	dutycycle 3

Music_SafariZone_branch_bc4f::
	callchannel Music_SafariZone_branch_bc5f
	notetype 12, $a4
	note F#, 4
	callchannel Music_SafariZone_branch_bc5f
	notetype 12, $a4
	note F#, 4
	loopchannel 0, Music_SafariZone_branch_bc4f

Music_SafariZone_branch_bc5f::
	notetype 12, $a2
	octave 3
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	endchannel


Music_SafariZone_Ch1::
	dutycycle 2
	vibrato 8, $25
	notetype 12, $a2
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note __, 4
	dutycycle 3

Music_SafariZone_branch_bc79::
	callchannel Music_SafariZone_branch_bc89
	notetype 12, $b5
	note A_, 4
	callchannel Music_SafariZone_branch_bc89
	notetype 12, $b5
	note B_, 4
	loopchannel 0, Music_SafariZone_branch_bc79

Music_SafariZone_branch_bc89::
	notetype 12, $b2
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	endchannel


Music_SafariZone_Ch2::
	notetype 12, $10
	note __, 8

Music_SafariZone_branch_bc97::
	callchannel Music_SafariZone_branch_bca5
	octave 4
	note A_, 4
	callchannel Music_SafariZone_branch_bca5
	octave 4
	note B_, 4
	loopchannel 0, Music_SafariZone_branch_bc97

Music_SafariZone_branch_bca5::
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	endchannel
