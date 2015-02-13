
INCLUDE "constants.asm"

flag_array: MACRO
	ds ((\1) + 7) / 8
ENDM

box_struct_length EQU 25 + NUM_MOVES * 2
box_struct: MACRO
\1Species::    db
\1HP::         dw
\1BoxLevel::   db
\1Status::     db
\1Type::
\1Type1::      db
\1Type2::      db
\1CatchRate::  db
\1Moves::      ds NUM_MOVES
\1OTID::       dw
\1Exp::        ds 3
\1HPExp::      dw
\1AttackExp::  dw
\1DefenseExp:: dw
\1SpeedExp::   dw
\1SpecialExp:: dw
\1DVs::        ds 2
\1PP::         ds NUM_MOVES
ENDM

party_struct: MACRO
	box_struct \1
\1Level::      db
\1Stats::
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
ENDM

battle_struct: MACRO
\1Species::    db
\1HP::         dw
\1BoxLevel::   db
\1Status::     db
\1Type::
\1Type1::      db
\1Type2::      db
\1CatchRate::  db
\1Moves::      ds NUM_MOVES
\1DVs::        ds 2
\1Level::      db
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
\1PP::         ds NUM_MOVES
ENDM


SECTION "WRAM Bank 0", WRAM0

wc000:: ds 1
wc001:: ds 1
wc002:: ds 1
wc003:: ds 1
wc004:: ds 1
wc005:: ds 1
wc006:: ds 8
wc00e:: ds 4
wc012:: ds 4
wc016:: ds 16
wc026:: ds 1
wc027:: ds 1
wc028:: ds 2
wc02a:: ds 1
wc02b:: ds 1
wc02c:: ds 1
wc02d:: ds 1
wc02e:: ds 8
wc036:: ds 8
wc03e:: ds 8
wc046:: ds 8
wc04e:: ds 8
wc056:: ds 8
wc05e:: ds 8
wc066:: ds 8
wc06e:: ds 8
wc076:: ds 8
wc07e:: ds 8
wc086:: ds 8
wc08e:: ds 8
wc096:: ds 8
wc09e:: ds 8
wc0a6:: ds 8
wc0ae:: ds 8
wc0b6:: ds 8
wc0be:: ds 8
wc0c6:: ds 8
wc0ce:: ds 1
wc0cf:: ds 1
wc0d0:: ds 1
wc0d1:: ds 1
wc0d2:: ds 1
wc0d3:: ds 1
wc0d4:: ds 1
wc0d5:: ds 1
wc0d6:: ds 8
wc0de:: ds 8
wc0e6:: ds 1
wc0e7:: ds 1
wc0e8:: ds 1
wc0e9:: ds 1
wc0ea:: ds 1
wc0eb:: ds 1
wc0ec:: ds 1
wc0ed:: ds 1
wc0ee:: ds 1
wc0ef:: ds 1
wc0f0:: ds 1
wc0f1:: ds 1
wc0f2:: ds 14


SECTION "Sprite State Data", WRAM0[$c100]

wSpriteStateData1:: ; c100
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


SECTION "Sprite State Data 2", WRAM0[$c200]

wSpriteStateData2:: ; c200
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


SECTION "OAM Buffer", WRAM0[$c300]

wOAMBuffer:: ; c300
; buffer for OAM data. Copied to OAM by DMA
	ds 4 * 40

wTileMap:: ; c3a0
; buffer for tiles that are visible on screen (20 columns by 18 rows)
	ds 20 * 18

wSerialPartyMonsPatchList:: ; c508
; list of indexes to patch with SERIAL_NO_DATA_BYTE after transfer

wTileMapBackup:: ; c508
; buffer for temporarily saving and restoring current screen's tiles
; (e.g. if menus are drawn on top)
;	ds 20 * 18

	ds 200

wSerialEnemyMonsPatchList:: ; c5d0
; list of indexes to patch with SERIAL_NO_DATA_BYTE after transfer
	ds 200

	ds 80

wTempPic::
wOverworldMap:: ; c6e8
	ds 1300

wScreenEdgeTiles:: ; cbfc
; the tiles of the row or column to be redrawn by RedrawExposedScreenEdge
	ds 20 * 2

; coordinates of the position of the cursor for the top menu item (id 0)
wTopMenuItemY:: ; cc24
	ds 1
wTopMenuItemX:: ; cc25
	ds 1

wCurrentMenuItem:: ; cc26
; the id of the currently selected menu item
; the top item has id 0, the one below that has id 1, etc.
; note that the "top item" means the top item currently visible on the screen
; add this value to [wListScrollOffset] to get the item's position within the list
	ds 1

wTileBehindCursor:: ; cc27
; the tile that was behind the menu cursor's current location
	ds 1

wMaxMenuItem:: ; cc28
; id of the bottom menu item
	ds 1

wMenuWatchedKeys:: ; cc29
; bit mask of keys that the menu will respond to
	ds 1

wLastMenuItem:: ; cc2a
; id of previously selected menu item
	ds 1

wcc2b:: ds 1
wcc2c:: ds 1
wcc2d:: ds 1

wPlayerMoveListIndex:: ; cc2e
	ds 1

wPlayerMonNumber:: ; cc2f
	ds 1

wMenuCursorLocation:: ; cc30
; the address of the menu cursor's current location within wTileMap
	ds 2

	ds 2

wMenuJoypadPollCount:: ; cc34
; how many times should HandleMenuInput poll the joypad state before it returns?
	ds 1

wMenuItemToSwap:: ; cc35
; id of menu item selected for swapping (counts from 1) (0 means that no menu item has been selected for swapping)
	ds 1

wListScrollOffset:: ; cc36
; offset of the current top menu item from the beginning of the list
; keeps track of what section of the list is on screen
	ds 1

wcc37:: ds 1

wTradeCenterPointerTableIndex:: ; cc38
	ds 1

	ds 1

wcc3a:: ds 1
wcc3b:: ds 1

wDoNotWaitForButtonPressAfterDisplayingText:: ; cc3c
; if non-zero, skip waiting for a button press after displaying text in DisplayTextID
	ds 1

wSerialSyncAndExchangeNybbleReceiveData:: ; cc3d
; the final received nybble is stored here by Serial_SyncAndExchangeNybble

wSerialExchangeNybbleTempReceiveData:: ; cc3d
; temporary nybble used by Serial_ExchangeNybble

wLinkMenuSelectionReceiveBuffer:: ; cc3d
; two byte buffer
; the received menu selection is stored twice

wcc3d:: ds 1

wSerialExchangeNybbleReceiveData:: ; cc3e
; the final received nybble is stored here by Serial_ExchangeNybble
	ds 1

	ds 3

wSerialExchangeNybbleSendData:: ; cc42
; this nybble is sent when using Serial_SyncAndExchangeNybble or Serial_ExchangeNybble

wLinkMenuSelectionSendBuffer:: ; cc42
; two byte buffer
; the menu selection byte is stored twice before sending

	ds 5

wLinkTimeoutCounter:: ; cc47
; 1 byte

wUnknownSerialCounter:: ; cc47
; 2 bytes

wcc47:: ds 1
wcc48:: ds 1

wWhichTradeMonSelectionMenu:: ; cc49
; $00 = player mons
; $01 = enemy mons

wcc49:: ds 1

wMenuWrappingEnabled:: ; cc4a
; set to 1 if you can go from the bottom to the top or top to bottom of a menu
; set to 0 if you can't go past the top or bottom of the menu
	ds 1

wcc4b:: ds 2
wcc4d:: ds 1

wPredefID:: ; cc4e
	ds 1
wPredefRegisters:: ; cc4f
	ds 6

wTrainerHeaderFlagBit:: ; cc55
	ds 1

	ds 1

