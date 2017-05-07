Music_Shop:
	dbw $c0, Music_Shop_Ch1
	dbw $01, Music_Shop_Ch2
	dbw $02, Music_Shop_Ch3
	dbw $03, Music_Shop_Ch4

Music_Shop_Ch1:
	tempo $90
	volume $77
	dutycycle 1
	notetype $C, $B2
;Channel1_Bar1:
	octave 4
	note C#, 4
	note C#, 4
	note C_, 2
	note C_, 4
	octave 3
	note B_, 6
;Channel1_Bar2:
	note A#, 12
;Channel1_Bar3:
Music_Shop_Loop1:
	note D#, 4
	octave 2
	note A#, 2
	octave 3
	note D#, 4
	octave 2
	note F#, 4
	octave 3
	note D#, 4
;Channel1_Bar4:
	octave 2
	note F#, 2
	note B_, 2
	note F#, 4
	octave 3
	note D#, 4
	octave 2
	note B_, 2
;Channel1_Bar5:
	note A_, 4
	note F#, 2
	octave 3
	note D#, 4
	octave 2
	note A_, 4
	octave 3
	note D#, 4
;Channel1_Bar6:
	octave 2
	note F#, 2
	note A_, 2
	note F#, 4
	octave 3
	note D#, 4
	octave 2
	note A_, 2
;Channel1_Bar7:
	note G#, 4
	note B_, 2
	note E_, 4
	note B_, 4
	note G#, 4
;Channel1_Bar8:
	note F_, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 4
	octave 3
	note D_, 4
	note F_, 2
;Channel1_Bar9:
	note B_, 4
	note F#, 2
	note B_, 2
	note F#, 2
	intensity $B4
	note F_, 2
	note F#, 2
	note G#, 2
;Channel1_Bar10:
	note A#, 16
;Channel1_Bar11:
	dutycycle 2
	note A#, 4
	note B_, 2
	note D#, 4
	note F#, 4
	note D#, 1
	note F#, 1
;Channel1_Bar12:
	note B_, 2
	note F#, 2
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
;Channel1_Bar13:
	octave 3
	note A_, 4
	note B_, 2
	note D#, 4
	note F#, 4
	note D#, 1
	note F#, 1
;Channel1_Bar14:
	note A_, 2
	note D#, 2
	note F#, 2
	note B_, 4
	note A_, 4
	note F#, 1
	note A_, 1
;Channel1_Bar15:
	note B_, 4
	note B_, 2
	note E_, 4
	note B_, 4
	note E_, 4
;Channel1_Bar16:
	octave 2
	note F_, 2
	octave 3
	note D_, 2
	note F_, 4
	note D_, 4
	note G#, 2
;Channel1_Bar17:
	note B_, 4
	note F#, 2
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note F#, 2
	note F_, 2
	note F#, 2
	note G#, 2
;Channel1_Bar18:
	note A#, 8
	note E_, 2
	note C#, 2
	note F#, 2
	note E_, 2
;Channel1_Bar19:
	intensity $B1
	dutycycle 0
	note D#, 2
	octave 2
	note G_, 2
	note A#, 2
	note G_, 4
	note A#, 4
	octave 3
	note D#, 4
;Channel1_Bar20:
	octave 2
	note G_, 2
	note A#, 2
	note G_, 4
	octave 3
	note D#, 4
	octave 2
	note A#, 2
;Channel1_Bar21:
	octave 3
	note D#, 2
	octave 2
	note G#, 2
	note B_, 2
	note G#, 4
	octave 3
	note D#, 4
	octave 2
	note B_, 4
;Channel1_Bar22:
	note G#, 2
	note B_, 2
	note G#, 4
	octave 3
	note D#, 4
	octave 2
	note G#, 2
;Channel1_Bar23:
	intensity $B4
	dutycycle 1
	octave 3
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note A#, 2
	note A_, 2
	note A#, 2
	octave 4
	note D#, 2
;Channel1_Bar24:
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	octave 4
	note D#, 1
	note D_, 1
	note D#, 2
	note F_, 1
	note E_, 1
	note F_, 2
	note G_, 1
	note F#, 1
	note G_, 2
;Channel1_Bar25:
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 4
	note D#, 4
	note C#, 4
