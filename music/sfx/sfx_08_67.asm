SFX_08_67_Ch1: ; 20624 (8:4624)
	duty 2
	note D_, 16
	note D#, 16
	rest 1
	note C_, 8

SFX_08_67_branch_2062a:
	note D_, 16
	notetype 15, 12, 0
	note C_, 8
	loopchannel 4, SFX_08_67_branch_2062a
	note D_, 16
	notetype 1, 12, 0
	note C_, 8
	endchannel


SFX_08_67_Ch2: ; 20637 (8:4637)
	dutycycle 179
	note D_, 16
	note D_, 16
	rest 9
	note C_, 8

SFX_08_67_branch_2063d:
	note D_, 16
	rest 16
	rest 8
	note C_, 8
	loopchannel 4, SFX_08_67_branch_2063d
	note D_, 16
	rest 2
	rest 9
	note C_, 8
	endchannel


SFX_08_67_Ch3: ; 2064a (8:464a)
	note D_, 4
	note A_, 8
	note C#, 3
	note D_, 4
	note A#, 2
	note C#, 2
	loopchannel 10, SFX_08_67_Ch3
	endchannel
; 0x20655