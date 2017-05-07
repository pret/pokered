Music_BattleTowerTheme: ; 178889
	dbw $c0, Music_BattleTowerTheme_Ch1
	dbw $01, Music_BattleTowerTheme_Ch2
	dbw $02, Music_BattleTowerTheme_Ch3
	dbw $03, Music_BattleTowerTheme_Ch4
; 178895

Music_BattleTowerTheme_Ch1: ; 178895
	tempo 141
	volume $77
	tone $0001
	vibrato $12, $34
	stereopanning $f
	notetype $6, $94
Music_BattleTowerTheme_branch_1788a5: ; 1788a5
	note __, 16
	note __, 16
	note __, 12
	note __, 12
	dutycycle $2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 4
	callchannel Music_BattleTowerTheme_branch_17895e
	note G_, 2
	note __, 2
	note C_, 4
	note __, 4
	intensity $92
	note G_, 2
	note F_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note E_, 2
	note G_, 2
	note E_, 2
	octave 3
	note G_, 2
	note E_, 2
	callchannel Music_BattleTowerTheme_branch_17895e
	note G_, 2
	note __, 2
	octave 2
	note A#, 4
	note __, 4
	intensity $92
	octave 3
	note G_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	note F_, 2
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	intensity $93
	note D_, 2
	note __, 2
	note E_, 4
	note F_, 4
	note G_, 2
	note A_, 2
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note C_, 2
	note __, 2
	note D_, 4
	note E_, 4
	note F_, 2
	note G_, 2
	note A_, 8
	octave 2
	note A_, 8
	note A#, 2
	note __, 2
	octave 3
	note C_, 4
	note D_, 4
	note D#, 2
	note F_, 2
	note D#, 4
	note F_, 4
	note G_, 4
	note A#, 4
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note F_, 4
	note __, 4
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	note E_, 4
	note __, 4
	dutycycle $3
	note C_, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note F_, 8
	note F_, 2
	note G_, 2
	note A_, 8
	note G_, 4
	note F_, 4
	note D_, 8
	note A#, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 4
	octave 3
	note F_, 8
	note C#, 2
	note D#, 2
	note F_, 8
	note G_, 4
	note F_, 4
	note F_, 4
	note C_, 8
	note G_, 2
	note F_, 2
	note E_, 8
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note E_, 2
	note C_, 4
	note F_, 8
	note C_, 2
	note F_, 2
	note A_, 8
	note A#, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note F_, 8
	note A#, 4
	octave 4
	note D_, 8
	octave 3
	note A#, 2
	note A_, 2
	note F_, 4
	note G#, 4
	note F_, 8
	note G#, 4
	note F_, 4
	note D#, 4
	note C#, 4
	note F_, 4
	intensity $94
	octave 4
	note C_, 4
	octave 3
	note E_, 6
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 4
	note __, 12
	loopchannel 0, Music_BattleTowerTheme_branch_1788a5
; 17895e

Music_BattleTowerTheme_branch_17895e: ; 17895e
	intensity $94
	note A_, 2
	note __, 2
	note C_, 4
	note __, 4
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note C_, 4
	note F_, 4
	note __, 4
	note A_, 4
	endchannel
; 17896d

Music_BattleTowerTheme_Ch2: ; 17896d
	vibrato $12, $34
Music_BattleTowerTheme_branch_178970: ; 178970
	dutycycle $3
	notetype $6, $b8
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note A_, 4
	note __, 4
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note F_, 4
	note __, 4
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note A_, 4
	note __, 4
	tone $0001
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 4
	note __, 4
	tone $0000
	intensity $b7
	note G_, 2
	octave 4
	note C_, 2
	note E_, 4
	callchannel Music_BattleTowerTheme_branch_178a15
	note A#, 4
	note __, 2
	note F_, 2
	notetype $c, $b7
	note C_, 12
	notetype $6, $b7
	callchannel Music_BattleTowerTheme_branch_178a15
	notetype $c, $b7
	note A#, 2
	note __, 1
	note G_, 1
	note A_, 12
	note A#, 1
	note __, 1
	note A#, 4
	note G_, 1
	note A_, 1
	note A#, 4
	note D_, 4
	note A_, 1
	note __, 1
	note A_, 4
	note G_, 1
	note A_, 1
	note F_, 8
	note G_, 1
	note __, 1
	note G_, 4
	note A#, 1
	note A_, 1
	note A#, 4
	note D#, 4
	note F_, 1
	note __, 1
	note F_, 4
	note G_, 1
	note F_, 1
	note E_, 8
	stereopanning $f0
	dutycycle $2
	note F_, 6
	note A_, 1
	note A#, 1
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	note A_, 2
	note A#, 16
	note A#, 6
	note G_, 1
	note A_, 1
	note A#, 4
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	note A_, 6
	note A#, 1
	note A_, 1
	note G_, 8
	note A_, 6
	note F_, 1
	note A_, 1
	octave 5
	note C_, 4
	note D_, 2
	note D#, 2
	note D_, 6
	note C_, 2
	octave 4
	note A#, 8
	octave 5
	note C#, 6
	note C_, 2
	octave 4
	note A#, 2
	note G#, 2
	note F_, 2
	note G#, 2
	note G_, 5
	note __, 1
	notetype $6, $b7
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 4
	note __, 4
	stereopanning $ff
	dutycycle $3
	octave 3
	note C_, 2
	note D_, 2
	note E_, 4
	loopchannel 0, Music_BattleTowerTheme_branch_178970
