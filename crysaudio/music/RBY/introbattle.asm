Music_IntroBattle:
	dbw $C0, Music_IntroBattle_Ch1
	dbw $01, Music_IntroBattle_Ch2
	dbw $02, Music_IntroBattle_Ch3
	dbw $03, Music_IntroBattle_Ch4

Music_IntroBattle_Ch1: ; 7f844 (1f:7844)
	ftempo 98
	volume 119
	dutycycle 3
	vibrato 6, 52
	
	notetype 12, 177
	note __, 8
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note D_, 4
	notetype 12, 177
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note D#, 4
	notetype 12, 177
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note D_, 4
	notetype 12, 177
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 160
	note A#, 4
	notetype 12, 177
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note D_, 4
	notetype 12, 177
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 41
	octave 3
	note G_, 4
	notetype 12, 176
	note A_, 8
	octave 2
	note A_, 8
	notetype 12, 183
	octave 3
	note F_, 8
	notetype 12, 79
	octave 2
	note F_, 8
	notetype 12, 177
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note D_, 4
	notetype 12, 177
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note D#, 4
	notetype 12, 177
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note F_, 4
	notetype 12, 177
	octave 2
	note A_, 2
	note A_, 2
	notetype 12, 180
	octave 3
	note G_, 4
	notetype 12, 176
	note F#, 16
	notetype 12, 177
	octave 4
	note D_, 16
	endchannel


Music_IntroBattle_Ch2: ; 7f8bc (1f:78bc)
	dutycycle 3
	vibrato 8, 37
	notetype 12, 194
	note __, 8
	octave 3
	note D_, 2
	note D_, 2
	notetype 12, 197
	note A_, 4
	notetype 12, 194
	note D_, 2
	note D_, 2
	notetype 12, 197
	note A#, 4
	notetype 12, 194
	note D_, 2
	note D_, 2
	notetype 12, 197
	note A_, 4
	notetype 12, 194
	note D_, 2
	note D_, 2
	notetype 12, 183
	note C#, 4
	notetype 12, 194
	note D_, 2
	note D_, 2
	notetype 12, 197
	note A_, 4
	notetype 12, 194
	octave 3
	note D_, 2
	note D_, 2
	notetype 12, 199
	octave 4
	note C#, 4
	note D_, 8
	octave 3
	note D_, 8
	octave 4
	note C_, 8
	octave 3
	note C_, 8
	notetype 12, 194
	note D_, 2
	note D_, 2
	notetype 12, 197
	note A_, 4
	notetype 12, 194
	note D_, 2
	note D_, 2
	notetype 12, 197
	note A#, 4
	notetype 12, 194
	note D_, 2
	note D_, 2
	notetype 12, 197
	octave 4
	note C_, 4
	notetype 12, 194
	octave 3
	note D_, 2
	note D_, 2
	notetype 12, 197
	octave 4
	note C#, 4
	notetype 12, 47
	note D_, 16
	notetype 12, 193
	octave 5
	note D_, 16
	endchannel


Music_IntroBattle_Ch3: ; 7f91d (1f:791d)
	notetype 12, 16
	note __, 8
	octave 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F#, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A#, 4
	note A_, 8
	note D_, 8
	note A#, 8
	note D_, 8
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A#, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A#, 4
	note A_, 16
	note D_, 1
	note __, 15
	endchannel


Music_IntroBattle_Ch4: ; 7f95b (1f:795b)
	notetype 6
	togglenoise 1
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 4
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 4
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A_, 16
	note A_, 16
	note A_, 16
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 4
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 4
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A_, 4
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 8
	note A_, 4
	note A_, 16
	note A_, 16
	note A_, 2
	note __, 16
	note __, 14
	endchannel
; 0x7fa19