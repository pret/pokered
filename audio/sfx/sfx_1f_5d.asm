SFX_1f_5d_Ch1: ; 7c45e (1f:445e)
	duty 2
IF _RED
	unknownsfx0x20 4, 244, 0, 7
	unknownsfx0x20 3, 228, 128, 6
	unknownsfx0x20 3, 228, 192, 6
	unknownsfx0x20 3, 228, 0, 7
	unknownsfx0x20 2, 228, 160, 7
ELSE
	unknownsfx0x20 3, 228, 0, 6
	unknownsfx0x20 3, 228, 128, 6
	unknownsfx0x20 3, 228, 192, 6
	unknownsfx0x20 3, 228, 0, 7
	unknownsfx0x20 15, 242, 224, 7
ENDC
	endchannel


SFX_1f_5d_Ch2: ; 7c475 (1f:4475)
	duty 2
IF _RED
	unknownsfx0x20 4, 8, 0, 0
	unknownsfx0x20 3, 212, 1, 7
	unknownsfx0x20 3, 196, 129, 6
	unknownsfx0x20 3, 196, 193, 6
	unknownsfx0x20 3, 196, 1, 7
	unknownsfx0x20 2, 196, 161, 7
ELSE
	unknownsfx0x20 3, 8, 0, 0
	unknownsfx0x20 3, 196, 1, 6
	unknownsfx0x20 3, 196, 129, 6
	unknownsfx0x20 3, 196, 193, 6
	unknownsfx0x20 3, 196, 1, 7
	unknownsfx0x20 15, 210, 225, 7
ENDC
	endchannel
; 0x7c490