wNPCMovementScriptPointerTableNum:: ; cc57
; which NPC movement script pointer is being used
; 0 if an NPC movement script is not running
	ds 1

wNPCMovementScriptBank:: ; cc58
; ROM bank of current NPC movement script
	ds 1

	ds 2

wHallOfFame:: ; cc5b
wcc5b:: ds 1
wcc5c:: ds 1
wcc5d:: ds 1
wcc5e:: ds 13

wcc6b:: ds 14
wcc79:: ds 30

wNPCMovementDirections2:: ; cc97

wSwitchPartyMonTempBuffer:: ; cc97
; temporary buffer when swapping party mon data
	ds 10

wcca1:: ds 49

wRLEByteCount:: ; ccd2
	ds 1

wSimulatedJoypadStatesEnd:: ; ccd3
; this is the end of the joypad states
; the list starts above this address and extends downwards in memory until here
; overloaded with below labels

wccd3:: ds 1
wccd4:: ds 1
wccd5:: ds 2

; current HP of player and enemy substitutes
wPlayerSubstituteHP:: ; ccd7
	ds 1
wEnemySubstituteHP:: ; ccd8
	ds 1

wccd9:: ds 2

wMoveMenuType:: ; ccdb
; 0=regular, 1=mimic, 2=above message box (relearn, heal pp..)
	ds 1

wPlayerSelectedMove:: ; ccdc
	ds 1
wEnemySelectedMove:: ; ccdd
	ds 1

wLinkBattleRandomNumberListIndex:: ; ccde
	ds 1

wAICount:: ; ccdf
; number of times remaining that AI action can occur
	ds 1

	ds 2

wEnemyMoveListIndex:: ; cce2
	ds 1

wcce3:: ds 1
wcce4:: ds 1

wTotalPayDayMoney:: ; cce5
; total amount of money made using Pay Day during the current battle
	ds 3

wSafariEscapeFactor:: ; cce8
	ds 1
wSafariBaitFactor:: ; cce9
	ds 1;

	ds 1

wcceb:: ds 1
wccec:: ds 1
wcced:: ds 1
wccee:: ds 1
wccef:: ds 1
wccf0:: ds 1
wPlayerUsedMove:: ds 1
wEnemyUsedMove:: ds 1
wccf3:: ds 1
wccf4:: ds 1

wPartyFoughtCurrentEnemyFlags::
; flags that indicate which party members have fought the current enemy mon
	flag_array 6

wccf6:: ds 1
wccf7:: ds 14

wUnknownSlotVar:: ; cd05

wEnemyNumHits:: ; cd05
; number of hits by enemy in attacks like Double Slap, etc.

wEnemyBideAccumulatedDamage:: ; cd05
; the amount of damage accumulated by the enemy while biding (2 bytes)

ds 10

wInGameTradeGiveMonSpecies:: ; cd0f

wPlayerMonUnmodifiedLevel:: ; cd0f 
	ds 1

wInGameTradeTextPointerTablePointer:: ; cd10

wPlayerMonUnmodifiedMaxHP:: ; cd10
	ds 2

wInGameTradeTextPointerTableIndex:: ; cd12

wPlayerMonUnmodifiedAttack:: ; cd12
	ds 1
wInGameTradeGiveMonName:: ; cd13
	ds 1
wPlayerMonUnmodifiedDefense:: ; cd14
	ds 2
wPlayerMonUnmodifiedSpeed:: ; cd16
	ds 2
wPlayerMonUnmodifiedSpecial:: ; cd18
	ds 2

; stat modifiers for the player's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal

wPlayerMonStatMods::
wPlayerMonAttackMod:: ; cd1a
	ds 1
wPlayerMonDefenseMod:: ; cd1b
	ds 1
wPlayerMonSpeedMod:: ; cd1c
	ds 1
wPlayerMonSpecialMod:: ; cd1d
	ds 1

wInGameTradeReceiveMonName:: ; cd1e

wPlayerMonAccuracyMod:: ; cd1e
	ds 1
wPlayerMonEvasionMod:: ; cd1f
	ds 1

	ds 3

wEnemyMonUnmodifiedLevel:: ; cd23
	ds 1
wEnemyMonUnmodifiedMaxHP:: ; cd24
	ds 2
wEnemyMonUnmodifiedAttack:: ; cd26
	ds 2
wEnemyMonUnmodifiedDefense:: ; cd28
	ds 1

wInGameTradeMonNick:: ; cd29
	ds 1

wEnemyMonUnmodifiedSpeed:: ; cd2a
	ds 2
wEnemyMonUnmodifiedSpecial:: ; cd2c
	ds 1

wEngagedTrainerClass:: ; cd2d
	ds 1
wEngagedTrainerSet:: ; cd2e
;	ds 1

; stat modifiers for the enemy's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal

wEnemyMonStatMods::
wEnemyMonAttackMod:: ; cd2e
	ds 1
wEnemyMonDefenseMod:: ; cd2f
	ds 1
wEnemyMonSpeedMod:: ; cd30
	ds 1
wEnemyMonSpecialMod:: ; cd31
	ds 1
wEnemyMonAccuracyMod:: ; cd32
	ds 1
wEnemyMonEvasionMod:: ; cd33
	ds 1

wInGameTradeReceiveMonSpecies::
	ds 1

	ds 2

wNPCMovementDirections2Index:: ; cd37

wcd37:: ds 1

wSimulatedJoypadStatesIndex:: ; cd38
; the next simulated joypad state is at wSimulatedJoypadStatesEnd plus this value minus 1
; 0 if the joypad state is not being simulated
	ds 1

wWastedByteCD39:: ; cd39
; written to but nothing ever reads it
	ds 1

wWastedByteCD3A:: ; cd3a
; written to but nothing ever reads it
	ds 1

wOverrideSimulatedJoypadStatesMask:: ; cd3b
; mask indicating which real button presses can override simulated ones
; XXX is it ever not 0?
	ds 1

	ds 1

wTradedPlayerMonSpecies:: ; cd3d

wTradingWhichPlayerMon:: ; cd3d

wChangeBoxSavedMapTextPointer:: ; cd3d

wFlyAnimUsingCoordList:: ; cd3d

wPlayerSpinInPlaceAnimFrameDelay:: ; cd3d

wPlayerSpinWhileMovingUpOrDownAnimDeltaY:: ; cd3d

wHiddenObjectFunctionArgument:: ; cd3d

wSubtrahend:: ; cd3d
; subtract (BCD) wSubtrahend, wSubtrahend+1, wSubtrahend+2

wWhichTrade:: ; cd3d
; which entry from TradeMons to select

wTrainerSpriteOffset:: ; cd3d
	ds 1

wTradedEnemyMonSpecies:: ; cd3e

wTradingWhichEnemyMon:: ; cd3e

wFlyAnimCounter:: ; cd3e

wPlayerSpinInPlaceAnimFrameDelayDelta:: ; cd3e

wPlayerSpinWhileMovingUpOrDownAnimMaxY:: ; cd3e

wHiddenObjectFunctionRomBank:: ; cd3e

wTrainerEngageDistance:: ; cd3e
	ds 1

wNameOfPlayerMonToBeTraded:: ; cd3f

wFlyAnimBirdSpriteImageIndex:: ; cd3f

wPlayerSpinInPlaceAnimFrameDelayEndValue:: ; cd3f

wPlayerSpinWhileMovingUpOrDownAnimFrameDelay:: ; cd3f

wHiddenObjectIndex:: ; cd3f

wTrainerFacingDirection:: ; cd3f
wcd3f::
	ds 1

wPlayerSpinInPlaceAnimSoundID:: ; cd40

wHiddenObjectY:: ; cd40

