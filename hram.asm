
H_SPRITEWIDTH            EQU $FF8B ; in tiles
H_SPRITEINTERLACECOUNTER EQU $FF8B
H_SPRITEHEIGHT           EQU $FF8C ; in tiles
H_SPRITEOFFSET           EQU $FF8D

hSoftReset EQU $FF8A
; Initialized to 16.
; Decremented each input iteration if the player
; presses the reset sequence (A+B+SEL+START).
; Soft reset when 0 is reached.

hBaseTileID EQU $FF8B

hItemPrice EQU $FF8B

; counters for blinking down arrow
H_DOWNARROWBLINKCNT1 EQU $FF8B
H_DOWNARROWBLINKCNT2 EQU $FF8C

H_SPRITEDATAOFFSET EQU $FF8B
H_SPRITEINDEX      EQU $FF8C

; DisplayTextID's argument
hSpriteIndexOrTextID EQU $FF8C

hPartyMonIndex EQU $FF8C

hHalveItemPrices EQU $FF8E

; Multiplcation and division variables are meant
; to overlap for back-to-back usage. Big endian.

H_MULTIPLICAND EQU $FF96 ; 3 bytes
H_MULTIPLIER   EQU $FF99 ; 1 byte
H_PRODUCT      EQU $FF95 ; 4 bytes

H_DIVIDEND     EQU $FF95 ; 4 bytes
H_DIVISOR      EQU $FF99 ; 1 byte
H_QUOTIENT     EQU $FF95 ; 4 bytes
H_REMAINDER    EQU $FF99 ; 1 byte

; PrintNumber (big endian).
H_PASTLEADINGZEROES EQU $FF95 ; last char printed
H_NUMTOPRINT        EQU $FF96 ; 3 bytes
H_POWEROFTEN        EQU $FF99 ; 3 bytes
H_SAVEDNUMTOPRINT   EQU $FF9C ; 3 bytes

hSerialReceivedNewData EQU $FFA9

; $01 = using external clock
; $02 = using internal clock
; $ff = establishing connection
hSerialConnectionStatus EQU $FFAA

hSerialIgnoringInitialData EQU $FFAB

hSerialSendData EQU $FFAC

hSerialReceiveData EQU $FFAD

; these values are copied to SCX, SCY, and WY during V-blank
hSCX EQU $FFAE
hSCY EQU $FFAF
hWY  EQU $FFB0

hJoyLast     EQU $FFB1
hJoyReleased EQU $FFB2
hJoyPressed  EQU $FFB3
hJoyHeld     EQU $FFB4
hJoy5        EQU $FFB5
hJoy6        EQU $FFB6
hJoy7        EQU $FFB7

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

; 00 = indoor
; 01 = cave
; 02 = outdoor
; this is often set to 00 in order to turn off water and flower BG tile animations
hTilesetType EQU $FFD7

H_CURRENTSPRITEOFFSET EQU $FFDA ; multiple of $10

H_WHOSETURN EQU $FFF3 ; 0 on player’s turn, 1 on enemy’s turn

; bit 0: draw HP fraction to the right of bar instead of below (for party menu)
; bit 1: menu is double spaced
hFlags_0xFFF6 EQU $FFF6

hJoyInput EQU $FFF8

