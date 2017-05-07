Music_Evolution: ; f06e1
	dbw $c0, Music_Evolution_Ch1
	dbw $01, Music_Evolution_Ch2
	dbw $02, Music_Evolution_Ch3
	dbw $03, Music_Evolution_Ch4
; f06ed

Music_Evolution_Ch1: ; f06ed
	ftempo 132
	volume $77
	vibrato $6, $34
	tone $0001
	dutycycle $2
	notetype $c, $92
	octave 3
	unknownmusic0xe0 $0, $4a
	note C_, 1
	unknownmusic0xe0 $0, $4a
	note G_, 1
	unknownmusic0xe0 $0, $4a
	note C_, 1
	unknownmusic0xe0 $0, $4a
	note G_, 1
	note __, 4
	dutycycle $3
	stereopanning $f
Music_Evolution_branch_f0713: ; f0713
	callchannel Music_Evolution_branch_f0737
	notetype $c, $a4
	note F#, 4
	callchannel Music_Evolution_branch_f0737
	notetype $c, $a4
	note F#, 4
	loopchannel 2, Music_Evolution_branch_f0713
	callchannel Music_Evolution_branch_f0743
	notetype $c, $a4
	note G#, 4
	callchannel Music_Evolution_branch_f0743
	notetype $c, $a4
	note G#, 4
	loopchannel 0, Music_Evolution_branch_f0713
; f0737

Music_Evolution_branch_f0737: ; f0737
	notetype $c, $a2
	octave 3
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	endchannel
; f0743

Music_Evolution_branch_f0743: ; f0743
	notetype $c, $a2
	octave 3
	note D_, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note D_, 4
	endchannel
; f074f

Music_Evolution_Ch2: ; f074f
	dutycycle $2
	vibrato $8, $25
	notetype $c, $a2
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note __, 4
	dutycycle $3
	stereopanning $f0
Music_Evolution_branch_f0761: ; f0761
	callchannel Music_Evolution_branch_f0787
	notetype $c, $b5
	note A_, 4
	callchannel Music_Evolution_branch_f0787
	notetype $c, $b5
	note B_, 4
	loopchannel 2, Music_Evolution_branch_f0761
	callchannel Music_Evolution_branch_f0793
	notetype $c, $b5
	note B_, 4
	callchannel Music_Evolution_branch_f0793
	notetype $c, $b5
	octave 4
	note C#, 4
	octave 3
	loopchannel 0, Music_Evolution_branch_f0761
; f0787

Music_Evolution_branch_f0787: ; f0787
	notetype $c, $b2
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	endchannel
; f0793

Music_Evolution_branch_f0793: ; f0793
	notetype $c, $b2
	octave 3
	note A_, 4
	note E_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	endchannel
; f079f

Music_Evolution_Ch3: ; f079f
	notetype $c, $16
	note __, 8
Music_Evolution_branch_f07a3: ; f07a3
	callchannel Music_Evolution_branch_f07bf
	octave 3
	note A_, 4
	callchannel Music_Evolution_branch_f07bf
	octave 3
	note B_, 4
	loopchannel 2, Music_Evolution_branch_f07a3
	callchannel Music_Evolution_branch_f07d5
	octave 3
	note B_, 4
	callchannel Music_Evolution_branch_f07d5
	octave 4
	note C#, 4
	loopchannel 0, Music_Evolution_branch_f07a3
; f07bf

Music_Evolution_branch_f07bf: ; f07bf
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	endchannel
; f07d5

Music_Evolution_branch_f07d5: ; f07d5
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	endchannel
; f07eb

Music_Evolution_Ch4: ; f07eb
	togglenoise $5
	notetype $c
	note __, 8
Music_Evolution_branch_f07f0: ; f07f0
	stereopanning $f0
	note A#, 6
	note A#, 4
	stereopanning $f
	note E_, 2
	note E_, 2
	note E_, 2
	loopchannel 0, Music_Evolution_branch_f07f0
; f07fd