wTrainerScreenY:: ; cd40
	ds 1

wTradedPlayerMonOT:: ; cd41

wHiddenObjectX:: ; cd41

wTrainerScreenX:: ; cd41
	ds 1

wcd42:: ds 1
wcd43:: ds 1
wcd44:: ds 1
wcd45:: ds 1
wcd46:: ds 1
wcd47:: ds 1
wcd48:: ds 1
wcd49:: ds 1
wcd4a:: ds 1
wcd4b:: ds 1

wTradedPlayerMonOTID:: ; cd4c

wcd4c:: ds 1
wcd4d:: ds 1

wTradedEnemyMonOT:: ; cd4e

wcd4e:: ds 1
wcd4f:: ds 1
wcd50:: ds 9

wTradedEnemyMonOTID:: ; cd59
	ds 2

wcd5b:: ds 1
wcd5c:: ds 1
wcd5d:: ds 1
wcd5e:: ds 1
wcd5f:: ds 1

wFlags_0xcd60:: ; cd60
; bit 0: is player engaged by trainer (to avoid being engaged by multiple trainers simultaneously)
; bit 1: boulder dust animation (from using Strength) pending
; bit 5: don't play sound when A or B is pressed in menu
; bit 6: tried pushing against boulder once (you need to push twice before it will move)
	ds 1

	ds 9

wcd6a:: ds 1

wJoyIgnore:: ; cd6b
; Set buttons are ignored.
	ds 1

wcd6c:: ds 1
wcd6d:: ds 4
wcd71:: ds 1
wcd72:: ds 5
wcd77:: ds 1
wcd78:: ds 9

wSerialOtherGameboyRandomNumberListBlock:: ; cd81
; buffer for transferring the random number list generated by the other gameboy

wTileMapBackup2:: ; cd81
; second buffer for temporarily saving and restoring current screen's tiles (e.g. if menus are drawn on top)
	ds 20 * 18

wBuffer:: ; cee9
; Temporary storage area of 30 bytes.
wHPBarMaxHP:: ; cee9
	ds 2
wHPBarOldHP:: ; ceeb
	ds 2
wHPBarNewHP:: ; ceed
	ds 2
wHPBarDelta:: ; ceef
	ds 1

wcef0:: ds 1
wcef1:: ds 12

wHPBarHPDifference:: ; cefd
	ds 1
	ds 7

wcf05:: ds 1
wcf06:: ds 1

wAnimSoundID:: ; cf07
; sound ID during battle animations
	ds 1

wcf08:: ds 1
wcf09:: ds 1
wcf0a:: ds 1
wBattleResult:: ; cf0b
; $00 - win
; $01 - lose
; $02 - draw
	ds 1

wAutoTextBoxDrawingControl:: ; cf0c
; bit 0: if set, DisplayTextID automatically draws a text box
	ds 1

wcf0d:: ds 1
wcf0e:: ds 1
wcf0f:: ds 1

wNPCMovementScriptFunctionNum:: ; cf10
; which script function within the pointer table indicated by
; wNPCMovementScriptPointerTableNum
	ds 1

wcf11:: ds 1

wPredefParentBank:: ; cf12
	ds 1

wSpriteIndex:: ds 1

wCurSpriteMovement2:: ; cf14
; movement byte 2 of current sprite
	ds 1

	ds 2

wNPCMovementScriptSpriteOffset:: ; cf17
; sprite offset of sprite being controlled by NPC movement script
	ds 1

wcf18:: ds 2

wGBC:: ; cf1a
	ds 1

wOnSGB:: ; cf1b
; if running on SGB, it's 1, else it's 0
	ds 1

wcf1c:: ds 1
wcf1d:: ds 1
wcf1e:: ds 1
wcf1f:: ds 6
wcf25:: ds 8
wcf2d:: ds 1
wcf2e:: ds 2
wcf30:: ds 7
wcf37:: ds 20
wcf4b:: ds 1
wcf4c:: ds 1
wcf4d:: ds 18

wGymCityName:: ; cf5f
wStringBuffer1:: ; cf5f
	ds 16 + 1
wGymLeaderName:: ; cf70
wStringBuffer2:: ; cf70
	ds 16 + 1
wStringBuffer3:: ; cf81
	ds 9 + 1

wList:: ; cf8b
	ds 2

wcf8d:: ds 1
wcf8e:: ds 1

wItemPrices:: ; cf8f
	ds 2

wcf91:: ds 1

wWhichPokemon:: ; cf92
; which pokemon you selected
	ds 1

wcf93:: ds 1

wHPBarType:: ; cf94
; type of HP bar
; $00 = enemy HUD in battle
; $01 = player HUD in battle / status screen
; $02 = party menu

wListMenuID:: ; cf94
; ID used by DisplayListMenuID
	ds 1

wcf95:: ds 1
wcf96:: ds 1
wcf97:: ds 1

; LoadMonData copies mon data here
wLoadedMon:: party_struct wLoadedMon ; cf98

wFontLoaded:: ; cfc4
; bit 0: The space in VRAM that is used to store walk animation tile patterns
;        for the player and NPCs is in use for font tile patterns.
;        This means that NPC movement must be disabled.
; The other bits are unused.
	ds 1

wWalkCounter:: ; cfc5
; walk animation counter
	ds 1

wTileInFrontOfPlayer:: ; cfc6
; background tile number in front of the player (either 1 or 2 steps ahead)
	ds 1

wMusicHeaderPointer:: ; cfc7
; (the current music channel address - $4000) / 3
	ds 1

wcfc8:: ds 1
wcfc9:: ds 1
wcfca:: ds 1

wUpdateSpritesEnabled:: ; cfcb
; $01 enables UpdateSprites; anything else disables it
	ds 1

W_ENEMYMOVENUM:: ; cfcc
	ds 1
W_ENEMYMOVEEFFECT:: ; cfcd
	ds 1
W_ENEMYMOVEPOWER:: ; cfce
	ds 1
W_ENEMYMOVETYPE:: ; cfcf
	ds 1
W_ENEMYMOVEACCURACY:: ; cfd0
	ds 1
W_ENEMYMOVEMAXPP:: ; cfd1
	ds 1
W_PLAYERMOVENUM:: ; cfd2
	ds 1
W_PLAYERMOVEEFFECT:: ; cfd3
	ds 1
W_PLAYERMOVEPOWER:: ; cfd4
	ds 1
W_PLAYERMOVETYPE:: ; cfd5
	ds 1
W_PLAYERMOVEACCURACY:: ; cfd6
	ds 1
W_PLAYERMOVEMAXPP:: ; cfd7
	ds 1


wEnemyMonSpecies2:: ; cfd8
	ds 1
wBattleMonSpecies2:: ; cfd9
	ds 1

wEnemyMonNick:: ds 11 ; cfda

wEnemyMon:: ; cfe5
; The wEnemyMon struct reaches past 0xcfff,
; the end of wram bank 0 on cgb.
; This has no significance on dmg, where wram
; isn't banked (c000-dfff is contiguous).
; However, recent versions of rgbds have replaced
; dmg-style wram with cgb wram banks.

; Until this is fixed, this struct will have
; to be declared manually.

wEnemyMonSpecies::   db
wEnemyMonHP::        dw
wEnemyMonPartyPos::
wEnemyMonBoxLevel::  db
wEnemyMonStatus::    db
wEnemyMonType::
wEnemyMonType1::     db
wEnemyMonType2::     db
wEnemyMonCatchRate_NotReferenced:: db
wEnemyMonMoves::     ds NUM_MOVES
wEnemyMonDVs::       ds 2
wEnemyMonLevel::     db
wEnemyMonMaxHP::     dw
wEnemyMonAttack::    dw
wEnemyMonDefense::   dw
wEnemyMonSpeed::     dw
wEnemyMonSpecial::   dw
wEnemyMonPP::        ds 2 ; NUM_MOVES - 2
SECTION "WRAM Bank 1", WRAMX, BANK[1]
                     ds 2 ; NUM_MOVES - 2

