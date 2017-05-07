Music_ContestResults: ; efb3e
	dbw $c0, Music_ContestResults_Ch1
	dbw $01, Music_ContestResults_Ch2
	dbw $02, Music_ContestResults_Ch3
	dbw $03, Music_ContestResults_Ch4
; efb4a

Music_ContestResults_Ch1: ; efb4a
	tempo 144
	volume $77
	notetype $c, $51
Music_ContestResults_branch_efb52: ; efb52
	note __, 2
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note __, 2
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note __, 2
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note __, 2
	note B_, 1
	note __, 3
	note A#, 1
	note __, 3
	note A_, 1
	note __, 3
	note G_, 1
	note __, 1
	loopchannel 0, Music_ContestResults_branch_efb52
; efb7b

Music_ContestResults_Ch2: ; efb7b
	notetype $c, $61
Music_ContestResults_branch_efb7e: ; efb7e
	octave 2
	note C_, 2
	octave 3
	note E_, 1
	note __, 1
	octave 1
	note G_, 2
	octave 3
	note E_, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note E_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note D_, 2
	octave 3
	note F_, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note F_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note C#, 2
	octave 3
	note F_, 1
	note __, 1
Music_ContestResults_branch_efba6: ; efba6
	octave 2
	note D_, 2
	octave 3
	note F_, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note F_, 1
	note __, 1
	loopchannel 2, Music_ContestResults_branch_efba6
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note D_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note G_, 2
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note D_, 2
	octave 3
	note D_, 1
	note __, 1
	loopchannel 0, Music_ContestResults_branch_efb7e
; efbcc

Music_ContestResults_Ch3: ; efbcc
	vibrato $8, $24
	notetype $c, $23
Music_ContestResults_branch_efbd2: ; efbd2
	octave 4
	note E_, 5
	note __, 1
	note E_, 1
	note F_, 1
	note G_, 4
	octave 5
	note C_, 4
	octave 4
	note B_, 8
	note A_, 8
	note D_, 5
	note __, 1
	note D_, 1
	note E_, 1
	note F_, 4
	note B_, 4
	note A_, 8
	note G_, 8
	loopchannel 0, Music_ContestResults_branch_efbd2
; efbe9

Music_ContestResults_Ch4: ; efbe9
	togglenoise $4
	notetype $6
Music_ContestResults_branch_efbed: ; efbed
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 4
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	loopchannel 0, Music_ContestResults_branch_efbed
; efc01


