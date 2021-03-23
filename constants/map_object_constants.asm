; spritestatedata1 struct members (see macros/wram.asm)
	const_def
	const SPRITESTATEDATA1_PICTUREID             ; 0
	const SPRITESTATEDATA1_MOVEMENTSTATUS        ; 1
	const SPRITESTATEDATA1_IMAGEINDEX            ; 2
	const SPRITESTATEDATA1_YSTEPVECTOR           ; 3
	const SPRITESTATEDATA1_YPIXELS               ; 4
	const SPRITESTATEDATA1_XSTEPVECTOR           ; 5
	const SPRITESTATEDATA1_XPIXELS               ; 6
	const SPRITESTATEDATA1_INTRAANIMFRAMECOUNTER ; 7
	const SPRITESTATEDATA1_ANIMFRAMECOUNTER      ; 8
	const SPRITESTATEDATA1_FACINGDIRECTION       ; 9
	const SPRITESTATEDATA1_YADJUSTED             ; a
	const SPRITESTATEDATA1_XADJUSTED             ; b
	const SPRITESTATEDATA1_COLLISIONDATA         ; c
	const SPRITESTATEDATA1_0D                    ; d
	const SPRITESTATEDATA1_0E                    ; e
	const SPRITESTATEDATA1_0F                    ; f
SPRITESTATEDATA1_LENGTH EQU const_value

; spritestatedata2 struct members (see macros/wram.asm)
	const_def
	const SPRITESTATEDATA2_WALKANIMATIONCOUNTER ; 0
	const SPRITESTATEDATA2_01                   ; 1
	const SPRITESTATEDATA2_YDISPLACEMENT        ; 2
	const SPRITESTATEDATA2_XDISPLACEMENT        ; 3
	const SPRITESTATEDATA2_MAPY                 ; 4
	const SPRITESTATEDATA2_MAPX                 ; 5
	const SPRITESTATEDATA2_MOVEMENTBYTE1        ; 6
	const SPRITESTATEDATA2_GRASSPRIORITY        ; 7
	const SPRITESTATEDATA2_MOVEMENTDELAY        ; 8
	const SPRITESTATEDATA2_ORIGFACINGDIRECTION  ; 9
	const SPRITESTATEDATA2_0A                   ; a
	const SPRITESTATEDATA2_0B                   ; b
	const SPRITESTATEDATA2_0C                   ; c
	const SPRITESTATEDATA2_PICTUREID            ; d
	const SPRITESTATEDATA2_IMAGEBASEOFFSET      ; e
	const SPRITESTATEDATA2_0F                   ; f
SPRITESTATEDATA2_LENGTH EQU const_value

; different kinds of people events
ITEM    EQU $80
TRAINER EQU $40

WALK EQU $FE
STAY EQU $FF

ANY_DIR    EQU $00
UP_DOWN    EQU $01
LEFT_RIGHT EQU $02
DOWN       EQU $D0
UP         EQU $D1
LEFT       EQU $D2
RIGHT      EQU $D3
NONE       EQU $FF

BOULDER_MOVEMENT_BYTE_2 EQU $10