wEnemyMonBaseStats:: ds 5
wEnemyMonCatchRate:: ds 1
wEnemyMonBaseExp:: ds 1

wBattleMonNick:: ds 11 ; d009
wBattleMon:: battle_struct wBattleMon ; d014


W_TRAINERCLASS:: ; d031
	ds 1

	ds 1

wd033:: ds 1
wd034:: ds 2
wd036:: ds 16
wd046:: ds 1
wd047:: ds 1
wd048:: ds 2

W_TRAINERNAME:: ; d04a
; 13 bytes for the letters of the opposing trainer
; the name is terminated with $50 with possible
; unused trailing letters
	ds 13

W_ISINBATTLE:: ; d057
; no battle, this is 0
; wild battle, this is 1
; trainer battle, this is 2
	ds 1

wPartyGainExpFlags:: ; d058
; flags that indicate which party members should be be given exp when GainExperience is called
	flag_array 6

W_CUROPPONENT:: ; d059
; in a wild battle, this is the species of pokemon
; in a trainer battle, this is the trainer class + $C8
	ds 1

W_BATTLETYPE:: ; d05a
; in normal battle, this is 0
; in old man battle, this is 1
; in safari battle, this is 2
	ds 1

wd05b:: ds 1

W_LONEATTACKNO:: ; d05c
; which entry in LoneAttacks to use
W_GYMLEADERNO:: ; d05c
; it's actually the same thing as ^
	ds 1
W_TRAINERNO:: ; d05d
; which instance of [youngster, lass, etc] is this?
	ds 1

wCriticalHitOrOHKO:: ; d05e
; $00 = normal attack
; $01 = critical hit
; $02 = successful OHKO
; $ff = failed OHKO
	ds 1

W_MOVEMISSED:: ; d05f
	ds 1

wPlayerStatsToDouble:: ; d060
; always 0
	ds 1

wPlayerStatsToHalve:: ; d061
; always 0
	ds 1

W_PLAYERBATTSTATUS1:: ; d062
; bit 0 - bide
; bit 1 - thrash / petal dance
; bit 2 - attacking multiple times (e.g. double kick)
; bit 3 - flinch
; bit 4 - charging up for attack
; bit 5 - using multi-turn move (e.g. wrap)
; bit 6 - invulnerable to normal attack (using fly/dig)
; bit 7 - confusion
	ds 1

W_PLAYERBATTSTATUS2:: ; d063
; bit 0 - X Accuracy effect
; bit 1 - protected by "mist"
; bit 2 - focus energy effect
; bit 4 - has a substitute
; bit 5 - need to recharge
; bit 6 - rage
; bit 7 - leech seeded
	ds 1

W_PLAYERBATTSTATUS3:: ; d064
; bit 0 - toxic
; bit 1 - light screen
; bit 2 - reflect
; bit 3 - tranformed
	ds 1

wEnemyStatsToDouble:: ; d065
; always 0
	ds 1

wEnemyStatsToHalve:: ; d066
; always 0
	ds 1

W_ENEMYBATTSTATUS1:: ; d067
	ds 1
W_ENEMYBATTSTATUS2:: ; d068
	ds 1
W_ENEMYBATTSTATUS3:: ; d069
	ds 1

wPlayerNumAttacksLeft::
; when the player is attacking multiple times, the number of attacks left
	ds 1

W_PLAYERCONFUSEDCOUNTER:: ; wd06b
	ds 1

W_PLAYERTOXICCOUNTER:: ; d06c
	ds 1
W_PLAYERDISABLEDMOVE:: ; d06d
	ds 1

	ds 1

wEnemyNumAttacksLeft::
; when the enemy is attacking multiple times, the number of attacks left
	ds 1

W_ENEMYCONFUSEDCOUNTER:: ; wd070
	ds 1

W_ENEMYTOXICCOUNTER:: ; d071
	ds 1
W_ENEMYDISABLEDMOVE:: ; d072
	ds 1

	ds 1

wPlayerNumHits:: ; d074
; number of hits by player in attacks like Double Slap, etc.

wPlayerBideAccumulatedDamage:: ; d074
; the amount of damage accumulated by the player while biding (2 bytes)

wUnknownSerialCounter2:: ; d075
; 2 bytes

ds 4

wEscapedFromBattle::
; non-zero when an item or move that allows escape from battle was used
	ds 1

wd079:: ds 1
wd07a:: ds 1
wd07b:: ds 1

W_ANIMATIONID:: ; d07c
; ID number of the current battle animation
	ds 1

wd07d:: ds 1
wd07e:: ds 3

; base coordinates of frame block
W_BASECOORDX:: ; d081
	ds 1
W_BASECOORDY:: ; d082
	ds 1

wd083:: ds 1

W_FBTILECOUNTER:: ; d084
; counts how many tiles of the current frame block have been drawn
	ds 1

wd085:: ds 1

W_SUBANIMFRAMEDELAY:: ; d086
; duration of each frame of the current subanimation in terms of screen refreshes
	ds 1
W_SUBANIMCOUNTER:: ; d087
; counts the number of subentries left in the current subanimation
	ds 1

wd088:: ds 1

W_NUMFBTILES:: ; d089
; number of tiles in current battle animation frame block
	ds 1

wd08a:: ds 1

wTownMapSpriteBlinkingCounter:: ; d08b

W_SUBANIMTRANSFORM:: ; d08b
; controls what transformations are applied to the subanimation
; 01: flip horizontally and vertically
; 02: flip horizontally and translate downwards 40 pixels
; 03: translate base coordinates of frame blocks, but don't change their internal coordinates or flip their tiles
; 04: reverse the subanimation
	ds 1

wEndBattleWinTextPointer:: ; d08c
	ds 2

wEndBattleLoseTextPointer:: ; d08e
	ds 2

	ds 2

wEndBattleTextRomBank:: ; d092
	ds 1

	ds 1

W_SUBANIMADDRPTR:: ; d094
; the address _of the address_ of the current subanimation entry
	ds 2
W_SUBANIMSUBENTRYADDR:: ; d096
; the address of the current subentry of the current subanimation
	ds 2

	ds 2

wd09a:: ds 1

wTownMapSpriteBlinkingEnabled:: ; d09b
; non-zero when enabled. causes nest locations to blink on and off.
; the town selection cursor will blink regardless of what this value is

wd09b:: ds 1

W_FBDESTADDR:: ; d09c
; current destination address in OAM for frame blocks (big endian)
	ds 2

W_FBMODE:: ; d09e
; controls how the frame blocks are put together to form frames
; specifically, after finishing drawing the frame block, the frame block's mode determines what happens
; 00: clean OAM buffer and delay
; 02: move onto the next frame block with no delay and no cleaning OAM buffer
; 03: delay, but don't clean OAM buffer
; 04: delay, without cleaning OAM buffer, and do not advance [W_FBDESTADDR], so that the next frame block will overwrite this one
; sprite data is written column by column, each byte contains 8 columns (one for ech bit)
; for 2bpp sprites, pairs of two consecutive bytes (i.e. pairs of consecutive rows of sprite data)
; contain the upper and lower bit of each of the 8 pixels, respectively
	ds 1

wNewTileBlockID:: ; d09f

wd09f:: ds 1
wd0a0:: ds 1

W_SPRITECURPOSX:: ; d0a1
	ds 1
W_SPRITECURPOSY:: ; d0a2
	ds 1
W_SPRITEWITDH:: ; d0a3
	ds 1
