

SECTION "WRAM Bank 0", WRAM0


SECTION "Sprite State Data", WRAM0[$c100]

wSpriteStateData1: ; c100
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
	ds $10 * $10

wSpriteStateData2: ; c200
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
	ds $10 * $10


wOAMBuffer: ; c300
; buffer for OAM data. Copied to OAM by DMA
	ds 4 * 40


SECTION "Tile Map", WRAM0[$c3a0]

wTileMap: ; c3a0
; buffer for tiles that are visible on screen (20 columns by 18 rows)
	ds 20 * 18

wTileMapBackup: ; c508
; buffer for temporarily saving and restoring current screen's tiles
; (e.g. if menus are drawn on top)
	ds 20 * 18

; c670


SECTION "Screen Edge Tiles", WRAM0[$cbfc]

wScreenEdgeTiles: ; cbfc
; the tiles of the row or column to be redrawn by RedrawExposedScreenEdge
	ds 20 * 2

; coordinates of the position of the cursor for the top menu item (id 0)
wTopMenuItemY: ; cc24
	ds 1
wTopMenuItemX: ; cc25
	ds 1

wCurrentMenuItem: ; cc26
; the id of the currently selected menu item
; the top item has id 0, the one below that has id 1, etc.
; note that the "top item" means the top item currently visible on the screen
; add this value to [wListScrollOffset] to get the item's position within the list
	ds 1

wTileBehindCursor: ; cc27
; the tile that was behind the menu cursor's current location
	ds 1

wMaxMenuItem: ; cc28
; id of the bottom menu item
	ds 1

wMenuWatchedKeys: ; cc29
; bit mask of keys that the menu will respond to
	ds 1

wLastMenuItem: ; cc2a
; id of previously selected menu item
	ds 1

; cc2b

	ds 3

wPlayerMoveListIndex: ; cc2e
	ds 1

wPlayerMonNumber: ; cc2f
	ds 1

wMenuCursorLocation: ; cc30
; the address of the menu cursor's current location within wTileMap
	ds 2

	ds 2

wMenuJoypadPollCount: ; cc34
; how many times should HandleMenuInput poll the joypad state before it returns?
	ds 1

	ds 1

wListScrollOffset: ; cc36
; offset of the current top menu item from the beginning of the list
; keeps track of what section of the list is on screen
	ds 1

	ds 19

wMenuWrappingEnabled: ; cc4a
; set to 1 if you can go from the bottom to the top or top to bottom of a menu
; set to 0 if you can't go past the top or bottom of the menu
	ds 1

	ds 10

wTrainerHeaderFlagBit: ; cc55
	ds 1

; cc56


SECTION "RLE", WRAM0[$ccd2]
wRLEByteCount: ; ccd2
	ds 1

	ds 4

; current HP of player and enemy substitutes
wPlayerSubstituteHP: ; ccd7
	ds 1
wEnemySubstituteHP: ; ccd8
	ds 1

	ds 2

wMoveMenuType: ; ccdb
; 0=regular, 1=mimic, 2=above message box (relearn, heal pp..)
	ds 1

wPlayerSelectedMove: ; ccdc
	ds 1
wEnemySelectedMove: ; ccdd
	ds 1

	ds 1

wAICount: ; ccdf
; number of times remaining that AI action can occur
	ds 1

	ds 2

wEnemyMoveListIndex: ; cce2
	ds 1

; cce3


SECTION "Stat Modifiers", WRAM0[$cd1a]

; stat modifiers for the player's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal

wPlayerMonStatMods:
wPlayerMonAttackMod: ; cd1a
	ds 1
wPlayerMonDefenseMod: ; cd1b
	ds 1
wPlayerMonSpeedMod: ; cd1c
	ds 1
wPlayerMonSpecialMod: ; cd1d
	ds 1
wPlayerMonAccuracyMod: ; cd1e
	ds 1
wPlayerMonEvasionMod: ; cd1f
	ds 1

	ds 13

wEngagedTrainerClass: ; cd2d
	ds 1
wEngagedTrainerSet: ; cd2e
;	ds 1

; stat modifiers for the enemy's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal

wEnemyMonStatMods:
wEnemyMonAttackMod: ; cd2e
	ds 1
wEnemyMonDefenseMod: ; cd2f
	ds 1
wEnemyMonSpeedMod: ; cd30
	ds 1
wEnemyMonSpecialMod: ; cd31
	ds 1
wEnemyMonAccuracyMod: ; cd32
	ds 1
wEnemyMonEvasionMod: ; cd33
	ds 1

	ds 9

wWhichTrade: ; cd3d
; which entry from TradeMons to select
;	ds 1

wTrainerSpriteOffset: ; cd3d
	ds 1
wTrainerEngageDistance: ; cd3e
	ds 1
wTrainerFacingDirection: ; cd3f
	ds 1
wTrainerScreenY: ; cd40
	ds 1
wTrainerScreenX: ; cd41
	ds 1

	ds 30

wFlags_0xcd60: ; cd60
; bit 0: is player engaged by trainer (to avoid being engaged by multiple trainers simultaniously)
	ds 1

	ds 10

wJoypadForbiddenButtonsMask: ; cd6b
; bit 1 means button presses will be ignored for that button
	ds 1

	ds 21

wTileMapBackup2: ; cd81
; second buffer for temporarily saving and restoring current screen's tiles (e.g. if menus are drawn on top)
	ds 20 * 18

wBuffer: ; cee9
; used for temporary things

wHPBarMaxHP: ; cee9
	ds 2
wHPBarOldHP: ; ceeb
	ds 2
wHPBarNewHP: ; ceed
	ds 2
wHPBarDelta: ; ceef
	ds 1

	ds 13

wHPBarHPDifference: ; cefd
	ds 1

	ds 9

wAnimSoundID: ; cf07
; sound ID during battle animations
	ds 1

	ds 12

wCurSpriteMovement2: ; cf14
; movement byte 2 of current sprite
	ds 1

	ds 74

wGymCityName: ; cf5f
wStringBuffer1: ; cf5f
	ds 16 + 1
wGymLeaderName: ; cf70
wStringBuffer2: ; cf70
	ds 16 + 1
wStringBuffer3: ; cf81
	ds 16 + 1

wWhichPokemon: ; cf92
; which pokemon you selected
	ds 1

	ds 1

wListMenuID: ; cf94
; ID used by DisplayListMenuID
	ds 1



W_WALKCOUNTER EQU $CFC5 ; walk animation counter

W_CURCHANNELPOINTER EQU $CFC7 ; (the current music channel pointer - $4000) / 3

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


SECTION "WRAM Bank 1", WRAMX, BANK[1]

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
W_GYMLEADERNO  EQU $D05C ; it's actually the same thing as ^
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


; List type
; used in $D0B6
W_LISTTYPE    EQU $D0B6

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


SECTION "Pokedex", WRAMX[$d2f7], BANK[1]

wPokedexOwned: ; d2f7
	ds (150 / 8) + 1
wPokedexOwnedEnd:

wPokedexSeen: ; d30a
	ds (150 / 8) + 1
wPokedexSeenEnd:


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

