Music_PkmnHealed::
	musicheader 3, 1, Music_PkmnHealed_Ch0
	musicheader 1, 2, Music_PkmnHealed_Ch1
	musicheader 1, 3, Music_PkmnHealed_Ch2

Music_PkmnHealed_Ch0::
	tempo 144
	volume $77
	dutycycle 2
	;toggleperfectpitch
	notetype 12, $81
	note __, 2
	octave 3
	slidepitchto 1, 4, A#
	note B_, 2
	slidepitchto 1, 5, D#
	note B_, 2
	slidepitchto 1, 4, D#
	note E_, 2
	note __, 4
	slidepitchto 1, 3, A#
	note E_, 4
	slidepitchto 1, 4, A#
	note B_, 4
	endchannel


Music_PkmnHealed_Ch1::
	dutycycle 2
	notetype 12, $c3
	octave 4
	note B_, 4
	note B_, 4
	note B_, 2
	note G#, 2
	notetype 12, $c4
	octave 5
	note E_, 8
	endchannel


Music_PkmnHealed_Ch2::
	notetype 12, $10
	octave 4
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note E_, 6
	note __, 2
	endchannel