; 178a15

Music_BattleTowerTheme_branch_178a15: ; 178a15
	note F_, 2
	note __, 2
	note F_, 8
	note C_, 2
	note F_, 2
	octave 5
	note C_, 8
	octave 4
	note A#, 4
	note A_, 4
	endchannel
; 178a20

Music_BattleTowerTheme_Ch3: ; 178a20
	vibrato $12, $34
	notetype $6, $16
Music_BattleTowerTheme_branch_178a26: ; 178a26
	stereopanning $ff
	callchannel Music_BattleTowerTheme_branch_178afe
	note C_, 2
	note __, 2
	note F_, 4
	note __, 4
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 4
	note __, 4
	stereopanning $f0
	note C_, 8
	callchannel Music_BattleTowerTheme_branch_178afe
	note C_, 2
	note __, 2
	note F_, 4
	note __, 4
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 4
	note C_, 4
	note __, 4
	note C_, 2
	note __, 2
	callchannel Music_BattleTowerTheme_branch_178afe
	octave 2
	note A#, 2
	note __, 2
	octave 3
	note D#, 4
	note __, 4
	octave 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note C_, 4
	note F_, 4
	note __, 4
	note C_, 1
	note __, 1
	note C_, 2
	octave 2
	note A#, 2
	note __, 2
	note A#, 4
	note F_, 4
	octave 3
	note F_, 1
	note __, 1
	note F_, 2
	octave 2
	note A#, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	note F_, 8
	note C_, 2
	note __, 2
	note C_, 4
	octave 2
	note F_, 4
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note C_, 2
	note __, 2
	note F_, 8
	note D#, 2
	note __, 2
	note D#, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 2
	note G_, 2
	note __, 2
	note A#, 2
	note __, 2
	octave 3
	note D#, 8
	note F_, 2
	note __, 2
	note C_, 4
	note __, 4
	note C_, 2
	octave 2
	note F_, 2
	note G_, 4
	note __, 4
	stereopanning $ff
	note G_, 2
	octave 3
	note C_, 2
	note E_, 4
	note F_, 4
	note C_, 8
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 4
	note C_, 6
	note __, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 4
	note D_, 8
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 4
	note A_, 4
	note F_, 4
	note D_, 4
	note F_, 4
	note C#, 8
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 4
	note F_, 8
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 4
	note F_, 8
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 4
	note C_, 4
	note D_, 4
	note E_, 4
	note F_, 4
	note C_, 8
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 4
	note C_, 8
	note F_, 2
	note __, 2
	note F_, 4
	octave 2
	note A#, 8
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 4
	octave 2
	note A#, 4
	octave 3
	note D_, 4
	note E_, 4
	note F_, 4
	octave 2
	note G#, 8
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note G#, 4
	octave 2
	note G#, 8
	octave 3
	note C#, 4
	note C_, 4
	note G_, 8
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 4
	note __, 12
	loopchannel 0, Music_BattleTowerTheme_branch_178a26
; 178afe

Music_BattleTowerTheme_branch_178afe: ; 178afe
	octave 3
	note C_, 2
	note __, 2
	note F_, 4
	note __, 4
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 4
	note C_, 4
	note __, 4
	note C_, 2
	note __, 2
	endchannel
; 178b0d

Music_BattleTowerTheme_Ch4: ; 178b0d
	togglenoise $3
	notetype $c
Music_BattleTowerTheme_branch_178b11: ; 178b11
	callchannel Music_BattleTowerTheme_branch_178b58
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 4
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
Music_BattleTowerTheme_branch_178b1d: ; 178b1d
	callchannel Music_BattleTowerTheme_branch_178b58
	callchannel Music_BattleTowerTheme_branch_178b61
	loopchannel 2, Music_BattleTowerTheme_branch_178b1d
	callchannel Music_BattleTowerTheme_branch_178b6c
	callchannel Music_BattleTowerTheme_branch_178b61
	callchannel Music_BattleTowerTheme_branch_178b6c
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 8
Music_BattleTowerTheme_branch_178b35: ; 178b35
	callchannel Music_BattleTowerTheme_branch_178b76
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	loopchannel 3, Music_BattleTowerTheme_branch_178b35
	callchannel Music_BattleTowerTheme_branch_178b76
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 4
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	loopchannel 0, Music_BattleTowerTheme_branch_178b11
; 178b58

Music_BattleTowerTheme_branch_178b58: ; 178b58
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	endchannel
; 178b61

Music_BattleTowerTheme_branch_178b61: ; 178b61
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	endchannel
; 178b6c

Music_BattleTowerTheme_branch_178b6c: ; 178b6c
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	endchannel
; 178b76

Music_BattleTowerTheme_branch_178b76: ; 178b76
	note D_, 2
	note C#, 2
	note D_, 2
	note D_, 1
	note C#, 1
	note D_, 2
	note C#, 2
	note D_, 2
	note D_, 1
	note C#, 1
	endchannel
; 178b81


