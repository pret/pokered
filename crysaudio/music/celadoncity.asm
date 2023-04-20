Music_CeladonCity:
	channel_count 3
	channel 1, Music_CeladonCity_Ch1
	channel 2, Music_CeladonCity_Ch2
	channel 3, Music_CeladonCity_Ch3

Music_CeladonCity_Ch1:
	tempo 146
	volume 7, 7
	pitch_offset 1
.mainloop:
	stereo_panning FALSE, TRUE
	note_type 12, 10, 6
	octave 3
	note A_, 7
	volume_envelope 10, 1
	note G#, 1
	note A_, 1
	note D_, 3
	note E_, 2
	note F#, 2
	sound_call .sub1
.loop1:
	note D_, 2
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	sound_loop 3, .loop1
	note D_, 2
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	sound_call .sub1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 16
	sound_call .sub2
	sound_call .sub3
	octave 2
	note B_, 2
	note A#, 1
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	sound_call .sub2
	sound_call .sub3
	note D_, 2
	note C#, 1
	note D_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 8
	sound_loop 0, .mainloop

.sub1:
.sub1loop1:
	note D_, 2
	note G_, 1
	note B_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	sound_loop 3, .sub1loop1
	note D_, 2
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	octave 3
	note A_, 1
	sound_ret

.sub2:
.sub2loop1
	octave 2
	note G_, 2
	note B_, 1
	octave 3
	note D_, 1
	sound_loop 4, .sub2loop1
	note C_, 2
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	octave 3
	note B_, 1
	sound_ret

.sub3:
.sub3loop1:
	note D_, 2
	note F#, 1
	note A_, 1
	sound_loop 4, .sub3loop1
	sound_ret

Music_CeladonCity_Ch2:
	vibrato 18, 3, 4
	duty_cycle 2
	stereo_panning TRUE, FALSE
	note_type 12, 11, 7
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 8
.mainloop:
	sound_call .sub1
	note A_, 4
	note F#, 4
	note A_, 2
	note F#, 6
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 2
	note B_, 2
	note G_, 4
	note B_, 4
	sound_call .sub1
	volume_envelope 12, 1
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	volume_envelope 11, 3
	octave 5
	note D_, 6
	volume_envelope 10, 2
	octave 1
	note F#, 2
	sound_call .sub2
	octave 1
	note G_, 3
	note B_, 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 6
	note F#, 2
	sound_call .sub2
	octave 1
	note A_, 3
	octave 2
	note D_, 1
	note A_, 4
	note D_, 6
	volume_envelope 9, 7
	octave 4
	note F#, 1
	note A_, 1
	octave 5
	note D_, 16
	sound_loop 0, .mainloop

.sub1:
	volume_envelope 11, 2
	octave 4
	note B_, 4
	note G_, 4
	note B_, 2
	note G_, 6
	note B_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note A_, 8
	sound_ret

.sub2:
	note G_, 3
	note B_, 1
	octave 2
	note D_, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 4
	octave 1
	note G_, 3
	octave 2
	note C_, 1
	note D_, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 4
	octave 1
	note A_, 3
	octave 2
	note D_, 1
	note F#, 4
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note F#, 4
	sound_ret

Music_CeladonCity_Ch3:
	vibrato 18, 2, 4
.mainloop:
	note_type 12, 2, 5
	octave 3
	note A_, 2
	rest 2
	note F#, 2
	rest 2
	note D_, 8
	sound_call .sub1
.loop1:
	octave 2
	note A_, 2
	rest 2
	octave 3
	note D_, 4
	sound_loop 3, .loop1
	octave 2
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	octave 3
	note D_, 3
	octave 2
	note F#, 1
	sound_call .sub1
	note A_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	octave 3
	note F#, 3
	octave 2
	note G#, 1
	note A_, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	note E_, 2
	note C#, 2
	note D_, 2
	rest 6
	octave 2
	note A_, 2
	rest 6
	volume_envelope 1, 0
	sound_call .sub2
	octave 5
	note E_, 2
	rest 2
	note F#, 2
	rest 2
	note D_, 4
	rest 4
	note C_, 8
	octave 4
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	rest 2
	note D_, 2
	note E_, 2
	note D_, 4
	rest 4
	sound_call .sub2
	octave 5
	note E_, 2
	rest 2
	note D_, 2
	note E_, 2
	note D_, 4
	rest 4
	note C_, 8
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	rest 6
	sound_loop 0, .mainloop

.sub1:
.sub1loop1:
	octave 2
	note G_, 2
	rest 2
	octave 3
	note D_, 4
	sound_loop 3, .sub1loop1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	note F#, 3
	octave 2
	note G#, 1
	sound_ret

.sub2:
	octave 5
	note D_, 8
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	sound_ret
