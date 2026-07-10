FrameBlockPointers:
	.DW FrameBlock00
	.DW FrameBlock01
	.DW FrameBlock02
	.DW FrameBlock03
	.DW FrameBlock04
	.DW FrameBlock05
	.DW FrameBlock06
	.DW FrameBlock07
	.DW FrameBlock08
	.DW FrameBlock09
	.DW FrameBlock0a
	.DW FrameBlock0b
	.DW FrameBlock0c
	.DW FrameBlock0d
	.DW FrameBlock0e
	.DW FrameBlock0f
	.DW FrameBlock10
	.DW FrameBlock11
	.DW FrameBlock12
	.DW FrameBlock13
	.DW FrameBlock14
	.DW FrameBlock15
	.DW FrameBlock16
	.DW FrameBlock17
	.DW FrameBlock18
	.DW FrameBlock19
	.DW FrameBlock1a
	.DW FrameBlock1b
	.DW FrameBlock1c
	.DW FrameBlock1d
	.DW FrameBlock1e
	.DW FrameBlock1f
	.DW FrameBlock20
	.DW FrameBlock21
	.DW FrameBlock22
	.DW FrameBlock23
	.DW FrameBlock24
	.DW FrameBlock25
	.DW FrameBlock26
	.DW FrameBlock27
	.DW FrameBlock28
	.DW FrameBlock29
	.DW FrameBlock2a
	.DW FrameBlock2b
	.DW FrameBlock2c
	.DW FrameBlock2d
	.DW FrameBlock2e
	.DW FrameBlock2f
	.DW FrameBlock30
	.DW FrameBlock31
	.DW FrameBlock32
	.DW FrameBlock33
	.DW FrameBlock34
	.DW FrameBlock35
	.DW FrameBlock36
	.DW FrameBlock37
	.DW FrameBlock38
	.DW FrameBlock39
	.DW FrameBlock3a
	.DW FrameBlock3b
	.DW FrameBlock3c
	.DW FrameBlock3d
	.DW FrameBlock3e
	.DW FrameBlock3f
	.DW FrameBlock40
	.DW FrameBlock41
	.DW FrameBlock42
	.DW FrameBlock43
	.DW FrameBlock44
	.DW FrameBlock45
	.DW FrameBlock46
	.DW FrameBlock47
	.DW SmallBlackCircleFrameBlock
	.DW LargeBlackCircleFrameBlock
	.DW FrameBlock4a
	.DW FrameBlock4b
	.DW FrameBlock4c
	.DW FrameBlock4d
	.DW FrameBlock4e
	.DW FrameBlock4f
	.DW FrameBlock50
	.DW FrameBlock51
	.DW FrameBlock52
	.DW FrameBlock53
	.DW FrameBlock54
	.DW FrameBlock55
	.DW FrameBlock56
	.DW FrameBlock57
	.DW FrameBlock58
	.DW FrameBlock59
	.DW FrameBlock5a
	.DW FrameBlock5b
	.DW FrameBlock5c
	.DW FrameBlock5d
	.DW FrameBlock5e
	.DW FrameBlock5f
	.DW FrameBlock60
	.DW FrameBlock61
	.DW FrameBlock62
	.DW FrameBlock63
	.DW FrameBlock64
	.DW FrameBlock65
	.DW FrameBlock66
	.DW FrameBlock67
	.DW FrameBlock68
	.DW FrameBlock69
	.DW FrameBlock6a
	.DW FrameBlock6b
	.DW FrameBlock6c
	.DW FrameBlock6d
	.DW FrameBlock6e
	.DW FrameBlock6f
	.DW FrameBlock70
	.DW FrameBlock71
	.DW FrameBlock72
	.DW FrameBlock73
	.DW FrameBlock74
	.DW FrameBlock75
	.DW FrameBlock76
	.DW FrameBlock77
	.DW FrameBlock78
	.DW FrameBlock79

FrameBlock01:
	.DB 9 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2c, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2d, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2c, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3c, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3d, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $3c, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2c, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2d, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2c, OAM_XFLIP | OAM_YFLIP

