Music_Pokecenter_Ch1::
	tempo 144
	volume 7, 7
	duty_cycle 3
	vibrato 10, 2, 2
	toggle_perfect_pitch
.mainloop:
	note_type 12, 10, 3
	octave 3
	note F#, 2
	note F_, 2
	note F#, 2
	note_type 12, 11, 5
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note_type 12, 10, 3
	note A_, 2
	note E_, 2
	note A_, 2
	note_type 12, 11, 5
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note_type 12, 10, 3
	note F#, 2
	note F_, 2
	note F#, 2
	note_type 12, 11, 5
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note_type 12, 10, 3
	note A_, 2
	note E_, 2
	note A_, 2
	note_type 12, 11, 5
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note F#, 2
	note E_, 2
	note D_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 4
	note C#, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 8
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 4
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 4
	note G_, 2
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	sound_loop 0, .mainloop

Music_Pokecenter_Ch2::
	vibrato 8, 2, 5
.mainloop:
	sound_call .sub1
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note A_, 4
	note E_, 4
	sound_call .sub2
	note D_, 2
	note F#, 6
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note A_, 4
	note E_, 4
	sound_call .sub1
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note A_, 4
	note E_, 4
	sound_call .sub2
	note D_, 8
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note D_, 4
	note E_, 4
	duty_cycle 2
	note_type 12, 12, 6
	octave 4
	note F#, 8
	note A_, 8
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 8
	note C#, 8
	note E_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	note F#, 8
	note A_, 8
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 8
	note A_, 4
	note G_, 2
	note F#, 2
	note G_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	sound_loop 0, .mainloop

.sub1:
	duty_cycle 2
	note_type 12, 12, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note_type 12, 12, 3
	note A_, 4
	note G_, 4
	note F#, 2
	note E_, 2
	note C#, 6
	sound_ret

.sub2:
	duty_cycle 2
	note_type 12, 12, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note_type 12, 12, 3
	note F#, 4
	note E_, 4
	note C#, 2
	sound_ret

Music_Pokecenter_Ch3::
	note_type 12, 1, 0
.mainloop:
	octave 4
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	sound_call .sub1
	sound_call .sub2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	sound_call .sub1
	sound_call .sub2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	sound_call .sub3
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	sound_call .sub3
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	sound_loop 0, .mainloop

.sub1:
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	sound_ret

.sub2:
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	sound_ret

.sub3:
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	sound_ret
