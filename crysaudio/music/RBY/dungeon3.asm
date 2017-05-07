Music_Dungeon3:
	dbw $80, Music_Dungeon3_Ch1
	dbw $01, Music_Dungeon3_Ch2
	dbw $02, Music_Dungeon3_Ch3

Music_Dungeon3_Ch1: ; 7e9f1 (1f:69f1)
	tempo 160
	volume 119
	dutycycle 3
	
	vibrato 8, 20

Music_Dungeon3_branch_7e9fc:
	notetype 12, 195

Music_Dungeon3_branch_7e9fe:
	callchannel Music_Dungeon3_branch_7eab2
	loopchannel 3, Music_Dungeon3_branch_7e9fe
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	note D#, 2
	note E_, 2

Music_Dungeon3_branch_7ea11:
	callchannel Music_Dungeon3_branch_7eac1
	loopchannel 4, Music_Dungeon3_branch_7ea11

Music_Dungeon3_branch_7ea18:
	callchannel Music_Dungeon3_branch_7eab2
	loopchannel 4, Music_Dungeon3_branch_7ea18
	octave 4
	note F_, 2
	note F_, 2
	note __, 2
	note F_, 2
	note E_, 2
	note E_, 2
	note D#, 2
	note D#, 2
	note __, 2
	note D#, 2
	note D_, 2
	note D_, 2
	callchannel Music_Dungeon3_branch_7eafc
	octave 4
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note D#, 2
	note D#, 2
	note E_, 2
	note E_, 2
	note __, 2
	note E_, 2
	note F_, 2
	note F_, 2

Music_Dungeon3_branch_7ea3c:
	callchannel Music_Dungeon3_branch_7eace
	loopchannel 4, Music_Dungeon3_branch_7ea3c

Music_Dungeon3_branch_7ea43:
	callchannel Music_Dungeon3_branch_7eadd
	loopchannel 3, Music_Dungeon3_branch_7ea43
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	note F_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	note F_, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note F_, 2
	note G#, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note E_, 2
	octave 4
	note C_, 2
	callchannel Music_Dungeon3_branch_7eaea
	callchannel Music_Dungeon3_branch_7eaea
	octave 3
	note G#, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note E_, 2
	note __, 16
	note __, 8
	callchannel Music_Dungeon3_branch_7eaf7
	callchannel Music_Dungeon3_branch_7eaf7
	callchannel Music_Dungeon3_branch_7eaf7
	callchannel Music_Dungeon3_branch_7eaf7
	note D#, 2
	note __, 16
	note __, 16
	loopchannel 0, Music_Dungeon3_branch_7e9fc

Music_Dungeon3_branch_7eab2:
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	endchannel

Music_Dungeon3_branch_7eac1:
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	endchannel

Music_Dungeon3_branch_7eace:
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note D#, 2
	octave 2
	note B_, 2
	endchannel

Music_Dungeon3_branch_7eadd:
	note A_, 2
	note F_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	note F_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	note F_, 2
	endchannel

Music_Dungeon3_branch_7eaea:
	octave 3
	note G#, 2
	note E_, 2
	note G#, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note E_, 2
	octave 4
	note C_, 2
	endchannel

Music_Dungeon3_branch_7eaf7:
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	endchannel

Music_Dungeon3_branch_7eafc:
	tempo 168
	octave 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	tempo 176
	octave 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	tempo 184
	octave 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	tempo 192
	octave 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	tempo 200
	octave 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	tempo 208
	octave 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	note D_, 1
	tempo 216
	octave 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	note C#, 1
	tempo 224
	octave 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 2
	note C_, 1
	tempo 160
	endchannel


Music_Dungeon3_Ch2: ; 7eb68 (1f:6b68)
	vibrato 11, 21
	dutycycle 3

Music_Dungeon3_branch_7eb6d:
	notetype 12, 211
	octave 4
	note D#, 6
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	note A#, 2
	note B_, 6
	octave 4
	note C#, 8
	note __, 2
	note G#, 6
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note D#, 2
	note E_, 6
	note F#, 6
	note E_, 4
	note D#, 6
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	note A#, 2
	note B_, 6
	octave 4
	note C#, 8
	note __, 2
	note G#, 2
	note G#, 2
	note __, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A#, 2
	note A#, 2
	note __, 2
	note A#, 2
	note B_, 2
	note B_, 2
	note __, 8
	note __, 8
	note __, 8
	note __, 8
	note __, 8
	note __, 8
	note __, 8
	note __, 8
	octave 4
	note B_, 2
	note B_, 2
	note __, 2
	note B_, 2
	note A#, 2
	note A#, 2
	note A_, 2
	note A_, 2
	note __, 2
	note A_, 2
	note G#, 2
	note G#, 2
	note C#, 8
	note __, 2
	octave 3
	note B_, 6
	note A#, 2
	note B_, 2
	octave 4
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 6
	note G_, 6
	octave 3
	note G_, 8
	note __, 2
	note F_, 6
	note E_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note G_, 6
	note F_, 2
	note G_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note G_, 6
	note A_, 6
	octave 4
	note C#, 6
	note G_, 8
	note __, 2
	note F_, 6
	note E_, 2
	note F_, 2
	note A_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note G_, 6
	note A_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note G_, 6
	note A_, 6
	octave 5
	note C#, 6
	octave 4
	note F#, 8
	note __, 2
	note E_, 6
	note D#, 2
	note E_, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note G#, 6
	octave 5
	note C_, 6
	octave 3
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 2
	note E_, 2
	note G#, 2
	octave 3
	note C_, 2
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	note E_, 2
	note G#, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note C_, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 0, Music_Dungeon3_branch_7eb6d


Music_Dungeon3_Ch3: ; 7ec7a (1f:6c7a)
	notetype 12, 18
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	notetype 6, 16
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note __, 2
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note __, 16
	note __, 16
	note __, 10
	octave 5
	note E_, 8
	octave 4
	note B_, 8
	octave 5
	note D#, 8
	octave 4
	note A#, 8
	octave 5
	note D_, 8
	octave 4
	note A_, 8
	octave 5
	note C#, 8
	octave 4
	note G#, 8
	octave 5
	note C_, 8
	octave 4
	note G_, 8
	note B_, 8
	note F#, 8
	note A#, 8
	note F_, 8
	note A_, 8
	note E_, 8
	note __, 16
	note __, 16
	note __, 8
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note __, 2
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note __, 10
	note __, 16
	notetype 12, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 10
	loopchannel 0, Music_Dungeon3_Ch3
