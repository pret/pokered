Music_Pokecenter:
	dbw $80, Music_Pokecenter_Ch1
	dbw $01, Music_Pokecenter_Ch2
	dbw $02, Music_Pokecenter_Ch3

Music_Pokecenter_Ch1: ; be56 (2:7e56)
	tempo 144
	volume 119
	dutycycle 3
	vibrato 10, 34
	

Music_Pokecenter_branch_be61:
	notetype 12, 163
	octave 3
	note F#, 2
	note F_, 2
	note F#, 2
	notetype 12, 181
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	notetype 12, 163
	note A_, 2
	note E_, 2
	note A_, 2
	notetype 12, 181
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	notetype 12, 163
	note F#, 2
	note F_, 2
	note F#, 2
	notetype 12, 181
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	notetype 12, 163
	note A_, 2
	note E_, 2
	note A_, 2
	notetype 12, 181
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note F#, 2
	note E_, 2
	note D_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 4
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 4
	note C#, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note A_, 8
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 4
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 4
	note G_, 2
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	loopchannel 0, Music_Pokecenter_branch_be61


Music_Pokecenter_Ch2: ; bef9 (2:7ef9)
	vibrato 8, 37

Music_Pokecenter_branch_befc:
	callchannel Music_Pokecenter_branch_bf4e
	dutycycle 3
	notetype 12, 165
	octave 3
	note A_, 4
	note E_, 4
	callchannel Music_Pokecenter_branch_bf60
	note D_, 2
	note F#, 6
	dutycycle 3
	notetype 12, 165
	octave 3
	note A_, 4
	note E_, 4
	callchannel Music_Pokecenter_branch_bf4e
	dutycycle 3
	notetype 12, 165
	octave 3
	note A_, 4
	note E_, 4
	callchannel Music_Pokecenter_branch_bf60
	note D_, 8
	dutycycle 3
	notetype 12, 165
	octave 3
	note D_, 4
	note E_, 4
	dutycycle 2
	notetype 12, 198
	octave 4
	note F#, 8
	note A_, 8
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 8
	note C#, 8
	note E_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	note F#, 8
	note A_, 8
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 8
	note A_, 4
	note G_, 2
	note F#, 2
	note G_, 8
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 8
	loopchannel 0, Music_Pokecenter_branch_befc

Music_Pokecenter_branch_bf4e:
	dutycycle 2
	notetype 12, 194
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	notetype 12, 195
	note A_, 4
	note G_, 4
	note F#, 2
	note E_, 2
	note C#, 6
	endchannel

Music_Pokecenter_branch_bf60:
	dutycycle 2
	notetype 12, 194
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	notetype 12, 195
	note F#, 4
	note E_, 4
	note C#, 2
	endchannel


Music_Pokecenter_Ch3: ; bf70 (2:7f70)
	notetype 12, 16

Music_Pokecenter_branch_bf72:
	octave 4
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	callchannel Music_Pokecenter_branch_bfd9
	callchannel Music_Pokecenter_branch_bfe2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	callchannel Music_Pokecenter_branch_bfd9
	callchannel Music_Pokecenter_branch_bfe2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	callchannel Music_Pokecenter_branch_bfeb
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	callchannel Music_Pokecenter_branch_bfeb
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	loopchannel 0, Music_Pokecenter_branch_bf72

Music_Pokecenter_branch_bfd9:
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	endchannel

Music_Pokecenter_branch_bfe2:
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	endchannel

Music_Pokecenter_branch_bfeb:
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	endchannel
; 0xbff4