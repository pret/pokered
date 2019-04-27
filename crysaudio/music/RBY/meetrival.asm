Music_MeetRival::
	musicheader 3, 1, Music_MeetRival_Ch0
	musicheader 1, 2, Music_MeetRival_Ch1
	musicheader 1, 3, Music_MeetRival_Ch2

Music_FarewellRival:
	musicheader 3, 1, Music_MeetRival_branch_b1a2
	musicheader 1, 2, Music_MeetRival_branch_b21d
	musicheader 1, 3, Music_MeetRival_branch_b2b5

Music_MeetRival_branch_b119::
	tempo 100
	loopchannel 0, Music_MeetRival_branch_b123

Music_MeetRival_Ch0::
	tempo 112

Music_MeetRival_branch_b123::
	volume $77
	dutycycle 3
	vibrato 6, $34
	;toggleperfectpitch
	notetype 12, $b3
	octave 4
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 2
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 6
	note D_, 1
	note __, 3
	note D_, 1
	note __, 5
	note A_, 2
	note G_, 2
	note A_, 2

Music_MeetRival_branch_b140::
	note B_, 4
	note A#, 2
	note A_, 4
	note G_, 2
	octave 4
	note C_, 4
	note D_, 2
	note __, 4
	note D_, 4
	note C#, 2
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 4
	note E_, 2
	note D_, 4
	note C_, 2
	octave 3
	note B_, 4
	octave 4
	note C_, 2
	note __, 4
	note G_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note F#, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note D_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 2
	note A#, 2
	note B_, 2
	octave 4
	note C_, 2
	note F_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note __, 4
	note A#, 4
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	notetype 12, $b7
	octave 3
	note G_, 4
	note D_, 2
	note F_, 6
	note F#, 4
	note D_, 2
	note __, 4
	note D_, 4
	notetype 12, $b3
	note A_, 2
	note G_, 2
	note A_, 2
	loopchannel 0, Music_MeetRival_branch_b140

Music_MeetRival_branch_b19b::
	tempo 100
	loopchannel 0, Music_MeetRival_branch_b1a5

Music_MeetRival_branch_b1a2::
	tempo 112

Music_MeetRival_branch_b1a5::
	volume $77
	dutycycle 3
	vibrato 6, $34
	;toggleperfectpitch
	notetype 12, $b3
	octave 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 5
	note A_, 2
	note G_, 2
	note A_, 2
	loopchannel 0, Music_MeetRival_branch_b140


Music_MeetRival_Ch1::
	dutycycle 3
	vibrato 10, $26
	notetype 12, $c7
	octave 4
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 2
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 6
	octave 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note D_, 1
	note __, 1
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2

Music_MeetRival_branch_b1d8::
	notetype 12, $c7
	note G_, 4
	note D_, 2
	note F_, 6
	note F#, 4
	note G_, 2
	note __, 4
	note G_, 4
	note G_, 2
	note A#, 2
	note B_, 2
	octave 5
	note C_, 4
	octave 4
	note G_, 2
	note A#, 6
	note B_, 4
	octave 5
	note C_, 2
	note __, 4
	note C_, 4
	note C_, 2
	octave 4
	note B_, 2
	octave 5
	note C_, 2
	notetype 12, $b0
	note D_, 16
	notetype 12, $b5
	note D_, 6
	notetype 12, $c7
	note F_, 4
	note D_, 2
	note C_, 2
	note D_, 2
	notetype 12, $b0
	note C_, 8
	notetype 12, $c7
	note C_, 8
	octave 4
	note C_, 2
	note __, 4
	note A#, 4
	note G_, 2
	note F_, 2
	notetype 12, $b0
	note G_, 16
	notetype 12, $b3
	note G_, 2
	octave 3
	note G_, 2
	note __, 4
	note G_, 4
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
	loopchannel 0, Music_MeetRival_branch_b1d8

Music_MeetRival_branch_b21d::
	dutycycle 3
	vibrato 10, $26
	notetype 12, $c7
	octave 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note D_, 1
	note __, 1
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
	loopchannel 0, Music_MeetRival_branch_b1d8


Music_MeetRival_Ch2::
	notetype 12, $14
	octave 5
	note D_, 2
	note __, 2
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 4
	note B_, 2
	note __, 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1

Music_MeetRival_branch_b24b::
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	note __, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	note __, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	note __, 4
	octave 5
	note D_, 4
	octave 4
	note G_, 2
	note A#, 2
	note B_, 2
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note __, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note __, 2
	note B_, 2
	octave 5
	note C_, 2
	note __, 4
	note C_, 4
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note __, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note __, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note __, 2
	note F#, 2
	note A_, 2
	note F#, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 5
	note C_, 2
	note __, 2
	octave 4
	note E_, 2
	octave 5
	note C_, 2
	octave 4
	note E_, 2
	note F_, 2
	note G_, 2
	note E_, 2
	note __, 4
	note E_, 2
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note __, 2
	note G_, 2
	note A#, 2
	note G_, 2
	note __, 2
	note A#, 2
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	note __, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	note __, 2
	octave 5
	note D_, 2
	loopchannel 0, Music_MeetRival_branch_b24b

Music_MeetRival_branch_b2b5::
	notetype 12, $14
	octave 4
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	loopchannel 0, Music_MeetRival_branch_b24b
