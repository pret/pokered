Music_Lavender::
	musicheader 4, 1, Music_Lavender_Ch0
	musicheader 1, 2, Music_Lavender_Ch1
	musicheader 1, 3, Music_Lavender_Ch2
	musicheader 1, 4, Music_Lavender_Ch3

Music_Lavender_Ch0::
	tempo 152
	volume $77
	dutycycle 1
	;toggleperfectpitch
	vibrato 0, $88
	notetype 12, $87
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype 12, $a7

Music_Lavender_branch_bb6b::
	octave 3
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note C#, 8
	note C#, 8
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note C_, 8
	note C_, 8
	octave 3
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note C#, 8
	note C#, 8
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note C_, 8
	note C_, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_Lavender_branch_bb6b


Music_Lavender_Ch1::
	vibrato 0, $34
	dutycycle 3
	notetype 12, $91

Music_Lavender_branch_bba5::
	octave 5
	note C_, 4
	note G_, 4
	note B_, 4
	note F#, 4
	loopchannel 0, Music_Lavender_branch_bba5


Music_Lavender_Ch2::
	vibrato 4, $11
	notetype 12, $3f
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype 12, $2f
	load_wave 2, 1, 14, 2, 3, 3, 2, 8, 14, 1, 2, 2, 15, 15, 14, 10, 1, 0, 1, 4, 13, 12, 1, 0, 14, 3, 4, 1, 5, 1, 7, 3

Music_Lavender_branch_bbb9::
	octave 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	notetype 12, $3f
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	notetype 12, $2f
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note E_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	notetype 12, $2f
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note E_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	loopchannel 0, Music_Lavender_branch_bbb9


Music_Lavender_Ch3::
	togglenoise 0
	notetype 12
	note __, 16
	note __, 16
	note __, 16
	note __, 16

Music_Lavender_branch_bc26::
	note F#, 8
	note F#, 8
	loopchannel 0, Music_Lavender_branch_bc26
