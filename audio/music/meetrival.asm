Music_MeetRival_Ch1_AlternateTempo::
	tempo 100
	sound_loop 0, Music_MeetRival_Ch1.body

Music_MeetRival_Ch1::
	tempo 112
.body:
	volume 7, 7
	duty_cycle 3
	vibrato 6, 3, 4
	toggle_perfect_pitch
	note_type 12, 11, 3
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
	rest 3
	note D_, 1
	rest 5
	note A_, 2
	note G_, 2
	note A_, 2
.mainloop:
	note B_, 4
	note A#, 2
	note A_, 4
	note G_, 2
	octave 4
	note C_, 4
	note D_, 2
	rest 4
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
	rest 4
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
	rest 2
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
	rest 4
	note A#, 4
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note_type 12, 11, 7
	octave 3
	note G_, 4
	note D_, 2
	note F_, 6
	note F#, 4
	note D_, 2
	rest 4
	note D_, 4
	note_type 12, 11, 3
	note A_, 2
	note G_, 2
	note A_, 2
	sound_loop 0, .mainloop

Music_MeetRival_Ch1_AlternateStartAndTempo::
	tempo 100
	sound_loop 0, Music_MeetRival_Ch1_AlternateStart.body

Music_MeetRival_Ch1_AlternateStart::
	tempo 112
.body:
	volume 7, 7
	duty_cycle 3
	vibrato 6, 3, 4
	toggle_perfect_pitch
	note_type 12, 11, 3
	octave 3
	note D_, 1
	rest 3
	note D_, 1
	rest 5
	note A_, 2
	note G_, 2
	note A_, 2
	sound_loop 0, Music_MeetRival_Ch1.mainloop

Music_MeetRival_Ch2::
	duty_cycle 3
	vibrato 10, 2, 6
	note_type 12, 12, 7
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
	rest 3
	note G_, 1
	rest 3
	note D_, 1
	rest 1
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
.mainloop:
	note_type 12, 12, 7
	note G_, 4
	note D_, 2
	note F_, 6
	note F#, 4
	note G_, 2
	rest 4
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
	rest 4
	note C_, 4
	note C_, 2
	octave 4
	note B_, 2
	octave 5
	note C_, 2
	note_type 12, 11, 0
	note D_, 16
	note_type 12, 11, 5
	note D_, 6
	note_type 12, 12, 7
	note F_, 4
	note D_, 2
	note C_, 2
	note D_, 2
	note_type 12, 11, 0
	note C_, 8
	note_type 12, 12, 7
	note C_, 8
	octave 4
	note C_, 2
	rest 4
	note A#, 4
	note G_, 2
	note F_, 2
	note_type 12, 11, 0
	note G_, 16
	note_type 12, 11, 3
	note G_, 2
	octave 3
	note G_, 2
	rest 4
	note G_, 4
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
	sound_loop 0, .mainloop

Music_MeetRival_Ch2_AlternateStart::
	duty_cycle 3
	vibrato 10, 2, 6
	note_type 12, 12, 7
	octave 3
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note D_, 1
	rest 1
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
	sound_loop 0, Music_MeetRival_Ch2.mainloop

Music_MeetRival_Ch3::
	note_type 12, 1, 4
	octave 5
	note D_, 2
	rest 2
	note C#, 2
	rest 2
	note C_, 2
	rest 2
	octave 4
	note B_, 2
	rest 2
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
.mainloop:
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	rest 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	rest 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	rest 4
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
	rest 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	rest 2
	note B_, 2
	octave 5
	note C_, 2
	rest 4
	note C_, 4
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note F#, 2
	note A_, 2
	rest 2
	note F#, 2
	note A_, 2
	note F#, 2
	rest 2
	note A_, 2
	note F#, 2
	note A_, 2
	rest 2
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
	rest 2
	octave 4
	note E_, 2
	octave 5
	note C_, 2
	octave 4
	note E_, 2
	note F_, 2
	note G_, 2
	note E_, 2
	rest 4
	note E_, 2
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note A#, 2
	rest 2
	note G_, 2
	note A#, 2
	note G_, 2
	rest 2
	note A#, 2
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	rest 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	rest 2
	octave 5
	note D_, 2
	sound_loop 0, .mainloop

Music_MeetRival_Ch3_AlternateStart::
	note_type 12, 1, 4
	octave 4
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	sound_loop 0, Music_MeetRival_Ch3.mainloop
