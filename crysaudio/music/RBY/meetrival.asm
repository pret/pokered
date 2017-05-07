Music_MeetRival:
	dbw $80, Music_MeetRival_Ch1
	dbw $01, Music_MeetRival_Ch2
	dbw $02, Music_MeetRival_Ch3
Music_FarewellRival:
	dbw $80, Music_FarewellRival_Ch1
	dbw $01, Music_FarewellRival_Ch2
	dbw $02, Music_FarewellRival_Ch3

Music_MeetRival_branch_b119:
	tempo 100
	loopchannel 0, Music_MeetRival_branch_b123

Music_MeetRival_Ch1: ; b120 (2:7120)
	tempo 112

Music_MeetRival_branch_b123:
	volume 119
	dutycycle 3
	vibrato 6, 52
	
	notetype 12, 179
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

Music_MeetRival_branch_b140:
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
	notetype 12, 183
	octave 3
	note G_, 4
	note D_, 2
	note F_, 6
	note F#, 4
	note D_, 2
	note __, 4
	note D_, 4
	notetype 12, 179
	note A_, 2
	note G_, 2
	note A_, 2
	loopchannel 0, Music_MeetRival_branch_b140

Music_MeetRival_branch_b19b:
	tempo 100
	loopchannel 0, Music_MeetRival_branch_b1a5

Music_FarewellRival_Ch1:
	tempo 112

Music_MeetRival_branch_b1a5:
	volume 119
	dutycycle 3
	vibrato 6, 52
	
	notetype 12, 179
	octave 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 5
	note A_, 2
	note G_, 2
	note A_, 2
	loopchannel 0, Music_MeetRival_branch_b140


Music_MeetRival_Ch2: ; b1bb (2:71bb)
	dutycycle 3
	vibrato 10, 38
	notetype 12, 199
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

Music_MeetRival_branch_b1d8:
	notetype 12, 199
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
	notetype 12, 176
	note D_, 16
	notetype 12, 181
	note D_, 6
	notetype 12, 199
	note F_, 4
	note D_, 2
	note C_, 2
	note D_, 2
	notetype 12, 176
	note C_, 8
	notetype 12, 199
	note C_, 8
	octave 4
	note C_, 2
	note __, 4
	note A#, 4
	note G_, 2
	note F_, 2
	notetype 12, 176
	note G_, 16
	notetype 12, 179
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

Music_FarewellRival_Ch2:
	dutycycle 3
	vibrato 10, 38
	notetype 12, 199
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


Music_MeetRival_Ch3: ; b233 (2:7233)
	notetype 12, 20
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

Music_MeetRival_branch_b24b:
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

Music_FarewellRival_Ch3:
	notetype 12, 20
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
; 0xb2c8