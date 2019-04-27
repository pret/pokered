Music_MeetEvilTrainer::
	musicheader 3, 1, Music_MeetEvilTrainer_Ch0
	musicheader 1, 2, Music_MeetEvilTrainer_Ch1
	musicheader 1, 3, Music_MeetEvilTrainer_Ch2

Music_MeetEvilTrainer_Ch0::
	tempo 124
	volume $77
	dutycycle 2
	;toggleperfectpitch
	notetype 12, $b1
	note __, 4
	octave 3
	note D_, 2
	note C#, 2
	notetype 12, $4f
	note D_, 4

Music_MeetEvilTrainer_branch_7f6ae::
	notetype 12, $a1
	note D_, 4
	note D_, 4
	note D_, 4
	notetype 12, $70
	note D_, 4
	loopchannel 0, Music_MeetEvilTrainer_branch_7f6ae


Music_MeetEvilTrainer_Ch1::
	dutycycle 1
	notetype 12, $b6
	octave 3
	note B_, 2
	note A#, 2
	note B_, 8

Music_MeetEvilTrainer_branch_7f6c2::
	notetype 12, $c2
	octave 4
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 3
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	notetype 12, $4f
	note A#, 4
	notetype 12, $c2
	note G_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	notetype 12, $3f
	note A#, 4
	notetype 12, $c2
	loopchannel 0, Music_MeetEvilTrainer_branch_7f6c2


Music_MeetEvilTrainer_Ch2::
	notetype 12, $10
	note __, 8
	octave 4
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1

Music_MeetEvilTrainer_branch_7f6ee::
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	note A#, 4
	loopchannel 0, Music_MeetEvilTrainer_branch_7f6ee
