Music_MuseumGuy::
	musicheader 4, 1, Music_MuseumGuy_Ch0
	musicheader 1, 2, Music_MuseumGuy_Ch1
	musicheader 1, 3, Music_MuseumGuy_Ch2
	musicheader 1, 4, Music_MuseumGuy_Ch3

Music_MuseumGuy_Ch0::
	tempo 128
	volume $77
	dutycycle 2
	;toggleperfectpitch
	notetype 12, $b1
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	octave 2
	note B_, 4
	note B_, 1
	octave 3
	note D#, 1
	note E_, 1
	note G#, 1
	note B_, 10
	callchannel Music_MuseumGuy_branch_ade7
	callchannel Music_MuseumGuy_branch_adec
	callchannel Music_MuseumGuy_branch_ade7
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 6

Music_MuseumGuy_branch_add6::
	callchannel Music_MuseumGuy_branch_ade7
	callchannel Music_MuseumGuy_branch_adec
	callchannel Music_MuseumGuy_branch_ade7
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 6
	loopchannel 0, Music_MuseumGuy_branch_add6

Music_MuseumGuy_branch_ade7::
	note E_, 2
	note E_, 6
	note F#, 2
	note F#, 6
	endchannel

Music_MuseumGuy_branch_adec::
	note E_, 2
	note E_, 6
	note D_, 2
	note D_, 6
	endchannel


Music_MuseumGuy_Ch1::
	dutycycle 2
	notetype 12, $c1
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note E_, 4
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 8
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	note A_, 4
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A_, 4

Music_MuseumGuy_branch_ae26::
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 3
	notetype 12, $81
	note E_, 1
	notetype 12, $c1
	note D_, 2
	note F#, 2
	note A_, 3
	notetype 12, $91
	note A_, 1
	notetype 12, $c1
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note B_, 3
	notetype 12, $a1
	note G#, 1
	notetype 12, $c1
	note A_, 2
	octave 4
	note C#, 2
	note E_, 3
	notetype 12, $91
	note E_, 1
	notetype 12, $c1
	note D_, 2
	note F#, 2
	note A_, 3
	notetype 12, $81
	note A_, 1
	notetype 12, $c1
	note G#, 2
	note E_, 1
	notetype 12, $81
	note E_, 1
	notetype 12, $c1
	note F#, 2
	notetype 12, $81
	note F#, 1
	notetype 12, $c1
	note G#, 1
	note A_, 2
	note A_, 2
	note A_, 4
	loopchannel 0, Music_MuseumGuy_branch_ae26


Music_MuseumGuy_Ch2::
	notetype 12, $10
	note __, 16
	octave 4
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 9
	callchannel Music_MuseumGuy_branch_aeb8
	note A_, 1
	note __, 1
	note A_, 1
	note __, 5
	note G#, 1
	note __, 1
	note G#, 1
	note __, 5
	callchannel Music_MuseumGuy_branch_aeb8
	note B_, 1
	note __, 3
	note G#, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3

Music_MuseumGuy_branch_ae8e::
	callchannel Music_MuseumGuy_branch_aec1
	note __, 3
	octave 6
	note E_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	callchannel Music_MuseumGuy_branch_aec1
	note __, 1
	octave 6
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	loopchannel 0, Music_MuseumGuy_branch_ae8e

Music_MuseumGuy_branch_aeb8::
	note A_, 1
	note __, 1
	note A_, 1
	note __, 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 5
	endchannel

Music_MuseumGuy_branch_aec1::
	octave 6
	note C#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	octave 6
	note F#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	endchannel


Music_MuseumGuy_Ch3::
	togglenoise 1
	notetype 12
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 14
	notetype 6
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1

Music_MuseumGuy_branch_aee1::
	note A_, 4
	note A_, 6
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note B_, 1
	note B_, 1
	note A_, 6
	note B_, 1
	note B_, 1
	note A_, 4
	note A_, 6
	note A_, 2
	note A#, 1
	note A#, 1
	note A_, 2
	note A_, 2
	note A_, 2
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 6
	note A_, 2
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note A_, 2
	note A#, 1
	note A#, 1
	note A_, 2
	note A_, 4
	note A_, 4
	note A_, 2
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 6
	note B_, 1
	note B_, 1
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	loopchannel 0, Music_MuseumGuy_branch_aee1
