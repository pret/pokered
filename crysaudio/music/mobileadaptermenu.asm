Music_MobileAdapterMenu:
	channel_count 3
	channel 1, Music_MobileAdapterMenu_Ch1
	channel 2, Music_MobileAdapterMenu_Ch2
	channel 3, Music_MobileAdapterMenu_Ch3

Music_MobileAdapterMenu_Ch1:
	tempo 168
	volume 7, 7
	pitch_offset 1
	stereo_panning FALSE, TRUE
	duty_cycle 2
	note_type 12, 6, 6
	rest 2
.mainloop:
	sound_call .sub1
	sound_call .sub2
	octave 3
	note F#, 4
	note B_, 4
	note F#, 2
	note B_, 1
	rest 1
	note D#, 4
	sound_call .sub2
	octave 3
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 3
	note E_, 1
	note D#, 8
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note G#, 7
	octave 4
	note E_, 1
	note D#, 1
	rest 1
	octave 3
	note B_, 1
	rest 1
	note F#, 4
	note E_, 8
	note D#, 1
	rest 1
	note C#, 1
	rest 1
	note D#, 4
	note G#, 7
	octave 4
	note E_, 1
	note D#, 1
	rest 1
	octave 3
	note B_, 1
	rest 1
	note F#, 4
	note A_, 2
	note E_, 2
	note A_, 3
	note A_, 1
	note G#, 8
	sound_ret

.sub2:
	note E_, 1
	rest 1
	note A_, 1
	rest 1
	octave 4
	note C#, 3
	octave 3
	note B_, 1
	note A_, 2
	octave 4
	note E_, 1
	rest 1
	note C#, 4
	sound_ret

Music_MobileAdapterMenu_Ch2:
	stereo_panning TRUE, FALSE
	note_type 12, 8, 4
	duty_cycle 2
	octave 4
	note E_, 1
	note G#, 1
.mainloop:
	sound_call .sub1
	note E_, 8
	sound_call .sub2
	note D#, 2
	note C#, 2
	note D#, 3
	note E_, 1
	note F#, 8
	sound_call .sub2
	note D#, 2
	note E_, 2
	note F#, 3
	note G#, 1
	note F#, 6
	note E_, 1
	note G#, 1
	sound_call .sub1
	note E_, 6
	note E_, 1
	note G#, 1
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note A_, 3
	note G#, 1
	note F#, 1
	rest 1
	note D#, 1
	rest 1
	octave 3
	note B_, 4
	octave 4
	note C#, 2
	note D#, 2
	note E_, 3
	note G#, 1
	note F#, 6
	note E_, 1
	note G#, 1
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note A_, 3
	note G#, 1
	note F#, 1
	rest 1
	note D#, 1
	rest 1
	octave 3
	note B_, 4
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 3
	note D#, 1
	sound_ret

.sub2:
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G#, 3
	note F#, 1
	note E_, 2
	note A_, 1
	rest 1
	note E_, 4
	sound_ret

Music_MobileAdapterMenu_Ch3:
	vibrato 8, 3, 4
	note_type 12, 2, 5
	rest 2
.mainloop:
	sound_call .sub1
	octave 2
	note B_, 1
	note G#, 1
	sound_call .sub2
	octave 2
	note B_, 2
	rest 2
	octave 3
	note F#, 2
	rest 1
	note D#, 1
	note F#, 2
	note D#, 1
	rest 1
	octave 2
	note B_, 2
	note F#, 1
	note G#, 1
	sound_call .sub2
	octave 2
	note B_, 2
	rest 2
	octave 3
	note F#, 2
	rest 1
	note D#, 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note D#, 1
	rest 1
	note F#, 4
	sound_call .sub1
	rest 2
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note E_, 2
	rest 2
	note B_, 2
	rest 1
	note G#, 1
	note D#, 1
	rest 1
	note B_, 1
	rest 1
	note D#, 4
	note C#, 2
	rest 2
	note A_, 2
	rest 1
	note F#, 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note D#, 1
	rest 1
	note F#, 4
	note E_, 2
	rest 2
	note B_, 2
	rest 1
	note G#, 1
	note D#, 1
	rest 1
	note B_, 1
	rest 1
	note D#, 4
	note C#, 2
	rest 2
	note A_, 2
	rest 1
	note C#, 1
	note E_, 3
	volume_envelope 3, 5
	note E_, 3
	volume_envelope 2, 5
	sound_ret

.sub2:
	note A_, 2
	rest 2
	octave 3
	note A_, 2
	rest 1
	note C#, 1
	note A_, 2
	octave 4
	note C#, 1
	rest 1
	octave 3
	note A_, 4
	sound_ret