;Channel1_Bar26:
	octave 4
	note C#, 2
	note D#, 2
	octave 3
	note B_, 4
	note D#, 4
	octave 2
	note G#, 2
;Channel1_Bar27:
	intensity $B2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G#, 4
	note B_, 4
	note D#, 2
;Channel1_Bar28:
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note G#, 4
	note F_, 4
	note D_, 2
;Channel1_Bar29:
	note C#, 2
	octave 2
	note F#, 2
	note A#, 2
	octave 3
	note C#, 2
	note F#, 2
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
;Channel1_Bar30:
	octave 4
	note C#, 2
	octave 3
	note B_, 4
	note A#, 10
;Channel1_Bar31:
	loopchannel 0, Music_Shop_Loop1

Music_Shop_Ch2:
	dutycycle 2
	notetype $C, $B1
;Channel2_Bar1:
	octave 4
	note F#, 4
	note F#, 4
	note F#, 2
	note F#, 4
	note F#, 6
;Channel2_Bar2:
	intensity $C5
	note F#, 6
	dutycycle 1
	octave 3
	note F#, 2
	note G#, 2
	note A#, 2
;Channel2_Bar3:
Music_Shop_Loop2:
	octave 4
	note C#, 3
	octave 3
	note F#, 1
	octave 4
	note D#, 2
	octave 3
	note B_, 8
	note B_, 1
	octave 4
	note C#, 1
;Channel2_Bar4:
	note D#, 2
	note D_, 2
	note D#, 2
	note E_, 6
	note D#, 1
	note E_, 1
	note F#, 2
;Channel2_Bar5:
	note C#, 3
	octave 3
	note F#, 1
	octave 4
	note D#, 2
	octave 3
	note B_, 8
	note B_, 1
	octave 4
	note C#, 1
;Channel2_Bar6:
	note D#, 2
	note D_, 2
	note D#, 2
	note G#, 6
	note E_, 1
	note D#, 1
	note C#, 2
;Channel2_Bar7:
	note D#, 3
	octave 3
	note G#, 1
	octave 4
	note E_, 2
	note C#, 12
;Channel2_Bar8:
	octave 3
	note G#, 6
	note A#, 4
	note B_, 4
;Channel2_Bar9:
	octave 4
	note D#, 6
	note E_, 1
	note D#, 1
	note C#, 2
	octave 3
	note B_, 2
	note A#, 2
	note B_, 2
;Channel2_Bar10:
	intensity $C2
	octave 4
	note C#, 8
	note B_, 2
	note F#, 2
	note E_, 2
	note D#, 2
;Channel2_Bar11:
	intensity $C5
	note C#, 3
	octave 3
	note F#, 1
	octave 4
	note D#, 2
	octave 3
	note B_, 8
	note B_, 1
	octave 4
	note C#, 1
;Channel2_Bar12:
	note D#, 6
	note E_, 4
	note D#, 2
	note E_, 2
	note F#, 2
;Channel2_Bar13:
	note C#, 3
	octave 3
	note F#, 1
	octave 4
	note D#, 2
	octave 3
	note B_, 8
	note B_, 1
	octave 4
	note C#, 1
;Channel2_Bar14:
	notetype 6, $C5
	note D#, 11
	note G_, 1
	note G#, 8
	note F#, 8
	octave 3
	note B_, 2
	octave 4
	note C#, 2
;Channel2_Bar15:
	note D#, 6
	octave 3
	note G#, 2
	octave 4
	note E_, 4
	note C#, 16
	note __, 8
;Channel2_Bar16:
	octave 3
	note G#, 4
	note G_, 4
	note G#, 4
	note A#, 4
	note G#, 4
	note A#, 4
	note B_, 3
	octave 4
	note D_, 1
;Channel2_Bar17:
	note D#, 12
	note E_, 2
	note D#, 2
	note C#, 4
	octave 3
	note B_, 4
	note A#, 4
	note B_, 4
;Channel2_Bar18:
	notetype $C, $C5
	octave 4
	note C#, 12
	dutycycle 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
;Channel2_Bar19:
	note D#, 4
	note D#, 4
	note D#, 2
	note D_, 2
	notetype 6, $C5
	note D#, 3
	note G#, 1
	note A#, 12
;Channel2_Bar20:
	note G_, 8
	note D#, 8
	note C#, 8
