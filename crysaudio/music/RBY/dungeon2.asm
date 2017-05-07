Music_Dungeon2:
	dbw $C0, Music_Dungeon2_Ch1
	dbw $01, Music_Dungeon2_Ch2
	dbw $02, Music_Dungeon2_Ch3
	dbw $03, Music_Dungeon2_Ch4

Music_Dungeon2_Ch1: ; 7e887 (1f:6887)
	tempo 144
	volume 119
	dutycycle 3
	
	vibrato 10, 20

Music_Dungeon2_branch_7e892:
	notetype 12, 178
	octave 4
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	octave 5
	note C#, 4
	note C#, 4
	note C#, 4
	note C#, 4
	octave 3
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	octave 2
	note G_, 2
	note A#, 4
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A#, 2
	note B_, 2
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A_, 4
	note F#, 2
	loopchannel 2, Music_Dungeon2_branch_7e892
	notetype 12, 31
	octave 3
	note E_, 16
	note C_, 16
	note D_, 16
	octave 2
	note A#, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_Dungeon2_branch_7e892


Music_Dungeon2_Ch2: ; 7e8d8 (1f:68d8)
	vibrato 11, 21

Music_Dungeon2_branch_7e8db:
	dutycycle 3
	notetype 12, 194
	octave 3
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	octave 4
	note F#, 4
	note F#, 4
	note F#, 4
	note F#, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note F#, 4
	loopchannel 2, Music_Dungeon2_branch_7e8db
	octave 3
	note E_, 2
	note G_, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note E_, 2
	octave 5
	note E_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 2
	note C#, 2
	note C_, 2
	octave 4
	note E_, 2
	note G_, 2
	octave 3
	note A#, 2
	note C#, 2
	note A#, 2
	note A_, 2
	note A#, 2
	note G_, 2
	octave 5
	note G_, 2
	note __, 2
	note F#, 2
	note __, 2
	note F_, 2
	note __, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype 12, 199
	dutycycle 1
	octave 4
	note E_, 16
	note D_, 16
	note C_, 16
	note D_, 16
	loopchannel 0, Music_Dungeon2_branch_7e8db


Music_Dungeon2_Ch3: ; 7e93b (1f:693b)
	notetype 12, 19
	vibrato 8, 38

Music_Dungeon2_branch_7e940:
	callchannel Music_Dungeon2_branch_7e9d1
	loopchannel 16, Music_Dungeon2_branch_7e940
	note E_, 4
	note __, 4
	note __, 4
	note E_, 4
	note C_, 4
	note __, 4
	note __, 4
	note C_, 4
	note D_, 4
	note __, 4
	note __, 4
	note D_, 4
	octave 3
	note A#, 4
	note __, 4
	note __, 4
	note A#, 4

Music_Dungeon2_branch_7e958:
	octave 5
	note E_, 2
	note __, 2
	note B_, 2
	note __, 2
	note A#, 2
	note __, 2
	octave 6
	note D_, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 5
	note G#, 2
	note __, 2
	note G_, 2
	note __, 2
	note B_, 2
	note __, 2
	note A#, 2
	note __, 2
	note E_, 2
	note __, 2
	note D#, 2
	note __, 2
	note A_, 2
	note __, 2
	note G#, 2
	note __, 2
	note E_, 2
	note __, 2
	note F#, 2
	note __, 2
	note D#, 2
	note __, 2
	loopchannel 3, Music_Dungeon2_branch_7e958
	octave 4
	note E_, 4
	note B_, 4
	note A#, 4
	octave 5
	note D_, 4
	note C#, 4
	octave 4
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
	octave 3
	note E_, 16
	note C_, 16
	note D_, 16
	octave 2
	note A#, 16
	octave 3
	note E_, 16
	note F_, 16
	note G_, 16
	octave 3
	note B_, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	callchannel Music_Dungeon2_branch_7e9d1
	callchannel Music_Dungeon2_branch_7e9d1
	callchannel Music_Dungeon2_branch_7e9d1
	callchannel Music_Dungeon2_branch_7e9d1
	callchannel Music_Dungeon2_branch_7e9d1
	callchannel Music_Dungeon2_branch_7e9d1
	callchannel Music_Dungeon2_branch_7e9d1
	callchannel Music_Dungeon2_branch_7e9d1
	loopchannel 0, Music_Dungeon2_branch_7e940
	octave 2
	note G_, 2
	note A#, 4
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A#, 2
	note G_, 2
	note __, 2
	endchannel

Music_Dungeon2_branch_7e9d1:
	octave 4
	note E_, 2
	note __, 4
	octave 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	octave 4
	note F#, 4
	endchannel


Music_Dungeon2_Ch4: ; 7e9dc (1f:69dc)
	notetype 12
	togglenoise 1

Music_Dungeon2_branch_7e9dd:
	note E_, 4
	note F_, 4
	note E_, 4
	note D_, 4
	note E_, 4
	note F_, 4
	note D#, 4
	note C#, 4
	loopchannel 0, Music_Dungeon2_branch_7e9dd
; 0x7e9f1