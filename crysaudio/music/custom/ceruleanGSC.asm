Music_CeruleanGSC: ; f5127
	dbw $c0, Music_CeruleanGSC_Ch1
	dbw $01, Music_CeruleanGSC_Ch2
	dbw $02, Music_CeruleanGSC_Ch3
	dbw $03, Music_CeruleanGSC_Ch4

Music_CeruleanGSC_Ch1:
	tempo $94
	volume $77
	notetype $C, $B2
	dutycycle 2
	octave 4
	note E_, 2
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
Music_CeruleanGSC_Loop1:
	intensity $B1
	octave 3
	note G#, 2
	octave 4
	note G#, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
	octave 3
	note B_, 2
	octave 4
	note G#, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	note D#, 2
	note B_, 2
	note D#, 2
	note B_, 2
	octave 3
	note B_, 4
	note B_, 2
	note G#, 1
	note G#, 1
	note E_, 2
	note F#, 2
	intensity $B4
	note G#, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 6
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A_, 8
	intensity $B2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 1
	note G#, 1
	note E_, 2
	note F#, 2
	intensity $B4
	note G#, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 6
	note G#, 1
	note B_, 1
	octave 4
	note D#, 8
	octave 3
	note E_, 2
	note E_, 1
	note F#, 1
	note G#, 1
	note __, 3
	note B_, 4
	note G#, 4
	note B_, 2
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	note __, 3
	note D#, 4
	octave 3
	note B_, 4
	note A_, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note __, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	note E_, 1
	note __, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	octave 5
	note B_, 1
	note F#, 1
	note D#, 1
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	note D#, 1
	note F#, 1
	note B_, 8
	intensity $B6
	octave 3
	note G#, 8
	note G#, 4
	note B_, 4
	octave 4
	note E_, 4
	note F#, 4
	note G#, 8
;Channel1_Bar16:
	note D#, 8
	octave 3
	note B_, 4
	octave 4
	note B_, 4
;Channel1_Bar17:
	note A_, 4
	note B_, 4
	intensity $B2
	note E_, 2
	note D#, 2
	note C#, 2
	note C_, 2
;Channel1_Bar18:
	loopchannel 0, Music_CeruleanGSC_Loop1

Music_CeruleanGSC_Ch2:
;Channel2_Bar1:
	vibrato 12,$34
	dutycycle 2
	notetype 2, $C2
	note __, 2
	notetype 12, $C2
	octave 5
	note E_, 2
	note D#, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	octave 5
	note C#, 2
	notetype 2, $C2
	note D#, 10
;Channel2_Bar2:
Music_CeruleanGSC_Loop2:
	notetype 12, $C2
	note E_, 6
	octave 3
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 2
	note D#, 2
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
;Channel2_Bar3:
	intensity $C4
	note G#, 6
	note A_, 1
	note G#, 1
	note F#, 14
;Channel2_Bar4:
	intensity $C2
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 2
	note D#, 2
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
;Channel2_Bar5:
	intensity $C4
	note G#, 6
	note E_, 1
	note G#, 1
	note B_, 14
;Channel2_Bar6:
	intensity $C2
	dutycycle 1
	octave 4
	note E_, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 2
	note D#, 2
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
;Channel2_Bar7:
	intensity $C4
	note G#, 6
	note A_, 1
	note G#, 1
	note F#, 8
;Channel2_Bar8:
	intensity $C2
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 2
	note E_, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 2
	note D#, 2
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
;Channel2_Bar9:
	intensity $C4
	note G#, 6
	note E_, 1
	note G#, 1
	note B_, 8
;Channel2_Bar10:
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 1
	note E_, 1
	note __, 3
	unknownmusic0xde 10
	dutycycle 0
	octave 4
	note G#, 4
	note E_, 4
;Channel2_Bar11:
	unknownmusic0xde 85
	dutycycle 1
	octave 3
	note D#, 1
	note C#, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note __, 3
	unknownmusic0xde 10
	dutycycle 0
	octave 4
	note B_, 4
	note F#, 4
;Channel2_Bar12:
	unknownmusic0xde 85
	dutycycle 1
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 1
	note E_, 1
	note __, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
;Channel2_Bar13:
	note B_, 1
	note F#, 1
	note D#, 1
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 1
	note F#, 1
	note B_, 8
;Channel2_Bar14:
	unknownmusic0xde 10
	intensity $C6
	dutycycle 2
	octave 4
	note E_, 8
	octave 3
	note B_, 4
	octave 4
	note F#, 4
;Channel2_Bar15:
	note G#, 4
	note A_, 4
	note B_, 8
;Channel2_Bar16:
	note B_, 8
	note G#, 4
	octave 5
	note D#, 4
;Channel2_Bar17:
	note C#, 4
	note D#, 4
	unknownmusic0xde 170
	notetype 2, $C2
	note __, 2
	notetype 12, $C2
	note E_, 2
	note D#, 2
	note C#, 2
	notetype 2, $C2
	note D#, 10
;Channel2_Bar18:
	loopchannel 0, Music_CeruleanGSC_Loop2

Music_CeruleanGSC_Ch3:
	notetype 6, $15
	vibrato 12, $24