FrameBlock02:
	.DB 16 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $20, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $21, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $21, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $20, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $30, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $31, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $30, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $30, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $31, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $31, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $30, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $20, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $21, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $21, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $20, OAM_XFLIP | OAM_YFLIP

FrameBlock03:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $02, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $02, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $12, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $12, OAM_XFLIP

FrameBlock04:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $06, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $07, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $16, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $17, 0

FrameBlock05:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $07, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $06, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $17, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $16, OAM_XFLIP

FrameBlock06:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $33, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $33, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $33, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $33, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP | OAM_YFLIP

FrameBlock07:
	.DB 16 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $20, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $21, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $30, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $21, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $20, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $31, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $30, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $30, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $31, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $20, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $21, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $31, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $30, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $21, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $20, OAM_XFLIP | OAM_YFLIP

FrameBlock08:
	.DB 16 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $20, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $21, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $30, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $21, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $20, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $31, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $30, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $30, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $31, OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $20, OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $21, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $31, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $30, OAM_XFLIP | OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $21, OAM_XFLIP | OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $20, OAM_XFLIP | OAM_YFLIP

FrameBlock09:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $24, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $25, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $34, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $25, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $24, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $34, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $34, OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $24, OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $25, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $34, OAM_XFLIP | OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $25, OAM_XFLIP | OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $24, OAM_XFLIP | OAM_YFLIP

FrameBlock0a:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $24, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $25, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $34, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $25, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $24, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $34, OAM_XFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $34, OAM_YFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $24, OAM_YFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $25, OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $34, OAM_XFLIP | OAM_YFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $25, OAM_XFLIP | OAM_YFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $24, OAM_XFLIP | OAM_YFLIP

FrameBlock0b:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $05, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $05, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $15, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $15, OAM_XFLIP

FrameBlock0c:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $04, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $04, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $14, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $14, OAM_XFLIP

FrameBlock0d:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0c, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0d, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1c, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1d, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1d, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1c, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0d, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0c, OAM_XFLIP | OAM_YFLIP

FrameBlock0e:
	.DB 4 ; #
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0c, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0d, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1c, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1d, 0

