; PureRGBnote: ADDED: The alternate versions don't set tempo and are used in the lavender basement
Music_Lavender_Alternate::
	channel_count 4
	channel 1, Music_Lavender_Ch1_Alternate
	channel 2, Music_Lavender_Ch2_Alternate
	channel 3, Music_Lavender_Ch3_Alternate
	channel 4, Music_Lavender_Ch4_Alternate

Music_Lavender_Ch1_Alternate::
	volume 7, 7
	duty_cycle 1
	toggle_perfect_pitch
	vibrato 0, 8, 8
	note_type 12, 10, 7
	sound_loop 0, Music_Lavender_Ch1.mainloop

Music_Lavender_Ch1::
	tempo 152
	volume 7, 7
	duty_cycle 1
	toggle_perfect_pitch
	vibrato 0, 8, 8
	note_type 12, 8, 7
	rest 16
	rest 16
	rest 16
	rest 16
	note_type 12, 10, 7
.mainloop:
	octave 3
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note C#, 8
	note C#, 8
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note C_, 8
	note C_, 8
	octave 3
	note G_, 8
	note G_, 8
	note E_, 8
	note E_, 8
	note G_, 4
	note F#, 4
	note E_, 4
	note B_, 4
	note C#, 8
	note C#, 8
	note G_, 8
	note G_, 8
	note F#, 8
	note F#, 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note C_, 8
	note C_, 8
	rest 16
	rest 16
	rest 16
	rest 16
	sound_loop 0, .mainloop

Music_Lavender_Ch2_Alternate::
	vibrato 0, 3, 4
	duty_cycle 3
	note_type 12, 9, 1
	sound_loop 0, Music_Lavender_Ch2.mainloop

Music_Lavender_Ch2::
	vibrato 0, 3, 4
	duty_cycle 3
	note_type 12, 9, 1
.mainloop:
	octave 5
	note C_, 4
	note G_, 4
	note B_, 4
	note F#, 4
	sound_loop 0, .mainloop

Music_Lavender_Ch3_Alternate::
	vibrato 4, 1, 1
	note_type 12, 2, 5
	sound_loop 0, Music_Lavender_Ch3.mainloop

Music_Lavender_Ch3::
	vibrato 4, 1, 1
	note_type 12, 3, 5
	rest 16
	rest 16
	rest 16
	rest 16
	note_type 12, 2, 5
.mainloop:
	octave 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note_type 12, 3, 5
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note_type 12, 2, 5
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note E_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note E_, 16
	note D_, 16
	note C_, 16
	note E_, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	note_type 12, 2, 5
	octave 6
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 7
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 8
	note B_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	octave 4
	note E_, 4
	note G_, 4
	note F#, 4
	note B_, 4
	sound_loop 0, .mainloop

Music_Lavender_Ch4_Alternate::
	drum_speed 12
	sound_loop 0, Music_Lavender_Ch4.mainloop	

Music_Lavender_Ch4::
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 16
.mainloop:
	drum_note 7, 8
	drum_note 7, 8
	sound_loop 0, .mainloop
