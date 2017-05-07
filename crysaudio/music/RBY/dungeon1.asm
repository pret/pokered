Music_Dungeon1:
	dbw $C0, Music_Dungeon1_Ch1
	dbw $01, Music_Dungeon1_Ch2
	dbw $02, Music_Dungeon1_Ch3
	dbw $03, Music_Dungeon1_Ch4

Music_Dungeon1_Ch1: ; 7ded1 (1f:5ed1)
	tempo 144
	volume 119
	dutycycle 3	
	vibrato 10, 20
	notetype 12, 77
	note __, 8
	unknownmusic0xee 237
	octave 4
	note F#, 8
	unknownmusic0xee 255

Music_Dungeon1_branch_7dee5:
	notetype 12, 178
	octave 3

Music_Dungeon1_branch_7dee8:
	callchannel Music_Dungeon1_branch_7dfaa
	loopchannel 3, Music_Dungeon1_branch_7dee8
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	note __, 1
	note A#, 1
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1

Music_Dungeon1_branch_7deff:
	callchannel Music_Dungeon1_branch_7dfaa
	loopchannel 4, Music_Dungeon1_branch_7deff
	callchannel Music_Dungeon1_branch_7dfd5
	octave 3
	note G_, 1
	note F#, 1
	note E_, 1
	note G_, 1
	callchannel Music_Dungeon1_branch_7dfd5
	octave 3
	note A_, 1
	note G_, 1
	note E_, 1
	note A_, 1
	callchannel Music_Dungeon1_branch_7dfd5
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	notetype 12, 195
	note G_, 4
	note F#, 4
	note E_, 4
	note D#, 4
	notetype 12, 194
	callchannel Music_Dungeon1_branch_7dfc5
	octave 3
	note B_, 3
	callchannel Music_Dungeon1_branch_7dfc5
	note C_, 3
	callchannel Music_Dungeon1_branch_7dfc5
	note C#, 3
	notetype 12, 195
	octave 3
	note G_, 4
	note F#, 4
	note E_, 4
	note D#, 4
	note E_, 4
	note D#, 4
	note C_, 4
	octave 2
	note B_, 4
	notetype 12, 194
	note B_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note G#, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note G#, 1
	note B_, 1
	octave 3
	note C#, 1
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note C#, 1
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note D_, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	note D_, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1

Music_Dungeon1_branch_7df6e:
	note __, 16
	loopchannel 8, Music_Dungeon1_branch_7df6e
	notetype 12, 195
	callchannel Music_Dungeon1_branch_7dfbb
	note B_, 2
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A_, 4
	note F#, 2
	callchannel Music_Dungeon1_branch_7dfbb
	note A#, 2
	note G_, 2
	note B_, 4
	note G_, 2
	note F#, 2
	note G_, 2
	note D#, 2
	notetype 12, 194
	callchannel Music_Dungeon1_branch_7dfc5
	octave 3
	note B_, 3
	callchannel Music_Dungeon1_branch_7dfc5
	note C_, 3
	callchannel Music_Dungeon1_branch_7dfc5
	note C#, 3
	notetype 12, 199
	octave 3
	note F#, 8
	note D#, 8
	notetype 12, 194
	callchannel Music_Dungeon1_branch_7dfaa
	callchannel Music_Dungeon1_branch_7dfaa
	loopchannel 0, Music_Dungeon1_branch_7dee5

Music_Dungeon1_branch_7dfaa:
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	note __, 1
	note A#, 1
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	note __, 1
	note A#, 1
	endchannel

Music_Dungeon1_branch_7dfbb:
	octave 2
	note G_, 2
	note A#, 4
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A#, 2
	endchannel

Music_Dungeon1_branch_7dfc5:
	octave 3
	note E_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note B_, 1
	note E_, 1
	octave 4
	note C_, 1
	endchannel

Music_Dungeon1_branch_7dfd5:
	note E_, 1
	note E_, 1
	note __, 4
	octave 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	endchannel


Music_Dungeon1_Ch2: ; 7dfde (1f:5fde)
	vibrato 11, 21
	dutycycle 3
	notetype 12, 15
	octave 4
	note G#, 8
	notetype 12, 77
	octave 5
	note D_, 8

Music_Dungeon1_branch_7dfeb:
	notetype 12, 194

Music_Dungeon1_branch_7dfed:
	callchannel Music_Dungeon1_branch_7e097
	loopchannel 3, Music_Dungeon1_branch_7dfed
	octave 2
	note E_, 1
	note E_, 1
	note B_, 1
	octave 3
	note C_, 1
	note __, 2
	note C_, 1
	octave 2
	note B_, 1
	note E_, 1
	note E_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note D#, 1

