Music_MtMoonSquare:
	musicheader 2, 1, Music_MtMoonSquare_Ch1
	musicheader 1, 2, Music_MtMoonSquare_Ch2

Music_MtMoonSquare_Ch1:
	tempo 112
	volume $77
	dutycycle $2
	tone $0001
	note __, 1
Music_MtMoonSquare_branch_f4826:
	notetype $c, $44
Music_MtMoonSquare_branch_f4829:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	loopchannel 2, Music_MtMoonSquare_branch_f4829
Music_MtMoonSquare_branch_f4835:
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	loopchannel 2, Music_MtMoonSquare_branch_f4835
Music_MtMoonSquare_branch_f4841:
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	loopchannel 2, Music_MtMoonSquare_branch_f4841
Music_MtMoonSquare_branch_f484d:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	loopchannel 2, Music_MtMoonSquare_branch_f484d
	loopchannel 0, Music_MtMoonSquare_branch_f4826

Music_MtMoonSquare_Ch2:
	dutycycle $2
	vibrato $18, $24
Music_MtMoonSquare_branch_f4862:
	notetype $c, $82
Music_MtMoonSquare_branch_f4865:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f4865
	notetype $c, $82
Music_MtMoonSquare_branch_f4877:
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f4877
	notetype $c, $82
Music_MtMoonSquare_branch_f4889:
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f4889
	notetype $c, $82
Music_MtMoonSquare_branch_f489b:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f489b
	loopchannel 0, Music_MtMoonSquare_branch_f4862
