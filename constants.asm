_JAPAN EQU 0
_GREEN EQU 0
_YELLOW EQU 0

;\1 = X
;\2 = Y
FuncCoord: MACRO
Coord = $C3A0 + 20 * \2 + \1
	ENDM

;\1 = Map Width
;\2 = Rows above (Y-blocks)
;\3 = X movement (X-blocks)
EVENT_DISP: MACRO
	dw ($C6EF + (\1) + ((\1) + 6) * ((\2) >> 1) + ((\3) >> 1)) ; Ev.Disp
	db \2,\3	;Y,X
	ENDM

FLYWARP_DATA: MACRO
	EVENT_DISP \1,\2,\3
	db ((\2) & $01)	;sub-block Y
	db ((\3) & $01)	;sub-block X
	ENDM

; external map entry macro
EMAP: MACRO ; emap x-coordinate,y-coordinate,textpointer
; the appearance of towns and routes in the town map, indexed by map id
	; nybble: y-coordinate
	; nybble: x-coordinate
	; word  : pointer to map name
	db (\1 + (\2 << 4))
	dw \3
	ENDM

; internal map entry macro
IMAP: MACRO ; imap mapid_less_than,x-coordinate,y-coordinate,textpointer
; the appearance of buildings and dungeons in the town map
	; byte  : maximum map id subject to this rule
	; nybble: y-coordinate
	; nybble: x-coordinate
	; word  : pointer to map name
	db \1
	db \2 + \3 << 4
	dw \4
	ENDM

; tilesets' headers macro
TSETHEAD: MACRO
	db BANK(\2)
	dw \1,\2,\3
	db \4,\5,\6,\7,\8
	ENDM
	
; macro for two nibbles
dn: MACRO
	db (\1 << 4 | \2)
	ENDM

; macro for putting a byte then a word
dbw: MACRO
	db \1
	dw \2
	ENDM

; data format macros
RGB: MACRO
	dw (\3 << 10 | \2 << 5 | \1)
	ENDM

; text macros
TX_NUM: MACRO
; print a big-endian decimal number.
; \1: address to read from
; \2: number of bytes to read
; \3: number of digits to display
	db $09
	dw \1
	db \2 << 4 | \3
	ENDM

TX_FAR: MACRO
	db $17
	dw \1
	db BANK(\1)
	ENDM

; text engine command $1
TX_RAM: MACRO
; prints text to screen
; \1: RAM address to read from
	db $1
	dw \1
	ENDM

; Predef macro.
PREDEF: MACRO
	ld a, (\1 - PredefPointers) / 3
	call Predef
	ENDM
	
PREDEF_JUMP: MACRO
	ld a, (\1 - PredefPointers) / 3
	jp Predef
	ENDM

; wram locations

