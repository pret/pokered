Music_MobileAdapter:
	channel_count 4
	channel 1, Music_MobileAdapter_Ch1
	channel 2, Music_MobileAdapter_Ch2
	channel 3, Music_MobileAdapter_Ch3
	channel 4, Music_MobileAdapter_Ch4

Music_MobileAdapter_Ch1:
	tempo 132
	volume 7, 7
	pitch_offset 1
	stereo_panning FALSE, TRUE
	duty_cycle 2
	note_type 12, 8, 4
	rest 2
	rest 6
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	note E_, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 4
.mainloop:
	sound_call .sub1
	note D_, 1
	note C#, 1
	note D_, 2
	octave 3
	note A_, 1
	note G_, 1
	note A_, 2
	note F#, 1
	note E_, 1
	note F#, 2
	note D_, 1
	note C#, 1
	note D_, 2
	sound_call .sub1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	volume_envelope 9, 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 4
	octave 5
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	octave 4
	note C#, 8
	volume_envelope 9, 2
	note F#, 1
	note G_, 1
	note A_, 2
	note G#, 2
	note A_, 2
	volume_envelope 9, 4
	note E_, 3
	octave 3
	note A_, 3
	note E_, 4
	octave 4
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	octave 3
	note B_, 8
	volume_envelope 9, 2
	octave 4
	note B_, 1
	octave 5
	note C_, 1
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	octave 5
	note C#, 3
	volume_envelope 9, 4
	octave 4
	note C#, 3
	octave 3
	note A_, 4
	octave 4
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	octave 3
	note F#, 10
	octave 4
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	octave 3
	note D_, 10
	octave 4
	note A_, 8
	volume_envelope 10, 1
	octave 3
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 2
	octave 3
	note A_, 1
	note G_, 1
	note A_, 2
	volume_envelope 9, 4
	note F#, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	volume_envelope 7, 7
	sound_call Music_MobileAdapter_Ch3.sub5
	sound_loop 0, .mainloop

.sub1:
	volume_envelope 9, 4
	octave 4
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 2
	octave 3
	note F#, 10
	octave 4
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 2
	octave 3
	note G_, 8
	volume_envelope 10, 1
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	sound_ret

Music_MobileAdapter_Ch2:
	note_type 12, 12, 1
	vibrato 16, 2, 3
	duty_cycle 2
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note C#, 1
	note D_, 2
	octave 3
	note B_, 1
	note A#, 1
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	volume_envelope 11, 4
	octave 4
	note D_, 1
	note F#, 1
.mainloop:
	sound_call .sub1
	note A_, 4
	note G_, 4
	note A_, 4
	note E_, 4
	note F#, 12
	rest 2
	note D_, 1
	note F#, 1
	sound_call .sub1
	octave 5
	note C#, 4
	octave 4
	note A_, 4
	octave 5
	note F#, 4
	note E_, 4
	note D_, 12
	rest 2
	note C#, 1
	note D_, 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note G_, 4
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 9
	volume_envelope 10, 2
	octave 3
	note E_, 3
	note C#, 2
	volume_envelope 11, 4
	octave 5
	note D_, 1
	note C#, 1
	octave 4
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	octave 5
	note C#, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note E_, 9
	volume_envelope 10, 2
	octave 3
	note A_, 3
	note E_, 2
	volume_envelope 11, 4
	octave 5
	note F#, 1
	note G_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 4
	note F#, 2
	note E_, 2
	note D_, 1
	note C#, 1
	octave 4
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	octave 5
	note G_, 4
	note F#, 2
	note D_, 2
	octave 4
	note A#, 1
	note B_, 1
	octave 5
	note C#, 12
	note E_, 4
	note D_, 16
	duty_cycle 1
	volume_envelope 7, 1
	sound_call .sub2
	octave 4
	note E_, 1
	note A_, 1
	octave 5
	note C#, 1
	note E_, 1
	sound_call .sub2
	rest 2
	duty_cycle 2
	volume_envelope 11, 4
	octave 4
	note D_, 1
	note F#, 1
	sound_loop 0, .mainloop

.sub1:
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 2
	octave 5
	note D_, 4
	note C#, 2
	octave 4
	note B_, 2
	note G_, 1
	note A_, 1
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note B_, 2
	octave 5
	note E_, 4
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	sound_ret

.sub2:
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A_, 1
	note F#, 1
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A_, 1
	note F#, 1
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A#, 1
	note F#, 1
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A#, 1
	note F#, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note C#, 4
	sound_ret

Music_MobileAdapter_Ch3:
	note_type 12, 1, 4
	rest 2
	octave 3
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	note B_, 1
	note G_, 1
	note A_, 1
	rest 1
	note E_, 1
	rest 1
	note A_, 4
.mainloop:
	sound_call .sub1
	sound_call .sub2
	sound_call .sub3
	note D_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	note B_, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	sound_call .sub2
	sound_call .sub4
	note B_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	octave 2
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	sound_call .sub4
	octave 3
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note C#, 1
	rest 1
	note A_, 1
	rest 1
	note C#, 1
	rest 1
	note A_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 2
	note A#, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 2
	note A#, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	sound_call .sub2
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note F#, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	sound_call .sub5
	sound_loop 0, .mainloop

.sub1:
.sub1loop1:
	octave 3
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	sound_loop 4, .sub1loop1
.sub1loop2:
	octave 2
	note G_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	sound_loop 4, .sub1loop2
	sound_ret

.sub2:
.sub2loop1:
	octave 2
	note A_, 1
	rest 1
	octave 3
	note E_, 1
	rest 1
	sound_loop 4, .sub2loop1
	sound_ret

.sub3:
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	sound_ret

.sub4:
	octave 2
	note A_, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	note E_, 1
	rest 1
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	octave 3
	note E_, 2
	rest 1
	octave 2
	note A_, 4
	sound_ret

.sub5:
.sub5loop1:
	octave 2
	note A_, 1
	rest 1
	octave 3
	note D_, 2
	octave 2
	note A_, 1
	octave 3
	note D_, 3
	octave 2
	note A#, 1
	rest 1
	octave 3
	note D_, 2
	octave 2
	note A#, 1
	octave 3
	note D_, 3
	octave 2
	note B_, 1
	rest 1
	octave 3
	note D_, 2
	octave 2
	note B_, 1
	octave 3
	note D_, 3
	octave 2
	note A_, 2
	rest 6
	sound_loop 2, .sub5loop1
	sound_ret

Music_MobileAdapter_Ch4:
	toggle_noise 3
	stereo_panning TRUE, FALSE
	drum_speed 12
	rest 2
	rest 10
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.mainloop:
	sound_call .sub1
	sound_call .sub1
.loop1:
	rest 4
	drum_note 3, 8
	drum_note 3, 8
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 3
	drum_note 3, 4
	sound_loop 2, .loop1
.loop2:
	rest 4
	drum_note 3, 4
	sound_loop 11, .loop2
	rest 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	rest 4
	drum_note 3, 8
	drum_note 3, 8
	drum_note 3, 6
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_loop 0, .mainloop

.sub1:
.sub1loop1:
	rest 4
	drum_note 3, 4
	sound_loop 7, .sub1loop1
	rest 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_ret