W_SPRITEHEIGHT:: ; d0a4
	ds 1
W_SPRITEINPUTCURBYTE:: ; d0a5
; current input byte
	ds 1
W_SPRITEINPUTBITCOUNTER:: ; d0a6
; bit offset of last read input bit
	ds 1

W_SPRITEOUTPUTBITOFFSET:: ; d0a7; determines where in the output byte the two bits are placed. Each byte contains four columns (2bpp data)
; 3 -> XX000000   1st column
; 2 -> 00XX0000   2nd column
; 1 -> 0000XX00   3rd column
; 0 -> 000000XX   4th column
	ds 1

W_SPRITELOADFLAGS:: ; d0a8
; bit 0 determines used buffer (0 -> $a188, 1 -> $a310)
; bit 1 loading last sprite chunk? (there are at most 2 chunks per load operation)
	ds 1
W_SPRITEUNPACKMODE:: ; d0a9
	ds 1
W_SPRITEFLIPPED:: ; d0aa
	ds 1

W_SPRITEINPUTPTR:: ; d0ab
; pointer to next input byte
	ds 2
W_SPRITEOUTPUTPTR:: ; d0ad
; pointer to current output byte
	ds 2
W_SPRITEOUTPUTPTRCACHED:: ; d0af
; used to revert pointer for different bit offsets
	ds 2
W_SPRITEDECODETABLE0PTR:: ; d0b1
; pointer to differential decoding table (assuming initial value 0)
	ds 2
W_SPRITEDECODETABLE1PTR:: ; d0b3
; pointer to differential decoding table (assuming initial value 1)
	ds 2

wd0b5:: ds 1

wNameListType:: ; d0b6
	ds 1

wPredefBank:: ; d0b7
	ds 1

W_MONHEADER:: ; d0b8
W_MONHDEXNUM:: ; d0b8
	ds 1

W_MONHBASESTATS:: ; d0b9
W_MONHBASEHP:: ; d0b9
	ds 1
W_MONHBASEATTACK:: ; d0ba
	ds 1
W_MONHBASEDEFENSE:: ; d0bb
	ds 1
W_MONHBASESPEED:: ; d0bc
	ds 1
W_MONHBASESPECIAL:: ; d0bd
	ds 1

W_MONHTYPES:: ; d0be
W_MONHTYPE1:: ; d0be
	ds 1
W_MONHTYPE2:: ; d0bf
	ds 1

W_MONHCATCHRATE:: ; d0c0
	ds 1
W_MONHBASEXP:: ; d0c1
	ds 1
W_MONHSPRITEDIM:: ; d0c2
	ds 1
W_MONHFRONTSPRITE:: ; d0c3
	ds 2
W_MONHBACKSPRITE:: ; d0c5
	ds 2

W_MONHMOVES:: ; d0c7
	ds 4

W_MONHGROWTHRATE:: ; d0cb
	ds 1

W_MONHLEARNSET:: ; d0cc
; bit field
	flag_array 50 + 5
	ds 1

wd0d4:: ds 3

W_MONHPADDING:: ; d0d7


W_DAMAGE:: ; d0d7
	ds 2

ds 2

wRepelRemainingSteps:: ; wd0db
    ds 1

wMoves:: ; wd0dc
; list of moves for FormatMovesString
	ds 4

wMoveNum:: ; d0e0
	ds 1

wMovesString:: ; d0e1
	ds 56

wd119:: ds 1

wWalkBikeSurfStateCopy:: ; d11a
; wWalkBikeSurfState is sometimes copied here, but it doesn't seem to be used for anything
	ds 1

wd11b:: ds 1
wd11c:: ds 1
wd11d:: ds 1
wd11e:: ds 1
wd11f:: ds 1

wNumRunAttempts::
; number of times the player has tried to run from battle
	ds 1

wd121:: ds 1
wd122:: ds 2
wd124:: ds 1

wTextBoxID:: ; d125
	ds 1

wd126:: ds 1

W_CURENEMYLVL:: ; d127
	ds 1

wd128:: ds 1
wd129:: ds 1
wd12a:: ds 1

wLinkState:: ; d12b
	ds 1

wTwoOptionMenuID:: ds 1
wd12d:: ds 1
wd12e:: ds 1
wd12f:: ds 1
wd130:: ds 1
wd131:: ds 1
wd132:: ds 1
wd133:: ds 6
wd139:: ds 1

wIgnoreInputCounter:: ; d13a
; counts downward each frame
; when it hits 0, bit 5 (ignore input bit) of wd730 is reset
	ds 1

wStepCounter:: ; d13b
; counts down once every step
	ds 1

wNumberOfNoRandomBattleStepsLeft:: ; d13c
; after a battle, you have at least 3 steps before a random battle can occur
	ds 1

W_PRIZE1:: ; d13d
	ds 1
W_PRIZE2:: ; d13e
	ds 1
W_PRIZE3:: ; d13f
	ds 1

	ds 1

wSerialRandomNumberListBlock:: ; d141
; the first 7 bytes are the preamble

wd141:: ds 2
wd143:: ds 2
wd145:: ds 3

wLinkBattleRandomNumberList:: ; d148
; shared list of 9 random numbers, indexed by wLinkBattleRandomNumberListIndex
	ds 10

wSerialPlayerDataBlock:: ; d152
; the first 6 bytes are the preamble

wd152:: ds 1
wd153:: ds 3
wd156:: ds 1
wd157:: ds 1


wPlayerName:: ; d158
	ds 11

wPartyCount::   ds 1 ; d163
wPartySpecies:: ds PARTY_LENGTH ; d164
wPartyEnd::     ds 1 ; d16a

wPartyMons::
wPartyMon1:: party_struct wPartyMon1 ; d16b
wPartyMon2:: party_struct wPartyMon2 ; d197
wPartyMon3:: party_struct wPartyMon3 ; d1c3
wPartyMon4:: party_struct wPartyMon4 ; d1ef
wPartyMon5:: party_struct wPartyMon5 ; d21b
wPartyMon6:: party_struct wPartyMon6 ; d247

wPartyMonOT::    ds 11 * PARTY_LENGTH ; d273
wPartyMonNicks:: ds 11 * PARTY_LENGTH ; d2b5


wPokedexOwned:: ; d2f7
	flag_array NUM_POKEMON
wPokedexOwnedEnd::

wPokedexSeen:: ; d30a
	flag_array NUM_POKEMON
wPokedexSeenEnd::


wNumBagItems:: ; d31d
	ds 1
wBagItems:: ; d31e
; item, quantity
	ds 20 * 2
	ds 1 ; end

wPlayerMoney:: ; d347
	ds 3 ; BCD

W_RIVALNAME:: ; d34a
	ds 11

W_OPTIONS:: ; d355
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
	ds 1

W_OBTAINEDBADGES:: ; d356
	ds 1

	ds 1

wd358:: ds 1

wPlayerID:: ; d359
	ds 2

wd35b:: ds 1
wd35c:: ds 1

wMapPalOffset:: ; d35d
; offset subtracted from FadePal4 to get the background and object palettes for the current map
; normally, it is 0. it is 6 when Flash is needed, causing FadePal2 to be used instead of FadePal4
	ds 1

W_CURMAP:: ; d35e
	ds 1

wCurrentTileBlockMapViewPointer:: ; d35f
; pointer to the upper left corner of the current view in the tile block map
	ds 2

W_YCOORD:: ; d361
; player’s position on the current map
	ds 1

W_XCOORD:: ; d362
	ds 1

W_YBLOCKCOORD:: ; d363
; player's y position (by block)
	ds 1

W_XBLOCKCOORD:: ; d364
	ds 1

wLastMap:: ; d365
	ds 1

wd366:: ds 1

