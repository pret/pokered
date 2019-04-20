Music_RuinsOfAlphInterior:
	musicheader 3, 1, Music_RuinsOfAlphInterior_Ch1
	musicheader 1, 2, Music_RuinsOfAlphInterior_Ch2
	musicheader 1, 3, Music_RuinsOfAlphInterior_Ch3

Music_RuinsOfAlphInterior_Ch1:
	tempo 224
	volume $77
	dutycycle $0
	stereopanning $f0
	notetype $c, $44
	note __, 1
	loopchannel 0, Music_RuinsOfAlphInterior_branch_ebdc2

Music_RuinsOfAlphInterior_Ch2:
	tone $0002
	dutycycle $0
	stereopanning $f
	notetype $c, $a4
Music_RuinsOfAlphInterior_branch_ebdc2:
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 2
	note D#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	loopchannel 0, Music_RuinsOfAlphInterior_branch_ebdc2

Music_RuinsOfAlphInterior_Ch3:
	notetype $c, $10
Music_RuinsOfAlphInterior_branch_ebdd7:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 2
	note __, 10
	loopchannel 0, Music_RuinsOfAlphInterior_branch_ebdd7