FrameBlock0f:
	.DB 4 ; #
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1d, OAM_XFLIP | OAM_YFLIP
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1c, OAM_XFLIP | OAM_YFLIP
	.DB ((7 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0d, OAM_XFLIP | OAM_YFLIP
	.DB ((7 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0c, OAM_XFLIP | OAM_YFLIP

FrameBlock10:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0f, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1e, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1f, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $0f, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $0e, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $1f, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $1e, OAM_XFLIP

FrameBlock11:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0f, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1e, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1f, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $0f, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $0e, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $1f, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $1e, OAM_XFLIP

FrameBlock12:
	.DB 3 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $37, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $37, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $37, 0

FrameBlock13:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $36, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $36, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $36, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $36, OAM_XFLIP | OAM_YFLIP

FrameBlock14:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $28, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $28, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $38, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $38, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $36, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $36, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $36, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $36, OAM_XFLIP | OAM_YFLIP

FrameBlock15:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $28, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $28, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $38, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $38, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $29, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $29, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $39, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $39, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $28, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $28, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $38, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $38, OAM_XFLIP

FrameBlock16:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $29, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $29, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $39, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $39, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $29, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $29, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $39, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $39, OAM_XFLIP

FrameBlock17:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $08, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $09, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $18, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $19, 0

FrameBlock18:
	.DB 1 ; #
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $45, OAM_XFLIP | OAM_YFLIP

FrameBlock19:
	.DB 2 ; #
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $45, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $46, OAM_XFLIP | OAM_YFLIP

FrameBlock1a:
	.DB 2 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $45, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $46, 0

FrameBlock1b:
	.DB 2 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $45, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $46, OAM_XFLIP | OAM_YFLIP

FrameBlock1c:
	.DB 2 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $45, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $46, 0

FrameBlock1d:
	.DB 2 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $45, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $46, OAM_XFLIP | OAM_YFLIP

FrameBlock1e:
	.DB 2 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $45, OAM_XFLIP | OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $46, 0

FrameBlock75:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP

FrameBlock1f:
	.DB 2 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP

FrameBlock20:
	.DB 6 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP

FrameBlock21:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP

FrameBlock22:
	.DB 19 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP

FrameBlock23:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0a, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0b, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1a, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1b, 0

FrameBlock24:
	.DB 2 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0a, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0b, 0

FrameBlock25:
	.DB 12 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0a, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0b, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1a, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1b, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $0a, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $0b, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $1a, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $1b, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $0a, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $0b, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $1a, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $1b, 0

FrameBlock26:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $44, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $44, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP | OAM_YFLIP

FrameBlock27:
	.DB 5 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $47, 0

FrameBlock28:
	.DB 6 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $44, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $44, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP | OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $47, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 2, ((2 * TILE_WIDTH) & $FF) + 6, $47, 0

FrameBlock29:
	.DB 4 ; #
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $47, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 2, ((0 * TILE_WIDTH) & $FF) + 6, $47, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 4, ((1 * TILE_WIDTH) & $FF) + 4, $47, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 6, ((2 * TILE_WIDTH) & $FF) + 2, $47, 0

FrameBlock2a:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $44, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $44, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP | OAM_YFLIP

FrameBlock2b:
	.DB 2 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 6, ((0 * TILE_WIDTH) & $FF) + 2, $47, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $47, 0

FrameBlock2c:
	.DB 1 ; #
	.DB ((20 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4d, 0

FrameBlock2d:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $26, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $27, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $36, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $37, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $28, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $29, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $38, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $39, 0

FrameBlock2e:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $27, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $26, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $37, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $36, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $29, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $28, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $39, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $38, OAM_XFLIP

FrameBlock2f:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0c, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0d, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0c, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0d, OAM_YFLIP

FrameBlock30:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $44, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $44, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP | OAM_YFLIP

FrameBlock31:
	.DB 1 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $45, 0

FrameBlock32:
	.DB 7 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4d, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2f, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $4d, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4e, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $07, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $4e, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3f, 0

FrameBlock33:
	.DB 7 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3f, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4e, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $07, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $4e, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4d, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2f, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $4d, OAM_XFLIP | OAM_YFLIP

FrameBlock34:
	.DB 1 ; #
	.DB ((20 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $00, OAM_PAL1

FrameBlock35:
	.DB 6 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2a, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2b, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3a, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3a, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2a, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2b, OAM_YFLIP

FrameBlock36:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $00, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $01, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $10, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $11, 0

FrameBlock37:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $01, OAM_PRIO | OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $00, OAM_PRIO | OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $11, OAM_PRIO | OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $10, OAM_PRIO | OAM_XFLIP

FrameBlock38:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0a, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0b, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1a, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1b, 0

FrameBlock39:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0b, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0a, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1b, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1a, OAM_XFLIP

FrameBlock3a:
	.DB 4 ; #
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $05, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $05, OAM_XFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $15, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $15, OAM_XFLIP

FrameBlock3b:
	.DB 5 ; #
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $04, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $04, OAM_XFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $14, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $14, OAM_XFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0

FrameBlock3c:
	.DB 6 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $05, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $05, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $15, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $15, OAM_XFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $42, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $42, 0

FrameBlock3d:
	.DB 7 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $04, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $04, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $14, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $14, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0

FrameBlock3e:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $05, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $05, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $15, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $15, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $42, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $42, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $42, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $42, 0

FrameBlock3f:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $04, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $04, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $14, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $14, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $41, 0

FrameBlock40:
	.DB 3 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3d, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3d, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3d, 0

FrameBlock41:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $06, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $06, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $16, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $17, 0

FrameBlock42:
	.DB 11 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $42, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $42, 0

FrameBlock43:
	.DB 11 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $41, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $41, 0

FrameBlock44:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $49, 0

FrameBlock45:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $49, 0

FrameBlock46:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0

FrameBlock47:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP

SmallBlackCircleFrameBlock:
	.DB 4 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $33, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $33, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $33, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $33, OAM_XFLIP | OAM_YFLIP

LargeBlackCircleFrameBlock:
	.DB 16 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $22, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $22, OAM_XFLIP | OAM_YFLIP

FrameBlock71:
	.DB 16 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3b, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $22, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $22, OAM_XFLIP | OAM_YFLIP

FrameBlock72:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $22, OAM_XFLIP | OAM_YFLIP

FrameBlock73:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $32, OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $32, OAM_XFLIP | OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP | OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $22, OAM_XFLIP | OAM_YFLIP

FrameBlock74:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $22, OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $23, OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $23, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $22, OAM_XFLIP | OAM_YFLIP

FrameBlock4a:
	.DB 4 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $4c, OAM_XFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $4b, 0
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $4c, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $4b, OAM_YFLIP

FrameBlock4b:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $4c, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4b, OAM_YFLIP
	.DB ((7 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $4c, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $4b, 0

FrameBlock4c:
	.DB 4 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $4a, OAM_YFLIP
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $4a, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $4a, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $4a, OAM_XFLIP | OAM_YFLIP

FrameBlock4d:
	.DB 4 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4a, OAM_XFLIP
	.DB ((7 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $4a, OAM_XFLIP | OAM_YFLIP
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $4a, OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $4a, 0

FrameBlock4e:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $44, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $44, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $44, OAM_XFLIP | OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 6, ((1 * TILE_WIDTH) & $FF) + 2, $44, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 6, ((2 * TILE_WIDTH) & $FF) + 2, $44, OAM_XFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 6, ((1 * TILE_WIDTH) & $FF) + 2, $44, OAM_YFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 6, ((2 * TILE_WIDTH) & $FF) + 2, $44, OAM_XFLIP | OAM_YFLIP

FrameBlock4f:
	.DB 12 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 6, ((4 * TILE_WIDTH) & $FF) + 2, $44, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 6, ((5 * TILE_WIDTH) & $FF) + 2, $44, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 6, ((4 * TILE_WIDTH) & $FF) + 2, $44, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 6, ((5 * TILE_WIDTH) & $FF) + 2, $44, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 6, ((6 * TILE_WIDTH) & $FF) + 2, $47, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $47, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 2, ((2 * TILE_WIDTH) & $FF) + 6, $44, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 2, ((3 * TILE_WIDTH) & $FF) + 6, $44, OAM_XFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 2, ((2 * TILE_WIDTH) & $FF) + 6, $44, OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 2, ((3 * TILE_WIDTH) & $FF) + 6, $44, OAM_XFLIP | OAM_YFLIP
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $47, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 2, ((1 * TILE_WIDTH) & $FF) + 6, $47, 0

FrameBlock50:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 6, ((6 * TILE_WIDTH) & $FF) + 2, $47, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $47, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 2, ((4 * TILE_WIDTH) & $FF) + 6, $47, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 4, ((5 * TILE_WIDTH) & $FF) + 4, $47, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 6, ((3 * TILE_WIDTH) & $FF) + 2, $47, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $47, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 2, ((1 * TILE_WIDTH) & $FF) + 6, $47, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 4, ((2 * TILE_WIDTH) & $FF) + 4, $47, 0

FrameBlock51:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $35, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $35, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $35, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $35, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((8 * TILE_WIDTH) & $FF) + 0, $35, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((8 * TILE_WIDTH) & $FF) + 0, $35, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((8 * TILE_WIDTH) & $FF) + 0, $35, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((8 * TILE_WIDTH) & $FF) + 0, $35, OAM_YFLIP

FrameBlock52:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2a, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2b, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3a, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3b, 0

FrameBlock53:
	.DB 3 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3f, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3f, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 6, $3f, 0

FrameBlock54:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0e, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $0f, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $0f, OAM_XFLIP

FrameBlock55:
	.DB 3 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2c, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $3c, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2d, 0

FrameBlock56:
	.DB 6 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2c, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $3c, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $2d, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $2d, 0

FrameBlock57:
	.DB 9 ; #
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $31, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $2c, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $3c, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $2d, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $2d, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $2d, 0

FrameBlock58:
	.DB 7 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $46, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 2, $47, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 3, $48, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 4, $48, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 5, $48, 0
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 5, $48, 0
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 5, $48, 0

FrameBlock59:
	.DB 1 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $42, 0

FrameBlock5a:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $24, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $25, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $34, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $25, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $24, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $34, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $34, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $24, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $25, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $34, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $25, OAM_XFLIP | OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $24, OAM_XFLIP | OAM_YFLIP

FrameBlock5b:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP

FrameBlock5c:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 2, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP

FrameBlock5d:
	.DB 11 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 2, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 4, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 4, ((1 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 4, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 4, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 4, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP

FrameBlock5e:
	.DB 15 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $43, OAM_YFLIP
	.DB ((5 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $43, OAM_XFLIP | OAM_YFLIP

FrameBlock5f:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $49, 0

FrameBlock60:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $49, 0

FrameBlock61:
	.DB 12 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $49, 0

FrameBlock62:
	.DB 15 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $49, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((7 * TILE_WIDTH) & $FF) + 0, $49, 0

FrameBlock63:
	.DB 6 ; #
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $26, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $27, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $26, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $27, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $26, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $27, 0

FrameBlock64:
	.DB 6 ; #
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $27, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $26, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $27, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $26, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $27, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((5 * TILE_WIDTH) & $FF) + 0, $26, 0

FrameBlock65:
	.DB 6 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1c, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1d, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1c, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1d, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1c, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1d, 0

FrameBlock66:
	.DB 2 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $13, 0

FrameBlock67:
	.DB 1 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0

FrameBlock68:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $03, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $03, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $13, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $13, OAM_XFLIP

FrameBlock69:
	.DB 1 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $06, 0

FrameBlock6a:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $2e, OAM_XFLIP
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2e, OAM_YFLIP
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $2e, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $2f, 0
	.DB ((6 * TILE_WIDTH) & $FF) + 0, ((3 * TILE_WIDTH) & $FF) + 0, $2f, OAM_YFLIP
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3e, 0
	.DB ((3 * TILE_WIDTH) & $FF) + 0, ((6 * TILE_WIDTH) & $FF) + 0, $3e, OAM_XFLIP

FrameBlock6b:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $2e, OAM_XFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2e, OAM_YFLIP
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $2e, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2f, 0
	.DB ((4 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2f, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3e, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((4 * TILE_WIDTH) & $FF) + 0, $3e, OAM_XFLIP

FrameBlock6c:
	.DB 8 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2e, OAM_XFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $2e, OAM_YFLIP
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2e, OAM_XFLIP | OAM_YFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2f, 0
	.DB ((2 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $2f, OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $3e, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $3e, OAM_XFLIP

FrameBlock6d:
	.DB 2 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $1e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $1f, 0

FrameBlock6e:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $48, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $48, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $12, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $12, OAM_XFLIP

FrameBlock6f:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4a, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $07, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $16, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $17, 0

FrameBlock70:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $07, OAM_XFLIP
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $4a, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $17, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $16, OAM_XFLIP

FrameBlock76:
	.DB 7 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((2 * TILE_WIDTH) & $FF) + 0, $2f, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 1, ((1 * TILE_WIDTH) & $FF) + 0, $2f, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 1, ((3 * TILE_WIDTH) & $FF) + 0, $2f, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 2, ((0 * TILE_WIDTH) & $FF) + 0, $2e, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 2, ((4 * TILE_WIDTH) & $FF) + 0, $2e, OAM_XFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 2, ((0 * TILE_WIDTH) & $FF) + 0, $3e, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 2, ((4 * TILE_WIDTH) & $FF) + 0, $3e, OAM_XFLIP

FrameBlock77:
	.DB 4 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 2, $4b, 0
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 2, $4c, 0
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4c, OAM_XFLIP | OAM_YFLIP
	.DB ((1 * TILE_WIDTH) & $FF) + 0, ((1 * TILE_WIDTH) & $FF) + 0, $4b, OAM_XFLIP | OAM_YFLIP

FrameBlock78:
	.DB 1 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4d, 0

FrameBlock79:
	.DB 1 ; #
	.DB ((0 * TILE_WIDTH) & $FF) + 0, ((0 * TILE_WIDTH) & $FF) + 0, $4e, 0

INCLUDE "data/battle_anims/base_coords.asm"

FrameBlock00:
	.DB 0 ; #

	.DB $00 ; unused
