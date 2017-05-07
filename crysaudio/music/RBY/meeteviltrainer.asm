Music_MeetEvilTrainer:
	dbw $80, Music_MeetEvilTrainer_Ch1
	dbw $01, Music_MeetEvilTrainer_Ch2
	dbw $02, Music_MeetEvilTrainer_Ch3

Music_MeetEvilTrainer_Ch1: ; 7f69d (1f:769d)
	tempo 124
	volume 119
	dutycycle 2
	
	notetype 12, 177
	note __, 4
	octave 3
	note D_, 2
	note C#, 2
	notetype 12, 79
	note D_, 4

Music_MeetEvilTrainer_branch_7f6ae:
	notetype 12, 161
	note D_, 4
	note D_, 4
	note D_, 4
	notetype 12, 112
	note D_, 4
	loopchannel 0, Music_MeetEvilTrainer_branch_7f6ae


Music_MeetEvilTrainer_Ch2: ; 7f6ba (1f:76ba)
	dutycycle 1
	notetype 12, 182
	octave 3
	note B_, 2
	note A#, 2
	note B_, 8

Music_MeetEvilTrainer_branch_7f6c2:
	notetype 12, 194
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
	notetype 12, 79
	note A#, 4
	notetype 12, 194
	note G_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	notetype 12, 63
	note A#, 4
	notetype 12, 194
	loopchannel 0, Music_MeetEvilTrainer_branch_7f6c2


Music_MeetEvilTrainer_Ch3: ; 7f6e6 (1f:76e6)
	notetype 12, 16
	note __, 8
	octave 4
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1

Music_MeetEvilTrainer_branch_7f6ee:
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	note A#, 4
	loopchannel 0, Music_MeetEvilTrainer_branch_7f6ee
; 0x7f6f9