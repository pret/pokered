Music_MeetFemaleTrainer_Ch1: ; 7f6f9 (1f:76f9)
	tempo 0, 124
	stereopanning 119
	duty 1
	togglecall
	notetype 12, 11, 2
	octave 3
	note G#, 6
	octave 4
	note E_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	notetype 12, 8, 1

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
	duty 2
	notetype 12, 12, 2
	octave 3
	note B_, 2
	notetype 12, 12, 7
	octave 4
	note B_, 12

Music_MeetFemaleTrainer_branch_7f726:
	notetype 12, 12, 2
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
	notetype 12, 1, 0
	rest 8
	octave 5
	note C#, 1
	rest 1
	octave 4
	note B_, 1
	rest 1
	note A_, 1
	rest 1

Music_MeetFemaleTrainer_branch_7f756:
	callchannel Music_MeetFemaleTrainer_branch_7f770
	note G#, 1
	rest 3
	note E_, 1
	rest 3
	note G#, 1
	rest 3
	note E_, 1
	rest 3
	callchannel Music_MeetFemaleTrainer_branch_7f770
	note G#, 1
	rest 3
	note E_, 1
	rest 3
	note G#, 1
	rest 3
	note B_, 1
	rest 3
	loopchannel 0, Music_MeetFemaleTrainer_branch_7f756

Music_MeetFemaleTrainer_branch_7f770:
	note G#, 1
	rest 3
	note E_, 1
	rest 3
	note G#, 1
	rest 3
	note E_, 1
	rest 1
	note F#, 1
	rest 1
	endchannel
; 0x7f77b