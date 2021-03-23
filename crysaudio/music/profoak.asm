Music_ProfOak:
	channel_count 3
	channel 1, Music_ProfOak_Ch1
	channel 2, Music_ProfOak_Ch2
	channel 3, Music_ProfOak_Ch3

Music_ProfOak_Ch1:
	tempo 118
	volume 7, 7
	vibrato 18, 3, 4
	pitch_offset 1
	stereo_panning TRUE, FALSE
	duty_cycle 3
	note_type 12, 9, 8
	octave 2
	note F#, 1
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	note A_, 16
	note G#, 8
	volume_envelope 9, 7
	note G#, 8
.loop1:
	volume_envelope 9, 1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub2
	sound_loop 2, .loop1
.mainloop:
	sound_call .sub3
	sound_call .sub3
	sound_call .sub4
	sound_call .sub4
	transpose 0, 2
	sound_call .sub3
	sound_call .sub3
	transpose 0, 0
	sound_call .sub4
	sound_call .sub4
	sound_loop 0, .mainloop

.sub1:
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note G#, 2
	note E_, 2
	sound_ret

.sub2:
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	note B_, 2
	note D#, 2
	note F#, 2
	note D#, 2
	sound_ret

.sub3:
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note C#, 1
	note E_, 1
	note C#, 2
	volume_envelope 9, 2
	note A_, 2
	volume_envelope 9, 1
	note C#, 2
	volume_envelope 9, 2
	note E_, 2
	volume_envelope 9, 1
	sound_ret

.sub4:
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	volume_envelope 9, 2
	note G#, 4
	note E_, 4
	volume_envelope 9, 1
	note E_, 1
	note G#, 1
	volume_envelope 9, 2
	note B_, 4
	volume_envelope 9, 1
	sound_ret

Music_ProfOak_Ch2:
	vibrato 18, 3, 4
	duty_cycle 3
	note_type 12, 10, 8
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	note F#, 1
	note A#, 1
	note B_, 16
	volume_envelope 10, 7
	note B_, 10
	duty_cycle 2
.loop1:
	volume_envelope 11, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 4
	volume_envelope 9, 1
	note B_, 2
	octave 5
	note C#, 2
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 4
	volume_envelope 11, 2
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 4
	note B_, 1
	rest 1
	note B_, 4
	volume_envelope 9, 1
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 4
	note B_, 2
	note B_, 4
	sound_loop 2, .loop1
	rest 6
	volume_envelope 11, 4
.mainloop:
	note C#, 6
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 6
	note C#, 1
	note E_, 1
	note F#, 4
	note E_, 4
	note D#, 4
	note C#, 4
	octave 3
	note B_, 6
	note G#, 1
	note B_, 1
	octave 4
	note E_, 8
	volume_envelope 8, 2
	note B_, 6
	note G#, 1
	note B_, 1
	volume_envelope 8, 3
	octave 5
	note E_, 8
	volume_envelope 11, 4
	octave 3
	note A_, 6
	note F#, 1
	note A_, 1
	octave 4
	note D#, 8
	note E_, 4
	note D#, 4
	note C#, 4
	note C_, 4
	octave 3
	note B_, 6
	note G#, 1
	note B_, 1
	octave 4
	note E_, 6
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note G#, 16
	sound_loop 0, .mainloop

Music_ProfOak_Ch3:
	stereo_panning FALSE, TRUE
	note_type 12, 1, 4
	rest 4
	octave 3
	note E_, 2
	rest 2
	octave 4
	note E_, 1
	rest 1
	octave 3
	note A_, 2
	rest 2
	octave 2
	note B_, 2
	octave 3
	note B_, 1
	rest 1
	note E_, 2
	sound_call .sub1
.loop1:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub2
	sound_loop 2, .loop1
.mainloop:
	sound_call .sub3
	sound_call .sub3
	sound_call .sub4
	sound_call .sub4
	transpose 0, 2
	sound_call .sub3
	sound_call .sub3
	transpose 0, 0
	sound_call .sub4
	sound_call .sub4
	sound_loop 0, .mainloop

.sub1:
	note E_, 2
	rest 2
	octave 4
	note E_, 1
	rest 1
	octave 3
	note G#, 2
	rest 2
	octave 2
	note B_, 2
	octave 3
	note B_, 1
	rest 1
	note E_, 2
	sound_ret

.sub2:
	octave 2
	note B_, 2
	rest 2
	octave 4
	note D#, 1
	rest 1
	octave 3
	note D#, 2
	rest 2
	note F#, 2
	note B_, 1
	rest 1
	note D#, 2
	sound_ret

.sub3:
	octave 2
	note A_, 2
	rest 2
	octave 3
	note A_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	octave 3
	note E_, 2
	note A_, 1
	rest 1
	note C#, 2
	sound_ret

.sub4:
	octave 2
	note G#, 2
	rest 2
	octave 3
	note G#, 1
	rest 1
	octave 2
	note G#, 2
	rest 2
	octave 3
	note E_, 2
	note G#, 1
	rest 1
	octave 2
	note B_, 2
	sound_ret
