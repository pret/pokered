SFX_08_67_Ch1: ; 20624 (8:4624)
	duty 2
	unknownsfx0x20 15, 63, 192, 7

SFX_08_67_branch_2062a:
	unknownsfx0x20 15, 223, 192, 7
	loopchannel 4, SFX_08_67_branch_2062a
	unknownsfx0x20 15, 209, 192, 7
	endchannel


SFX_08_67_Ch2: ; 20637 (8:4637)
	dutycycle 179
	unknownsfx0x20 15, 47, 200, 7

SFX_08_67_branch_2063d:
	unknownsfx0x20 15, 207, 199, 7
	loopchannel 4, SFX_08_67_branch_2063d
	unknownsfx0x20 15, 193, 200, 7
	endchannel


SFX_08_67_Ch3: ; 2064a (8:464a)
	unknownnoise0x20 3, 151, 18
	unknownnoise0x20 3, 161, 17
	loopchannel 10, SFX_08_67_Ch3
	endchannel