W_CURMAPTILESET:: ; d367
	ds 1

W_CURMAPHEIGHT:: ; d368
; blocks
	ds 1

W_CURMAPWIDTH:: ; d369
; blocks
	ds 1

W_MAPDATAPTR:: ; d36a
	ds 2

W_MAPTEXTPTR:: ; d36c
	ds 2

W_MAPSCRIPTPTR:: ; d36e
	ds 2

W_MAPCONNECTIONS:: ; d370
; connection byte
	ds 1

W_MAPCONN1PTR:: ; d371
	ds 1

wd372:: ds 1
wd373:: ds 1
wd374:: ds 1
wd375:: ds 1
wd376:: ds 1
wd377:: ds 1
wd378:: ds 1
wd379:: ds 1
wd37a:: ds 1
wd37b:: ds 1

W_MAPCONN2PTR:: ; d37c
	ds 1

wd37d:: ds 1
wd37e:: ds 1
wd37f:: ds 1
wd380:: ds 1
wd381:: ds 1
wd382:: ds 1
wd383:: ds 1
wd384:: ds 1
wd385:: ds 1
wd386:: ds 1

W_MAPCONN3PTR:: ; d387
	ds 1

wd388:: ds 1
wd389:: ds 1
wd38a:: ds 1
wd38b:: ds 1
wd38c:: ds 1
wd38d:: ds 1
wd38e:: ds 1
wd38f:: ds 1
wd390:: ds 1
wd391:: ds 1

W_MAPCONN4PTR:: ; d392
	ds 1

wd393:: ds 1
wd394:: ds 1
wd395:: ds 1
wd396:: ds 1
wd397:: ds 1
wd398:: ds 1
wd399:: ds 1
wd39a:: ds 1
wd39b:: ds 1
wd39c:: ds 1