Music_Dungeon1_branch_7e006:
	callchannel Music_Dungeon1_branch_7e097
	loopchannel 4, Music_Dungeon1_branch_7e006
	note __, 2
	callchannel Music_Dungeon1_branch_7e0ab
	octave 3
	note C_, 4
	callchannel Music_Dungeon1_branch_7e0ab
	octave 3
	note C#, 4
	callchannel Music_Dungeon1_branch_7e0ab
	octave 3
	note D#, 4
	notetype 12, 211
	octave 4
	note E_, 4
	note D#, 4
	note C_, 4
	octave 3
	note B_, 4
	notetype 12, 210
	callchannel Music_Dungeon1_branch_7e0b5
	octave 3
	note F#, 4
	callchannel Music_Dungeon1_branch_7e0b5
	octave 3
	note G_, 4
	callchannel Music_Dungeon1_branch_7e0b5
	octave 3
	note A#, 4
	notetype 12, 211
	octave 4
	note E_, 4
	note D#, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note G_, 4
	note F#, 2
	notetype 12, 214
	note E_, 8
	note F_, 8
	note F#, 8
	note G_, 8
	notetype 12, 210
	callchannel Music_Dungeon1_branch_7e0ba
	note __, 10
	note E_, 1
	note __, 1
	callchannel Music_Dungeon1_branch_7e0ba
	note __, 12
	callchannel Music_Dungeon1_branch_7e0ba
	note __, 12
	callchannel Music_Dungeon1_branch_7e0ba
	note __, 14
	notetype 12, 211
	callchannel Music_Dungeon1_branch_7e0cd
	note D#, 4
	callchannel Music_Dungeon1_branch_7e0cd
	note D#, 2
	note __, 2
	notetype 12, 210
	callchannel Music_Dungeon1_branch_7e0c0
	note __, 2
	octave 3
	note F#, 4
	octave 2
	note E_, 1
	note E_, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 1
	note C#, 1
	note __, 2
	octave 3
	note G_, 4
	callchannel Music_Dungeon1_branch_7e0c0
	octave 3
	note A#, 4
	notetype 12, 214
	note B_, 8
	octave 4
	note D#, 8
	notetype 12, 210
	callchannel Music_Dungeon1_branch_7e097
	callchannel Music_Dungeon1_branch_7e097
	loopchannel 0, Music_Dungeon1_branch_7dfeb

Music_Dungeon1_branch_7e097:
	octave 2
	note E_, 1
	note E_, 1
	note B_, 1
	octave 3
	note C_, 1
	note __, 2
	note C_, 1
	octave 2
	note B_, 1
	note E_, 1
	note E_, 1
	note B_, 1
	octave 3
	note C_, 1
	note __, 2
	note C_, 1
	octave 2
	note B_, 1
	endchannel

Music_Dungeon1_branch_7e0ab:
	octave 2
	note E_, 1
	note E_, 1
	note __, 2
	octave 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	endchannel

Music_Dungeon1_branch_7e0b5:
	octave 2
	note E_, 1
	note E_, 1
	note __, 10
	endchannel

Music_Dungeon1_branch_7e0ba:
	octave 1
	note E_, 1
	note G_, 1
	note E_, 1
	note D#, 1
	endchannel

Music_Dungeon1_branch_7e0c0:
	octave 2
	note E_, 1
	note E_, 1
	octave 4
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note C_, 1
	endchannel

Music_Dungeon1_branch_7e0cd:
	octave 3
	note E_, 6
	note G_, 6
	note E_, 4
	note A_, 6
	octave 4
	note C_, 6
	octave 3
	note B_, 4
	note G_, 6
	note A#, 6
	note F#, 4
	note E_, 6
	note F#, 6
	endchannel


Music_Dungeon1_Ch3: ; 7e0dc (1f:60dc)
	notetype 12, 17
	vibrato 8, 38
	note __, 14
	octave 4
	note D_, 1
	note D#, 1