;Channel3_Bar1:
	note __, 16
	octave 4
	note E_, 3
	note __, 1
	note D#, 3
	note __, 1
	note C#, 3
	note __, 1
	note C_, 3
	note __, 1
;Channel3_Bar2:
Music_CeruleanGSC_Loop3:
	octave 1
	note E_, 2
	note __, 6
	note E_, 2
	note __, 4
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note F#, 2
	note __, 6
	note F#, 2
	note __, 4
	octave 2
	note C#, 2
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note E_, 2
	note __, 6
	note E_, 2
	note __, 4
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note F#, 2
	note __, 6
	note F#, 2
	note __, 4
	octave 2
	note C#, 2
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	octave 4
	note B_, 2
	octave 3
	note B_, 2
	octave 1
	note E_, 2
	note __, 2
	octave 5
	note G#, 1
	note __, 3
	octave 1
	note E_, 2
	note __, 2
	octave 5
	note G#, 1
	note __, 1
	octave 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	octave 5
	note G#, 1
	note __, 1
	octave 2
	note E_, 2
	octave 1
	note E_, 2
	octave 2
	note E_, 2
	octave 5
	note G#, 1
	note __, 1
	octave 1
	note E_, 2
	note F#, 2
	note __, 2
	octave 6
	note C#, 1
	note __, 3
	octave 1
	note F#, 2
	note __, 2
	octave 6
	note C#, 1
	note __, 1
	octave 2
	note C#, 2
	octave 1
	note B_, 2
	note __, 2
	octave 6
	note D#, 1
	note __, 1
	octave 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	octave 6
	note D#, 1
	note __, 1
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 5
	note E_, 2
	octave 1
	note E_, 2
	note __, 2
	octave 5
	note G#, 1
	note __, 1
	octave 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	octave 5
	note G#, 1
	note __, 1
	octave 2
	note E_, 2
	octave 1
	note E_, 2
	octave 2
	note E_, 2
	octave 5
	note G#, 1
	note __, 1
	octave 1
	note E_, 2
	note F#, 2
	note __, 2
	octave 5
	note E_, 1
	note __, 3
	octave 1
	note F#, 2
	note __, 2
	octave 5
	note E_, 1
	note __, 1
	octave 2
	note C#, 2
	octave 1
	note B_, 2
	note __, 2
	octave 5
	note F#, 1
	note __, 1
	octave 1
	note B_, 2
	note G#, 2
	octave 4
	note D#, 2
	octave 5
	note G#, 1
	note __, 1
	octave 3
	note G#, 2
	octave 2
	note C#, 2
	note __, 6
	note C#, 2
	note __, 4
	note C#, 1
	note __, 1
	note C#, 2
	note __, 2
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note C#, 2
	note __, 2
	octave 3
	note C#, 2
	note __, 2
	octave 1
	note G#, 2
	note __, 6
	note G#, 2
	note __, 4
	note G#, 1
	note __, 1
	note G#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 2
	octave 1
	note G#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 2
	octave 1
	note A_, 4
	octave 2
	note A_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	note G#, 4
	octave 2
	note G#, 2
	note __, 2
	octave 1
	note G#, 2
	note __, 2
	note F#, 4
	octave 2
	note F#, 2
	note __, 2
	octave 1
	note F#, 2
	note __, 2
	note B_, 2
	note __, 2
	note B_, 8
	note __, 16
	note __, 4
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 6
	note E_, 2
	note __, 2
	octave 1
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 6
	note F#, 2
	note __, 2
	octave 1
	note F#, 2
	note __, 2
	octave 2
	note F#, 2
	note __, 6
	note F#, 2
	note __, 2
	octave 1
	note F#, 2
	note __, 2
	octave 2
	note F#, 2
	note __, 6
	note G#, 2
	note __, 2
	octave 1
	note G#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 6
	note G#, 2
	note __, 2
	octave 1
	note G#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 6
	note A_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 6
	note A_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	loopchannel 0, Music_CeruleanGSC_Loop3

Music_CeruleanGSC_Ch4:
	notetype $C
	togglenoise 0
;Channel4_Bar1:
	note __, 16
;Channel4_Bar2:
Music_CeruleanGSC_Loop4:
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
;Channel4_Bar3:
	note A_, 2
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
;Channel4_Bar4:
	note A_, 2
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
;Channel4_Bar5:
	note A_, 2
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
	note F_, 1
;Channel4_Bar6:
	note A_, 2
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
;Channel4_Bar7:
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note A#, 2
;Channel4_Bar8:
	note F_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
;Channel4_Bar9:
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note A#, 2
	note D_, 2
	note D_, 1
	note F_, 1
;Channel4_Bar10:
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
;Channel4_Bar11:
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note A#, 2
;Channel4_Bar12:
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note A_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note A_, 2
	note G_, 1
	note G_, 1
;Channel4_Bar13:
	note D_, 2
	note D_, 2
	note D_, 12
;Channel4_Bar14:
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
;Channel4_Bar15:
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
;Channel4_Bar16:
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
;Channel4_Bar17:
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note D_, 2
	note F_, 1
	note F_, 1
;Channel4_Bar18:
	loopchannel 0, Music_CeruleanGSC_Loop4
