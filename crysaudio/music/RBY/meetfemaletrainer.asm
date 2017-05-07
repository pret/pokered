Music_MeetFemaleTrainer:
	dbw $80, Music_MeetFemaleTrainer_Ch1
	dbw $01, Music_MeetFemaleTrainer_Ch2
	dbw $02, Music_MeetFemaleTrainer_Ch3

Music_MeetFemaleTrainer_Ch1: ; 7f6f9 (1f:76f9)
	tempo 124
	volume 119
	dutycycle 1
	
	notetype 12, 178
	octave 3
	note G#, 6
	octave 4
	note E_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	notetype 12, 129

Music_MeetFemaleTrainer_branch_7f70c:
	octave 3
	note E_, 4
	loopchannel 12, Music_MeetFemaleTrainer_branch_7f70c
	note E_, 4
	octave 2
	note B_, 4
	note B_, 4
	octave 3
	note E_, 4
	loopchannel 0, Music_MeetFemaleTrainer_branch_7f70c


Music_MeetFemaleTrainer_Ch2: ; 7f71c (1f:771c)
	dutycycle 2
	notetype 12, 194
	octave 3
	note B_, 2
	notetype 12, 199
	octave 4
	note B_, 12

Music_MeetFemaleTrainer_branch_7f726:
	notetype 12, 194
	octave 3
	note B_, 4
	octave 4
	note D#, 4
	note E_, 4
	note D#, 4
	note C#, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	note A_, 4
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	loopchannel 0, Music_MeetFemaleTrainer_branch_7f726


Music_MeetFemaleTrainer_Ch3: ; 7f74b (1f:774b)
	notetype 12, 16
	note __, 8
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1

Music_MeetFemaleTrainer_branch_7f756:
	callchannel Music_MeetFemaleTrainer_branch_7f770
	note G#, 1
	note __, 3
	note E_, 1
	note __, 3
	note G#, 1
	note __, 3
	note E_, 1
	note __, 3
	callchannel Music_MeetFemaleTrainer_branch_7f770
	note G#, 1
	note __, 3
	note E_, 1
	note __, 3
	note G#, 1
	note __, 3
	note B_, 1
	note __, 3
	loopchannel 0, Music_MeetFemaleTrainer_branch_7f756

Music_MeetFemaleTrainer_branch_7f770:
	note G#, 1
	note __, 3
	note E_, 1
	note __, 3
	note G#, 1
	note __, 3
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	endchannel
; 0x7f77b