;Channel2_Bar21:
	note C#, 6
	note C#, 1
	note D_, 1
	note D#, 4
	octave 3
	note B_, 8
	note A#, 4
	note B_, 4
	octave 4
	note C#, 12
;Channel2_Bar22:
	note D#, 4
	note G#, 12
	octave 3
	note B_, 4
	octave 4
	note C#, 4
;Channel2_Bar23:
	note D#, 8
	note D#, 8
	note D#, 4
	note D_, 4
	note D#, 3
	note G#, 1
	note A#, 12
;Channel2_Bar24:
	note G_, 2
	note F#, 2
	note G_, 4
	note G#, 2
	note G_, 2
	note G#, 4
	note A#, 2
	note A_, 2
	note A#, 4
;Channel2_Bar25:
	note A#, 8
	note B_, 4
	note G#, 8
	note G_, 4
	note G#, 4
	note A#, 12
;Channel2_Bar26:
	note B_, 4
	note G#, 7
	dutycycle 0
	octave 5
	note C_, 1
	note C#, 4
	octave 4
	note B_, 4
	note A#, 4
;Channel2_Bar27:
	notetype $C, $C5
	note B_, 15
	notetype 6, $C5
	note G#, 1
	note A#, 1
;Channel2_Bar28:
	notetype $C, $C5
	note B_, 10
	note G#, 2
	note A#, 2
	note B_, 2
;Channel2_Bar29:
	note A#, 10
	note G#, 2
	note A#, 2
	note G#, 2
;Channel2_Bar30:
	note A#, 2
	note G#, 4
	note F#, 10
;Channel2_Bar31:
	dutycycle 1
	loopchannel 0, Music_Shop_Loop2

Music_Shop_Ch3:
	notetype $C, $14
;Channel3_Bar1:
	octave 4
	note D#, 1
	note __, 3
	note D#, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note C#, 1
	note __, 5
;Channel3_Bar2:
	octave 3
	note F#, 5
	note __, 7
;Channel3_Bar3:
Music_Shop_Loop3:
	octave 2
	note B_, 4
	note __, 2
	note B_, 1
	note __, 1
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
;Channel3_Bar4:
	note B_, 4
	note __, 2
	note B_, 1
	note __, 1
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
;Channel3_Bar5:
	note B_, 4
	note __, 2
	note B_, 1
	note __, 1
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
;Channel3_Bar6:
	note B_, 4
	note __, 2
	note B_, 1
	note __, 1
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
;Channel3_Bar7:
	note E_, 4
	note __, 2
	note E_, 1
	note __, 1
	note B_, 4
	note __, 2
	note B_, 1
	note __, 1
;Channel3_Bar8:
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note B_, 4
	note __, 2
	note B_, 1
	note __, 1
;Channel3_Bar9:
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
	octave 3
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
;Channel3_Bar10:
	octave 2
	note F#, 2
	note __, 14
	callchannel Music_Shop_Branch
	callchannel Music_Shop_Branch
	callchannel Music_Shop_Branch
	callchannel Music_Shop_Branch
;Channel3_Bar15:
	note E_, 4
	intensity $24
	octave 6
	note G#, 1
	intensity $14
	octave 2
	note __, 1
	note E_, 1
	note __, 1
	note B_, 4
	intensity $24
	octave 5
	note G#, 1
	intensity $14
	octave 2
	note __, 1
	note B_, 1
	note __, 1
;Channel3_Bar16:
	note F_, 4
	intensity $24
	octave 6
	note G#, 1
	intensity $14
	octave 2
	note __, 1
	note F_, 1
	note __, 1
	note B_, 4
	intensity $24
	octave 5
	note G#, 1
	intensity $14
	octave 2
	note __, 1
	note B_, 1
	note __, 1
;Channel3_Bar17:
	note F#, 4
	intensity $24
	octave 6
	note F#, 1
	intensity $14
	octave 2
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note F#, 4
	intensity $24
	octave 5
	note F#, 1
	intensity $14
	octave 2
	note __, 1
	octave 3
	note F#, 1
	octave 2
	note __, 1
;Channel3_Bar18:
	note F#, 2
	note __, 6
	octave 3
	note C#, 4
	octave 2
	note F#, 4
;Channel3_Bar19:
	note D#, 4
	note __, 2
	note D#, 1
	note __, 1
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
;Channel3_Bar20:
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	note D#, 4
	note G_, 4