Music_Dungeon1_branch_7e0e5:
	callchannel Music_Dungeon1_branch_7e140
	callchannel Music_Dungeon1_branch_7e140
	octave 5
	note E_, 2
	note __, 4
	octave 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	octave 4
	note F#, 4
	callchannel Music_Dungeon1_branch_7e154
	octave 4
	note G_, 4
	callchannel Music_Dungeon1_branch_7e154
	octave 4
	note A_, 4
	note B_, 4
	note A#, 4
	note G_, 4
	note F#, 4
	note __, 6
	callchannel Music_Dungeon1_branch_7e177
	note B_, 4
	note A#, 4
	note G_, 4
	note F#, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note D#, 4
	callchannel Music_Dungeon1_branch_7e15e
	note __, 12
	callchannel Music_Dungeon1_branch_7e15e
	note __, 12
	callchannel Music_Dungeon1_branch_7e15e
	note __, 10
	note E_, 1
	note __, 1
	callchannel Music_Dungeon1_branch_7e15e
	note __, 12
	callchannel Music_Dungeon1_branch_7e15e
	note __, 12
	callchannel Music_Dungeon1_branch_7e15e
	note __, 10
	note D_, 1
	note D#, 1
	callchannel Music_Dungeon1_branch_7e164
	callchannel Music_Dungeon1_branch_7e164
	note E_, 2
	note __, 4
	callchannel Music_Dungeon1_branch_7e177
	note B_, 8
	note F#, 6
	note D_, 1
	note D#, 1
	note __, 16
	note __, 16
	loopchannel 0, Music_Dungeon1_branch_7e0e5

Music_Dungeon1_branch_7e140:
	octave 5
	note E_, 4
	note B_, 4
	note A#, 4
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note G#, 4
	note G_, 4
	note B_, 4
	note A#, 4
	note E_, 4
	note D#, 4
	note A_, 4
	note G#, 4
	note E_, 4
	note F#, 4
	note D#, 4
	endchannel

Music_Dungeon1_branch_7e154:
	octave 6
	note E_, 1
	note E_, 1
	note __, 4
	octave 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	endchannel

Music_Dungeon1_branch_7e15e:
	octave 3
	note E_, 1
	note G_, 1
	note E_, 1
	note D#, 1
	endchannel

Music_Dungeon1_branch_7e164:
	note E_, 4
	note B_, 4
	note A#, 4
	octave 4
	note D_, 4
	note C#, 4
	octave 3
	note G#, 4
	note G_, 4
	note B_, 4
	note A#, 4
	note E_, 4
	note D#, 4
	note A_, 4
	note G#, 4
	note E_, 4
	note F#, 4
	note D#, 4
	endchannel

Music_Dungeon1_branch_7e177:
	octave 4
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note F#, 4
	note __, 6
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note G_, 4
	note __, 6
	note E_, 1
	note __, 3
	note E_, 1
	note E_, 1
	note A#, 4
	endchannel


Music_Dungeon1_Ch4: ; 7e18a (1f:618a)
	notetype 12
	togglenoise 1
	note __, 14
	note E_, 1
	note E_, 1

Music_Dungeon1_branch_7e190:
	callchannel Music_Dungeon1_branch_7e1f1
	loopchannel 3, Music_Dungeon1_branch_7e190
	note F_, 4
	note E_, 4
	note F_, 4
	note E_, 2
	note E_, 2

Music_Dungeon1_branch_7e1a1:
	callchannel Music_Dungeon1_branch_7e1f1
	loopchannel 3, Music_Dungeon1_branch_7e1a1
	note F_, 4
	note E_, 4
	note F_, 4
	note F_, 4

Music_Dungeon1_branch_7e1b0:
	callchannel Music_Dungeon1_branch_7e1fa
	loopchannel 3, Music_Dungeon1_branch_7e1b0
	callchannel Music_Dungeon1_branch_7e202

Music_Dungeon1_branch_7e1ba:
	callchannel Music_Dungeon1_branch_7e1fa
	loopchannel 3, Music_Dungeon1_branch_7e1ba
	callchannel Music_Dungeon1_branch_7e202
	note C#, 4
	note D_, 4
	note D_, 4
	note __, 2
	note C#, 2
	note F_, 4

Music_Dungeon1_branch_7e1cf:
	note __, 16
	loopchannel 13, Music_Dungeon1_branch_7e1cf
	note __, 12

Music_Dungeon1_branch_7e1d5:
	callchannel Music_Dungeon1_branch_7e1fa
	loopchannel 3, Music_Dungeon1_branch_7e1d5
	note E_, 4
	note E_, 4
	note E_, 4
	note __, 2
	note E_, 1
	note E_, 1
	callchannel Music_Dungeon1_branch_7e1f1
	callchannel Music_Dungeon1_branch_7e1f1
	loopchannel 0, Music_Dungeon1_branch_7e190

Music_Dungeon1_branch_7e1f1:
	note F_, 4
	note E_, 4
	note F_, 4
	note E_, 4
	endchannel

Music_Dungeon1_branch_7e1fa:
	note E_, 1
	note E_, 1
	note __, 10
	note F#, 4
	endchannel

Music_Dungeon1_branch_7e202:
	note C#, 4
	note D_, 4
	note D_, 4
	note D#, 4
	endchannel
; 0x7e20b