; data for all sprites on the current map
; holds info for 16 sprites with $10 bytes each
; player sprite is always sprite 0
; C1x0: picture ID (fixed, loaded at map init)
; C1x1: movement status (0: uninitialized, 1: ready, 2: delayed, 3: moving)
; C1x2: sprite image index (changed on update, $ff if off screen, includes facing direction, progress in walking animation and a sprite-specific offset)
; C1x3: Y screen position delta (-1,0 or 1; added to c1x4 on each walking animation update)
; C1x4: Y screen position (in pixels, always 4 pixels above grid which makes sprites appear to be in the center of a tile)
; C1x5: X screen position delta (-1,0 or 1; added to c1x6 on each walking animation update)
; C1x6: X screen position (in pixels, snaps to grid if not currently walking)
; C1x7: intra-animation-frame counter (counting upwards to 4 until c1x8 is incremented)
; C1x8: animation frame counter (increased every 4 updates, hold four states (totalling to 16 walking frames)
; C1x9: facing direction (0: down, 4: up, 8: left, $c: right)
; C1xA
; C1xB
; C1xC
; C1xD
; C1xE
; C1xF
W_SPRITESTATEDATA1 EQU $C100 ; to $C200

; more data for all sprites on the current map
; holds info for 16 sprites with $10 bytes each
; player sprite is always sprite 0
; C2x0: walk animation counter (counting from $10 backwards when moving)
; C2x1: 
; C2x2: Y displacement (initialized at 8, supposed to keep moving sprites from moving too far, but bugged)
; C2x3: X displacement (initialized at 8, supposed to keep moving sprites from moving too far, but bugged)
; C2x4: Y position (in 2x2 tile grid steps, topmost 2x2 tile has value 4)
; C2x5: X position (in 2x2 tile grid steps, leftmost 2x2 tile has value 4)
; C2x6: movement byte 1 (determines whether a sprite can move, $ff:not moving, $fe:random movements, others unknown)
; C2x7: (?) (set to $80 when in grass, else $0; may be used to draw grass above the sprite)
; C2x8: delay until next movement (counted downwards, status (c1x1) is set to ready if reached 0)
; C2x9
; C2xA
; C2xB
; C2xC
; C2xD
; C2xE: sprite image base offset (in video ram, player always has value 1, used to compute c1x2)
; C2xF
W_SPRITESTATEDATA2 EQU $C200 ; to $C300

; buffer for OAM data. Is copied to OAM RAM by OAM DMA
W_OAMBUFFER EQU $C300 ; size $a0, to $C3A0

; buffer for tiles that are visible on screen (20 columns by 18 rows = $168 bytes)
W_SCREENTILESBUFFER EQU $C3A0 ; size $168, to $C508

; buffer for temporarily saving and restoring current screen's tiles (e.g. if menus are drawn on top)
W_SCREENTILESBACKBUFFER EQU $C508 ; size $168, to $C670

; the tiles of the row or column to be redrawn by RedrawExposedScreenEdge
W_SCREENEDGETILES EQU $CBFC

; coordinates of the position of the cursor for the top menu item (id 0)
W_TOPMENUITEMY EQU $CC24
W_TOPMENUITEMX EQU $CC25

; the id of the currently selected menu item
; the top item has id 0, the one below that has id 1, etc.
; note that the "top item" means the top item currently visible on the screen
; add this value to [W_LISTSCROLLOFFSET] to get the item's position within the list
W_CURMENUITEMID EQU $CC26

; the tile that was behind the menu cursor's current location
W_TILEBEHINDCURSOR EQU $CC27

W_MAXMENUITEMID EQU $CC28 ; id of the bottom menu item

W_MENUWATCHEDKEYS EQU $CC29 ; bit mask of keys that the menu will respond to

W_OLDMENUITEMID EQU $CC2A ; id of previously selected menu item

; how many times should HandleMenuInput poll the joypad state before it returns?
W_MENUJOYPADPOLLCOUNT EQU $CC34

W_PLAYERMOVELISTINDEX EQU $CC2E
W_PLAYERMONNUMBER EQU $CC2F

; the address of the menu cursor's current location within C3A0-C507
W_MENUCURSORLOCATION EQU $CC30 ; 2 bytes

; offset of the current top menu item from the beginning of the list
; keeps track of what section of the list is on screen
W_LISTSCROLLOFFSET EQU $CC36

; set to 1 if you can go from the bottom to the top or top to bottom of a menu
; set to 0 if you can't go past the top or bottom of the menu
W_MENUWRAPPINGENABLED EQU $CC4A

W_TRAINERHEADERFLAGBIT EQU $CC55

W_RLEBYTECOUNTER      EQU $CCD2

; current HP of player and enemy substitutes
W_PLAYERSUBSITUTEHP EQU $CCD7
W_ENEMYSUBSITUTEHP EQU $CCD8

W_PLAYERSELECTEDMOVE EQU $CCDC
W_ENEMYSELECTEDMOVE  EQU $CCDD

W_ENEMYMOVELISTINDEX EQU $CCE2

W_AICOUNT EQU $CCDF ; number of times remaining that AI action can occur

; stat modifiers for the player's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal

W_PLAYERMONATTACKMOD   EQU $CD1A
W_PLAYERMONDEFENSEMOD  EQU $CD1B
W_PLAYERMONSPEEDMOD    EQU $CD1C
W_PLAYERMONSPECIALMOD  EQU $CD1D
W_PLAYERMONACCURACYMOD EQU $CD1E
W_PLAYERMONEVASIONMOD  EQU $CD1F


W_ENGAGEDTRAINERCLASS  EQU $CD2D
W_ENGAGEDTRAINERSETNUM EQU $CD2E

; stat modifiers for the enemy's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal
W_ENEMYMONATTACKMOD   EQU $CD2E
W_ENEMYMONDEFENSEMOD  EQU $CD2F
W_ENEMYMONSPEEDMOD    EQU $CD30
W_ENEMYMONSPECIALMOD  EQU $CD31
W_ENEMYMONACCURACYMOD EQU $CD32
W_ENEMYMONEVASIONMOD  EQU $CD33

W_WHICHTRADE EQU $CD3D ; which entry from TradeMons to select
W_TRAINERSPRITEOFFSET   EQU $CD3D
W_TRAINERENGAGEDISTANCE EQU $CD3E
W_TRAINERFACINGDIR      EQU $CD3F
W_TRAINERSCREENYPOS     EQU $CD40
W_TRAINERSCREENXPOS     EQU $CD41

; bit 0: is player engaged by trainer (to avoid being engaged by multiple trainers simultaniously)
W_FLAGS_CD60 EQU $CD60

; bit 1 means button presses will be ignored for that futton
W_JOYPADFORBIDDENBUTTONSMASK EQU $CD6B

; second buffer for temporarily saving and restoring current screen's tiles (e.g. if menus are drawn on top)
W_SCREENTILESBACKBUFFER2 EQU $CD81 ; size $168, to $CEE9

W_HPBARMAXHP   EQU $CEE9
W_HPBAROLDHP   EQU $CEEB
W_HPBARNEWHP   EQU $CEED
W_HPBARDELTA   EQU $CEEF

W_HPBARHPDIFFERENCE EQU $CEFD

W_ANIMSOUNDID EQU $CF07 ; sound ID during battle animations

; movement byte 2 of current sprite
W_CURSPRITEMOVEMENT2 EQU $CF14

W_GYMCITYNAME   EQU $CF5F
W_GYMLEADERNAME EQU $CF70

W_WHICHPOKEMON EQU $CF92 ; which pokemon you selected

W_LISTMENUID EQU $CF94 ; ID used by DisplayListMenuID

W_WALKCOUNTER EQU $CFC5 ; walk animation counter

W_ENEMYMOVENUM      EQU $CFCC
W_ENEMYMOVEEFFECT   EQU $CFCD
W_ENEMYMOVEPOWER    EQU $CFCE
W_ENEMYMOVETYPE     EQU $CFCF
W_ENEMYMOVEACCURACY EQU $CFD0
W_ENEMYMOVEMAXPP    EQU $CFD1

W_PLAYERMOVENUM      EQU $CFD2
W_PLAYERMOVEEFFECT   EQU $CFD3
W_PLAYERMOVEPOWER    EQU $CFD4
W_PLAYERMOVETYPE     EQU $CFD5
W_PLAYERMOVEACCURACY EQU $CFD6
W_PLAYERMOVEMAXPP    EQU $CFD7

W_ENEMYMONID    EQU $CFD8

W_ENEMYMONNAME  EQU $CFDA

W_ENEMYMONCURHP EQU $CFE6 ; active opponent's hp (16 bits)
W_ENEMYMONNUMBER EQU $CFE8 ; active opponent's position in team (0 to 5)
W_ENEMYMONSTATUS EQU $CFE9 ; active opponent's status condition
	; bit 0 slp
	; bit 1 slp
	; bit 2 slp
	; bit 3 psn
	; bit 4 brn
	; bit 5 frz
	; bit 6 par
	; unused? (XXX confirm)
W_ENEMYMONTYPES    EQU $CFEA
W_ENEMYMONTYPE1    EQU $CFEA
W_ENEMYMONTYPE2    EQU $CFEB
W_ENEMYMONMOVES    EQU $CFED
W_ENEMYMONATKDEFIV EQU $CFF1
W_ENEMYMONSPDSPCIV EQU $CFF2
W_ENEMYMONLEVEL    EQU $CFF3
W_ENEMYMONMAXHP    EQU $CFF4 ; (16 bits)
W_ENEMYMONATTACK   EQU $CFF6
W_ENEMYMONDEFENSE  EQU $CFF8
W_ENEMYMONSPEED    EQU $CFFA
W_ENEMYMONSPECIAL  EQU $CFFC
W_ENEMYMONPP       EQU $CFFE

W_PLAYERMONNAME   EQU $D009
W_PLAYERMONID     EQU $D014
W_PLAYERMONCURHP  EQU $D015 ; active opponent's hp (16 bits)
W_PLAYERMONSTATUS EQU $D018 ; the status of the player’s current monster
	; bit 0 slp
	; bit 1 slp
	; bit 2 slp
	; bit 3 psn
	; bit 4 brn
	; bit 5 frz
	; bit 6 par
	; unused? (XXX confirm)
W_PLAYERMONTYPES    EQU $D019
W_PLAYERMONTYPE1    EQU $D019
W_PLAYERMONTYPE2    EQU $D01A
W_PLAYERMONMOVES    EQU $D01C
W_PLAYERMONIVS      EQU $D020 ; 4x 4 bit: atk, def, spd, spc
W_PLAYERMONLEVEL    EQU $D022
W_PLAYERMONMAXHP    EQU $D023 ; (16 bits)
W_PLAYERMONATK      EQU $D025
W_PLAYERMONDEF      EQU $D027
W_PLAYERMONSPEED    EQU $D029
W_PLAYERMONSPECIAL  EQU $D02B
W_PLAYERMONPP       EQU $D02D

W_TRAINERCLASS EQU $D031

W_ISINBATTLE EQU $D057 ; no battle, this is 0
                       ; wild battle, this is 1
                       ; trainer battle, this is 2

W_PLAYERMONSALIVEFLAGS EQU $D058 ; 6 bit array, 1 if player mon is alive

W_CUROPPONENT EQU $D059 ; in a wild battle, this is the species of pokemon
                        ; in a trainer battle, this is the trainer class + $C8

W_BATTLETYPE EQU $D05A ; in normal battle, this is 0
                       ; in old man battle, this is 1
                       ; in safari battle, this is 2

W_LONEATTACKNO EQU $D05C ; which entry in LoneAttacks to use
W_TRAINERNO    EQU $D05D ; which instance of [youngster, lass, etc] is this?

W_MOVEMISSED EQU $D05F

; not entirely sure that all these bits are 100% correct
; Battle Status Byte 1
; bit 0 - bide
; bit 1 - thrash / petal dance
; bit 2 - attacking multiple times (e.g. double kick)
; bit 3 - flinch
; bit 4 - charging up for attack
; bit 5 - using multi-turn move (e.g. wrap)
; bit 6 - invulnerable to normal attack (using fly/dig)
; bit 7 - confusion

; Battle Status Byte 2
; bit 0 - X Accuracy effect
; bit 1 - protected by "mist"
; bit 2 - focus energy effect
; bit 4 - has a substitute
; bit 5 - need to recharge
; bit 6 - rage
; bit 7 - leech seeded

; Battle Status Byte 3
; bit 0 - toxic
; bit 1 - light screen
; bit 2 - reflect
; bit 3 - tranformed

W_PLAYERBATTSTATUS1 EQU $D062
W_PLAYERBATTSTATUS2 EQU $D063
W_PLAYERBATTSTATUS3 EQU $D064

W_ENEMYBATTSTATUS1 EQU $D067
W_ENEMYBATTSTATUS2 EQU $D068
W_ENEMYBATTSTATUS3 EQU $D069

W_PLAYERTOXICCOUNTER EQU $D06C
W_PLAYERDISABLEDMOVE EQU $D06D

W_ENEMYTOXICCOUNTER EQU $D071
W_ENEMYDISABLEDMOVE EQU $D072

W_NUMHITS EQU $D074 ; number of hits in attacks like Doubleslap, etc.

W_ANIMATIONID EQU $D07C ; ID number of the current battle animation

; base coordinates of frame block
W_BASECOORDX EQU $D081
W_BASECOORDY EQU $D082

W_FBTILECOUNTER EQU $D084 ; counts how many tiles of the current frame block have been drawn

W_SUBANIMFRAMEDELAY EQU $D086 ; duration of each frame of the current subanimation in terms of screen refreshes
W_SUBANIMCOUNTER EQU $D087 ; counts the number of subentries left in the current subanimation

W_NUMFBTILES EQU $D089 ; number of tiles in current battle animation frame block

W_SUBANIMTRANSFORM EQU $D08B ; controls what transformations are applied to the subanimation
; 01: flip horizontally and vertically
; 02: flip horizontally and translate downwards 40 pixels
; 03: translate base coordinates of frame blocks, but don't change their internal coordinates or flip their tiles
; 04: reverse the subanimation

W_PBSTOREDREGISTERH  EQU $D08C
W_PBSTOREDREGISTERL  EQU $D08D
W_PBSTOREDREGISTERD  EQU $D08E
W_PBSTOREDREGISTERE  EQU $D08F
W_PBSTOREDROMBANK    EQU $D092

W_SUBANIMADDRPTR EQU $D094 ; the address _of the address_ of the current subanimation entry (2 bytes)

W_SUBANIMSUBENTRYADDR EQU $D096 ; the address of the current subentry of the current subanimation (2 bytes)

W_FBDESTADDR EQU $D09C ; current destination address in OAM for frame blocks (2 bytes, big endian)

W_FBMODE EQU $D09E ; controls how the frame blocks are put together to form frames
; specifically, after finishing drawing the frame block, the frame block's mode determines what happens
; 00: clean OAM buffer and delay
; 02: move onto the next frame block with no delay and no cleaning OAM buffer
; 03: delay, but don't clean OAM buffer
; 04: delay, without cleaning OAM buffer, and do not advance [W_FBDESTADDR], so that the next frame block will overwrite this one

; sprite data is written column by column, each byte contains 8 columns (one for ech bit)
; for 2bpp sprites, pairs of two consecutive bytes (i.e. pairs of consecutive rows of sprite data)
; contain the upper and lower bit of each of the 8 pixels, respectively
SPRITEBUFFERSIZE   EQU $188 ; 7 * 7 (tiles) * 8 (bytes per tile)
S_SPRITEBUFFER0    EQU $A000 + 0 * SPRITEBUFFERSIZE
S_SPRITEBUFFER1    EQU $A000 + 1 * SPRITEBUFFERSIZE
S_SPRITEBUFFER2    EQU $A000 + 2 * SPRITEBUFFERSIZE

W_SPRITECURPOSX         EQU $D0A1
W_SPRITECURPOSY         EQU $D0A2
W_SPRITEWITDH           EQU $D0A3
W_SPRITEHEIGHT          EQU $D0A4
W_SPRITEINPUTCURBYTE    EQU $D0A5 ; current input byte
W_SPRITEINPUTBITCOUNTER EQU $D0A6 ; bit offset of last read input bit

; determines where in the output byte the two bits are placed. Each byte contains four columns (2bpp data)
; 3 -> XX000000   1st column
; 2 -> 00XX0000   2nd column
; 1 -> 0000XX00   3rd column
; 0 -> 000000XX   4th column
W_SPRITEOUTPUTBITOFFSET EQU $D0A7

; bit 0 determines used buffer (0 -> $a188, 1 -> $a310)
; bit 1 loading last sprite chunk? (there are at most 2 chunks per load operation)
W_SPRITELOADFLAGS       EQU $D0A8
W_SPRITEUNPACKMODE      EQU $D0A9
W_SPRITEFLIPPED         EQU $D0AA

W_SPRITEINPUTPTR        EQU $D0AB ; pointer to next input byte
W_SPRITEOUTPUTPTR       EQU $D0AD ; pointer to current output byte
W_SPRITEOUTPUTPTRCACHED EQU $D0AF ; used to revert pointer for different bit offsets
W_SPRITEDECODETABLE0PTR EQU $D0B1 ; pointer to differential decoding table (assuming initial value 0)
W_SPRITEDECODETABLE1PTR EQU $D0B3 ; pointer to differential decoding table (assuming initial value 1)

H_SPRITEWIDTH           EQU $FF8B ; in bytes
H_SPRITEINTERLACECOUNTER EQU $FF8B
H_SPRITEHEIGHT          EQU $FF8C ; in bytes
H_SPRITEOFFSET          EQU $FF8D

; OAM flags used by this game
OAMFLAG_ENDOFDATA   EQU %00000001 ; pseudo OAM flag, only used by game logic
OAMFLAG_CANBEMASKED EQU %00000010 ; pseudo OAM flag, only used by game logic
OAMFLAG_VFLIPPED    EQU %00100000 ; OAM flag flips the sprite vertically. Used for making left facing sprites face right and to alternate between left and right foot animation when walking up or down

; List type
; used in $D0B6
W_LISTTYPE    EQU $D0B6
MONSTER_NAME  EQU 1
MOVE_NAME     EQU 2
; ???_NAME    EQU 3
ITEM_NAME     EQU 4
PLAYEROT_NAME EQU 5
ENEMYOT_NAME  EQU 6
TRAINER_NAME  EQU 7

W_MONHEADER       EQU $d0b8
W_MONHDEXNUM      EQU $d0b8
W_MONHBASESTATS   EQU $d0b9
;W_MONHBASEHP      EQU $d0b9
;W_MONHBASEATTACK  EQU $d0ba
;W_MONHBASEDEFENSE EQU $d0bb
W_MONHBASESPEED   EQU $d0bc
;W_MONHBASESPECIAL EQU $d0bd
W_MONHTYPES       EQU $d0be
W_MONHTYPE1       EQU $d0be
W_MONHTYPE2       EQU $d0bf
W_MONHCATCHRATE   EQU $d0c0
;W_MONHBASEXP      EQU $d0c1
W_MONHSPRITEDIM   EQU $d0c2
W_MONHFRONTSPRITE EQU $d0c3
W_MONHBACKSPRITE  EQU $d0c5
W_MONHMOVES       EQU $d0c7
;W_MONHMOVE1       EQU $d0c7
;W_MONHMOVE2       EQU $d0c8
;W_MONHMOVE3       EQU $d0c9
;W_MONHMOVE4       EQU $d0ca
W_MONHGROWTHRATE  EQU $d0cb
W_MONHLEARNSET    EQU $d0cc ; bit field, 7 bytes
;W_MONHPADDING     EQU $d0d7



W_DAMAGE EQU $D0D7


W_CURENEMYLVL EQU $D127

W_ISLINKBATTLE EQU $D12B

W_PRIZE1 EQU $D13D
W_PRIZE2 EQU $D13E
W_PRIZE3 EQU $D13F

W_PLAYERNAME EQU $D158 ; 11 characters, including null

W_NUMINPARTY EQU $D163

W_PARTYMON1 EQU $D164
W_PARTYMON2 EQU $D165
W_PARTYMON3 EQU $D166
W_PARTYMON4 EQU $D167
W_PARTYMON5 EQU $D168
W_PARTYMON6 EQU $D169
W_PARTYMONEND EQU $D16A

W_PARTYMON1DATA EQU $D16B
W_PARTYMON1_NUM EQU $D16B
W_PARTYMON1_HP EQU $D16C
W_PARTYMON1_BOXLEVEL EQU $D16E
W_PARTYMON1_STATUS EQU $D16F
W_PARTYMON1_TYPE1 EQU $D170
W_PARTYMON1_TYPE2 EQU $D171
W_PARTYMON1_CRATE EQU $D172
W_PARTYMON1_MOVE1 EQU $D173
W_PARTYMON1_MOVE2 EQU $D174
W_PARTYMON1_MOVE3 EQU $D175
W_PARTYMON1_MOVE4 EQU $D176
W_PARTYMON1_OTID EQU $D177
W_PARTYMON1_EXP EQU $D179
W_PARTYMON1_EVHP EQU $D17C
W_PARTYMON1_EVATTACK EQU $D17E
W_PARTYMON1_EVDEFENSE EQU $D180
W_PARTYMON1_EVSPEED EQU $D182
W_PARTYMON1_EVSECIAL EQU $D184
W_PARTYMON1_IV EQU $D186
W_PARTYMON1_MOVE1PP EQU $D188
W_PARTYMON1_MOVE2PP EQU $D189
W_PARTYMON1_MOVE3PP EQU $D18A
W_PARTYMON1_MOVE4PP EQU $D18B
W_PARTYMON1_LEVEL EQU $D18C
W_PARTYMON1_MAXHP EQU $D18D
W_PARTYMON1_ATACK EQU $D18F
W_PARTYMON1_DEFENSE EQU $D191
W_PARTYMON1_SPEED EQU $D193
W_PARTYMON1_SPECIAL EQU $D195

W_PARTYMON2DATA EQU $D197
W_PARTYMON2_NUM EQU $D197
W_PARTYMON2_HP EQU $D198
W_PARTYMON2_BOXLEVEL EQU $D19A
W_PARTYMON2_STATUS EQU $D19B
W_PARTYMON2_TYPE1 EQU $D19C
W_PARTYMON2_TYPE2 EQU $D19D
W_PARTYMON2_CRATE EQU $D19E
W_PARTYMON2_MOVE1 EQU $D19F
W_PARTYMON2_MOVE2 EQU $D1A0
W_PARTYMON2_MOVE3 EQU $D1A1
W_PARTYMON2_MOVE4 EQU $D1A2
W_PARTYMON2_OTID EQU $D1A3
W_PARTYMON2_EXP EQU $D1A5
W_PARTYMON2_EVHP EQU $D1A8
W_PARTYMON2_EVATTACK EQU $D1AA
W_PARTYMON2_EVDEFENSE EQU $D1AC
W_PARTYMON2_EVSPEED EQU $D1AE
W_PARTYMON2_EVSECIAL EQU $D1B0
W_PARTYMON2_IV EQU $D1B2
W_PARTYMON2_MOVE1PP EQU $D1B4
W_PARTYMON2_MOVE2PP EQU $D1B5
W_PARTYMON2_MOVE3PP EQU $D1B6
W_PARTYMON2_MOVE4PP EQU $D1B7
W_PARTYMON2_LEVEL EQU $D1B8
W_PARTYMON2_MAXHP EQU $D1B9
W_PARTYMON2_ATACK EQU $D1BB
W_PARTYMON2_DEFENSE EQU $D1BD
W_PARTYMON2_SPEED EQU $D1BF
W_PARTYMON2_SPECIAL EQU $D1C1

W_PARTYMON3DATA EQU $D1C3
W_PARTYMON3_NUM EQU $D1C3
W_PARTYMON3_HP EQU $D1C4
W_PARTYMON3_BOXLEVEL EQU $D1C6
W_PARTYMON3_STATUS EQU $D1C7
W_PARTYMON3_TYPE1 EQU $D1C8
W_PARTYMON3_TYPE2 EQU $D1C9
W_PARTYMON3_CRATE EQU $D1CA
W_PARTYMON3_MOVE1 EQU $D1CB
W_PARTYMON3_MOVE2 EQU $D1CC
W_PARTYMON3_MOVE3 EQU $D1CD
W_PARTYMON3_MOVE4 EQU $D1CE
W_PARTYMON3_OTID EQU $D1CF
W_PARTYMON3_EXP EQU $D1D1
W_PARTYMON3_EVHP EQU $D1D4
W_PARTYMON3_EVATTACK EQU $D1D6
W_PARTYMON3_EVDEFENSE EQU $D1D8
W_PARTYMON3_EVSPEED EQU $D1DA
W_PARTYMON3_EVSECIAL EQU $D1DC
W_PARTYMON3_IV EQU $D1DE
W_PARTYMON3_MOVE1PP EQU $D1E0
W_PARTYMON3_MOVE2PP EQU $D1E1
W_PARTYMON3_MOVE3PP EQU $D1E2
W_PARTYMON3_MOVE4PP EQU $D1E3
W_PARTYMON3_LEVEL EQU $D1E4
W_PARTYMON3_MAXHP EQU $D1E5
W_PARTYMON3_ATACK EQU $D1E7
W_PARTYMON3_DEFENSE EQU $D1E9
W_PARTYMON3_SPEED EQU $D1EB
W_PARTYMON3_SPECIAL EQU $D1ED

W_PARTYMON4DATA EQU $D1EF
W_PARTYMON4_NUM EQU $D1EF
W_PARTYMON4_HP EQU $D1F0
W_PARTYMON4_BOXLEVEL EQU $D1F2
W_PARTYMON4_STATUS EQU $D1F3
W_PARTYMON4_TYPE1 EQU $D1F4
W_PARTYMON4_TYPE2 EQU $D1F5
W_PARTYMON4_CRATE EQU $D1F6
W_PARTYMON4_MOVE1 EQU $D1F7
W_PARTYMON4_MOVE2 EQU $D1F8
W_PARTYMON4_MOVE3 EQU $D1F9
W_PARTYMON4_MOVE4 EQU $D1FA
W_PARTYMON4_OTID EQU $D1FB
W_PARTYMON4_EXP EQU $D1FD
W_PARTYMON4_EVHP EQU $D200
W_PARTYMON4_EVATTACK EQU $D202
W_PARTYMON4_EVDEFENSE EQU $D204
W_PARTYMON4_EVSPEED EQU $D206
W_PARTYMON4_EVSECIAL EQU $D208
W_PARTYMON4_IV EQU $D20A
W_PARTYMON4_MOVE1PP EQU $D20C
W_PARTYMON4_MOVE2PP EQU $D20D
W_PARTYMON4_MOVE3PP EQU $D20E
W_PARTYMON4_MOVE4PP EQU $D20F
W_PARTYMON4_LEVEL EQU $D210
W_PARTYMON4_MAXHP EQU $D211
W_PARTYMON4_ATACK EQU $D213
W_PARTYMON4_DEFENSE EQU $D215
W_PARTYMON4_SPEED EQU $D217
W_PARTYMON4_SPECIAL EQU $D219

W_PARTYMON5DATA EQU $D21B
W_PARTYMON5_NUM EQU $D21B
W_PARTYMON5_HP EQU $D21C
W_PARTYMON5_BOXLEVEL EQU $D21E
W_PARTYMON5_STATUS EQU $D21F
W_PARTYMON5_TYPE1 EQU $D220
W_PARTYMON5_TYPE2 EQU $D221
W_PARTYMON5_CRATE EQU $D222
W_PARTYMON5_MOVE1 EQU $D223
W_PARTYMON5_MOVE2 EQU $D224
W_PARTYMON5_MOVE3 EQU $D225
W_PARTYMON5_MOVE4 EQU $D226
W_PARTYMON5_OTID EQU $D227
W_PARTYMON5_EXP EQU $D229
W_PARTYMON5_EVHP EQU $D22C
W_PARTYMON5_EVATTACK EQU $D22E
W_PARTYMON5_EVDEFENSE EQU $D230
W_PARTYMON5_EVSPEED EQU $D232
W_PARTYMON5_EVSECIAL EQU $D234
W_PARTYMON5_IV EQU $D236
W_PARTYMON5_MOVE1PP EQU $D238
W_PARTYMON5_MOVE2PP EQU $D239
W_PARTYMON5_MOVE3PP EQU $D23A
W_PARTYMON5_MOVE4PP EQU $D23B
W_PARTYMON5_LEVEL EQU $D23C
W_PARTYMON5_MAXHP EQU $D23D
W_PARTYMON5_ATACK EQU $D23F
W_PARTYMON5_DEFENSE EQU $D241
W_PARTYMON5_SPEED EQU $D243
W_PARTYMON5_SPECIAL EQU $D245

W_PARTYMON6DATA EQU $D247
W_PARTYMON6_NUM EQU $D247
W_PARTYMON6_HP EQU $D248
W_PARTYMON6_BOXLEVEL EQU $D24A
W_PARTYMON6_STATUS EQU $D24B
W_PARTYMON6_TYPE1 EQU $D24C
W_PARTYMON6_TYPE2 EQU $D24D
W_PARTYMON6_CRATE EQU $D24E
W_PARTYMON6_MOVE1 EQU $D24F
W_PARTYMON6_MOVE2 EQU $D250
W_PARTYMON6_MOVE3 EQU $D251
W_PARTYMON6_MOVE4 EQU $D252
W_PARTYMON6_OTID EQU $D253
W_PARTYMON6_EXP EQU $D255
W_PARTYMON6_EVHP EQU $D258
W_PARTYMON6_EVATTACK EQU $D25A
W_PARTYMON6_EVDEFENSE EQU $D25C
W_PARTYMON6_EVSPEED EQU $D25E
W_PARTYMON6_EVSECIAL EQU $D260
W_PARTYMON6_IV EQU $D262
W_PARTYMON6_MOVE1PP EQU $D264
W_PARTYMON6_MOVE2PP EQU $D265
W_PARTYMON6_MOVE3PP EQU $D266
W_PARTYMON6_MOVE4PP EQU $D267
W_PARTYMON6_LEVEL EQU $D268
W_PARTYMON6_MAXHP EQU $D269
W_PARTYMON6_ATACK EQU $D26B
W_PARTYMON6_DEFENSE EQU $D26D
W_PARTYMON6_SPEED EQU $D26F
W_PARTYMON6_SPECIAL EQU $D271

W_PARTYMON1OT EQU $D273
W_PARTYMON2OT EQU $D27E
W_PARTYMON3OT EQU $D289
W_PARTYMON4OT EQU $D294
W_PARTYMON5OT EQU $D29F
W_PARTYMON6OT EQU $D2AA

W_PARTYMON1NAME EQU $D2B5
W_PARTYMON2NAME EQU $D2C0
W_PARTYMON3NAME EQU $D2CB
W_PARTYMON4NAME EQU $D2D6
W_PARTYMON5NAME EQU $D2E1
W_PARTYMON6NAME EQU $D2EC

W_OWNEDPOKEMON EQU $D2F7 ; bit field, 19 bytes

W_SEENPOKEMON EQU $D30A ; bit field, 19 bytes

;number of items in bag
W_NUMBAGITEMS     EQU $D31D
; BAGITEM01  is an item id
; BAGCOUNT01 is how many of this item
W_BAGITEM01         EQU $D31E
W_BAGITEM01QTY      EQU $D31F
W_BAGITEM02         EQU $D320
W_BAGITEM02QTY      EQU $D321
W_BAGITEM03         EQU $D322
W_BAGITEM03QTY      EQU $D323
W_BAGITEM04         EQU $D324
W_BAGITEM04QTY      EQU $D325
W_BAGITEM05         EQU $D326
W_BAGITEM05QTY      EQU $D327
W_BAGITEM06         EQU $D328
W_BAGITEM06QTY      EQU $D329
W_BAGITEM07         EQU $D32A
W_BAGITEM07QTY      EQU $D32B
W_BAGITEM08         EQU $D32C
W_BAGITEM08QTY      EQU $D32D
W_BAGITEM09         EQU $D32E
W_BAGITEM09QTY      EQU $D32F
W_BAGITEM10         EQU $D330
W_BAGITEM10QTY      EQU $D331
W_BAGITEM11         EQU $D332
W_BAGITEM11QTY      EQU $D333
W_BAGITEM12         EQU $D334
W_BAGITEM12QTY      EQU $D335
W_BAGITEM13         EQU $D336
W_BAGITEM13QTY      EQU $D337
W_BAGITEM14         EQU $D338
W_BAGITEM14QTY      EQU $D339
W_BAGITEM15         EQU $D33A
W_BAGITEM15QTY      EQU $D33B
W_BAGITEM16         EQU $D33C
W_BAGITEM16QTY      EQU $D33D
W_BAGITEM17         EQU $D33E
W_BAGITEM17QTY      EQU $D33F
W_BAGITEM18         EQU $D340
W_BAGITEM18QTY      EQU $D341
W_BAGITEM19         EQU $D342
W_BAGITEM19QTY      EQU $D343
W_BAGITEM20         EQU $D344
W_BAGITEM20QTY      EQU $D345

; money is in decimal
W_PLAYERMONEY3 EQU $D347
W_PLAYERMONEY2 EQU $D348
W_PLAYERMONEY1 EQU $D349

W_RIVALNAME  EQU $D34A ; 11 characters, including null

W_OPTIONS EQU $D355
; bit 7 = battle animation
; 0: On
; 1: Off
; bit 6 = battle style
; 0: Shift
; 1: Set
; bits 0-3 = text speed (number of frames to delay after printing a letter)
; 1: Fast
; 3: Medium
; 5: Slow

W_OBTAINEDBADGES EQU $D356

W_PLAYERIDHI EQU $D359
W_PLAYERIDLO EQU $D35A

W_CURMAP EQU $D35E

W_YCOORD EQU $D361 ; player’s position on the current map
W_XCOORD EQU $D362
W_YBLOCKCOORD EQU $D363 ; player's y position (by block)
W_XBLOCKCOORD EQU $D364

W_CURMAPTILESET EQU $D367
W_CURMAPHEIGHT  EQU $D368 ; blocks
W_CURMAPWIDTH   EQU $D369 ; blocks

W_MAPDATAPTR EQU $D36A
W_MAPTEXTPTR EQU $D36C
W_MAPSCRIPTPTR EQU $D36E
W_MAPCONNECTIONS EQU $D370 ; connection byte
W_MAPCONN1PTR EQU $D371
W_MAPCONN2PTR EQU $D37C
W_MAPCONN3PTR EQU $D387
W_MAPCONN4PTR EQU $D392

W_SPRITESET EQU $D39D ; sprite set for the current map (11 sprite picture ID's)
W_SPRITESETID EQU $D3A8 ; sprite set ID for the current map

W_NUMSPRITES EQU $D4E1 ; number of sprites on the current map

; two bytes per sprite (movement byte 2 , text ID)
W_MAPSPRITEDATA EQU $D4e4

; two bytes per sprite (trainer class/item ID , trainer set ID)
W_MAPSPRITEEXTRADATA EQU $D504

W_TILESETBANK             EQU $D52B
W_TILESETBLOCKSPTR        EQU $D52C ; maps blocks (4x4 tiles) to it's tiles
W_TILESETGFXPTR           EQU $D52E
W_TILESETCOLLISIONPTR     EQU $D530 ; list of all walkable tiles
W_TILESETTALKINGOVERTILES EQU $D532 ; 3 bytes
W_GRASSTILE               EQU $D535

;number of items in box
W_NUMBOXITEMS EQU $D53A
; BOXITEM01    is an item id
; BOXITEM01QTY is how many of this item
W_BOXITEM01       EQU $D53B
W_BOXITEM01QTY    EQU $D53C
W_BOXITEM02       EQU $D53D
W_BOXITEM02QTY    EQU $D53E
W_BOXITEM03       EQU $D53F
W_BOXITEM03QTY    EQU $D540
W_BOXITEM04       EQU $D541
W_BOXITEM04QTY    EQU $D542
W_BOXITEM05       EQU $D543
W_BOXITEM05QTY    EQU $D544
W_BOXITEM06       EQU $D545
W_BOXITEM06QTY    EQU $D546
W_BOXITEM07       EQU $D547
W_BOXITEM07QTY    EQU $D548
W_BOXITEM08       EQU $D549
W_BOXITEM08QTY    EQU $D54A
W_BOXITEM09       EQU $D54B
W_BOXITEM09QTY    EQU $D54C
W_BOXITEM10       EQU $D54D
W_BOXITEM10QTY    EQU $D54E
W_BOXITEM11       EQU $D54F
W_BOXITEM11QTY    EQU $D550
W_BOXITEM12       EQU $D551
W_BOXITEM12QTY    EQU $D552
W_BOXITEM13       EQU $D553
W_BOXITEM13QTY    EQU $D554
W_BOXITEM14       EQU $D555
W_BOXITEM14QTY    EQU $D556
W_BOXITEM15       EQU $D557
W_BOXITEM15QTY    EQU $D558
W_BOXITEM16       EQU $D559
W_BOXITEM16QTY    EQU $D55A
W_BOXITEM17       EQU $D55B
W_BOXITEM17QTY    EQU $D55C
W_BOXITEM18       EQU $D55D
W_BOXITEM18QTY    EQU $D55E
W_BOXITEM19       EQU $D55F
W_BOXITEM19QTY    EQU $D560
W_BOXITEM20       EQU $D561
W_BOXITEM20QTY    EQU $D562
W_BOXITEM21       EQU $D563
W_BOXITEM21QTY    EQU $D564
W_BOXITEM22       EQU $D565
W_BOXITEM22QTY    EQU $D566
W_BOXITEM23       EQU $D567
W_BOXITEM23QTY    EQU $D568
W_BOXITEM24       EQU $D569
W_BOXITEM24QTY    EQU $D56A
W_BOXITEM25       EQU $D56B
W_BOXITEM25QTY    EQU $D56C
W_BOXITEM26       EQU $D56D
W_BOXITEM26QTY    EQU $D56E
W_BOXITEM27       EQU $D56F
W_BOXITEM27QTY    EQU $D570
W_BOXITEM28       EQU $D571
W_BOXITEM28QTY    EQU $D572
W_BOXITEM29       EQU $D573
W_BOXITEM29QTY    EQU $D574
W_BOXITEM30       EQU $D575
W_BOXITEM30QTY    EQU $D576
W_BOXITEM31       EQU $D577
W_BOXITEM31QTY    EQU $D578
W_BOXITEM32       EQU $D579
W_BOXITEM32QTY    EQU $D57A
W_BOXITEM33       EQU $D57B
W_BOXITEM33QTY    EQU $D57C
W_BOXITEM34       EQU $D57D
W_BOXITEM34QTY    EQU $D57E
W_BOXITEM35       EQU $D57F
W_BOXITEM35QTY    EQU $D580
W_BOXITEM36       EQU $D581
W_BOXITEM36QTY    EQU $D582
W_BOXITEM37       EQU $D583
W_BOXITEM37QTY    EQU $D584
W_BOXITEM38       EQU $D585
W_BOXITEM38QTY    EQU $D586
W_BOXITEM39       EQU $D587
W_BOXITEM39QTY    EQU $D588
W_BOXITEM40       EQU $D589
W_BOXITEM40QTY    EQU $D58A
W_BOXITEM41       EQU $D58B
W_BOXITEM41QTY    EQU $D58C
W_BOXITEM42       EQU $D58D
W_BOXITEM42QTY    EQU $D58E
W_BOXITEM43       EQU $D58F
W_BOXITEM43QTY    EQU $D590
W_BOXITEM44       EQU $D591
W_BOXITEM44QTY    EQU $D592
W_BOXITEM45       EQU $D593
W_BOXITEM45QTY    EQU $D594
W_BOXITEM46       EQU $D595
W_BOXITEM46QTY    EQU $D596
W_BOXITEM47       EQU $D597
W_BOXITEM47QTY    EQU $D598
W_BOXITEM48       EQU $D599
W_BOXITEM48QTY    EQU $D59A
W_BOXITEM49       EQU $D59B
W_BOXITEM49QTY    EQU $D59C
W_BOXITEM50       EQU $D59D
W_BOXITEM50QTY    EQU $D59E
;box end of list $D59F

; coins are in decimal
W_PLAYERCOINS1 EQU $D5A4
W_PLAYERCOINS2 EQU $D5A5
W_MISSABLEOBJECTFLAGS EQU $D5A6 ; $20 bytes, bit array of missable objects. bit 1 = removed

; each entry consists of 2 bytes
; * the sprite ID (depending on the current map)
; * the missable object index (global, used for W_MISSABLEOBJECTFLAGS)
; terminated with $FF
W_MISSABLEOBJECTLIST EQU $D5CE

W_GAMEPROGRESSFLAGS           EQU $D5F0 ; $c8 bytes
W_OAKSLABCURSCRIPT            EQU $D5F0
W_PALLETTOWNCURSCRIPT         EQU $D5F1

W_BLUESHOUSECURSCRIPT         EQU $D5F3
W_VIRIDIANCITYCURSCRIPT       EQU $D5F4

W_PEWTERCITYCURSCRIPT         EQU $D5F7
W_ROUTE3CURSCRIPT             EQU $D5F8
W_ROUTE4CURSCRIPT             EQU $D5F9

W_VIRIDIANGYMCURSCRIPT        EQU $D5FB
W_PEWTERGYMCURSCRIPT          EQU $D5FC
W_CERULEANGYMCURSCRIPT        EQU $D5FD
W_VERMILIONGYMCURSCRIPT       EQU $D5FE
W_CELADONGYMCURSCRIPT         EQU $D5FF
W_ROUTE6CURSCRIPT             EQU $D600
W_ROUTE8CURSCRIPT             EQU $D601
W_ROUTE24CURSCRIPT            EQU $D602
W_ROUTE25CURSCRIPT            EQU $D603
W_ROUTE9CURSCRIPT             EQU $D604
W_ROUTE10CURSCRIPT            EQU $D605
W_MTMOON1CURSCRIPT            EQU $D606
W_MTMOON3CURSCRIPT            EQU $D607
W_SSANNE8CURSCRIPT            EQU $D608
W_SSANNE9CURSCRIPT            EQU $D609
W_ROUTE22CURSCRIPT            EQU $D60A

W_REDSHOUSE2CURSCRIPT         EQU $D60C
W_VIRIDIANMARKETCURSCRIPT     EQU $D60D
W_ROUTE22GATECURSCRIPT        EQU $D60E
W_CERULEANCITYCURSCRIPT       EQU $D60F

W_SSANNE5CURSCRIPT            EQU $D617
W_VIRIDIANFORESTCURSCRIPT     EQU $D618
W_MUSEUMF1CURSCRIPT           EQU $D619
W_ROUTE13CURSCRIPT            EQU $D61A
W_ROUTE14CURSCRIPT            EQU $D61B
W_ROUTE17CURSCRIPT            EQU $D61C
W_ROUTE19CURSCRIPT            EQU $D61D
W_ROUTE21CURSCRIPT            EQU $D61E
W_SAFARIZONEENTRANCECURSCRIPT EQU $D61F
W_ROCKTUNNEL2CURSCRIPT        EQU $D620
W_ROCKTUNNEL1CURSCRIPT        EQU $D621

W_ROUTE11CURSCRIPT            EQU $D623
W_ROUTE12CURSCRIPT            EQU $D624
W_ROUTE15CURSCRIPT            EQU $D625
W_ROUTE16CURSCRIPT            EQU $D626
W_ROUTE18CURSCRIPT            EQU $D627
W_ROUTE20CURSCRIPT            EQU $D628
W_SSANNE10CURSCRIPT           EQU $D629
W_VERMILIONCITYCURSCRIPT      EQU $D62A
W_POKEMONTOWER2CURSCRIPT      EQU $D62B
W_POKEMONTOWER3CURSCRIPT      EQU $D62C
W_POKEMONTOWER4CURSCRIPT      EQU $D62D
W_POKEMONTOWER5CURSCRIPT      EQU $D62E
W_POKEMONTOWER6CURSCRIPT      EQU $D62F
W_POKEMONTOWER7CURSCRIPT      EQU $D630
W_ROCKETHIDEOUT1CURSCRIPT     EQU $D631
W_ROCKETHIDEOUT2CURSCRIPT     EQU $D632
W_ROCKETHIDEOUT3CURSCRIPT     EQU $D633
W_ROCKETHIDEOUT4CURSCRIPT     EQU $D634

W_ROUTE6GATECURSCRIPT         EQU $D636
W_ROUTE8GATECURSCRIPT         EQU $D637

W_CINNABARISLANDCURSCRIPT     EQU $D639
W_MANSION1CURSCRIPT           EQU $D63A

W_MANSION2CURSCRIPT           EQU $D63C
W_MANSION3CURSCRIPT           EQU $D63D
W_MANSION4CURSCRIPT           EQU $D63E
W_VICTORYROAD2CURSCRIPT       EQU $D63F
W_VICTORYROAD3CURSCRIPT       EQU $D640

W_FIGHTINGDOJOCURSCRIPT       EQU $D642
W_SILPHCO2CURSCRIPT           EQU $D643
W_SILPHCO3CURSCRIPT           EQU $D644
W_SILPHCO4CURSCRIPT           EQU $D645
W_SILPHCO5CURSCRIPT           EQU $D646
W_SILPHCO6CURSCRIPT           EQU $D647
W_SILPHCO7CURSCRIPT           EQU $D648
W_SILPHCO8CURSCRIPT           EQU $D649
W_SILPHCO9CURSCRIPT           EQU $D64A
W_HALLOFFAMEROOMCURSCRIPT     EQU $D64B
W_GARYCURSCRIPT               EQU $D64C
W_LORELEICURSCRIPT            EQU $D64D
W_BRUNOCURSCRIPT              EQU $D64E
W_AGATHACURSCRIPT             EQU $D64F
W_UNKNOWNDUNGEON3CURSCRIPT    EQU $D650
W_VICTORYROAD1CURSCRIPT       EQU $D651

W_LANCECURSCRIPT              EQU $D653

W_SILPHCO10CURSCRIPT          EQU $D658
W_SILPHCO11CURSCRIPT          EQU $D659

W_FUCHSIAGYMCURSCRIPT         EQU $D65B
W_SAFFRONGYMCURSCRIPT         EQU $D65C

W_CINNABARGYMCURSCRIPT        EQU $D65E
W_CELADONGAMECORNERCURSCRIPT  EQU $D65F
W_ROUTE16GATECURSCRIPT        EQU $D660
W_BILLSHOUSECURSCRIPT         EQU $D661
W_ROUTE5GATECURSCRIPT         EQU $D662
W_POWERPLANTCURSCRIPT         EQU $D663 ; overload
W_ROUTE7GATECURSCRIPT         EQU $D663 ; overload

W_SSANNE2CURSCRIPT            EQU $D665
W_SEAFOAMISLANDS4CURSCRIPT    EQU $D666
W_ROUTE23CURSCRIPT            EQU $D667
W_SEAFOAMISLANDS5CURSCRIPT    EQU $D668
W_ROUTE18GATECURSCRIPT        EQU $D669

W_TOWNVISITEDFLAG EQU $D70B ; 2 bytes bit array, 1 means visited

W_SAFARITIMER1 EQU $D70D ; use 01 for maximum
W_SAFARITIMER2 EQU $D70E ; use F4 for maximum
W_FOSSILITEM   EQU $D70F ; item given to cinnabar lab
W_FOSSILMON    EQU $D710 ; mon that will result from the item

W_ENEMYMONORTRAINERCLASS EQU $D713 ; trainer classes start at $c8

W_RIVALSTARTER EQU $D715

W_PLAYERSTARTER EQU $D717

; bit 4: use variable [W_CURMAPSCRIPT] instead of the provided index for next frame's map script (used to start battle when talking to trainers)
W_FLAGS_D733 EQU $D733


W_GRASSRATE EQU $D887
W_GRASSMONS EQU $D888
W_WATERRATE EQU $D8A4 ; OVERLOADED
W_WATERMONS EQU $D8A5 ; OVERLOADED

W_ENEMYMONCOUNT  EQU $D89C

W_ENEMYMON1HP EQU $D8A5 ; 16 bits

W_ENEMYMON1MOVE3 EQU $D8AE

W_ENEMYMON2MOVE3 EQU $D8DA

W_ENEMYMON3MOVE3 EQU $D906

W_ENEMYMON4MOVE3 EQU $D932

W_ENEMYMON5MOVE3 EQU $D95E

W_ENEMYMON6MOVE3 EQU $D98A

W_ENEMYMON1OT    EQU $D9AC
W_ENEMYMON2OT    EQU $D9B7
W_ENEMYMON3OT    EQU $D9C2
W_ENEMYMON4OT    EQU $D9CD
W_ENEMYMON5OT    EQU $D9D8
W_ENEMYMON6OT    EQU $D9E3

W_ENEMYMON1NAME     EQU $D9EE
W_ENEMYMON2NAME     EQU $D9F9
W_ENEMYMON3NAME     EQU $DA04
W_ENEMYMON4NAME     EQU $DA0F
W_ENEMYMON5NAME     EQU $DA1A
W_ENEMYMON6NAME     EQU $DA25 ; to $da2f
W_TRAINERHEADERPTR  EQU $DA30

; index of current map script, mostly used as index for function pointer array
; mostly copied from map-specific map script pointer and wirtten back later
W_CURMAPSCRIPT      EQU $DA39

W_PLAYTIMEHOURS     EQU $DA40 ; two bytes
W_PLAYTIMEMINUTES   EQU $DA42 ; two bytes
W_PLAYTIMESECONDS   EQU $DA44 ; one byte
W_PLAYTIMEFRAMES    EQU $DA45 ; one byte

W_NUMSAFARIBALLS EQU $DA47

; number of mons in current box
W_NUMINBOX    EQU $DA80
W_BOXMON1DATA EQU $DA96
W_BOXMON2DATA EQU $DAB7


H_SOFTRESETCOUNTER EQU $FF8A ; initialized to 16, decremented each input iteration if the user presses the reset sequence (A+B+S+s). Soft reset when 0 is reached.

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

H_OLDPRESSEDBUTTONS     EQU $FFB1
H_NEWLYRELEASEDBUTTONS  EQU $FFB2
H_NEWLYPRESSEDBUTTONS   EQU $FFB3
H_CURRENTPRESSEDBUTTONS EQU $FFB4

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

H_RAND1 EQU $FFD3
H_RAND2 EQU $FFD4

H_FRAMECOUNTER EQU $FFD5 ; decremented every V-blank (used for delays)

; V-blank sets this to 0 each time it runs.
; So, by setting it to a nonzero value and waiting for it to become 0 again,
; you can detect that the V-blank handler has run since then.
H_VBLANKOCCURRED EQU $FFD6

H_CURRENTSPRITEOFFSET EQU $FFDA ; multiple of $10

H_WHOSETURN EQU $FFF3 ; 0 on player’s turn, 1 on enemy’s turn

H_JOYPADSTATE EQU $FFF8

; hardware registers, from the pandocs http://nocash.emubase.de/pandocs.htm
rJOYP EQU $FF00
rDIV EQU $FF04
rLCDC EQU $FF40
rSCY EQU $FF42
rSCX EQU $FF43
rBGP EQU $FF47
rOBP0 EQU $FF48
rOBP1 EQU $FF49
rWY EQU $FF4A
rWX EQU $FF4B
rIE EQU $FFFF

BTN_A      EQU %00000001
BTN_B      EQU %00000010
BTN_SELECT EQU %00000100
BTN_START  EQU %00001000
BTN_RIGHT  EQU %00010000
BTN_LEFT   EQU %00100000
BTN_UP     EQU %01000000
BTN_DOWN   EQU %10000000

; OAM attribute flags
OAM_HFLIP EQU %00100000 ; horizontal flip
OAM_VFLIP EQU %01000000 ; vertical flip

; list menu ID's
PCPOKEMONLISTMENU  EQU $00 ; PC pokemon withdraw/deposit lists
MOVESLISTMENU      EQU $01 ; XXX where is this used?
PRICEDITEMLISTMENU EQU $02 ; Pokemart buy menu / Pokemart buy/sell choose quantity menu
ITEMLISTMENU       EQU $03 ; Start menu Item menu / Pokemart sell menu
SPECIALLISTMENU    EQU $04 ; list of special "items" e.g. floor list in elevators / list of badges

; pokemon name constants
RHYDON     EQU $01
KANGASKHAN EQU $02
NIDORAN_M  EQU $03
CLEFAIRY   EQU $04
SPEAROW    EQU $05
VOLTORB    EQU $06
NIDOKING   EQU $07
SLOWBRO    EQU $08
IVYSAUR    EQU $09
EXEGGUTOR  EQU $0A
LICKITUNG  EQU $0B
EXEGGCUTE  EQU $0C
GRIMER     EQU $0D
GENGAR     EQU $0E
NIDORAN_F  EQU $0F
NIDOQUEEN  EQU $10
CUBONE     EQU $11
RHYHORN    EQU $12
LAPRAS     EQU $13
ARCANINE   EQU $14
MEW        EQU $15
GYARADOS   EQU $16
SHELLDER   EQU $17
TENTACOOL  EQU $18
GASTLY     EQU $19
SCYTHER    EQU $1A
STARYU     EQU $1B
BLASTOISE  EQU $1C
PINSIR     EQU $1D
TANGELA    EQU $1E
GROWLITHE  EQU $21
ONIX       EQU $22
FEAROW     EQU $23
PIDGEY     EQU $24
SLOWPOKE   EQU $25
KADABRA    EQU $26
GRAVELER   EQU $27
CHANSEY    EQU $28
MACHOKE    EQU $29
MR_MIME    EQU $2A
HITMONLEE  EQU $2B
HITMONCHAN EQU $2C
ARBOK      EQU $2D
PARASECT   EQU $2E
PSYDUCK    EQU $2F
DROWZEE    EQU $30
GOLEM      EQU $31
MAGMAR     EQU $33
ELECTABUZZ EQU $35
MAGNETON   EQU $36
KOFFING    EQU $37
MANKEY     EQU $39
SEEL       EQU $3A
DIGLETT    EQU $3B
TAUROS     EQU $3C
FARFETCH_D EQU $40
VENONAT    EQU $41
DRAGONITE  EQU $42
DODUO      EQU $46
POLIWAG    EQU $47
JYNX       EQU $48
MOLTRES    EQU $49
ARTICUNO   EQU $4A
ZAPDOS     EQU $4B
DITTO      EQU $4C
MEOWTH     EQU $4D
KRABBY     EQU $4E
VULPIX     EQU $52
NINETALES  EQU $53
PIKACHU    EQU $54
RAICHU     EQU $55
DRATINI    EQU $58
DRAGONAIR  EQU $59
KABUTO     EQU $5A
KABUTOPS   EQU $5B
HORSEA     EQU $5C
SEADRA     EQU $5D
SANDSHREW  EQU $60
SANDSLASH  EQU $61
OMANYTE    EQU $62
OMASTAR    EQU $63
JIGGLYPUFF EQU $64
WIGGLYTUFF EQU $65
EEVEE      EQU $66
FLAREON    EQU $67
JOLTEON    EQU $68
VAPOREON   EQU $69
MACHOP     EQU $6A
ZUBAT      EQU $6B
EKANS      EQU $6C
PARAS      EQU $6D
POLIWHIRL  EQU $6E
POLIWRATH  EQU $6F
WEEDLE     EQU $70
KAKUNA     EQU $71
BEEDRILL   EQU $72
DODRIO     EQU $74
PRIMEAPE   EQU $75
DUGTRIO    EQU $76
VENOMOTH   EQU $77
DEWGONG    EQU $78
CATERPIE   EQU $7B
METAPOD    EQU $7C
BUTTERFREE EQU $7D
MACHAMP    EQU $7E
GOLDUCK    EQU $80
HYPNO      EQU $81
GOLBAT     EQU $82
MEWTWO     EQU $83
SNORLAX    EQU $84
MAGIKARP   EQU $85
MUK        EQU $88
KINGLER    EQU $8A
CLOYSTER   EQU $8B
ELECTRODE  EQU $8D
CLEFABLE   EQU $8E
WEEZING    EQU $8F
PERSIAN    EQU $90
MAROWAK    EQU $91
HAUNTER    EQU $93
ABRA       EQU $94
ALAKAZAM   EQU $95
PIDGEOTTO  EQU $96
PIDGEOT    EQU $97
STARMIE    EQU $98
BULBASAUR  EQU $99
VENUSAUR   EQU $9A
TENTACRUEL EQU $9B
GOLDEEN    EQU $9D
SEAKING    EQU $9E
PONYTA     EQU $A3
RAPIDASH   EQU $A4
RATTATA    EQU $A5
RATICATE   EQU $A6
NIDORINO   EQU $A7
NIDORINA   EQU $A8
GEODUDE    EQU $A9
PORYGON    EQU $AA
AERODACTYL EQU $AB
MAGNEMITE  EQU $AD
CHARMANDER EQU $B0
SQUIRTLE   EQU $B1
CHARMELEON EQU $B2
WARTORTLE  EQU $B3
CHARIZARD  EQU $B4
MON_GHOST  EQU $B8
ODDISH     EQU $B9
GLOOM      EQU $BA
VILEPLUME  EQU $BB
BELLSPROUT EQU $BC
WEEPINBELL EQU $BD
VICTREEBEL EQU $BE


; trainer name constants
; sometimes it's necessary to add $C8 to these values
YOUNGSTER     EQU $01
BUG_CATCHER   EQU $02
LASS          EQU $03
SAILOR        EQU $04
JR__TRAINER_M EQU $05
JR__TRAINER_F EQU $06
POKEMANIAC    EQU $07
SUPER_NERD    EQU $08
HIKER         EQU $09
BIKER         EQU $0A
BURGLAR       EQU $0B
ENGINEER      EQU $0C
JUGGLER_X     EQU $0D
FISHER        EQU $0E
SWIMMER       EQU $0F
CUE_BALL      EQU $10
GAMBLER       EQU $11
BEAUTY        EQU $12
PSYCHIC_TR    EQU $13
ROCKER        EQU $14
JUGGLER       EQU $15
TAMER         EQU $16
BIRD_KEEPER   EQU $17
BLACKBELT     EQU $18
SONY1         EQU $19
PROF_OAK      EQU $1A
CHIEF         EQU $1B
SCIENTIST     EQU $1C
GIOVANNI      EQU $1D
ROCKET        EQU $1E
COOLTRAINER_M EQU $1F
COOLTRAINER_F EQU $20
BRUNO         EQU $21
BROCK         EQU $22
MISTY         EQU $23
LT__SURGE     EQU $24
ERIKA         EQU $25
KOGA          EQU $26
BLAINE        EQU $27
SABRINA       EQU $28
GENTLEMAN     EQU $29
SONY2         EQU $2A
SONY3         EQU $2B
LORELEI       EQU $2C
CHANNELER     EQU $2D
AGATHA        EQU $2E
LANCE         EQU $2F

; pokemon dex numbers
DEX_BULBASAUR  EQU 1
DEX_IVYSAUR    EQU 2
DEX_VENUSAUR   EQU 3
DEX_CHARMANDER EQU 4
DEX_CHARMELEON EQU 5
DEX_CHARIZARD  EQU 6
DEX_SQUIRTLE   EQU 7
DEX_WARTORTLE  EQU 8
DEX_BLASTOISE  EQU 9
DEX_CATERPIE   EQU 10
DEX_METAPOD    EQU 11
DEX_BUTTERFREE EQU 12
DEX_WEEDLE     EQU 13
DEX_KAKUNA     EQU 14
DEX_BEEDRILL   EQU 15
DEX_PIDGEY     EQU 16
DEX_PIDGEOTTO  EQU 17
DEX_PIDGEOT    EQU 18
DEX_RATTATA    EQU 19
DEX_RATICATE   EQU 20
DEX_SPEAROW    EQU 21
DEX_FEAROW     EQU 22
DEX_EKANS      EQU 23
DEX_ARBOK      EQU 24
DEX_PIKACHU    EQU 25
DEX_RAICHU     EQU 26
DEX_SANDSHREW  EQU 27
DEX_SANDSLASH  EQU 28
DEX_NIDORAN_F  EQU 29
DEX_NIDORINA   EQU 30
DEX_NIDOQUEEN  EQU 31
DEX_NIDORAN_M  EQU 32
DEX_NIDORINO   EQU 33
DEX_NIDOKING   EQU 34
DEX_CLEFAIRY   EQU 35
DEX_CLEFABLE   EQU 36
DEX_VULPIX     EQU 37
DEX_NINETALES  EQU 38
DEX_JIGGLYPUFF EQU 39
DEX_WIGGLYTUFF EQU 40
DEX_ZUBAT      EQU 41
DEX_GOLBAT     EQU 42
DEX_ODDISH     EQU 43
DEX_GLOOM      EQU 44
DEX_VILEPLUME  EQU 45
DEX_PARAS      EQU 46
DEX_PARASECT   EQU 47
DEX_VENONAT    EQU 48
DEX_VENOMOTH   EQU 49
DEX_DIGLETT    EQU 50
DEX_DUGTRIO    EQU 51
DEX_MEOWTH     EQU 52
DEX_PERSIAN    EQU 53
DEX_PSYDUCK    EQU 54
DEX_GOLDUCK    EQU 55
DEX_MANKEY     EQU 56
DEX_PRIMEAPE   EQU 57
DEX_GROWLITHE  EQU 58
DEX_ARCANINE   EQU 59
DEX_POLIWAG    EQU 60
DEX_POLIWHIRL  EQU 61
DEX_POLIWRATH  EQU 62
DEX_ABRA       EQU 63
DEX_KADABRA    EQU 64
DEX_ALAKAZAM   EQU 65
DEX_MACHOP     EQU 66
DEX_MACHOKE    EQU 67
DEX_MACHAMP    EQU 68
DEX_BELLSPROUT EQU 69
DEX_WEEPINBELL EQU 70
DEX_VICTREEBEL EQU 71
DEX_TENTACOOL  EQU 72
DEX_TENTACRUEL EQU 73
DEX_GEODUDE    EQU 74
DEX_GRAVELER   EQU 75
DEX_GOLEM      EQU 76
DEX_PONYTA     EQU 77
DEX_RAPIDASH   EQU 78
DEX_SLOWPOKE   EQU 79
DEX_SLOWBRO    EQU 80
DEX_MAGNEMITE  EQU 81
DEX_MAGNETON   EQU 82
DEX_FARFETCH_D EQU 83
DEX_DODUO      EQU 84
DEX_DODRIO     EQU 85
DEX_SEEL       EQU 86
DEX_DEWGONG    EQU 87
DEX_GRIMER     EQU 88
DEX_MUK        EQU 89
DEX_SHELLDER   EQU 90
DEX_CLOYSTER   EQU 91
DEX_GASTLY     EQU 92
DEX_HAUNTER    EQU 93
DEX_GENGAR     EQU 94
DEX_ONIX       EQU 95
DEX_DROWZEE    EQU 96
DEX_HYPNO      EQU 97
DEX_KRABBY     EQU 98
DEX_KINGLER    EQU 99
DEX_VOLTORB    EQU 100
DEX_ELECTRODE  EQU 101
DEX_EXEGGCUTE  EQU 102
DEX_EXEGGUTOR  EQU 103
DEX_CUBONE     EQU 104
DEX_MAROWAK    EQU 105
DEX_HITMONLEE  EQU 106
DEX_HITMONCHAN EQU 107
DEX_LICKITUNG  EQU 108
DEX_KOFFING    EQU 109
DEX_WEEZING    EQU 110
DEX_RHYHORN    EQU 111
DEX_RHYDON     EQU 112
DEX_CHANSEY    EQU 113
DEX_TANGELA    EQU 114
DEX_KANGASKHAN EQU 115
DEX_HORSEA     EQU 116
DEX_SEADRA     EQU 117
DEX_GOLDEEN    EQU 118
DEX_SEAKING    EQU 119
DEX_STARYU     EQU 120
DEX_STARMIE    EQU 121
DEX_MR_MIME    EQU 122
DEX_SCYTHER    EQU 123
DEX_JYNX       EQU 124
DEX_ELECTABUZZ EQU 125
DEX_MAGMAR     EQU 126
DEX_PINSIR     EQU 127
DEX_TAUROS     EQU 128
DEX_MAGIKARP   EQU 129
DEX_GYARADOS   EQU 130
DEX_LAPRAS     EQU 131
DEX_DITTO      EQU 132
DEX_EEVEE      EQU 133
DEX_VAPOREON   EQU 134
DEX_JOLTEON    EQU 135
DEX_FLAREON    EQU 136
DEX_PORYGON    EQU 137
DEX_OMANYTE    EQU 138
DEX_OMASTAR    EQU 139
DEX_KABUTO     EQU 140
DEX_KABUTOPS   EQU 141
DEX_AERODACTYL EQU 142
DEX_SNORLAX    EQU 143
DEX_ARTICUNO   EQU 144
DEX_ZAPDOS     EQU 145
DEX_MOLTRES    EQU 146
DEX_DRATINI    EQU 147
DEX_DRAGONAIR  EQU 148
DEX_DRAGONITE  EQU 149
DEX_MEWTWO     EQU 150
DEX_MEW        EQU 151


; item name constants
MASTER_BALL   EQU $01
ULTRA_BALL    EQU $02
GREAT_BALL    EQU $03
POKE_BALL     EQU $04
TOWN_MAP      EQU $05
BICYCLE       EQU $06
SURFBOARD     EQU $07 ; buggy?
SAFARI_BALL   EQU $08
POKEDEX       EQU $09
MOON_STONE    EQU $0A
ANTIDOTE      EQU $0B
BURN_HEAL     EQU $0C
ICE_HEAL      EQU $0D
AWAKENING     EQU $0E
PARLYZ_HEAL   EQU $0F
FULL_RESTORE  EQU $10
MAX_POTION    EQU $11
HYPER_POTION  EQU $12
SUPER_POTION  EQU $13
POTION        EQU $14
BOULDERBADGE  EQU $15
CASCADEBADGE  EQU $16
THUNDERBADGE  EQU $17
RAINBOWBADGE  EQU $18
SOULBADGE     EQU $19
MARSHBADGE    EQU $1A
VOLCANOBADGE  EQU $1B
EARTHBADGE    EQU $1C
ESCAPE_ROPE   EQU $1D
REPEL         EQU $1E
OLD_AMBER     EQU $1F
FIRE_STONE    EQU $20
THUNDER_STONE EQU $21
WATER_STONE   EQU $22
HP_UP         EQU $23
PROTEIN       EQU $24
IRON          EQU $25
CARBOS        EQU $26
CALCIUM       EQU $27
RARE_CANDY    EQU $28
DOME_FOSSIL   EQU $29
HELIX_FOSSIL  EQU $2A
SECRET_KEY    EQU $2B
; XXX ????? EQU $2C
BIKE_VOUCHER  EQU $2D
X_ACCURACY    EQU $2E
LEAF_STONE    EQU $2F
CARD_KEY      EQU $30
NUGGET        EQU $31
;PP_UP         EQU $32
POKE_DOLL     EQU $33
FULL_HEAL     EQU $34
REVIVE        EQU $35
MAX_REVIVE    EQU $36
GUARD_SPEC_   EQU $37
SUPER_REPEL   EQU $38
MAX_REPEL     EQU $39
DIRE_HIT      EQU $3A
COIN          EQU $3B
FRESH_WATER   EQU $3C
SODA_POP      EQU $3D
LEMONADE      EQU $3E
S_S__TICKET   EQU $3F
GOLD_TEETH    EQU $40
X_ATTACK      EQU $41
X_DEFEND      EQU $42
X_SPEED       EQU $43
X_SPECIAL     EQU $44
COIN_CASE     EQU $45
OAKS_PARCEL   EQU $46
ITEMFINDER    EQU $47
SILPH_SCOPE   EQU $48
POKE_FLUTE    EQU $49
LIFT_KEY      EQU $4A
EXP__ALL      EQU $4B
OLD_ROD       EQU $4C
GOOD_ROD      EQU $4D
SUPER_ROD     EQU $4E
; XXX todo: compare this to $32
PP_UP         EQU $4F
ETHER         EQU $50
MAX_ETHER     EQU $51
ELIXER        EQU $52
MAX_ELIXER    EQU $53
HM_01         EQU $C4
HM_02         EQU $C5
HM_03         EQU $C6
HM_04         EQU $C7
HM_05         EQU $C8
TM_01         EQU $C9
TM_02         EQU $CA
TM_03         EQU $CB
TM_04         EQU $CC
TM_05         EQU $CD
TM_06         EQU $CE
TM_07         EQU $CF
TM_08         EQU $D0
TM_09         EQU $D1
TM_10         EQU $D2
TM_11         EQU $D3
TM_12         EQU $D4
TM_13         EQU $D5
TM_14         EQU $D6
TM_15         EQU $D7
TM_16         EQU $D8
TM_17         EQU $D9
TM_18         EQU $DA
TM_19         EQU $DB
TM_20         EQU $DC
TM_21         EQU $DD
TM_22         EQU $DE
TM_23         EQU $DF
TM_24         EQU $E0
TM_25         EQU $E1
TM_26         EQU $E2
TM_27         EQU $E3
TM_28         EQU $E4
TM_29         EQU $E5
TM_30         EQU $E6
TM_31         EQU $E7
TM_32         EQU $E8
TM_33         EQU $E9
TM_34         EQU $EA
TM_35         EQU $EB
TM_36         EQU $EC
TM_37         EQU $ED
TM_38         EQU $EE
TM_39         EQU $EF
TM_40         EQU $F0
TM_41         EQU $F1
TM_42         EQU $F2
TM_43         EQU $F3
TM_44         EQU $F4
TM_45         EQU $F5
TM_46         EQU $F6
TM_47         EQU $F7
TM_48         EQU $F8
TM_49         EQU $F9
TM_50         EQU $FA

; tentative move effect constants
; {stat}_(UP|DOWN)(1|2) means that the move raises the user's (or lowers the target's) corresponding stat modifier by 1 (or 2) stages
; {status condition}_side_effect means that the move has a side chance of causing that condition
; {status condition}_effect means that the move causes the status condition every time it hits the target
NO_ADDITIONAL_EFFECT       EQU $00
POISON_SIDE_EFFECT1        EQU $02
DRAIN_HP_EFFECT            EQU $03
BURN_SIDE_EFFECT1          EQU $04
FREEZE_SIDE_EFFECT         EQU $05
PARALYZE_SIDE_EFFECT1      EQU $06
EXPLODE_EFFECT             EQU $07 ; Explosion, Self Destruct
DREAM_EATER_EFFECT         EQU $08
MIRROR_MOVE_EFFECT         EQU $09
ATTACK_UP1_EFFECT          EQU $0A
DEFENSE_UP1_EFFECT         EQU $0B
SPECIAL_UP1_EFFECT         EQU $0D
EVASION_UP1_EFFECT         EQU $0F
PAY_DAY_EFFECT             EQU $10
SWIFT_EFFECT               EQU $11
ATTACK_DOWN1_EFFECT        EQU $12
DEFENSE_DOWN1_EFFECT       EQU $13
SPEED_DOWN1_EFFECT         EQU $14
ACCURACY_DOWN1_EFFECT      EQU $16
CONVERSION_EFFECT          EQU $18
HAZE_EFFECT                EQU $19
BIDE_EFFECT                EQU $1A
THRASH_PETAL_DANCE_EFFECT  EQU $1B
SWITCH_AND_TELEPORT_EFFECT EQU $1C
TWO_TO_FIVE_ATTACKS_EFFECT EQU $1D
FLINCH_SIDE_EFFECT1        EQU $1F
SLEEP_EFFECT               EQU $20
POISON_SIDE_EFFECT2        EQU $21
BURN_SIDE_EFFECT2          EQU $22
PARALYZE_SIDE_EFFECT2      EQU $24
FLINCH_SIDE_EFFECT2        EQU $25
OHKO_EFFECT                EQU $26 ; moves like Horn Drill
CHARGE_EFFECT              EQU $27 ; moves like Solar Beam
SUPER_FANG_EFFECT          EQU $28
SPECIAL_DAMAGE_EFFECT      EQU $29 ; Seismic Toss, Night Shade, Sonic Boom, Dragon Rage, Psywave
TRAPPING_EFFECT            EQU $2A ; moves like Wrap
FLY_EFFECT                 EQU $2B
ATTACK_TWICE_EFFECT        EQU $2C
JUMP_KICK_EFFECT           EQU $2D ; Jump Kick and Hi Jump Kick effect
MIST_EFFECT                EQU $2E
FOCUS_ENERGY_EFFECT        EQU $2F
RECOIL_EFFECT              EQU $30 ; moves like Double Edge
CONFUSION_EFFECT           EQU $31 ; Confuse Ray, Supersonic (not the move Confusion)
ATTACK_UP2_EFFECT          EQU $32
DEFENSE_UP2_EFFECT         EQU $33
SPEED_UP2_EFFECT           EQU $34
SPECIAL_UP2_EFFECT         EQU $35
HEAL_EFFECT                EQU $38 ; Recover, Softboiled, Rest
TRANSFORM_EFFECT           EQU $39
DEFENSE_DOWN2_EFFECT       EQU $3B
LIGHT_SCREEN_EFFECT        EQU $40
REFLECT_EFFECT             EQU $41
POISON_EFFECT              EQU $42
PARALYZE_EFFECT            EQU $43
ATTACK_DOWN_SIDE_EFFECT    EQU $44
DEFENSE_DOWN_SIDE_EFFECT   EQU $45
SPEED_DOWN_SIDE_EFFECT     EQU $46
SPECIAL_DOWN_SIDE_EFFECT   EQU $47
CONFUSION_SIDE_EFFECT      EQU $4C
TWINEEDLE_EFFECT           EQU $4D
SUBSTITUTE_EFFECT          EQU $4F
HYPER_BEAM_EFFECT          EQU $50
RAGE_EFFECT                EQU $51
MIMIC_EFFECT               EQU $52
METRONOME_EFFECT           EQU $53
LEECH_SEED_EFFECT          EQU $54
SPLASH_EFFECT              EQU $55
DISABLE_EFFECT             EQU $56

; fixed damage constants
SONICBOOM_DAMAGE   EQU 20
DRAGON_RAGE_DAMAGE EQU 40

; move name constants
POUND        EQU $01
KARATE_CHOP  EQU $02
DOUBLESLAP   EQU $03
COMET_PUNCH  EQU $04
MEGA_PUNCH   EQU $05
PAY_DAY      EQU $06
FIRE_PUNCH   EQU $07
ICE_PUNCH    EQU $08
THUNDERPUNCH EQU $09
SCRATCH      EQU $0A
VICEGRIP     EQU $0B
GUILLOTINE   EQU $0C
RAZOR_WIND   EQU $0D
SWORDS_DANCE EQU $0E
CUT          EQU $0F
GUST         EQU $10
WING_ATTACK  EQU $11
WHIRLWIND    EQU $12
FLY          EQU $13
BIND         EQU $14
SLAM         EQU $15
VINE_WHIP    EQU $16
STOMP        EQU $17
DOUBLE_KICK  EQU $18
MEGA_KICK    EQU $19
JUMP_KICK    EQU $1A
ROLLING_KICK EQU $1B
SAND_ATTACK  EQU $1C
HEADBUTT     EQU $1D
HORN_ATTACK  EQU $1E
FURY_ATTACK  EQU $1F
HORN_DRILL   EQU $20
TACKLE       EQU $21
BODY_SLAM    EQU $22
WRAP         EQU $23
TAKE_DOWN    EQU $24
THRASH       EQU $25
DOUBLE_EDGE  EQU $26
TAIL_WHIP    EQU $27
POISON_STING EQU $28
TWINEEDLE    EQU $29
PIN_MISSILE  EQU $2A
LEER         EQU $2B
BITE         EQU $2C
GROWL        EQU $2D
ROAR         EQU $2E
SING         EQU $2F
SUPERSONIC   EQU $30
SONICBOOM    EQU $31
DISABLE      EQU $32
ACID         EQU $33
EMBER        EQU $34
FLAMETHROWER EQU $35
MIST         EQU $36
WATER_GUN    EQU $37
HYDRO_PUMP   EQU $38
SURF         EQU $39
ICE_BEAM     EQU $3A
BLIZZARD     EQU $3B
PSYBEAM      EQU $3C
BUBBLEBEAM   EQU $3D
AURORA_BEAM  EQU $3E
HYPER_BEAM   EQU $3F
PECK         EQU $40
DRILL_PECK   EQU $41
SUBMISSION   EQU $42
LOW_KICK     EQU $43
COUNTER      EQU $44
SEISMIC_TOSS EQU $45
STRENGTH     EQU $46
ABSORB       EQU $47
MEGA_DRAIN   EQU $48
LEECH_SEED   EQU $49
GROWTH       EQU $4A
RAZOR_LEAF   EQU $4B
SOLARBEAM    EQU $4C
POISONPOWDER EQU $4D
STUN_SPORE   EQU $4E
SLEEP_POWDER EQU $4F
PETAL_DANCE  EQU $50
STRING_SHOT  EQU $51
DRAGON_RAGE  EQU $52
FIRE_SPIN    EQU $53
THUNDERSHOCK EQU $54
THUNDERBOLT  EQU $55
THUNDER_WAVE EQU $56
THUNDER      EQU $57
ROCK_THROW   EQU $58
EARTHQUAKE   EQU $59
FISSURE      EQU $5A
DIG          EQU $5B
TOXIC        EQU $5C
CONFUSION    EQU $5D
PSYCHIC_M    EQU $5E
HYPNOSIS     EQU $5F
MEDITATE     EQU $60
AGILITY      EQU $61
QUICK_ATTACK EQU $62
RAGE         EQU $63
TELEPORT     EQU $64
NIGHT_SHADE  EQU $65
MIMIC        EQU $66
SCREECH      EQU $67
DOUBLE_TEAM  EQU $68
RECOVER      EQU $69
HARDEN       EQU $6A
MINIMIZE     EQU $6B
SMOKESCREEN  EQU $6C
CONFUSE_RAY  EQU $6D
WITHDRAW     EQU $6E
DEFENSE_CURL EQU $6F
BARRIER      EQU $70
LIGHT_SCREEN EQU $71
HAZE         EQU $72
REFLECT      EQU $73
FOCUS_ENERGY EQU $74
BIDE         EQU $75
METRONOME    EQU $76
MIRROR_MOVE  EQU $77
SELFDESTRUCT EQU $78
EGG_BOMB     EQU $79
LICK         EQU $7A
SMOG         EQU $7B
SLUDGE       EQU $7C
BONE_CLUB    EQU $7D
FIRE_BLAST   EQU $7E
WATERFALL    EQU $7F
CLAMP        EQU $80
SWIFT        EQU $81
SKULL_BASH   EQU $82
SPIKE_CANNON EQU $83
CONSTRICT    EQU $84
AMNESIA      EQU $85
KINESIS      EQU $86
SOFTBOILED   EQU $87
HI_JUMP_KICK EQU $88
GLARE        EQU $89
DREAM_EATER  EQU $8A
POISON_GAS   EQU $8B
BARRAGE      EQU $8C
LEECH_LIFE   EQU $8D
LOVELY_KISS  EQU $8E
SKY_ATTACK   EQU $8F
TRANSFORM    EQU $90
BUBBLE       EQU $91
DIZZY_PUNCH  EQU $92
SPORE        EQU $93
FLASH        EQU $94
PSYWAVE      EQU $95
SPLASH       EQU $96
ACID_ARMOR   EQU $97
CRABHAMMER   EQU $98
EXPLOSION    EQU $99
FURY_SWIPES  EQU $9A
BONEMERANG   EQU $9B
REST         EQU $9C
ROCK_SLIDE   EQU $9D
HYPER_FANG   EQU $9E
SHARPEN      EQU $9F
CONVERSION   EQU $A0
TRI_ATTACK   EQU $A1
SUPER_FANG   EQU $A2
SLASH        EQU $A3
SUBSTITUTE   EQU $A4
STRUGGLE     EQU $A5
; these do double duty as animation identifiers
SHOWPIC_ANIM EQU $A6 ; redraw monster pic
XSTATITEM_ANIM EQU $AE ; use X Attack/Defense/Speed/Special
SLP_ANIM     EQU $BD ; sleeping monster
CONF_ANIM    EQU $BF ; confused monster
TOSS_ANIM    EQU $C1 ; toss Poké Ball
SHAKE_ANIM   EQU $C2 ; shaking Poké Ball when catching monster
POOF_ANIM    EQU $C3 ; puff of smoke
BLOCKBALL_ANIM EQU $C4 ; trainer knocks away Poké Ball
GREATTOSS_ANIM EQU $C5 ; toss Great Ball
ULTRATOSS_ANIM EQU $C6 ; toss Ultra Ball or Master Ball
HIDEPIC_ANIM EQU $C8 ; monster disappears
ROCK_ANIM EQU $C9 ; throw rock
BAIT_ANIM EQU $CA ; throw bait

; super game boy palettes
PAL_ROUTE     EQU $00
PAL_PALLET    EQU $01
PAL_VIRIDIAN  EQU $02
PAL_PEWTER    EQU $03
PAL_CERULEAN  EQU $04
PAL_LAVENDER  EQU $05
PAL_VERMILION EQU $06
PAL_CELADON   EQU $07
PAL_FUCHSIA   EQU $08
PAL_CINNABAR  EQU $09
PAL_INDIGO    EQU $0A
PAL_SAFFRON   EQU $0B
PAL_TOWNMAP   EQU $0C
PAL_LOGO1     EQU $0D
; XXX
PAL_LOGO2     EQU $0F
PAL_MEWMON    EQU $10
PAL_BLUEMON   EQU $11
PAL_REDMON    EQU $12
PAL_CYANMON   EQU $13
PAL_PURPLEMON EQU $14
PAL_BROWNMON  EQU $15
PAL_GREENMON  EQU $16
PAL_PINKMON   EQU $17
PAL_YELLOWMON EQU $18
PAL_GREYMON   EQU $19
PAL_SLOTS1    EQU $1A
PAL_SLOTS2    EQU $1B
PAL_SLOTS3    EQU $1C
PAL_SLOTS4    EQU $1D
PAL_BLACK     EQU $1E
PAL_GREENBAR  EQU $1F
PAL_YELLOWBAR EQU $20
PAL_REDBAR    EQU $21
PAL_BADGE     EQU $22
PAL_CAVE      EQU $23
; XXX

; map name constants
PALLET_TOWN     EQU $00
VIRIDIAN_CITY   EQU $01
PEWTER_CITY     EQU $02
CERULEAN_CITY   EQU $03
LAVENDER_TOWN   EQU $04
VERMILION_CITY  EQU $05
CELADON_CITY    EQU $06
FUCHSIA_CITY    EQU $07
CINNABAR_ISLAND EQU $08
INDIGO_PLATEAU  EQU $09
SAFFRON_CITY    EQU $0A
; unused        EQU $0B
ROUTE_1         EQU $0C
ROUTE_2         EQU $0D
ROUTE_3         EQU $0E
ROUTE_4         EQU $0F
ROUTE_5         EQU $10
ROUTE_6         EQU $11
ROUTE_7         EQU $12
ROUTE_8         EQU $13
ROUTE_9         EQU $14
ROUTE_10        EQU $15
ROUTE_11        EQU $16
ROUTE_12        EQU $17
ROUTE_13        EQU $18
ROUTE_14        EQU $19
ROUTE_15        EQU $1A
ROUTE_16        EQU $1B
ROUTE_17        EQU $1C
ROUTE_18        EQU $1D
ROUTE_19        EQU $1E
ROUTE_20        EQU $1F
ROUTE_21        EQU $20
ROUTE_22        EQU $21
ROUTE_23        EQU $22
ROUTE_24        EQU $23
ROUTE_25        EQU $24
REDS_HOUSE_1F EQU $25
REDS_HOUSE_2F EQU $26
BLUES_HOUSE EQU $27
OAKS_LAB EQU $28
VIRIDIAN_POKECENTER EQU $29
VIRIDIAN_MART EQU $2A
VIRIDIAN_SCHOOL EQU $2B
VIRIDIAN_HOUSE EQU $2C
VIRIDIAN_GYM EQU $2D
DIGLETTS_CAVE_EXIT EQU $2E
VIRIDIAN_FOREST_EXIT EQU $2F
ROUTE_2_HOUSE EQU $30
ROUTE_2_GATE EQU $31
VIRIDIAN_FOREST_ENTRANCE EQU $32
VIRIDIAN_FOREST EQU $33
MUSEUM_1F EQU $34
MUSEUM_2F EQU $35
PEWTER_GYM EQU $36
PEWTER_HOUSE_1 EQU $37
PEWTER_MART EQU $38
PEWTER_HOUSE_2 EQU $39
PEWTER_POKECENTER EQU $3A
MT_MOON_1 EQU $3B
MT_MOON_2 EQU $3C
MT_MOON_3 EQU $3D
TRASHED_HOUSE EQU $3E
CERULEAN_HOUSE EQU $3F
CERULEAN_POKECENTER EQU $40
CERULEAN_GYM EQU $41
BIKE_SHOP EQU $42
CERULEAN_MART EQU $43
MT_MOON_POKECENTER EQU $44
;copy of TRASHED_HOUSE EQU $45
ROUTE_5_GATE EQU $46
PATH_ENTRANCE_ROUTE_5 EQU $47
DAYCAREM EQU $48
ROUTE_6_GATE EQU $49
PATH_ENTRANCE_ROUTE_6 EQU $4A
;copy of PATH_ENTRANCE_ROUTE_6 EQU $4B
ROUTE_7_GATE EQU $4C
PATH_ENTRANCE_ROUTE_7 EQU $4D
;copy of PATH_ENTRANCE_ROUTE_7 EQU $4E
ROUTE_8_GATE EQU $4F
PATH_ENTRANCE_ROUTE_8 EQU $50
ROCK_TUNNEL_POKECENTER EQU $51
ROCK_TUNNEL_1 EQU $52
POWER_PLANT EQU $53
ROUTE_11_GATE_1F EQU $54
DIGLETTS_CAVE_ENTRANCE EQU $55
ROUTE_11_GATE_2F EQU $56
ROUTE_12_GATE EQU $57
BILLS_HOUSE EQU $58
VERMILION_POKECENTER EQU $59
POKEMON_FAN_CLUB EQU $5A
VERMILION_MART EQU $5B
VERMILION_GYM EQU $5C
VERMILION_HOUSE_1 EQU $5D
VERMILION_DOCK EQU $5E
SS_ANNE_1 EQU $5F
SS_ANNE_2 EQU $60
SS_ANNE_3 EQU $61
SS_ANNE_4 EQU $62
SS_ANNE_5 EQU $63
SS_ANNE_6 EQU $64
SS_ANNE_7 EQU $65
SS_ANNE_8 EQU $66
SS_ANNE_9 EQU $67
SS_ANNE_10 EQU $68
;EQU $69
;EQU $6A
;EQU $6B
VICTORY_ROAD_1 EQU $6C
;EQU $6D
;EQU $6E
;EQU $6F
;EQU $70
LANCES_ROOM EQU $71
;EQU $72
;EQU $73
;EQU $74
;EQU $75
HALL_OF_FAME EQU $76
UNDERGROUND_PATH_NS EQU $77
CHAMPIONS_ROOM EQU $78
UNDERGROUND_PATH_WE EQU $79
CELADON_MART_1 EQU $7A
CELADON_MART_2 EQU $7B
CELADON_MART_3 EQU $7C
CELADON_MART_4 EQU $7D
CELADON_MART_ROOF EQU $7E
CELADON_MART_ELEVATOR EQU $7F
CELADON_MANSION_1 EQU $80
CELADON_MANSION_2 EQU $81
CELADON_MANSION_3 EQU $82
CELADON_MANSION_4 EQU $83
CELADON_MANSION_5 EQU $84
CELADON_POKECENTER EQU $85
CELADON_GYM EQU $86
GAME_CORNER EQU $87
CELADON_MART_5 EQU $88
CELADONPRIZE_ROOM EQU $89
CELADON_DINER EQU $8A
CELADON_HOUSE EQU $8B
CELADON_HOTEL EQU $8C
LAVENDER_POKECENTER EQU $8D
POKEMONTOWER_1 EQU $8E
POKEMONTOWER_2 EQU $8F
POKEMONTOWER_3 EQU $90
POKEMONTOWER_4 EQU $91
POKEMONTOWER_5 EQU $92
POKEMONTOWER_6 EQU $93
POKEMONTOWER_7 EQU $94
LAVENDER_HOUSE_1 EQU $95
LAVENDER_MART EQU $96
LAVENDER_HOUSE_2 EQU $97
FUCHSIA_MART EQU $98
FUCHSIA_HOUSE_1 EQU $99
FUCHSIA_POKECENTER EQU $9A
FUCHSIA_HOUSE_2 EQU $9B
SAFARIZONEENTRANCE EQU $9C
FUCHSIA_GYM EQU $9D
FUCHSIAMEETINGROOM EQU $9E
SEAFOAM_ISLANDS_2 EQU $9F
SEAFOAM_ISLANDS_3 EQU $A0
SEAFOAM_ISLANDS_4 EQU $A1
SEAFOAM_ISLANDS_5 EQU $A2
VERMILION_HOUSE_2 EQU $A3
FUCHSIA_HOUSE_3 EQU $A4
MANSION_1 EQU $A5
CINNABAR_GYM EQU $A6
CINNABAR_LAB_1 EQU $A7
CINNABAR_LAB_2 EQU $A8
CINNABAR_LAB_3 EQU $A9
CINNABAR_LAB_4 EQU $AA
CINNABAR_POKECENTER EQU $AB
CINNABAR_MART EQU $AC
;copy of CINNABAR_MART EQU $AD
INDIGO_PLATEAU_LOBBY EQU $AE
COPYCATS_HOUSE_1F EQU $AF
COPYCATS_HOUSE_2F EQU $B0
FIGHTINGDOJO EQU $B1
SAFFRON_GYM EQU $B2
SAFFRON_HOUSE_1 EQU $B3
SAFFRON_MART EQU $B4
SILPH_CO_1F EQU $B5
SAFFRON_POKECENTER EQU $B6
SAFFRON_HOUSE_2 EQU $B7
ROUTE_15_GATE_1F EQU $B8
ROUTE_15_GATE_2F EQU $B9
ROUTE_16_GATE_1F EQU $BA
ROUTE_16_GATE_2F EQU $BB
ROUTE_16_HOUSE EQU $BC
ROUTE_12_HOUSE EQU $BD
ROUTE_18_GATE_1F EQU $BE
ROUTE_18_GATE_2F EQU $BF
SEAFOAM_ISLANDS_1 EQU $C0
ROUTE_22_GATE EQU $C1
VICTORY_ROAD_2 EQU $C2
ROUTE_12_GATE_2F EQU $C3
VERMILION_HOUSE_3 EQU $C4
DIGLETTS_CAVE EQU $C5
VICTORY_ROAD_3 EQU $C6
ROCKET_HIDEOUT_1 EQU $C7
ROCKET_HIDEOUT_2 EQU $C8
ROCKET_HIDEOUT_3 EQU $C9
ROCKET_HIDEOUT_4 EQU $CA
ROCKET_HIDEOUT_ELEVATOR EQU $CB
;EQU $CC
;EQU $CD
;EQU $CE
SILPH_CO_2F EQU $CF
SILPH_CO_3F EQU $D0
SILPH_CO_4F EQU $D1
SILPH_CO_5F EQU $D2
SILPH_CO_6F EQU $D3
SILPH_CO_7F EQU $D4
SILPH_CO_8F EQU $D5
MANSION_2 EQU $D6
MANSION_3 EQU $D7
MANSION_4 EQU $D8
SAFARI_ZONE_EAST EQU $D9
SAFARI_ZONE_NORTH EQU $DA
SAFARI_ZONE_WEST EQU $DB
SAFARI_ZONE_CENTER EQU $DC
SAFARI_ZONE_REST_HOUSE_1 EQU $DD
SAFARI_ZONE_SECRET_HOUSE EQU $DE
SAFARI_ZONE_REST_HOUSE_2 EQU $DF
SAFARI_ZONE_REST_HOUSE_3 EQU $E0
SAFARI_ZONE_REST_HOUSE_4 EQU $E1
UNKNOWN_DUNGEON_2 EQU $E2
UNKNOWN_DUNGEON_3 EQU $E3
UNKNOWN_DUNGEON_1 EQU $E4
NAME_RATERS_HOUSE EQU $E5
CERULEAN_HOUSE_3 EQU $E6
;EQU $E7
ROCK_TUNNEL_2 EQU $E8
SILPH_CO_9F EQU $E9
SILPH_CO_10F EQU $EA
SILPH_CO_11F EQU $EB
SILPH_CO_ELEVATOR EQU $EC
;EQU $ED
;EQU $EE
BATTLE_CENTER EQU $EF
TRADE_CENTER EQU $F0
;EQU $F1
;EQU $F2
;EQU $F3
;EQU $F4
LORELEIS_ROOM EQU $F5
BRUNOS_ROOM EQU $F6
AGATHAS_ROOM EQU $F7
BEACH_HOUSE EQU $F8 ; Yellow only

; Evolution types
EV_LEVEL	EQU 1
EV_ITEM 	EQU 2
EV_TRADE	EQU 3

; Elemental types
NORMAL EQU $00
FIGHTING EQU $01
FLYING EQU $02
POISON EQU $03
GROUND EQU $04
ROCK EQU $05
BUG EQU $07
GHOST EQU $08
FIRE EQU $14
WATER EQU $15
GRASS EQU $16
ELECTRIC EQU $17
PSYCHIC EQU $18
ICE EQU $19
DRAGON EQU $1A

EAST EQU 1
WEST EQU 2
SOUTH EQU 4
NORTH EQU 8

; different kinds of people events
ITEM EQU $80
TRAINER EQU $40

; status ailments (masks)
SLP     EQU %00000111
PSN     EQU %00001000
BRN     EQU %00010000
FRZ     EQU %00100000
PAR     EQU %01000000

; pokemon's overworld sprites
SPRITE_MON			EQU $0
SPRITE_BALL_M		EQU $1
SPRITE_HELIX		EQU $2
SPRITE_FAIRY		EQU $3
SPRITE_BIRD_M		EQU $4
SPRITE_WATER		EQU $5
SPRITE_BUG			EQU $6
SPRITE_GRASS		EQU $7
SPRITE_SNAKE		EQU $8
SPRITE_QUADRUPED 	EQU $9

; overworld sprites
SPRITE_RED                       EQU $01
SPRITE_BLUE                      EQU $02
SPRITE_OAK                       EQU $03
SPRITE_BUG_CATCHER               EQU $04
SPRITE_SLOWBRO                   EQU $05
SPRITE_LASS                      EQU $06
SPRITE_BLACK_HAIR_BOY_1          EQU $07
SPRITE_LITTLE_GIRL               EQU $08
SPRITE_BIRD                      EQU $09
SPRITE_FAT_BALD_GUY              EQU $0a
SPRITE_GAMBLER                   EQU $0b
SPRITE_BLACK_HAIR_BOY_2          EQU $0c
SPRITE_GIRL                      EQU $0d
SPRITE_HIKER                     EQU $0e
SPRITE_FOULARD_WOMAN             EQU $0f
SPRITE_GENTLEMAN                 EQU $10
SPRITE_DAISY                     EQU $11
SPRITE_BIKER                     EQU $12
SPRITE_SAILOR                    EQU $13
SPRITE_COOK                      EQU $14
SPRITE_BIKE_SHOP_GUY             EQU $15
SPRITE_MR_FUJI                   EQU $16
SPRITE_GIOVANNI                  EQU $17
SPRITE_ROCKET                    EQU $18
SPRITE_MEDIUM                    EQU $19
SPRITE_WAITER                    EQU $1a
SPRITE_ERIKA                     EQU $1b
SPRITE_MOM_GEISHA                EQU $1c
SPRITE_BRUNETTE_GIRL             EQU $1d
SPRITE_LANCE                     EQU $1e
SPRITE_OAK_SCIENTIST_AIDE        EQU $1f
SPRITE_OAK_AIDE                  EQU $20
SPRITE_ROCKER                    EQU $21
SPRITE_SWIMMER                   EQU $22
SPRITE_WHITE_PLAYER              EQU $23
SPRITE_GYM_HELPER                EQU $24
SPRITE_OLD_PERSON                EQU $25
SPRITE_MART_GUY                  EQU $26
SPRITE_FISHER                    EQU $27
SPRITE_OLD_MEDIUM_WOMAN          EQU $28
SPRITE_NURSE                     EQU $29
SPRITE_CABLE_CLUB_WOMAN          EQU $2a
SPRITE_MR_MASTERBALL             EQU $2b
SPRITE_LAPRAS_GIVER              EQU $2c
SPRITE_WARDEN                    EQU $2d
SPRITE_SS_CAPTAIN                EQU $2e
SPRITE_FISHER2                   EQU $2f
SPRITE_BLACKBELT                 EQU $30
SPRITE_GUARD                     EQU $31
;SPRITE_COP_GUARD                 EQU $32
SPRITE_MOM                       EQU $33
SPRITE_BALDING_GUY               EQU $34
SPRITE_YOUNG_BOY                 EQU $35
SPRITE_GAMEBOY_KID               EQU $36
SPRITE_GAMEBOY_KID_COPY          EQU $37
SPRITE_CLEFAIRY                  EQU $38
SPRITE_AGATHA                    EQU $39
SPRITE_BRUNO                     EQU $3a
SPRITE_LORELEI                   EQU $3b
SPRITE_SEEL                      EQU $3c
SPRITE_BALL                      EQU $3d
SPRITE_OMANYTE                   EQU $3e
SPRITE_BOULDER                   EQU $3f
SPRITE_PAPER_SHEET               EQU $40
SPRITE_BOOK_MAP_DEX              EQU $41
SPRITE_CLIPBOARD                 EQU $42
SPRITE_SNORLAX                   EQU $43
SPRITE_OLD_AMBER_COPY            EQU $44
SPRITE_OLD_AMBER                 EQU $45
SPRITE_LYING_OLD_MAN_UNUSED_1    EQU $46
SPRITE_LYING_OLD_MAN_UNUSED_2    EQU $47
SPRITE_LYING_OLD_MAN             EQU $48

; Map sizes (y, x)

; PalletTown_h map_id=0
PALLET_TOWN_HEIGHT EQU $09
PALLET_TOWN_WIDTH  EQU $0a

; ViridianCity_h map_id=1
VIRIDIAN_CITY_HEIGHT EQU $12
VIRIDIAN_CITY_WIDTH  EQU $14

; PewterCity_h map_id=2
PEWTER_CITY_HEIGHT EQU $12
PEWTER_CITY_WIDTH  EQU $14

; CeruleanCity_h map_id=3
CERULEAN_CITY_HEIGHT EQU $12
CERULEAN_CITY_WIDTH  EQU $14

; LavenderTown_h map_id=4
LAVENDER_TOWN_HEIGHT EQU $09
LAVENDER_TOWN_WIDTH  EQU $0a

; VermilionCity_h map_id=5
VERMILION_CITY_HEIGHT EQU $12
VERMILION_CITY_WIDTH  EQU $14

; CeladonCity_h map_id=6
CELADON_CITY_HEIGHT EQU $12
CELADON_CITY_WIDTH  EQU $19

; FuchsiaCity_h map_id=7
FUCHSIA_CITY_HEIGHT EQU $12
FUCHSIA_CITY_WIDTH  EQU $14

; CinnabarIsland_h map_id=8
CINNABAR_ISLAND_HEIGHT EQU $09
CINNABAR_ISLAND_WIDTH  EQU $0a

; IndigoPlateau_h map_id=9
INDIGO_PLATEAU_HEIGHT EQU $09
INDIGO_PLATEAU_WIDTH  EQU $0a

; SaffronCity_h map_id=10
SAFFRON_CITY_HEIGHT EQU $12
SAFFRON_CITY_WIDTH  EQU $14

; Route1_h map_id=12
ROUTE_1_HEIGHT EQU $12
ROUTE_1_WIDTH  EQU $0a

; Route2_h map_id=13
ROUTE_2_HEIGHT EQU $24
ROUTE_2_WIDTH  EQU $0a

; Route3_h map_id=14
ROUTE_3_HEIGHT EQU $09
ROUTE_3_WIDTH  EQU $23

; Route4_h map_id=15
ROUTE_4_HEIGHT EQU $09
ROUTE_4_WIDTH  EQU $2d

; Route5_h map_id=16
ROUTE_5_HEIGHT EQU $12
ROUTE_5_WIDTH  EQU $0a

; Route6_h map_id=17
ROUTE_6_HEIGHT EQU $12
ROUTE_6_WIDTH  EQU $0a

; Route7_h map_id=18
ROUTE_7_HEIGHT EQU $09
ROUTE_7_WIDTH  EQU $0a

; Route8_h map_id=19
ROUTE_8_HEIGHT EQU $09
ROUTE_8_WIDTH  EQU $1e

; Route9_h map_id=20
ROUTE_9_HEIGHT EQU $09
ROUTE_9_WIDTH  EQU $1e

; Route10_h map_id=21
ROUTE_10_HEIGHT EQU $24
ROUTE_10_WIDTH  EQU $0a

; Route11_h map_id=22
ROUTE_11_HEIGHT EQU $09
ROUTE_11_WIDTH  EQU $1e

; Route12_h map_id=23
ROUTE_12_HEIGHT EQU $36
ROUTE_12_WIDTH  EQU $0a

; Route13_h map_id=24
ROUTE_13_HEIGHT EQU $09
ROUTE_13_WIDTH  EQU $1e

; Route14_h map_id=25
ROUTE_14_HEIGHT EQU $1b
ROUTE_14_WIDTH  EQU $0a

; Route15_h map_id=26
ROUTE_15_HEIGHT EQU $09
ROUTE_15_WIDTH  EQU $1e

; Route16_h map_id=27
ROUTE_16_HEIGHT EQU $09
ROUTE_16_WIDTH  EQU $14

; Route17_h map_id=28
ROUTE_17_HEIGHT EQU $48
ROUTE_17_WIDTH  EQU $0a

; Route18_h map_id=29
ROUTE_18_HEIGHT EQU $09
ROUTE_18_WIDTH  EQU $19

; Route19_h map_id=30
ROUTE_19_HEIGHT EQU $1b
ROUTE_19_WIDTH  EQU $0a

; Route20_h map_id=31
ROUTE_20_HEIGHT EQU $09
ROUTE_20_WIDTH  EQU $32

; Route21_h map_id=32
ROUTE_21_HEIGHT EQU $2d
ROUTE_21_WIDTH  EQU $0a

; Route22_h map_id=33
ROUTE_22_HEIGHT EQU $09
ROUTE_22_WIDTH  EQU $14

; Route23_h map_id=34
ROUTE_23_HEIGHT EQU $48
ROUTE_23_WIDTH  EQU $0a

; Route24_h map_id=35
ROUTE_24_HEIGHT EQU $12
ROUTE_24_WIDTH  EQU $0a

; Route25_h map_id=36
ROUTE_25_HEIGHT EQU $09
ROUTE_25_WIDTH  EQU $1e

; RedsHouse1F_h map_id=37
REDS_HOUSE_1F_HEIGHT EQU $04
REDS_HOUSE_1F_WIDTH  EQU $04

; RedsHouse2F_h map_id=38
REDS_HOUSE_2F_HEIGHT EQU $04
REDS_HOUSE_2F_WIDTH  EQU $04

; BluesHouse_h map_id=39
BLUES_HOUSE_HEIGHT EQU $04
BLUES_HOUSE_WIDTH  EQU $04

; OaksLab_h map_id=40
OAKS_LAB_HEIGHT EQU $06
OAKS_LAB_WIDTH  EQU $05

; ViridianPokeCenter_h map_id=41
VIRIDIAN_POKECENTER_HEIGHT EQU $04
VIRIDIAN_POKECENTER_WIDTH  EQU $07

; ViridianMart_h map_id=42
VIRIDIAN_MART_HEIGHT EQU $04
VIRIDIAN_MART_WIDTH  EQU $04

; School_h map_id=43
VIRIDIAN_SCHOOL_HEIGHT EQU $04
VIRIDIAN_SCHOOL_WIDTH  EQU $04

; ViridianHouse_h map_id=44
VIRIDIAN_HOUSE_HEIGHT EQU $04
VIRIDIAN_HOUSE_WIDTH  EQU $04

; ViridianGym_h map_id=45
VIRIDIAN_GYM_HEIGHT EQU $09
VIRIDIAN_GYM_WIDTH  EQU $0a

; DiglettsCaveRoute2_h map_id=46
DIGLETTS_CAVE_EXIT_HEIGHT EQU $04
DIGLETTS_CAVE_EXIT_WIDTH  EQU $04

; ViridianForestexit_h map_id=47
VIRIDIAN_FOREST_EXIT_HEIGHT EQU $04
VIRIDIAN_FOREST_EXIT_WIDTH  EQU $05

; Route2House_h map_id=48
ROUTE_2_HOUSE_HEIGHT EQU $04
ROUTE_2_HOUSE_WIDTH  EQU $04

; Route2Gate_h map_id=49
ROUTE_2_GATE_HEIGHT EQU $04
ROUTE_2_GATE_WIDTH  EQU $05

; ViridianForestEntrance_h map_id=50
VIRIDIAN_FOREST_ENTRANCE_HEIGHT EQU $04
VIRIDIAN_FOREST_ENTRANCE_WIDTH  EQU $05

; ViridianForest_h map_id=51
VIRIDIAN_FOREST_HEIGHT EQU $18
VIRIDIAN_FOREST_WIDTH  EQU $11

; MuseumF1_h map_id=52
MUSEUM_1F_HEIGHT EQU $04
MUSEUM_1F_WIDTH  EQU $0a

; MuseumF2_h map_id=53
MUSEUM_2F_HEIGHT EQU $04
MUSEUM_2F_WIDTH  EQU $07

; PewterGym_h map_id=54
PEWTER_GYM_HEIGHT EQU $07
PEWTER_GYM_WIDTH  EQU $05

; PewterHouse1_h map_id=55
PEWTER_HOUSE_1_HEIGHT EQU $04
PEWTER_HOUSE_1_WIDTH  EQU $04

; PewterMart_h map_id=56
PEWTER_MART_HEIGHT EQU $04
PEWTER_MART_WIDTH  EQU $04

; PewterHouse2_h map_id=57
PEWTER_HOUSE_2_HEIGHT EQU $04
PEWTER_HOUSE_2_WIDTH  EQU $04

; PewterPokecenter_h map_id=58
PEWTER_POKECENTER_HEIGHT EQU $04
PEWTER_POKECENTER_WIDTH  EQU $07

; MtMoon1_h map_id=59
MT_MOON_1_HEIGHT EQU $12
MT_MOON_1_WIDTH  EQU $14

; MtMoon2_h map_id=60
MT_MOON_2_HEIGHT EQU $0e
MT_MOON_2_WIDTH  EQU $0e

; MtMoon3_h map_id=61
MT_MOON_3_HEIGHT EQU $12
MT_MOON_3_WIDTH  EQU $14

; CeruleanHouseTrashed_h map_id=62
TRASHED_HOUSE_HEIGHT EQU $04
TRASHED_HOUSE_WIDTH  EQU $04

; CeruleanHouse2_h map_id=63
CERULEAN_HOUSE_HEIGHT EQU $04
CERULEAN_HOUSE_WIDTH  EQU $04

; CeruleanPokecenter_h map_id=64
CERULEAN_POKECENTER_HEIGHT EQU $04
CERULEAN_POKECENTER_WIDTH  EQU $07

; CeruleanGym_h map_id=65
CERULEAN_GYM_HEIGHT EQU $07
CERULEAN_GYM_WIDTH  EQU $05

; BikeShop_h map_id=66
BIKE_SHOP_HEIGHT EQU $04
BIKE_SHOP_WIDTH  EQU $04

; CeruleanMart_h map_id=67
CERULEAN_MART_HEIGHT EQU $04
CERULEAN_MART_WIDTH  EQU $04

; MtMoonPokecenter_h map_id=68
MT_MOON_POKECENTER_HEIGHT EQU $04
MT_MOON_POKECENTER_WIDTH  EQU $07

; Route5Gate_h map_id=70
ROUTE_5_GATE_HEIGHT EQU $03
ROUTE_5_GATE_WIDTH  EQU $04

; UndergroundTunnelEntranceRoute5_h map_id=71
PATH_ENTRANCE_ROUTE_5_HEIGHT EQU $04
PATH_ENTRANCE_ROUTE_5_WIDTH  EQU $04

; DayCareM_h map_id=72
DAYCAREM_HEIGHT EQU $04
DAYCAREM_WIDTH  EQU $04

; Route6Gate_h map_id=73
ROUTE_6_GATE_HEIGHT EQU $03
ROUTE_6_GATE_WIDTH  EQU $04

; UndergroundTunnelEntranceRoute6_h map_id=74
PATH_ENTRANCE_ROUTE_6_HEIGHT EQU $04
PATH_ENTRANCE_ROUTE_6_WIDTH  EQU $04

; Route7Gate_h map_id=76
ROUTE_7_GATE_HEIGHT EQU $04
ROUTE_7_GATE_WIDTH  EQU $03

; UndergroundPathEntranceRoute7_h map_id=77
PATH_ENTRANCE_ROUTE_7_HEIGHT EQU $04
PATH_ENTRANCE_ROUTE_7_WIDTH  EQU $04

; Route8Gate_h map_id=79
ROUTE_8_GATE_HEIGHT EQU $04
ROUTE_8_GATE_WIDTH  EQU $03

; UndergroundPathEntranceRoute8_h map_id=80
PATH_ENTRANCE_ROUTE_8_HEIGHT EQU $04
PATH_ENTRANCE_ROUTE_8_WIDTH  EQU $04

; RockTunnelPokecenter_h map_id=81
ROCK_TUNNEL_POKECENTER_HEIGHT EQU $04
ROCK_TUNNEL_POKECENTER_WIDTH  EQU $07

; RockTunnel1_h map_id=82
ROCK_TUNNEL_1_HEIGHT EQU $12
ROCK_TUNNEL_1_WIDTH  EQU $14

; PowerPlant_h map_id=83
POWER_PLANT_HEIGHT EQU $12
POWER_PLANT_WIDTH  EQU $14

; Route11Gate_h map_id=84
ROUTE_11_GATE_1F_HEIGHT EQU $05
ROUTE_11_GATE_1F_WIDTH  EQU $04

; DiglettsCaveEntranceRoute11_h map_id=85
DIGLETTS_CAVE_ENTRANCE_HEIGHT EQU $04
DIGLETTS_CAVE_ENTRANCE_WIDTH  EQU $04

; Route11GateUpstairs_h map_id=86
ROUTE_11_GATE_2F_HEIGHT EQU $04
ROUTE_11_GATE_2F_WIDTH  EQU $04

; Route12Gate_h map_id=87
ROUTE_12_GATE_HEIGHT EQU $04
ROUTE_12_GATE_WIDTH  EQU $05

; BillsHouse_h map_id=88
BILLS_HOUSE_HEIGHT EQU $04
BILLS_HOUSE_WIDTH  EQU $04

; VermilionPokecenter_h map_id=89
VERMILION_POKECENTER_HEIGHT EQU $04
VERMILION_POKECENTER_WIDTH  EQU $07

; FanClub_h map_id=90
POKEMON_FAN_CLUB_HEIGHT EQU $04
POKEMON_FAN_CLUB_WIDTH  EQU $04

; VermilionMart_h map_id=91
VERMILION_MART_HEIGHT EQU $04
VERMILION_MART_WIDTH  EQU $04

; VermilionGym_h map_id=92
VERMILION_GYM_HEIGHT EQU $09
VERMILION_GYM_WIDTH  EQU $05

; VermilionHouse1_h map_id=93
VERMILION_HOUSE_1_HEIGHT EQU $04
VERMILION_HOUSE_1_WIDTH  EQU $04

; VermilionDock_h map_id=94
VERMILION_DOCK_HEIGHT EQU $06
VERMILION_DOCK_WIDTH  EQU $0e

; SSAnne1_h map_id=95
SS_ANNE_1_HEIGHT EQU $09
SS_ANNE_1_WIDTH  EQU $14

; SSAnne2_h map_id=96
SS_ANNE_2_HEIGHT EQU $09
SS_ANNE_2_WIDTH  EQU $14

; SSAnne3_h map_id=97
SS_ANNE_3_HEIGHT EQU $03
SS_ANNE_3_WIDTH  EQU $0a

; SSAnne4_h map_id=98
SS_ANNE_4_HEIGHT EQU $04
SS_ANNE_4_WIDTH  EQU $0f

; SSAnne5_h map_id=99
SS_ANNE_5_HEIGHT EQU $07
SS_ANNE_5_WIDTH  EQU $0a

; SSAnne6_h map_id=100
SS_ANNE_6_HEIGHT EQU $08
SS_ANNE_6_WIDTH  EQU $07

; SSAnne7_h map_id=101
SS_ANNE_7_HEIGHT EQU $04
SS_ANNE_7_WIDTH  EQU $03

; SSAnne8_h map_id=102
SS_ANNE_8_HEIGHT EQU $08
SS_ANNE_8_WIDTH  EQU $0c

; SSAnne9_h map_id=103
SS_ANNE_9_HEIGHT EQU $08
SS_ANNE_9_WIDTH  EQU $0c

; SSAnne10_h map_id=104
SS_ANNE_10_HEIGHT EQU $08
SS_ANNE_10_WIDTH  EQU $0c

; VictoryRoad1_h map_id=108
VICTORY_ROAD_1_HEIGHT EQU $09
VICTORY_ROAD_1_WIDTH  EQU $0a

; Lance_h map_id=113
LANCES_ROOM_HEIGHT EQU $0d
LANCES_ROOM_WIDTH  EQU $0d

; HallofFameRoom_h map_id=118
HALL_OF_FAME_HEIGHT EQU $04
HALL_OF_FAME_WIDTH  EQU $05

; UndergroundPathNS_h map_id=119
UNDERGROUND_PATH_NS_HEIGHT EQU $18
UNDERGROUND_PATH_NS_WIDTH  EQU $04

; Gary_h map_id=120
CHAMPIONS_ROOM_HEIGHT EQU $04
CHAMPIONS_ROOM_WIDTH  EQU $04

; UndergroundPathWE_h map_id=121
UNDERGROUND_PATH_WE_HEIGHT EQU $04
UNDERGROUND_PATH_WE_WIDTH  EQU $19

; CeladonMart1_h map_id=122
CELADON_MART_1_HEIGHT EQU $04
CELADON_MART_1_WIDTH  EQU $0a

; CeladonMart2_h map_id=123
CELADON_MART_2_HEIGHT EQU $04
CELADON_MART_2_WIDTH  EQU $0a

; CeladonMart3_h map_id=124
CELADON_MART_3_HEIGHT EQU $04
CELADON_MART_3_WIDTH  EQU $0a

; CeladonMart4_h map_id=125
CELADON_MART_4_HEIGHT EQU $04
CELADON_MART_4_WIDTH  EQU $0a

; CeladonMartRoof_h map_id=126
CELADON_MART_5_HEIGHT EQU $04
CELADON_MART_5_WIDTH  EQU $0a

; CeladonMartElevator_h map_id=127
CELADON_MART_6_HEIGHT EQU $02
CELADON_MART_6_WIDTH  EQU $02

; CeladonMansion1_h map_id=128
CELADON_MANSION_1_HEIGHT EQU $06
CELADON_MANSION_1_WIDTH  EQU $04

; CeladonMansion2_h map_id=129
CELADON_MANSION_2_HEIGHT EQU $06
CELADON_MANSION_2_WIDTH  EQU $04

; CeladonMansion3_h map_id=130
CELADON_MANSION_3_HEIGHT EQU $06
CELADON_MANSION_3_WIDTH  EQU $04

; CeladonMansion4_h map_id=131
CELADON_MANSION_4_HEIGHT EQU $06
CELADON_MANSION_4_WIDTH  EQU $04

; CeladonMansion5_h map_id=132
CELADON_MANSION_5_HEIGHT EQU $04
CELADON_MANSION_5_WIDTH  EQU $04

; CeladonPokecenter_h map_id=133
CELADON_POKECENTER_HEIGHT EQU $04
CELADON_POKECENTER_WIDTH  EQU $07

; CeladonGym_h map_id=134
CELADON_GYM_HEIGHT EQU $09
CELADON_GYM_WIDTH  EQU $05

; CeladonGameCorner_h map_id=135
GAME_CORNER_HEIGHT EQU $09
GAME_CORNER_WIDTH  EQU $0a

; CeladonMart5_h map_id=136
CELADON_HOUSE_HEIGHT EQU $04
CELADON_HOUSE_WIDTH  EQU $0a

; CeladonPrizeRoom_h map_id=137
CELADONPRIZE_ROOM_HEIGHT EQU $04
CELADONPRIZE_ROOM_WIDTH  EQU $05

; CeladonDiner_h map_id=138
CELADON_DINER_HEIGHT EQU $04
CELADON_DINER_WIDTH  EQU $05

; CeladonHouse_h map_id=139
CELADON_HOUSE_2_HEIGHT EQU $04
CELADON_HOUSE_2_WIDTH  EQU $04

; CeladonHotel_h map_id=140
CELADONHOTEL_HEIGHT EQU $04
CELADONHOTEL_WIDTH  EQU $07

; LavenderPokecenter_h map_id=141
LAVENDER_POKECENTER_HEIGHT EQU $04
LAVENDER_POKECENTER_WIDTH  EQU $07

; PokemonTower1_h map_id=142
POKEMONTOWER_1_HEIGHT EQU $09
POKEMONTOWER_1_WIDTH  EQU $0a

; PokemonTower2_h map_id=143
POKEMONTOWER_2_HEIGHT EQU $09
POKEMONTOWER_2_WIDTH  EQU $0a

; PokemonTower3_h map_id=144
POKEMONTOWER_3_HEIGHT EQU $09
POKEMONTOWER_3_WIDTH  EQU $0a

; PokemonTower4_h map_id=145
POKEMONTOWER_4_HEIGHT EQU $09
POKEMONTOWER_4_WIDTH  EQU $0a

; PokemonTower5_h map_id=146
POKEMONTOWER_5_HEIGHT EQU $09
POKEMONTOWER_5_WIDTH  EQU $0a

; PokemonTower6_h map_id=147
POKEMONTOWER_6_HEIGHT EQU $09
POKEMONTOWER_6_WIDTH  EQU $0a

; PokemonTower7_h map_id=148
POKEMONTOWER_7_HEIGHT EQU $09
POKEMONTOWER_7_WIDTH  EQU $0a

; LavenderHouse1_h map_id=149
LAVENDER_HOUSE_1_HEIGHT EQU $04
LAVENDER_HOUSE_1_WIDTH  EQU $04

; LavenderMart_h map_id=150
LAVENDER_MART_HEIGHT EQU $04
LAVENDER_MART_WIDTH  EQU $04

; LavenderHouse2_h map_id=151
LAVENDER_HOUSE_2_HEIGHT EQU $04
LAVENDER_HOUSE_2_WIDTH  EQU $04

; FuchsiaMart_h map_id=152
FUCHSIA_MART_HEIGHT EQU $04
FUCHSIA_MART_WIDTH  EQU $04

; FuchsiaHouse1_h map_id=153
FUCHSIA_HOUSE_1_HEIGHT EQU $04
FUCHSIA_HOUSE_1_WIDTH  EQU $04

; FuchsiaPokecenter_h map_id=154
FUCHSIA_POKECENTER_HEIGHT EQU $04
FUCHSIA_POKECENTER_WIDTH  EQU $07

; FuchsiaHouse2_h map_id=155
FUCHSIA_HOUSE_2_HEIGHT EQU $04
FUCHSIA_HOUSE_2_WIDTH  EQU $05

; SafariZoneEntrance_h map_id=156
SAFARIZONEENTRANCE_HEIGHT EQU $03
SAFARIZONEENTRANCE_WIDTH  EQU $04

; FuchsiaGym_h map_id=157
FUCHSIA_GYM_HEIGHT EQU $09
FUCHSIA_GYM_WIDTH  EQU $05

; FuchsiaMeetingRoom_h map_id=158
FUCHSIAMEETINGROOM_HEIGHT EQU $04
FUCHSIAMEETINGROOM_WIDTH  EQU $07

; SeafoamIslands2_h map_id=159
SEAFOAM_ISLANDS_2_HEIGHT EQU $09
SEAFOAM_ISLANDS_2_WIDTH  EQU $0f

; SeafoamIslands3_h map_id=160
SEAFOAM_ISLANDS_3_HEIGHT EQU $09
SEAFOAM_ISLANDS_3_WIDTH  EQU $0f

; SeafoamIslands4_h map_id=161
SEAFOAM_ISLANDS_4_HEIGHT EQU $09
SEAFOAM_ISLANDS_4_WIDTH  EQU $0f

; SeafoamIslands5_h map_id=162
SEAFOAM_ISLANDS_5_HEIGHT EQU $09
SEAFOAM_ISLANDS_5_WIDTH  EQU $0f

; VermilionHouse2_h map_id=163
VERMILION_HOUSE_2_HEIGHT EQU $04
VERMILION_HOUSE_2_WIDTH  EQU $04

; FuchsiaHouse3_h map_id=164
FUCHSIA_HOUSE_3_HEIGHT EQU $04
FUCHSIA_HOUSE_3_WIDTH  EQU $04

; Mansion1_h map_id=165
MANSION_1_HEIGHT EQU $0e
MANSION_1_WIDTH  EQU $0f

; CinnabarGym_h map_id=166
CINNABAR_GYM_HEIGHT EQU $09
CINNABAR_GYM_WIDTH  EQU $0a

; Lab1_h map_id=167
CINNABAR_LAB_1_HEIGHT EQU $04
CINNABAR_LAB_1_WIDTH  EQU $09

; Lab2_h map_id=168
CINNABAR_LAB_2_HEIGHT EQU $04
CINNABAR_LAB_2_WIDTH  EQU $04

; Lab3_h map_id=169
CINNABAR_LAB_3_HEIGHT EQU $04
CINNABAR_LAB_3_WIDTH  EQU $04

; Lab4_h map_id=170
CINNABAR_LAB_4_HEIGHT EQU $04
CINNABAR_LAB_4_WIDTH  EQU $04

; CinnabarPokecenter_h map_id=171
CINNABAR_POKECENTER_HEIGHT EQU $04
CINNABAR_POKECENTER_WIDTH  EQU $07

; CinnabarMart_h map_id=172
CINNABAR_MART_HEIGHT EQU $04
CINNABAR_MART_WIDTH  EQU $04

; IndigoPlateauLobby_h map_id=174
INDIGO_PLATEAU_LOBBY_HEIGHT EQU $06
INDIGO_PLATEAU_LOBBY_WIDTH  EQU $08

; CopycatsHouseF1_h map_id=175
COPYCATS_HOUSE_1F_HEIGHT EQU $04
COPYCATS_HOUSE_1F_WIDTH  EQU $04

; CopycatsHouseF2_h map_id=176
COPYCATS_HOUSE_2F_HEIGHT EQU $04
COPYCATS_HOUSE_2F_WIDTH  EQU $04

; FightingDojo_h map_id=177
FIGHTINGDOJO_HEIGHT EQU $06
FIGHTINGDOJO_WIDTH  EQU $05

; SaffronGym_h map_id=178
SAFFRON_GYM_HEIGHT EQU $09
SAFFRON_GYM_WIDTH  EQU $0a

; SaffronHouse1_h map_id=179
SAFFRON_HOUSE_1_HEIGHT EQU $04
SAFFRON_HOUSE_1_WIDTH  EQU $04

; SaffronMart_h map_id=180
SAFFRON_MART_HEIGHT EQU $04
SAFFRON_MART_WIDTH  EQU $04

; SilphCo1_h map_id=181
SILPH_CO_1F_HEIGHT EQU $09
SILPH_CO_1F_WIDTH  EQU $0f

; SaffronPokecenter_h map_id=182
SAFFRON_POKECENTER_HEIGHT EQU $04
SAFFRON_POKECENTER_WIDTH  EQU $07

; SaffronHouse2_h map_id=183
SAFFRON_HOUSE_2_HEIGHT EQU $04
SAFFRON_HOUSE_2_WIDTH  EQU $04

; Route15Gate1F_h map_id=184
ROUTE_15_GATE_1F_HEIGHT EQU $05
ROUTE_15_GATE_1F_WIDTH  EQU $04

; Route15GateUpstairs_h map_id=185
ROUTE_15_GATE_2F_HEIGHT EQU 4
ROUTE_15_GATE_2F_WIDTH  EQU 4

; Route16GateMap_h map_id=186
ROUTE_16_GATE_1F_HEIGHT EQU $07
ROUTE_16_GATE_1F_WIDTH  EQU $04

; Route16GateUpstairs_h map_id=187
ROUTE_16_GATE_2F_HEIGHT EQU $04
ROUTE_16_GATE_2F_WIDTH  EQU $04

; Route16House_h map_id=188
ROUTE_16_HOUSE_HEIGHT EQU $04
ROUTE_16_HOUSE_WIDTH  EQU $04

; Route12House_h map_id=189
ROUTE_12_HOUSE_HEIGHT EQU $04
ROUTE_12_HOUSE_WIDTH  EQU $04

; Route18Gate_h map_id=190
ROUTE_18_GATE_1F_HEIGHT EQU $05
ROUTE_18_GATE_1F_WIDTH  EQU $04

; Route18GateHeader_h map_id=191
ROUTE_18_GATE_2F_HEIGHT EQU $04
ROUTE_18_GATE_2F_WIDTH  EQU $04

; SeafoamIslands1_h map_id=192
SEAFOAM_ISLANDS_1_HEIGHT EQU $09
SEAFOAM_ISLANDS_1_WIDTH  EQU $0f

; Route22Gate_h map_id=193
ROUTE_22_GATE_HEIGHT EQU $04
ROUTE_22_GATE_WIDTH  EQU $05

; VictoryRoad2_h map_id=194
VICTORY_ROAD_2_HEIGHT EQU $09
VICTORY_ROAD_2_WIDTH  EQU $0f

; Route12GateUpstairs_h map_id=195
ROUTE_12_GATE_2F_HEIGHT EQU $04
ROUTE_12_GATE_2F_WIDTH  EQU $04

; VermilionHouse3_h map_id=196
VERMILION_HOUSE_3_HEIGHT EQU $04
VERMILION_HOUSE_3_WIDTH  EQU $04

; DiglettsCave_h map_id=197
DIGLETTS_CAVE_HEIGHT EQU $12
DIGLETTS_CAVE_WIDTH  EQU $14

; VictoryRoad3_h map_id=198
VICTORY_ROAD_3_HEIGHT EQU $09
VICTORY_ROAD_3_WIDTH  EQU $0f

; RocketHideout1_h map_id=199
ROCKET_HIDEOUT_1_HEIGHT EQU $0e
ROCKET_HIDEOUT_1_WIDTH  EQU $0f

; RocketHideout2_h map_id=200
ROCKET_HIDEOUT_2_HEIGHT EQU $0e
ROCKET_HIDEOUT_2_WIDTH  EQU $0f

; RocketHideout3_h map_id=201
ROCKET_HIDEOUT_3_HEIGHT EQU $0e
ROCKET_HIDEOUT_3_WIDTH  EQU $0f

; RocketHideout4_h map_id=202
ROCKET_HIDEOUT_4_HEIGHT EQU $0c
ROCKET_HIDEOUT_4_WIDTH  EQU $0f

; RocketHideoutElevator_h map_id=203
ROCKET_HIDEOUT_ELEVATOR_HEIGHT EQU $04
ROCKET_HIDEOUT_ELEVATOR_WIDTH  EQU $03

; SilphCo2_h map_id=207
SILPH_CO_2F_HEIGHT EQU $09
SILPH_CO_2F_WIDTH  EQU $0f

; SilphCo3_h map_id=208
SILPH_CO_3F_HEIGHT EQU $09
SILPH_CO_3F_WIDTH  EQU $0f

; SilphCo4_h map_id=209
SILPH_CO_4F_HEIGHT EQU $09
SILPH_CO_4F_WIDTH  EQU $0f

; SilphCo5_h map_id=210
SILPH_CO_5F_HEIGHT EQU $09
SILPH_CO_5F_WIDTH  EQU $0f

; SilphCo6_h map_id=211
SILPH_CO_6F_HEIGHT EQU $09
SILPH_CO_6F_WIDTH  EQU $0d

; SilphCo7_h map_id=212
SILPH_CO_7F_HEIGHT EQU $09
SILPH_CO_7F_WIDTH  EQU $0d

; SilphCo8_h map_id=213
SILPH_CO_8F_HEIGHT EQU $09
SILPH_CO_8F_WIDTH  EQU $0d

; Mansion2_h map_id=214
MANSION_2_HEIGHT EQU $0e
MANSION_2_WIDTH  EQU $0f

; Mansion3_h map_id=215
MANSION_3_HEIGHT EQU $09
MANSION_3_WIDTH  EQU $0f

; Mansion4_h map_id=216
MANSION_4_HEIGHT EQU $0e
MANSION_4_WIDTH  EQU $0f

; SafariZoneEast_h map_id=217
SAFARI_ZONE_EAST_HEIGHT EQU $0d
SAFARI_ZONE_EAST_WIDTH  EQU $0f

; SafariZoneNorth_h map_id=218
SAFARI_ZONE_NORTH_HEIGHT EQU $12
SAFARI_ZONE_NORTH_WIDTH  EQU $14

; SafariZoneWest_h map_id=219
SAFARI_ZONE_WEST_HEIGHT EQU $0d
SAFARI_ZONE_WEST_WIDTH  EQU $0f

; SafariZoneCenter_h map_id=220
SAFARI_ZONE_CENTER_HEIGHT EQU $0d
SAFARI_ZONE_CENTER_WIDTH  EQU $0f

; SafariZoneRestHouse1_h map_id=221
SAFARI_ZONE_REST_HOUSE_1_HEIGHT EQU $04
SAFARI_ZONE_REST_HOUSE_1_WIDTH  EQU $04

; SafariZoneSecretHouse_h map_id=222
SAFARI_ZONE_SECRET_HOUSE_HEIGHT EQU $04
SAFARI_ZONE_SECRET_HOUSE_WIDTH  EQU $04

; SafariZoneRestHouse2_h map_id=223
SAFARI_ZONE_REST_HOUSE_2_HEIGHT EQU $04
SAFARI_ZONE_REST_HOUSE_2_WIDTH  EQU $04

; SafariZoneRestHouse3_h map_id=224
SAFARI_ZONE_REST_HOUSE_3_HEIGHT EQU $04
SAFARI_ZONE_REST_HOUSE_3_WIDTH  EQU $04

; SafariZoneRestHouse4_h map_id=225
SAFARI_ZONE_REST_HOUSE_4_HEIGHT EQU $04
SAFARI_ZONE_REST_HOUSE_4_WIDTH  EQU $04

; UnknownDungeon2_h map_id=226
UNKNOWN_DUNGEON_2_HEIGHT EQU $09
UNKNOWN_DUNGEON_2_WIDTH  EQU $0f

; UnknownDungeon3_h map_id=227
UNKNOWN_DUNGEON_3_HEIGHT EQU $09
UNKNOWN_DUNGEON_3_WIDTH  EQU $0f

; UnknownDungeon1_h map_id=228
UNKNOWN_DUNGEON_1_HEIGHT EQU $09
UNKNOWN_DUNGEON_1_WIDTH  EQU $0f

; NameRater_h map_id=229
NAME_RATERS_HOUSE_HEIGHT EQU $04
NAME_RATERS_HOUSE_WIDTH  EQU $04

; CeruleanHouse3_h map_id=230
CERULEAN_HOUSE_3_HEIGHT EQU $04
CERULEAN_HOUSE_3_WIDTH  EQU $04

; RockTunnel2_h map_id=232
ROCK_TUNNEL_2_HEIGHT EQU $12
ROCK_TUNNEL_2_WIDTH  EQU $14

; SilphCo9_h map_id=233
SILPH_CO_9F_HEIGHT EQU $09
SILPH_CO_9F_WIDTH  EQU $0d

; SilphCo10_h map_id=234
SILPH_CO_10F_HEIGHT EQU $09
SILPH_CO_10F_WIDTH  EQU $08

; SilphCo11_h map_id=235
SILPH_CO_11F_HEIGHT EQU $09
SILPH_CO_11F_WIDTH  EQU $09

; SilphCoElevator_h map_id=236
SILPH_CO_ELEVATOR_HEIGHT EQU $02
SILPH_CO_ELEVATOR_WIDTH  EQU $02

; BattleCenterM_h map_id=239
BATTLE_CENTER_HEIGHT EQU $04
BATTLE_CENTER_WIDTH  EQU $05

; TradeCenterM_h map_id=240
TRADE_CENTER_HEIGHT EQU $04
TRADE_CENTER_WIDTH  EQU $05

; Lorelei_h map_id=245
LORELEIS_ROOM_HEIGHT EQU $06
LORELEIS_ROOM_WIDTH  EQU $05

; Bruno_h map_id=246
BRUNOS_ROOM_HEIGHT EQU $06
BRUNOS_ROOM_WIDTH  EQU $05

; Agatha_h map_id=247
AGATHAS_ROOM_HEIGHT EQU $06
AGATHAS_ROOM_WIDTH  EQU $05

;Sound Constants (Copied from pkms.asm with modifications)
MUSIC		EQU 0
SFX			EQU 4
CH1			EQU 0
CH2			EQU 1
CH3			EQU 2
CH4			EQU 3

;Note Pitch
noteC		EQU $0
noteC#		EQU $1
noteD		EQU $2
noteD#		EQU $3
noteE		EQU $4
noteF		EQU $5
noteF#		EQU $6
noteG		EQU $7
noteG#		EQU $8
noteA		EQU $9
noteA#		EQU $A
noteB		EQU $B
noteRst		EQU $C

;Note Delay
note16		EQU $0 ;1/16
note8		EQU $1 ;1/8
note8_16	EQU $2 ;1/8 + 1/16
note4		EQU $3 ;1/4
note4_16	EQU $4 ;1/4 + 1/16
note4_8		EQU $5 ;1/4 + 1/8
note4_8_16 	EQU $6 ;1/4 + 1/8 + 1/16
note2		EQU $7 ;1/2
note2_16	EQU $8 ;1/2 + 1/16
note2_8		EQU $9 ;1/2 + 1/8
note2_8_16	EQU $A ;1/2 + 1/8 + 1/16
note2_4		EQU $B ;1/2 + 1/4
note2_4_16 	EQU $C ;1/2 + 1/4 + 1/16
note2_4_8	EQU $D ;1/2 + 1/4 + 1/8
note2_4_8_16 EQU $E ;1/2 + 1/4 + 1/8 + 1/16
note1		EQU $F ;1

;Drum
dNote		EQU $B0
dRst		EQU $C0
d5d3Spd		EQU $D4
d4d3Spd		EQU $D8
dNormSpd	EQU $DC
d2Spd		EQU $D0

; octaves
oct0		EQU $E7
oct1		EQU $E6
oct2		EQU $E5
oct3		EQU $E4
oct4		EQU $E3
oct5		EQU $E2
oct6		EQU $E1
oct7		EQU $E0

;duty
duty12_5	EQU $0
duty25		EQU $1
duty50		EQU $2
duty75		EQU $3

;Write a music note
;format: mus_note pitch delay
mus_note: MACRO
	db ((\1 << 4) | \2)
ENDM

;Write an octave note
;format: mus_octave octave
mus_octave: MACRO
	db \1
ENDM

; set velocity/note fade (\1 is velocity, \2 is note length, both 0-15)
; format: mus_vel vel, length
mus_vel: MACRO
	db $DC
	db	((\1 << 4) | \2)
ENDM

; stop sound
; format: mus_end
mus_end: MACRO
	db $FF
ENDM

; ???
; format: mus_E8
mus_E8: MACRO
	db $E8
ENDM

; set modulation (\1 is delay, \2 is depth, \3 is rate)
; format: mus_mod delay, depth, rate
mus_mod: MACRO
	db	$EA
	db	\1
	db	((\2 << 4) | \3)
ENDM

; set duty cycle (\1: 0 = 12.5%, 1 = 25%, 2 = 50%, 3 = 75%)
; format: mus_duty duty
mus_duty: MACRO
	db	$EC
	db	\1
ENDM

; set music tempo (\1 is divider, \2 is modifier)
; format:	mus_tempo divider, modifier
mus_tempo: MACRO
	db	$ED
	db	\1
	db	\2
ENDM

; set volume (\1 is volume)
; format: mus_volume volume
; (may actually be panning?)
mus_volume: MACRO
	db	$F0
	db	\1
ENDM

; call \1
; format: mus_call offset
mus_call: MACRO
	db	$FD
	;dw	((\1 % $4000) + ((\1 >= $4000) * $4000))
	dw \1
ENDM

; jump \1 \2
; format: mus_jump loop offset
mus_jump: MACRO
	db	$FE
	db	\1
	dw  \2
	;dw	((\2 % $4000) + ((\2 >= $4000) * $4000))
ENDM