;Channel3_Bar21:
	note G#, 4
	note __, 2
	note G#, 1
	note __, 1
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
;Channel3_Bar22:
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
	note F_, 4
	note E_, 4
;Channel3_Bar23:
	note D#, 4
	octave 4
	note A#, 1
	octave 2
	note __, 1
	note D#, 1
	note __, 1
	note G_, 4
	octave 4
	note G_, 1
	octave 2
	note __, 1
	note G_, 1
	note __, 1
;Channel3_Bar24:
	note A#, 4
	octave 4
	note A#, 1
	octave 2
	note __, 1
	note A#, 1
	note __, 1
	note D#, 4
	note G_, 4
;Channel3_Bar25:
	note G#, 4
	intensity $24
	octave 6
	note D#, 1
	intensity $14
	octave 2
	note __, 1
	note G#, 1
	note __, 1
	note G_, 4
	intensity $24
	octave 6
	note D#, 1
	intensity $14
	octave 2
	note __, 1
	note G_, 1
	note __, 1
;Channel3_Bar26:
	note F#, 4
	intensity $24
	octave 6
	note D#, 1
	intensity $14
	octave 2
	note __, 1
	note F#, 1
	note __, 1
	note F_, 4
	intensity $24
	octave 6
	note D#, 1
	intensity $14
	octave 2
	note __, 1
	note F_, 1
	note __, 1
;Channel3_Bar27:
	note E_, 4
	intensity $24
	octave 6
	note G#, 1
	intensity $14
	octave 2
	note __, 1
	note E_, 1
	note __, 1
	octave 1
	note B_, 4
	intensity $24
	octave 5
	note G#, 1
	intensity $14
	octave 1
	note __, 1
	note B_, 1
	note __, 1
;Channel3_Bar28:
	octave 2
	note F_, 4
	intensity $24
	octave 6
	note G#, 1
	intensity $14
	octave 2
	note __, 1
	note F_, 1
	note __, 1
	octave 1
	note B_, 4
	intensity $24
	octave 6
	note D_, 1
	intensity $14
	octave 1
	note __, 1
	note B_, 1
	note __, 1
;Channel3_Bar29:
	octave 2
	note F#, 4
	intensity $24
	octave 6
	note F#, 1
	intensity $14
	octave 2
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note C#, 4
	intensity $24
	octave 5
	note F#, 1
	intensity $14
	octave 3
	note __, 1
	note C#, 1
	note __, 1
;Channel3_Bar30:
	octave 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	note F#, 3
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
;Channel3_Bar31:
	loopchannel 0, Music_Shop_Loop3
Music_Shop_Branch:
	note B_, 4
	intensity $24
	octave 6
	note F#, 1
	intensity $14
	octave 2
	note __, 1
	note B_, 1
	note __, 1
	note F#, 4
	intensity $24
	octave 5
	note F#, 1
	intensity $14
	octave 2
	note __, 1
	note F#, 1
	note __, 1
	endchannel

Music_Shop_Ch4:
	notetype $C
	togglenoise 0
;Channel4_Bar1:
	note G_, 4
	note G_, 4
	note G_, 2
	note G_, 4
	note G_, 6
;Channel4_Bar2:
	note A#, 12
;Channel4_Bar3:
Music_Shop_Loop4:
	note A#, 4
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar4:
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
;Channel4_Bar5:
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar6:
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
;Channel4_Bar7:
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar8:
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
;Channel4_Bar9:
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar10:
	note G_, 16
;Channel4_Bar11:
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar12:
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
;Channel4_Bar13:
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar14:
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
;Channel4_Bar15:
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar16:
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
;Channel4_Bar17:
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar18:
	note G_, 16
;Channel4_Bar19:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar20:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar21:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar22:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar23:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar24:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar25:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar26:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar27:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar28:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar29:
	note A#, 4
	note G_, 2
	note D_, 2
	note A#, 4
	note G_, 2
	note D_, 2
;Channel4_Bar30:
	note G_, 2
	note A#, 4
	note A#, 4
	note D_, 2
	note G_, 2
	note G_, 2
;Channel4_Bar31:
	loopchannel 0, Music_Shop_Loop4
