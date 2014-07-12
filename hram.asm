
H_SPRITEWIDTH           EQU $FF8B ; in bytes
H_SPRITEINTERLACECOUNTER EQU $FF8B
H_SPRITEHEIGHT          EQU $FF8C ; in bytes
H_SPRITEOFFSET          EQU $FF8D

hSoftReset EQU $FF8A
; Initialized to 16.
; Decremented each input iteration if the player
; presses the reset sequence (A+B+SEL+START).
; Soft reset when 0 is reached.

; counters for blinking down arrow
H_DOWNARROWBLINKCNT1 EQU $FF8B
H_DOWNARROWBLINKCNT2 EQU $FF8C

; Note: the following multiplication and division addresses are used for multiple purposes
; and so they overlap with each other

H_MULTIPLICAND EQU $FF96 ; 3 bytes, big endian order
H_MULTIPLIER   EQU $FF99 ; 1 byte
H_PRODUCT      EQU $FF95 ; 4 bytes, big endian order

H_DIVIDEND     EQU $FF95 ; 4 bytes, big endian order
H_DIVISOR      EQU $FF99 ; 1 byte
H_QUOTIENT     EQU $FF95 ; 4 bytes, big endian order
H_REMAINDER    EQU $FF99 ; 1 byte

; used to convert numbers to decimal
H_PASTLEADINGZEROES EQU $FF95 ; flag to indicate that a nonzero digit has been printed
H_NUMTOPRINT        EQU $FF96 ; 3 bytes, big endian order
H_POWEROFTEN        EQU $FF99 ; 3 bytes, big endian order
H_SAVEDNUMTOPRINT   EQU $FF9C ; 3 bytes, big endian order (to back out of a subtraction)

hJoyHeldLast     EQU $FFB1
hJoyReleased  EQU $FFB2
hJoyPressed   EQU $FFB3
hJoyHeld EQU $FFB4

H_LOADEDROMBANK     EQU $FFB8

; is automatic background transfer during V-blank enabled?
; if nonzero, yes
; if zero, no
H_AUTOBGTRANSFERENABLED EQU $FFBA

TRANSFERTOP    EQU 0
TRANSFERMIDDLE EQU 1
TRANSFERBOTTOM EQU 2

; 00 = top third of background
; 01 = middle third of background
; 02 = bottom third of background
H_AUTOBGTRANSFERPORTION EQU $FFBB

; the destination address of the automatic background transfer
H_AUTOBGTRANSFERDEST EQU $FFBC ; 2 bytes

; temporary storage for stack pointer during memory transfers that use pop
; to increase speed
H_SPTEMP EQU $FFBF ; 2 bytes

; source address for VBlankCopyBgMap function
; the first byte doubles as the byte that enabled the transfer.
; if it is 0, the transfer is disabled
; if it is not 0, the transfer is enabled
; this means that XX00 is not a valid source address
H_VBCOPYBGSRC EQU $FFC1 ; 2 bytes

; destination address for VBlankCopyBgMap function
H_VBCOPYBGDEST EQU $FFC3 ; 2 bytes

; number of rows for VBlankCopyBgMap to copy
H_VBCOPYBGNUMROWS EQU $FFC5

; size of VBlankCopy transfer in 16-byte units
H_VBCOPYSIZE EQU $FFC6

; source address for VBlankCopy function
H_VBCOPYSRC EQU $FFC7

; destination address for VBlankCopy function
H_VBCOPYDEST EQU $FFC9

; size of source data for VBlankCopyDouble in 8-byte units
H_VBCOPYDOUBLESIZE EQU $FFCB

; source address for VBlankCopyDouble function
H_VBCOPYDOUBLESRC EQU $FFCC

; destination address for VBlankCopyDouble function
H_VBCOPYDOUBLEDEST EQU $FFCE

; controls whether a row or column of 2x2 tile blocks is redrawn in V-blank
; 00 = no redraw
; 01 = redraw column
; 02 = redraw row
H_SCREENEDGEREDRAW EQU $FFD0

REDRAWCOL EQU 1
REDRAWROW EQU 2

H_SCREENEDGEREDRAWADDR EQU $FFD1

hRandomAdd EQU $FFD3
hRandomSub EQU $FFD4

H_FRAMECOUNTER EQU $FFD5 ; decremented every V-blank (used for delays)

; V-blank sets this to 0 each time it runs.
; So, by setting it to a nonzero value and waiting for it to become 0 again,
; you can detect that the V-blank handler has run since then.
H_VBLANKOCCURRED EQU $FFD6

H_CURRENTSPRITEOFFSET EQU $FFDA ; multiple of $10

H_WHOSETURN EQU $FFF3 ; 0 on player’s turn, 1 on enemy’s turn

hJoyInput EQU $FFF8

