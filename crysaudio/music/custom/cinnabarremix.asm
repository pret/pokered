Music_CinnabarRemix:
	dbw $C0, Music_CinnabarRemix_Ch1
	dbw $01, Music_CinnabarRemix_Ch2
	dbw $02, Music_CinnabarRemix_Ch3
	dbw $03, Music_CinnabarRemix_Ch4

Music_CinnabarRemix_Ch1: ; b86d (2:786d)
	tempo 144
	volume 119
	dutycycle 2
	
Music_CinnabarRemix_branch_b878:
	notetype 12, 181
	note __, 4
	octave 3
	note D_, 4
	note E_, 6
	note C#, 2
	notetype 12, 177
	note D_, 4
	notetype 12, 181
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
	notetype 12, 177
	note B_, 4
	notetype 12, 181
	note G_, 4
	note F#, 4
	note E_, 2
	note F#, 2
	notetype 12, 177
	note G_, 4
	notetype 12, 181
	note G_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	note E_, 4
	note F#, 6
	note A_, 2
	notetype 12, 177
	note G_, 4
	notetype 12, 181
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
	note B_, 4
	note G_, 4
	note F#, 3
	note E_, 1
	note F#, 2
	note A_, 2
	notetype 12, 162
	note G_, 4
	octave 4
	note D_, 1
	note E_, 1
	note D_, 4
	notetype 12, 114
	note D_, 1
	note E_, 1
	note D_, 4
	notetype 12, 167
	octave 3
	note B_, 6
	note G_, 2
	note E_, 8
	octave 4
	note C_, 6
	octave 3
	note A_, 2
	note F#, 8
	octave 4
	note F#, 6
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 8
	note F#, 4
	note E_, 4
	loopchannel 0, Music_CinnabarRemix_branch_b878


Music_CinnabarRemix_Ch2: ; b8d4 (2:78d4)
	dutycycle 2
	vibrato 12,$34

Music_CinnabarRemix_branch_b8d9:
	unknownmusic0xde 170
	notetype 12, $C2
	octave 3
	note G_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	note D_, 1
	note E_, 1
	notetype 12, 193
	note D_, 4
	notetype 12, 199
	note G_, 4
	note A_, 6
	note G_, 1
	note F#, 1
	note E_, 4
	note D_, 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	note D_, 1
	note E_, 1
	notetype 12, 193
	note D_, 4
	notetype 12, 199
	octave 3
	note B_, 8
	note A_, 4
	note G_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	note D_, 1
	note E_, 1
	notetype 12, 193
	note D_, 4
	notetype 12, 199
	note G_, 4
	note A_, 6
	note G_, 1
	note F#, 1
	note E_, 4
	note D_, 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	note D_, 1
	note E_, 1
	notetype 12, 193
	note D_, 4
	notetype 12, 199
	octave 3
	note A_, 4
	note G_, 4
	note F#, 4
	notetype 12, 176
	unknownmusic0xde 10
	octave 4
	note D_, 6
	octave 3
	note B_, 2
	note G_, 8
	octave 4
	note E_, 6
	note C_, 2
	octave 3
	note A_, 8
	octave 4
	note A_, 6
	note F#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 4
	octave 4
	note D_, 4
	octave 3
	note B_, 2
	note A_, 6
	loopchannel 0, Music_CinnabarRemix_branch_b8d9


Music_CinnabarRemix_Ch3: ; b93d (2:793d)
	notetype 6, $25
	vibrato 12, $24
Music_CinnabarRemix_branch_b93f:
	octave 2
	note G_, 1
	note __, 3
	note B_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F#, 1
	note __, 1
	note G_, 1
	note __, 3
	note B_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F#, 1
	note __, 1
	note G_, 1
	note __, 3
	note B_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F#, 1
	note __, 1
	note G_, 1
	note __, 3
	note B_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note A_, 1
	note __, 1
	note G_, 1
	note __, 3
	note B_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F#, 1
	note __, 1
	note G_, 1
	note __, 3
	note B_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F#, 1
	note __, 1
	note G_, 1
	note __, 3
	note B_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F#, 1
	note __, 1
	note G_, 1
	note __, 3
	note B_, 4
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 4
	octave 2
	note B_, 1
	note __, 3
	octave 3
	note D_, 2
	octave 2
	note B_, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 3
	octave 3
	note E_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 2
	note C_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 3
	octave 3
	note A_, 2
	note F#, 1
	note F#, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note C_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 3
	octave 3
	note D_, 2
	note C_, 1
	note C_, 1
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 2
	octave 3
	note C_, 1
	note __, 1
	loopchannel 0, Music_CinnabarRemix_branch_b93f
; 0xb9eb
Music_CinnabarRemix_Ch4:
	notetype $c
	togglenoise 0
Music_CinnabarRemix_Loop4:
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 4
	note A_, 4
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 4
	note A#, 4
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 4
	note A_, 4
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 4
	note A#, 4
	note A_, 4
	note A#, 4
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note G_, 1
	note G_, 1
	note F_, 2
	note G_, 1
	note G_, 1
	loopchannel 0, Music_CinnabarRemix_Loop4
