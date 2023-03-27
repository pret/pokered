Music_SecretLab2_Ch1::
	tempo 110
	volume 7, 7
	duty_cycle 2
	toggle_perfect_pitch
	vibrato 10, 2, 4
	note_type 12, 12, 0
	octave 3	
	rest 16
;	
	octave 3
	note A_, 1
	note B_, 6
	rest 1
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 4
	octave 4
	note E_, 4
	note D_, 4
	note C_, 6
	octave 3
	note A#, 1
	note B_, 6
	rest 1
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note A_, 1
	note B_, 7
	rest 2
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	rest 4
;	
	octave 3
	note D_, 1
	note E_, 6
	rest 1
	note E_, 2
	note F_, 2
	note D_, 2
	note E_, 4
	note A_, 1
	note B_, 3
	note A_, 4
	note G_, 6
	note D_, 1
	note E_, 6
	rest 1
	note E_, 2
	note F_, 2
	note D_, 2
	note D_, 1
	note E_, 7
	rest 6
	octave 6
	note D_, 1
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note E_, 1
	octave 3
	note_type 6, 12, 2
.mainloop
	sound_call SecretLab_MainMelody
	sound_loop 0, .mainloop

Music_SecretLab2_Ch2::
	duty_cycle 2
	toggle_perfect_pitch
	vibrato 10, 2, 4
	note_type 12, 12, 0
	octave 3
	rest 16
	note D_, 1
	note E_, 6
	rest 1
	note E_, 2
	note F_, 2
	note D_, 2
	note E_, 4
	note D_, 4
	note C_, 4
	note D_, 6
	octave 2
	note A_, 1
	note B_, 6
	rest 1
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note A_, 2
	note A_, 1
	note B_, 7
	rest 6
	octave 5
	note G_, 1
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
;
	octave 2
	note A_, 1
	note B_, 6
	rest 1
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note A_, 2
	note B_, 4
	note G_, 1
	note A_, 3
	note G_, 4
	note F#, 6
	note D_, 1
	note E_, 6
	rest 1
	note E_, 2
	note F_, 2
	note D_, 2
	note D_, 1
	note E_, 7
	rest 2
	octave 5
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	rest 4
;
	note_type 12, 8, 0
.mainloop
.loop2
	octave 5
	note E_, 2
	octave 4
	note B_, 2
	rest 4
	octave 3
	note B_, 4
	sound_loop 5, .loop2
.loop1
	octave 5
	note F_, 2
	note C_, 2
	rest 4
	octave 4
	note C_, 4
	sound_loop 5, .loop1
	sound_loop 0, .mainloop

Music_SecretLab2_Ch3::
	note_type 6, 1, 2
	octave 2
	note E_, 2
	rest 2
	octave 3
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note E_, 2
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note E_, 2
.loop1
	sound_call .sub1
	sound_call .sub3
	sound_loop 2, .loop1
.mainloop
	sound_call .sub2
	sound_call .sub2
	sound_call .sub1
	sound_call .sub3
	sound_loop 0, .mainloop

.sub1
	note_type 6, 6, 2
	octave 2
	note E_, 8
	note E_, 4
	note E_, 4
	octave 3
	note E_, 4
	note F_, 4
	octave 2
	note E_, 4
	note E_, 8
	note E_, 8
	note E_, 4
	octave 3
	note E_, 4
	note F_, 4
	note E_, 4
	note F_, 4
	sound_ret

.sub2
	note_type 6, 6, 2
	octave 2
	note E_, 8
	note E_, 4
	note E_, 4
	octave 3
	note D_, 4
	note E_, 4
	octave 2
	note E_, 4
	note E_, 8
	note E_, 8
	note E_, 4
	octave 3
	note D_, 4
	note E_, 4
	note D_, 4
	note E_, 4
	sound_ret

.sub3
	note_type 6, 6, 2
	octave 2
	note E_, 8
	note E_, 4
	note E_, 4
	octave 3
	note D_, 4
	note E_, 4
	octave 2
	note E_, 4
	note E_, 8
	note E_, 8
	note E_, 3
	rest 1
	note_type 6, 1, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 3
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note E_, 2
	sound_ret

Music_SecretLab2_Ch4::
	drum_speed 6
	rest 12
	drum_note_short 10, 2
	drum_note_short 10, 2
	drum_note 14, 4
	drum_note_short 6, 4
	drum_note_short 10, 4
	drum_note_short 10, 4
	drum_note 14, 8
.mainloop
	drum_note_short 6, 4
	drum_note_short 6, 4
	drum_note 14, 8
	drum_note_short 6, 4
	drum_note_short 6, 8
	drum_note_short 6, 8
	drum_note_short 6, 4
	drum_note 14, 8
	drum_note_short 6, 8
	drum_note_short 6, 8
	sound_loop 0, .mainloop