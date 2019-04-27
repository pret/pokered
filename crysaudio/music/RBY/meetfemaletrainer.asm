Music_MeetFemaleTrainer::
	musicheader 3, 1, Music_MeetFemaleTrainer_Ch0
	musicheader 1, 2, Music_MeetFemaleTrainer_Ch1
	musicheader 1, 3, Music_MeetFemaleTrainer_Ch2

Music_MeetFemaleTrainer_Ch0::
	tempo 124
	volume $77
	dutycycle 1
	;toggleperfectpitch
	notetype 12, $b2
	octave 3
	note G#, 6
	octave 4
	note E_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	notetype 12, $81

Music_MeetFemaleTrainer_branch_7f70c::
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


Music_MeetFemaleTrainer_Ch1::
	dutycycle 2
	notetype 12, $c2
	octave 3
	note B_, 2
	notetype 12, $c7
	octave 4
	note B_, 12

Music_MeetFemaleTrainer_branch_7f726::
	notetype 12, $c2
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


Music_MeetFemaleTrainer_Ch2::
	notetype 12, $10
	note __, 8
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1

Music_MeetFemaleTrainer_branch_7f756::
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

Music_MeetFemaleTrainer_branch_7f770::
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