W_SPRITESET:: ; d39d
; sprite set for the current map (11 sprite picture ID's)
	ds 11

W_SPRITESETID:: ; d3a8
; sprite set ID for the current map
	ds 1

wd3a9:: ds 1
wd3aa:: ds 3
wd3ad:: ds 1

wNumberOfWarps:: ; d3ae
; number of warps in current map
	ds 1

wWarpEntries:: ; d3af
; current map warp entries
	ds 128

wDestinationWarpID:: ; d42f
; if $ff, the player's coordinates are not updated when entering the map
	ds 1

	ds 128

wd4b0:: ds 1
wd4b1:: ds 32
wd4d1:: ds 16

W_NUMSPRITES:: ; d4e1
; number of sprites on the current map
	ds 1

; these two variables track the X and Y offset in blocks from the last special warp used
; they don't seem to be used for anything
wYOffsetSinceLastSpecialWarp:: ; d4e2
	ds 1
wXOffsetSinceLastSpecialWarp:: ; d4e3
	ds 1

W_MAPSPRITEDATA:: ; d4e4
; two bytes per sprite (movement byte 2, text ID)
	ds 32

W_MAPSPRITEEXTRADATA:: ; d504
; two bytes per sprite (trainer class/item ID, trainer set ID)
	ds 32

wd524:: ds 1
wd525:: ds 1

wMapViewVRAMPointer:: ; d526
; the address of the upper left corner of the visible portion of the BG tile map in VRAM
	ds 2

wd528:: ds 1
wd529:: ds 1
wd52a:: ds 1

W_TILESETBANK:: ; d52b
	ds 1

W_TILESETBLOCKSPTR:: ; d52c
; maps blocks (4x4 tiles) to tiles
	ds 2

W_TILESETGFXPTR:: ; d52e
	ds 2

W_TILESETCOLLISIONPTR:: ; d530
; list of all walkable tiles
	ds 2

W_TILESETTALKINGOVERTILES:: ; d532
	ds 3

W_GRASSTILE:: ; d535
	ds 1

	ds 4

wNumBoxItems:: ; d53a
	ds 1
wBoxItems:: ; d53b
; item, quantity
	ds 50 * 2
	ds 1 ; end

wd5a0:: ds 2
wd5a2:: ds 1
wd5a3:: ds 1

wPlayerCoins:: ; d5a4
	ds 2 ; BCD

W_MISSABLEOBJECTFLAGS:: ; d5a6
; bit array of missable objects. set = removed
	ds 39

wd5cd:: ds 1

W_MISSABLEOBJECTLIST:: ; d5ce
; each entry consists of 2 bytes
; * the sprite ID (depending on the current map)
; * the missable object index (global, used for W_MISSABLEOBJECTFLAGS)
; terminated with $FF
	ds 17 * 2

W_GAMEPROGRESSFLAGS:: ; d5f0
; $c8 bytes
	ds 0

W_OAKSLABCURSCRIPT:: ; d5f0
	ds 1
W_PALLETTOWNCURSCRIPT:: ; d5f1
	ds 1
	ds 1
W_BLUESHOUSECURSCRIPT:: ; d5f3
	ds 1
W_VIRIDIANCITYCURSCRIPT:: ; d5f4
	ds 1
	ds 2
W_PEWTERCITYCURSCRIPT:: ; d5f7
	ds 1
W_ROUTE3CURSCRIPT:: ; d5f8
	ds 1
W_ROUTE4CURSCRIPT:: ; d5f9
	ds 1
	ds 1
W_VIRIDIANGYMCURSCRIPT:: ; d5fb
	ds 1
W_PEWTERGYMCURSCRIPT:: ; d5fc
	ds 1
W_CERULEANGYMCURSCRIPT:: ; d5fd
	ds 1
W_VERMILIONGYMCURSCRIPT:: ; d5fe
	ds 1
W_CELADONGYMCURSCRIPT:: ; d5ff
	ds 1
W_ROUTE6CURSCRIPT:: ; d600
	ds 1
W_ROUTE8CURSCRIPT:: ; d601
	ds 1
W_ROUTE24CURSCRIPT:: ; d602
	ds 1
W_ROUTE25CURSCRIPT:: ; d603
	ds 1
W_ROUTE9CURSCRIPT:: ; d604
	ds 1
W_ROUTE10CURSCRIPT:: ; d605
	ds 1
W_MTMOON1CURSCRIPT:: ; d606
	ds 1
W_MTMOON3CURSCRIPT:: ; d607
	ds 1
W_SSANNE8CURSCRIPT:: ; d608
	ds 1
W_SSANNE9CURSCRIPT:: ; d609
	ds 1
W_ROUTE22CURSCRIPT:: ; d60a
	ds 1
	ds 1
W_REDSHOUSE2CURSCRIPT:: ; d60c
	ds 1
W_VIRIDIANMARKETCURSCRIPT:: ; d60d
	ds 1
W_ROUTE22GATECURSCRIPT:: ; d60e
	ds 1
W_CERULEANCITYCURSCRIPT:: ; d60f
	ds 1
	ds 7
W_SSANNE5CURSCRIPT:: ; d617
	ds 1
W_VIRIDIANFORESTCURSCRIPT:: ; d618
	ds 1
W_MUSEUM1FCURSCRIPT:: ; d619
	ds 1
W_ROUTE13CURSCRIPT:: ; d61a
	ds 1
W_ROUTE14CURSCRIPT:: ; d61b
	ds 1
W_ROUTE17CURSCRIPT:: ; d61c
	ds 1
W_ROUTE19CURSCRIPT:: ; d61d
	ds 1
W_ROUTE21CURSCRIPT:: ; d61e
	ds 1
W_SAFARIZONEENTRANCECURSCRIPT:: ; d61f
	ds 1
W_ROCKTUNNEL2CURSCRIPT:: ; d620
	ds 1
W_ROCKTUNNEL1CURSCRIPT:: ; d621
	ds 1
	ds 1
W_ROUTE11CURSCRIPT:: ; d623
	ds 1
W_ROUTE12CURSCRIPT:: ; d624
	ds 1
W_ROUTE15CURSCRIPT:: ; d625
	ds 1
W_ROUTE16CURSCRIPT:: ; d626
	ds 1
W_ROUTE18CURSCRIPT:: ; d627
	ds 1
W_ROUTE20CURSCRIPT:: ; d628
	ds 1
W_SSANNE10CURSCRIPT:: ; d629
	ds 1
W_VERMILIONCITYCURSCRIPT:: ; d62a
	ds 1
W_POKEMONTOWER2CURSCRIPT:: ; d62b
	ds 1
W_POKEMONTOWER3CURSCRIPT:: ; d62c
	ds 1
W_POKEMONTOWER4CURSCRIPT:: ; d62d
	ds 1
W_POKEMONTOWER5CURSCRIPT:: ; d62e
	ds 1
W_POKEMONTOWER6CURSCRIPT:: ; d62f
	ds 1
W_POKEMONTOWER7CURSCRIPT:: ; d630
	ds 1
W_ROCKETHIDEOUT1CURSCRIPT:: ; d631
	ds 1
W_ROCKETHIDEOUT2CURSCRIPT:: ; d632
	ds 1
W_ROCKETHIDEOUT3CURSCRIPT:: ; d633
	ds 1
W_ROCKETHIDEOUT4CURSCRIPT:: ; d634
	ds 2
W_ROUTE6GATECURSCRIPT:: ; d636
	ds 1
W_ROUTE8GATECURSCRIPT:: ; d637
	ds 2
W_CINNABARISLANDCURSCRIPT:: ; d639
	ds 1
W_MANSION1CURSCRIPT:: ; d63a
	ds 2
W_MANSION2CURSCRIPT:: ; d63c
	ds 1
W_MANSION3CURSCRIPT:: ; d63d
	ds 1
W_MANSION4CURSCRIPT:: ; d63e
	ds 1
W_VICTORYROAD2CURSCRIPT:: ; d63f
	ds 1
W_VICTORYROAD3CURSCRIPT:: ; d640
	ds 2
W_FIGHTINGDOJOCURSCRIPT:: ; d642
	ds 1
W_SILPHCO2CURSCRIPT:: ; d643
	ds 1
W_SILPHCO3CURSCRIPT:: ; d644
	ds 1
W_SILPHCO4CURSCRIPT:: ; d645
	ds 1
W_SILPHCO5CURSCRIPT:: ; d646
	ds 1
W_SILPHCO6CURSCRIPT:: ; d647
	ds 1
W_SILPHCO7CURSCRIPT:: ; d648
	ds 1
W_SILPHCO8CURSCRIPT:: ; d649
	ds 1
W_SILPHCO9CURSCRIPT:: ; d64a
	ds 1
W_HALLOFFAMEROOMCURSCRIPT:: ; d64b
	ds 1
W_GARYCURSCRIPT:: ; d64c
	ds 1
W_LORELEICURSCRIPT:: ; d64d
	ds 1
W_BRUNOCURSCRIPT:: ; d64e
	ds 1
W_AGATHACURSCRIPT:: ; d64f
	ds 1
W_UNKNOWNDUNGEON3CURSCRIPT:: ; d650
	ds 1
W_VICTORYROAD1CURSCRIPT:: ; d651
	ds 1
	ds 1
W_LANCECURSCRIPT:: ; d653
	ds 1
	ds 4
W_SILPHCO10CURSCRIPT:: ; d658
	ds 1
W_SILPHCO11CURSCRIPT:: ; d659
	ds 1
	ds 1
W_FUCHSIAGYMCURSCRIPT:: ; d65b
	ds 1
W_SAFFRONGYMCURSCRIPT:: ; d65c
	ds 1
	ds 1
W_CINNABARGYMCURSCRIPT:: ; d65e
	ds 1
W_CELADONGAMECORNERCURSCRIPT:: ; d65f
	ds 1
W_ROUTE16GATECURSCRIPT:: ; d660
	ds 1
W_BILLSHOUSECURSCRIPT:: ; d661
	ds 1
W_ROUTE5GATECURSCRIPT:: ; d662
	ds 1
W_POWERPLANTCURSCRIPT:: ; d663
; overload
	ds 0
W_ROUTE7GATECURSCRIPT:: ; d663
; overload
	ds 1
	ds 1
W_SSANNE2CURSCRIPT:: ; d665
	ds 1
W_SEAFOAMISLANDS4CURSCRIPT:: ; d666
	ds 1
W_ROUTE23CURSCRIPT:: ; d667
	ds 1
W_SEAFOAMISLANDS5CURSCRIPT:: ; d668
	ds 1
W_ROUTE18GATECURSCRIPT:: ; d669
	ds 1

	ds 134

wd6f0:: ds 14
wd6fe:: ds 2

wWalkBikeSurfState:: ; d700
; $00 = walking
; $01 = biking
; $02 = surfing
	ds 1

	ds 10

W_TOWNVISITEDFLAG:: ; d70b
	flag_array 13

wSafariSteps:: ; d70d
; starts at 502
	ds 2

W_FOSSILITEM:: ; d70f
; item given to cinnabar lab
	ds 1

W_FOSSILMON:: ; d710
; mon that will result from the item
	ds 1

	ds 2

W_ENEMYMONORTRAINERCLASS:: ; d713
; trainer classes start at $c8
	ds 1

wPlayerJumpingYScreenCoordsIndex:: ; d714
	ds 1

W_RIVALSTARTER:: ; d715
	ds 1

	ds 1

W_PLAYERSTARTER:: ; d717
	ds 1

wBoulderSpriteIndex:: ; d718
; sprite index of the boulder the player is trying to push
	ds 1

wLastBlackoutMap:: ; d719
	ds 1

wDestinationMap:: ; d71a
; destination map (for certain types of special warps, not ordinary walking)
	ds 1

wd71b:: ds 1

wTileInFrontOfBoulderAndBoulderCollisionResult:: ; d71c
; used to store the tile in front of the boulder when trying to push a boulder
; also used to store the result of the collision check ($ff for a collision and $00 for no collision)
	ds 1

wDungeonWarpDestinationMap:: ; d71d
; destination map for dungeon warps
	ds 1

wWhichDungeonWarp:: ; d71e
; which dungeon warp within the source map was used
	ds 1

wd71f:: ds 9

wd728::
; bit 0: using Strength outside of battle
	ds 1

	ds 1

wd72a:: ds 2

wd72c:: ; d72c
; bit 0: if not set, the 3 minimum steps between random battles have passed
	ds 1

wd72d:: ds 1
wd72e:: ds 2

wd730::
; bit 0: NPC sprite being moved by script
; bit 5: ignore joypad input
; bit 6: print text with no delay between each letter
; bit 7: set if joypad states are being simulated in the overworld
	ds 1

	ds 1

wd732:: ; d732
; bit 0: play time being counted
; bit 1: remnant of debug mode? not set by the game code.
; if it is set
; 1. skips most of Prof. Oak's speech, and uses NINTEN as the player's name and SONY as the rival's name
; 2. does not have the player start in floor two of the playyer's house (instead sending them to [wLastMap])
; 3. allows wild battles to be avoided by holding down B
; bit 2: the target warp is a fly warp (bit 3 set or blacked out) or a dungeon warp (bit 4 set)
; bit 3: used warp pad, escape rope, dig, teleport, or fly, so the target warp is a "fly warp"
; bit 4: jumped into hole (Pokemon Mansion, Seafoam Islands, Victory Road) or went down waterfall (Seafoam Islands), so the target warp is a "dungeon warp"
; bit 5: currently being forced to ride bike (cycling road)
; bit 6: map destination is [wLastBlackoutMap] (usually the last used pokemon center, but could be the player's house)
	ds 1

W_FLAGS_D733:: ; d733
; bit 4: use variable [W_CURMAPSCRIPT] instead of the provided index for next frame's map script (used to start battle when talking to trainers)
; bit 7: used fly out of battle
	ds 1

wd734:: ds 2

wd736:: ; d736
; bit 0: check if the player is standing on a door and make him walk down a step if so
; bit 1: the player is currently stepping down from a door
; bit 2: standing on a warp
; bit 6: jumping down a ledge
	ds 1

wCompletedInGameTradeFlags:: ; d737
	ds 2

	ds 2

wd73b:: ds 1
wd73c:: ds 3

wCardKeyDoorY:: ; d73f
	ds 1

wCardKeyDoorX:: ; d740
	ds 1

	ds 2

wd743:: ds 1
wd744:: ds 3
wd747:: ds 3
wd74a:: ds 1

wd74b:: ; d74b
; bit 0: Prof. Oak has lead the player to the north end of his lab
; bit 1: Prof. Oak has asked the player to choose a pokemon
; bit 2: the player and the rival have received their pokemon
; bit 3: the player has battled the rival in Oak's lab
; bit 4: Prof. Oak has given the player 5 pokeballs
; bit 5: received pokedex
	ds 1

wd74c:: ds 2
wd74e:: ds 3
wd751:: ds 1
wd752:: ds 2
wd754:: ds 1
wd755:: ds 5
wd75a:: ds 1
wd75b:: ds 3
wd75e:: ds 1
wd75f:: ds 5
wd764:: ds 1
wd765:: ds 1
wd766:: ds 1
wd767:: ds 1
wd768:: ds 1
wd769:: ds 3
wd76c:: ds 5
wd771:: ds 2
wd773:: ds 4
wd777:: ds 1
wd778:: ds 4
wd77c:: ds 1
wd77d:: ds 1
wd77e:: ds 5
wd783:: ds 11
wd78e:: ds 2
wd790:: ds 2
wd792:: ds 4
wd796:: ds 2
wd798:: ds 2
wd79a:: ds 1
wd79b:: ds 1
wd79c:: ds 5
wd7a1:: ds 2
wd7a3:: ds 12
wd7af:: ds 2
wd7b1:: ds 2
wd7b3:: ds 1
wd7b4:: ds 5
wd7b9:: ds 4
wd7bd:: ds 2
wd7bf:: ds 3
wd7c2:: ds 1
wd7c3:: ds 2
wd7c5:: ds 1
wd7c6:: ds 3
wd7c9:: ds 4
wd7cd:: ds 2
wd7cf:: ds 2
wd7d1:: ds 1
wd7d2:: ds 1
wd7d3:: ds 2
wd7d5:: ds 1
wd7d6:: ds 1
wd7d7:: ds 1
wd7d8:: ds 1
wd7d9:: ds 2
wd7db:: ds 2
wd7dd:: ds 2
wd7df:: ds 1
wd7e0:: ds 1
wd7e1:: ds 2
wd7e3:: ds 2
wd7e5:: ds 2
wd7e7:: ds 1
wd7e8:: ds 1
wd7e9:: ds 2
wd7eb:: ds 2
wd7ed:: ds 1
wd7ee:: ds 1
wd7ef:: ds 1
wd7f0:: ds 1
wd7f1:: ds 1
wd7f2:: ds 1
wd7f3:: ds 2
wd7f5:: ds 1
wd7f6:: ds 9
wd7ff:: ds 4
wd803:: ds 2
wd805:: ds 2
wd807:: ds 2
wd809:: ds 10
wd813:: ds 2
wd815:: ds 1
wd816:: ds 1
wd817:: ds 2
wd819:: ds 2
wd81b:: ds 10
wd825:: ds 1
wd826:: ds 1
wd827:: ds 1
wd828:: ds 1
wd829:: ds 1
wd82a:: ds 1
wd82b:: ds 1
wd82c:: ds 1
wd82d:: ds 1
wd82e:: ds 1
wd82f:: ds 1
wd830:: ds 1
wd831:: ds 1
wd832:: ds 1
wd833:: ds 1
wd834:: ds 1
wd835:: ds 1
wd836:: ds 1
wd837:: ds 1
wd838:: ds 15
wd847:: ds 2
wd849:: ds 2
wd84b:: ds 12
wd857:: ds 8
wd85f:: ds 4
wd863:: ds 1
wd864:: ds 1
wd865:: ds 1
wd866:: ds 1
wd867:: ds 2
wd869:: ds 20
wd87d:: ds 2
wd87f:: ds 1
wd880:: ds 1
wd881:: ds 1
wd882:: ds 5

wLinkEnemyTrainerName:: ; d887
; linked game's trainer name

W_GRASSRATE:: ; d887
	ds 1

W_GRASSMONS:: ; d888
	ds 20


wEnemyPartyCount:: ds 1     ; d89c
wEnemyPartyMons::  ds PARTY_LENGTH + 1 ; d89d

wEnemyMons:: ; d8a4
wEnemyMon1:: party_struct wEnemyMon1
wEnemyMon2:: party_struct wEnemyMon2
wEnemyMon3:: party_struct wEnemyMon3
wEnemyMon4:: party_struct wEnemyMon4
wEnemyMon5:: party_struct wEnemyMon5
wEnemyMon6:: party_struct wEnemyMon6

wEnemyMonOT::    ds 11 * PARTY_LENGTH ; d9ac
wEnemyMonNicks:: ds 11 * PARTY_LENGTH ; d9ee


W_TRAINERHEADERPTR:: ; da30
	ds 2

	ds 6

wda38:: ds 1

W_CURMAPSCRIPT:: ; da39
; index of current map script, mostly used as index for function pointer array
; mostly copied from map-specific map script pointer and wirtten back later
	ds 1

	ds 6

W_PLAYTIMEHOURS:: ; da40
	ds 2
W_PLAYTIMEMINUTES:: ; da42
	ds 2
W_PLAYTIMESECONDS:: ; da44
	ds 1
W_PLAYTIMEFRAMES:: ; da45
	ds 1

wSafariZoneGameOver:: ; da46
	ds 1

W_NUMSAFARIBALLS:: ; da47
	ds 1


W_DAYCARE_IN_USE:: ; da48
; 0 if no pokemon is in the daycare
; 1 if pokemon is in the daycare
	ds 1

W_DAYCAREMONNAME:: ds 11 ; da49
W_DAYCAREMONOT::   ds 11 ; da54

wDayCareMon:: box_struct wDayCareMon ; da5f


W_NUMINBOX::  ds 1 ; da80
wBoxSpecies:: ds MONS_PER_BOX + 1

wBoxMons::
wBoxMon1:: box_struct wBoxMon1 ; da96
wBoxMon2:: ds box_struct_length * (MONS_PER_BOX + -1) ; dab7

wBoxMonOT::    ds 11 * MONS_PER_BOX ; dd2a
wBoxMonNicks:: ds 11 * MONS_PER_BOX ; de06
wBoxMonNicksEnd:: ; dee2


SECTION "Stack", WRAMX[$dfff], BANK[1]
wStack:: ; dfff
	ds -$100


SECTION "Sprite Buffers", SRAM, BANK[0]

S_SPRITEBUFFER0:: ds SPRITEBUFFERSIZE ; a000
S_SPRITEBUFFER1:: ds SPRITEBUFFERSIZE ; a188
S_SPRITEBUFFER2:: ds SPRITEBUFFERSIZE ; a310

	ds $100

sHallOfFame:: ds HOF_TEAM * NUM_HOF_TEAMS ; a598

