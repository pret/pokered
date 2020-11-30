INCLUDE "constants.asm"

INCLUDE "macros/wram.asm"


INCLUDE "vram.asm"


SECTION "WRAM", WRAM0

wUnusedC000::
	ds 1

wSoundID::
	ds 1

wMuteAudioAndPauseMusic::
; bit 7: whether sound has been muted
; all bits: whether the effective is active
; Store 1 to activate effect (any value in the range [1, 127] works).
; All audio is muted and music is paused. Sfx continues playing until it
; ends normally.
; Store 0 to resume music.
	ds 1

wDisableChannelOutputWhenSfxEnds::
	ds 1

wStereoPanning::
	ds 1

wSavedVolume::
	ds 1

wChannelCommandPointers::
	ds 16

wChannelReturnAddresses::
	ds 16

wChannelSoundIDs::
	ds 8

wChannelFlags1::
	ds 8

wChannelFlags2::
	ds 8

wChannelDutyCycles::
	ds 8

wChannelDutyCyclePatterns::
	ds 8

wChannelVibratoDelayCounters::
; reloaded at the beginning of a note. counts down until the vibrato begins.
	ds 8

wChannelVibratoExtents::
	ds 8

wChannelVibratoRates::
; high nybble is rate (counter reload value) and low nybble is counter.
; time between applications of vibrato.
	ds 8

wChannelFrequencyLowBytes::
	ds 8

wChannelVibratoDelayCounterReloadValues::
; delay of the beginning of the vibrato from the start of the note
	ds 8

wChannelPitchSlideLengthModifiers::
	ds 8

wChannelPitchSlideFrequencySteps::
	ds 8

wChannelPitchSlideFrequencyStepsFractionalPart::
	ds 8

wChannelPitchSlideCurrentFrequencyFractionalPart::
	ds 8

wChannelPitchSlideCurrentFrequencyHighBytes::
	ds 8

wChannelPitchSlideCurrentFrequencyLowBytes::
	ds 8

wChannelPitchSlideTargetFrequencyHighBytes::
	ds 8

wChannelPitchSlideTargetFrequencyLowBytes::
	ds 8

wChannelNoteDelayCounters::
; Note delays are stored as 16-bit fixed-point numbers where the integer part
; is 8 bits and the fractional part is 8 bits.
	ds 8

wChannelLoopCounters::
	ds 8

wChannelNoteSpeeds::
	ds 8

wChannelNoteDelayCountersFractionalPart::
	ds 8

wChannelOctaves::
	ds 8

wChannelVolumes::
; also includes fade for hardware channels that support it
	ds 8

wMusicWaveInstrument::
	ds 1

wSfxWaveInstrument::
	ds 1

wMusicTempo::
	ds 2

wSfxTempo::
	ds 2

wSfxHeaderPointer::
	ds 2

wNewSoundID::
	ds 1

wAudioROMBank::
	ds 1

wAudioSavedROMBank::
	ds 1

wFrequencyModifier::
	ds 1

wTempoModifier::
	ds 1

	ds 13


SECTION "Sprite State Data", WRAM0

wSpriteDataStart::

wSpriteStateData1::
; data for all sprites on the current map
; holds info for 16 sprites with $10 bytes each
; player sprite is always sprite 0
; struct fields:
; - 0: picture ID (fixed, loaded at map init)
; - 1: movement status (0: uninitialized, 1: ready, 2: delayed, 3: moving)
; - 2: sprite image index (changed on update, $ff if off screen, includes facing direction, progress in walking animation and a sprite-specific offset)
; - 3: Y screen position delta (-1,0 or 1; added to Y pixels on each walking animation update)
; - 4: Y screen position (in pixels, always 4 pixels above grid which makes sprites appear to be in the center of a tile)
; - 5: X screen position delta (-1,0 or 1; added to field X pixels on each walking animation update)
; - 6: X screen position (in pixels, snaps to grid if not currently walking)
; - 7: intra-animation-frame counter (counting upwards to 4 until animation frame counter is incremented)
; - 8: animation frame counter (increased every 4 updates, hold four states (totalling to 16 walking frames)
; - 9: facing direction ($0: down, $4: up, $8: left, $c: right)
; - A: adjusted Y coordinate
; - B: adjusted X coordinate
; - C: direction of collision
; - D
; - E
; - F
wSpritePlayerStateData1::  spritestatedata1 wSpritePlayerStateData1
wSprite01StateData1::      spritestatedata1 wSprite01StateData1
wSprite02StateData1::      spritestatedata1 wSprite02StateData1
wSprite03StateData1::      spritestatedata1 wSprite03StateData1
wSprite04StateData1::      spritestatedata1 wSprite04StateData1
wSprite05StateData1::      spritestatedata1 wSprite05StateData1
wSprite06StateData1::      spritestatedata1 wSprite06StateData1
wSprite07StateData1::      spritestatedata1 wSprite07StateData1
wSprite08StateData1::      spritestatedata1 wSprite08StateData1
wSprite09StateData1::      spritestatedata1 wSprite09StateData1
wSprite10StateData1::      spritestatedata1 wSprite10StateData1
wSprite11StateData1::      spritestatedata1 wSprite11StateData1
wSprite12StateData1::      spritestatedata1 wSprite12StateData1
wSprite13StateData1::      spritestatedata1 wSprite13StateData1
wSprite14StateData1::      spritestatedata1 wSprite14StateData1
wSprite15StateData1::      spritestatedata1 wSprite15StateData1

wSpriteStateData2::
; more data for all sprites on the current map
; holds info for 16 sprites with $10 bytes each
; player sprite is always sprite 0
; struct fields:
; - 0: walk animation counter (counting from $10 backwards when moving)
; - 1:
; - 2: Y displacement (initialized at 8, supposed to keep moving sprites from moving too far, but bugged)
; - 3: X displacement (initialized at 8, supposed to keep moving sprites from moving too far, but bugged)
; - 4: Y position (in 2x2 tile grid steps, topmost 2x2 tile has value 4)
; - 5: X position (in 2x2 tile grid steps, leftmost 2x2 tile has value 4)
; - 6: movement byte 1 (determines whether a sprite can move, $ff:not moving, $fe:random movements, others unknown)
; - 7: (?) (set to $80 when in grass, else $0; may be used to draw grass above the sprite)
; - 8: delay until next movement (counted downwards, movement status is set to ready if reached 0)
; - 9: original facing direction (backed up by DisplayTextIDInit, restored by CloseTextDisplay)
; - A
; - B
; - C
; - D: picture ID
; - E: sprite image base offset (in video ram, player always has value 1, used to compute sprite image index)
; - F
wSpritePlayerStateData2::  spritestatedata2 wSpritePlayerStateData2
wSprite01StateData2::      spritestatedata2 wSprite01StateData2
wSprite02StateData2::      spritestatedata2 wSprite02StateData2
wSprite03StateData2::      spritestatedata2 wSprite03StateData2
wSprite04StateData2::      spritestatedata2 wSprite04StateData2
wSprite05StateData2::      spritestatedata2 wSprite05StateData2
wSprite06StateData2::      spritestatedata2 wSprite06StateData2
wSprite07StateData2::      spritestatedata2 wSprite07StateData2
wSprite08StateData2::      spritestatedata2 wSprite08StateData2
wSprite09StateData2::      spritestatedata2 wSprite09StateData2
wSprite10StateData2::      spritestatedata2 wSprite10StateData2
wSprite11StateData2::      spritestatedata2 wSprite11StateData2
wSprite12StateData2::      spritestatedata2 wSprite12StateData2
wSprite13StateData2::      spritestatedata2 wSprite13StateData2
wSprite14StateData2::      spritestatedata2 wSprite14StateData2
wSprite15StateData2::      spritestatedata2 wSprite15StateData2


wSpriteDataEnd::


SECTION "OAM Buffer", WRAM0

wOAMBuffer::
; buffer for OAM data. Copied to OAM by DMA
	ds 4 * 40
wOAMBufferEnd::

wTileMap::
; buffer for tiles that are visible on screen (20 columns by 18 rows)
	ds SCREEN_WIDTH * SCREEN_HEIGHT

UNION
wTileMapBackup::
; buffer for temporarily saving and restoring current screen's tiles
; (e.g. if menus are drawn on top)
	ds SCREEN_WIDTH * SCREEN_HEIGHT

NEXTU
wSerialPartyMonsPatchList::
; list of indexes to patch with SERIAL_NO_DATA_BYTE after transfer
	ds 200

wSerialEnemyMonsPatchList::
; list of indexes to patch with SERIAL_NO_DATA_BYTE after transfer
	ds 200
ENDU

	ds 80

UNION
wOverworldMap::
	ds 1300
wOverworldMapEnd::

NEXTU
wTempPic::
	ds 7 * 7 tiles
ENDU

wRedrawRowOrColumnSrcTiles::
; the tiles of the row or column to be redrawn by RedrawRowOrColumn
	ds SCREEN_WIDTH * 2

; coordinates of the position of the cursor for the top menu item (id 0)
wTopMenuItemY::
	ds 1
wTopMenuItemX::
	ds 1

wCurrentMenuItem::
; the id of the currently selected menu item
; the top item has id 0, the one below that has id 1, etc.
; note that the "top item" means the top item currently visible on the screen
; add this value to [wListScrollOffset] to get the item's position within the list
	ds 1

wTileBehindCursor::
; the tile that was behind the menu cursor's current location
	ds 1

wMaxMenuItem::
; id of the bottom menu item
	ds 1

wMenuWatchedKeys::
; bit mask of keys that the menu will respond to
	ds 1

wLastMenuItem::
; id of previously selected menu item
	ds 1

wPartyAndBillsPCSavedMenuItem::
; It is mainly used by the party menu to remember the cursor position while the
; menu isn't active.
; It is also used to remember the cursor position of mon lists (for the
; withdraw/deposit/release actions) in Bill's PC so that it doesn't get lost
; when you choose a mon from the list and a sub-menu is shown. It's reset when
; you return to the main Bill's PC menu.
	ds 1

wBagSavedMenuItem::
; It is used by the bag list to remember the cursor position while the menu
; isn't active.
	ds 1

wBattleAndStartSavedMenuItem::
; It is used by the start menu to remember the cursor position while the menu
; isn't active.
; The battle menu uses it so that the cursor position doesn't get lost when
; a sub-menu is shown. It's reset at the start of each battle.
	ds 1

wPlayerMoveListIndex::
	ds 1

wPlayerMonNumber::
; index in party of currently battling mon
	ds 1

wMenuCursorLocation::
; the address of the menu cursor's current location within wTileMap
	ds 2

	ds 2

wMenuJoypadPollCount::
; how many times should HandleMenuInput poll the joypad state before it returns?
	ds 1

wMenuItemToSwap::
; id of menu item selected for swapping (counts from 1) (0 means that no menu item has been selected for swapping)
	ds 1

wListScrollOffset::
; offset of the current top menu item from the beginning of the list
; keeps track of what section of the list is on screen
	ds 1

wMenuWatchMovingOutOfBounds::
; If non-zero, then when wrapping is disabled and the player tries to go past
; the top or bottom of the menu, return from HandleMenuInput. This is useful for
; menus that have too many items to display at once on the screen because it
; allows the caller to scroll the entire menu up or down when this happens.
	ds 1

wTradeCenterPointerTableIndex::
	ds 1

	ds 1

wTextDest::
; destination pointer for text output
; this variable is written to, but is never read from
	ds 2

wDoNotWaitForButtonPressAfterDisplayingText::
; if non-zero, skip waiting for a button press after displaying text in DisplayTextID
	ds 1

wSerialSyncAndExchangeNybbleReceiveData::
; the final received nybble is stored here by Serial_SyncAndExchangeNybble

wSerialExchangeNybbleTempReceiveData::
; temporary nybble used by Serial_ExchangeNybble

wLinkMenuSelectionReceiveBuffer::
; two byte buffer
; the received menu selection is stored twice
	ds 1

wSerialExchangeNybbleReceiveData::
; the final received nybble is stored here by Serial_ExchangeNybble
	ds 1

	ds 3

wSerialExchangeNybbleSendData::
; this nybble is sent when using Serial_SyncAndExchangeNybble or Serial_ExchangeNybble

wLinkMenuSelectionSendBuffer::
; two byte buffer
; the menu selection byte is stored twice before sending

	ds 5

wLinkTimeoutCounter::
; 1 byte

wUnknownSerialCounter::
; 2 bytes

wEnteringCableClub::
; 1 byte
	ds 2

wWhichTradeMonSelectionMenu::
; $00 = player mons
; $01 = enemy mons

wMonDataLocation::
; 0 = player's party
; 1 = enemy party
; 2 = current box
; 3 = daycare
; 4 = in-battle mon
;
; AddPartyMon uses it slightly differently.
; If the lower nybble is 0, the mon is added to the player's party, else the enemy's.
; If the entire value is 0, then the player is allowed to name the mon.
	ds 1

wMenuWrappingEnabled::
; set to 1 if you can go from the bottom to the top or top to bottom of a menu
; set to 0 if you can't go past the top or bottom of the menu
	ds 1

wCheckFor180DegreeTurn::
; whether to check for 180-degree turn (0 = don't, 1 = do)
	ds 1

	ds 1

wMissableObjectIndex::
	ds 1

wPredefID::
	ds 1
wPredefRegisters::
	ds 6

wTrainerHeaderFlagBit::
	ds 1

	ds 1

wNPCMovementScriptPointerTableNum::
; which NPC movement script pointer is being used
; 0 if an NPC movement script is not running
	ds 1

wNPCMovementScriptBank::
; ROM bank of current NPC movement script
	ds 1

	ds 2

wUnusedCC5B::

wVermilionDockTileMapBuffer::
; 180 bytes

wOaksAideRewardItemName::

wDexRatingNumMonsSeen::

wFilteredBagItems::
; List of bag items that has been filtered to a certain type of items,
; such as drinks or fossils.

wElevatorWarpMaps::

wMonPartySpritesSavedOAM::
; Saved copy of OAM for the first frame of the animation to make it easy to
; flip back from the second frame.
; $60 bytes

wTrainerCardBlkPacket::
; $40 bytes

wSlotMachineSevenAndBarModeChance::
; If a random number greater than this value is generated, then the player is
; allowed to have three 7 symbols or bar symbols line up.
; So, this value is actually the chance of NOT entering that mode.
; If the slot is lucky, it equals 250, giving a 5/256 (~2%) chance.
; Otherwise, it equals 253, giving a 2/256 (~0.8%) chance.

wHallOfFame::
wBoostExpByExpAll::
wAnimationType::
; values between 0-6. Shake screen horizontally, shake screen vertically, blink Pokemon...

wNPCMovementDirections::
	ds 1

wDexRatingNumMonsOwned::
	ds 1

wDexRatingText::
	ds 1

wSlotMachineSavedROMBank::
; ROM back to return to when the player is done with the slot machine
	ds 1

	ds 26

wAnimPalette::
	ds 1

	ds 29

UNION
wNPCMovementDirections2::
	ds 10

NEXTU
wSwitchPartyMonTempBuffer::
; temporary buffer when swapping party mon data
	ds 49

NEXTU
	ds 10

wNumStepsToTake::
; used in Pallet Town scripted movement
	ds 1
ENDU

	ds 10

wRLEByteCount::
	ds 1

wAddedToParty::
; 0 = not added
; 1 = added

wSimulatedJoypadStatesEnd::
; this is the end of the joypad states
; the list starts above this address and extends downwards in memory until here
; overloaded with below labels

wParentMenuItem::

wCanEvolveFlags::
; 1 flag for each party member indicating whether it can evolve
; The purpose of these flags is to track which mons levelled up during the
; current battle at the end of the battle when evolution occurs.
; Other methods of evolution simply set it by calling TryEvolvingMon.
	ds 1

wForceEvolution::
	ds 1

; if [wAILayer2Encouragement] != 1, the second AI layer is not applied
wAILayer2Encouragement::
	ds 1
	ds 1

; current HP of player and enemy substitutes
wPlayerSubstituteHP::
	ds 1
wEnemySubstituteHP::
	ds 1

wTestBattlePlayerSelectedMove::
; The player's selected move during a test battle.
; InitBattleVariables sets it to the move Pound.
	ds 1

	ds 1

wMoveMenuType::
; 0=regular, 1=mimic, 2=above message box (relearn, heal pp..)
	ds 1

wPlayerSelectedMove::
	ds 1
wEnemySelectedMove::
	ds 1

wLinkBattleRandomNumberListIndex::
	ds 1

wAICount::
; number of times remaining that AI action can occur
	ds 1

	ds 2

wEnemyMoveListIndex::
	ds 1

wLastSwitchInEnemyMonHP::
; The enemy mon's HP when it was switched in or when the current player mon
; was switched in, which was more recent.
; It's used to determine the message to print when switching out the player mon.
	ds 2

wTotalPayDayMoney::
; total amount of money made using Pay Day during the current battle
	ds 3

wSafariEscapeFactor::
	ds 1
wSafariBaitFactor::
	ds 1

	ds 1

wTransformedEnemyMonOriginalDVs::
	ds 2

wMonIsDisobedient:: ds 1

wPlayerDisabledMoveNumber:: ds 1
wEnemyDisabledMoveNumber:: ds 1

wInHandlePlayerMonFainted::
; When running in the scope of HandlePlayerMonFainted, it equals 1.
; When running in the scope of HandleEnemyMonFainted, it equals 0.
	ds 1

wPlayerUsedMove:: ds 1
wEnemyUsedMove:: ds 1

wEnemyMonMinimized:: ds 1

wMoveDidntMiss:: ds 1

wPartyFoughtCurrentEnemyFlags::
; flags that indicate which party members have fought the current enemy mon
	flag_array 6

wLowHealthAlarmDisabled::
; Whether the low health alarm has been disabled due to the player winning the
; battle.
	ds 1

wPlayerMonMinimized::
	ds 1

	ds 13

wLuckySlotHiddenObjectIndex::

wEnemyNumHits::
; number of hits by enemy in attacks like Double Slap, etc.

wEnemyBideAccumulatedDamage::
; the amount of damage accumulated by the enemy while biding (2 bytes)

	ds 10

wInGameTradeGiveMonSpecies::

wPlayerMonUnmodifiedLevel::
	ds 1

wInGameTradeTextPointerTablePointer::

wPlayerMonUnmodifiedMaxHP::
	ds 2

wInGameTradeTextPointerTableIndex::

wPlayerMonUnmodifiedAttack::
	ds 1
wInGameTradeGiveMonName::
	ds 1
wPlayerMonUnmodifiedDefense::
	ds 2
wPlayerMonUnmodifiedSpeed::
	ds 2
wPlayerMonUnmodifiedSpecial::
	ds 2

; stat modifiers for the player's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal

wPlayerMonStatMods::
wPlayerMonAttackMod::
	ds 1
wPlayerMonDefenseMod::
	ds 1
wPlayerMonSpeedMod::
	ds 1
wPlayerMonSpecialMod::
	ds 1

wInGameTradeReceiveMonName::

wPlayerMonAccuracyMod::
	ds 1
wPlayerMonEvasionMod::
	ds 1

	ds 3

wEnemyMonUnmodifiedLevel::
	ds 1
wEnemyMonUnmodifiedMaxHP::
	ds 2
wEnemyMonUnmodifiedAttack::
	ds 2
wEnemyMonUnmodifiedDefense::
	ds 1

wInGameTradeMonNick::
	ds 1

wEnemyMonUnmodifiedSpeed::
	ds 2
wEnemyMonUnmodifiedSpecial::
	ds 1

wEngagedTrainerClass::
	ds 1
wEngagedTrainerSet::
;	ds 1

; stat modifiers for the enemy's current pokemon
; value can range from 1 - 13 ($1 to $D)
; 7 is normal

wEnemyMonStatMods::
wEnemyMonAttackMod::
	ds 1
wEnemyMonDefenseMod::
	ds 1
wEnemyMonSpeedMod::
	ds 1
wEnemyMonSpecialMod::
	ds 1
wEnemyMonAccuracyMod::
	ds 1
wEnemyMonEvasionMod::
	ds 1

wInGameTradeReceiveMonSpecies::
	ds 1

	ds 2

wNPCMovementDirections2Index::

wUnusedCD37::

wFilteredBagItemsCount::
; number of items in wFilteredBagItems list
	ds 1

wSimulatedJoypadStatesIndex::
; the next simulated joypad state is at wSimulatedJoypadStatesEnd plus this value minus 1
; 0 if the joypad state is not being simulated
	ds 1

wWastedByteCD39::
; written to but nothing ever reads it
	ds 1

wWastedByteCD3A::
; written to but nothing ever reads it
	ds 1

wOverrideSimulatedJoypadStatesMask::
; mask indicating which real button presses can override simulated ones
; XXX is it ever not 0?
	ds 1

	ds 1

wFallingObjectsMovementData::
; up to 20 bytes (one byte for each falling object)

wSavedY::

wTempSCX::

wBattleTransitionCircleScreenQuadrantY::
; 0 = upper half (Y < 9)
; 1 = lower half (Y >= 9)

wBattleTransitionCopyTilesOffset::
; 2 bytes
; after 1 row/column has been copied, the offset to the next one to copy from

wInwardSpiralUpdateScreenCounter::
; counts down from 7 so that every time 7 more tiles of the spiral have been
; placed, the tile map buffer is copied to VRAM so that progress is visible

wHoFTeamIndex::

wSSAnneSmokeDriftAmount::
; multiplied by 16 to get the number of times to go right by 2 pixels

wRivalStarterTemp::

wBoxMonCounts::
; 12 bytes
; array of the number of mons in each box

wDexMaxSeenMon::

wPPRestoreItem::

wWereAnyMonsAsleep::

wCanPlaySlots::

wNumShakes::

wDayCareStartLevel::
; the level of the mon at the time it entered day care

wWhichBadge::

wPriceTemp::
; 3-byte BCD number

wTitleMonSpecies::

wPlayerCharacterOAMTile::

wMoveDownSmallStarsOAMCount::
; the number of small stars OAM entries to move down

wChargeMoveNum::

wCoordIndex::

wOptionsTextSpeedCursorX::

wTrainerInfoTextBoxWidthPlus1::

wSwappedMenuItem::

wHoFMonSpecies::

wFieldMoves::
; 4 bytes
; the current mon's field moves

wBadgeNumberTile::
; tile ID of the badge number being drawn

wRodResponse::
; 0 = no bite
; 1 = bite
; 2 = no fish on map

wWhichTownMapLocation::

wStoppingWhichSlotMachineWheel::
; which wheel the player is trying to stop
; 0 = none, 1 = wheel 1, 2 = wheel 2, 3 or greater = wheel 3

wTradedPlayerMonSpecies::

wTradingWhichPlayerMon::

wChangeBoxSavedMapTextPointer::

wFlyAnimUsingCoordList::

wPlayerSpinInPlaceAnimFrameDelay::

wPlayerSpinWhileMovingUpOrDownAnimDeltaY::

wBoxNumString::

wHiddenObjectFunctionArgument::

wWhichTrade::
; which entry from TradeMons to select

wTrainerSpriteOffset::

wUnusedCD3D::
	ds 1

wHUDPokeballGfxOffsetX::
; difference in X between the next ball and the current one

wBattleTransitionCircleScreenQuadrantX::
; 0 = left half (X < 10)
; 1 = right half (X >= 10)

wSSAnneSmokeX::

wRivalStarterBallSpriteIndex::

wDayCareNumLevelsGrown::

wOptionsBattleAnimCursorX::

wTrainerInfoTextBoxWidth::

wHoFPartyMonIndex::

wNumCreditsMonsDisplayed::
; the number of credits mons that have been displayed so far

wBadgeNameTile::
; first tile ID of the name being drawn

wFlyLocationsList::
; NUM_CITY_MAPS bytes plus $ff sentinel values at each end

wSlotMachineWheel1Offset::

wTradedEnemyMonSpecies::

wTradingWhichEnemyMon::

wFlyAnimCounter::

wPlayerSpinInPlaceAnimFrameDelayDelta::

wPlayerSpinWhileMovingUpOrDownAnimMaxY::

wHiddenObjectFunctionRomBank::

wTrainerEngageDistance::
	ds 1

wHUDGraphicsTiles::
; 3 bytes

wDayCareTotalCost::
; 2-byte BCD number

wJigglypuffFacingDirections::

wOptionsBattleStyleCursorX::

wTrainerInfoTextBoxNextRowOffset::

wHoFMonLevel::

wBadgeOrFaceTiles::
; 8 bytes
; a list of the first tile IDs of each badge or face (depending on whether the
; badge is owned) to be drawn on the trainer screen

wSlotMachineWheel2Offset::

wNameOfPlayerMonToBeTraded::

wFlyAnimBirdSpriteImageIndex::

wPlayerSpinInPlaceAnimFrameDelayEndValue::

wPlayerSpinWhileMovingUpOrDownAnimFrameDelay::

wHiddenObjectIndex::

wTrainerFacingDirection::
	ds 1

wHoFMonOrPlayer::
; show mon or show player?
; 0 = mon
; 1 = player

wSlotMachineWheel3Offset::

wPlayerSpinInPlaceAnimSoundID::

wHiddenObjectY::

wTrainerScreenY::

wOptionsCancelCursorX::
	ds 1

wDayCarePerLevelCost::
; 2-byte BCD number (always set to $100)

wHoFTeamIndex2::

wHiddenItemOrCoinsIndex::

wTradedPlayerMonOT::

wHiddenObjectX::

wSlotMachineWinningSymbol::
; the OAM tile number of the upper left corner of the winning symbol minus 2

wNumFieldMoves::

wSlotMachineWheel1BottomTile::

wTrainerScreenX::
	ds 1
; a lot of the uses for these values use more than the said address

wHoFTeamNo::

wSlotMachineWheel1MiddleTile::

wFieldMovesLeftmostXCoord::
	ds 1

wLastFieldMoveID::
; unused

wSlotMachineWheel1TopTile::
	ds 1

wSlotMachineWheel2BottomTile::
	ds 1

wSlotMachineWheel2MiddleTile::
	ds 1

wTempCoins1::
; 2 bytes
; temporary variable used to add payout amount to the player's coins

wSlotMachineWheel2TopTile::
	ds 1

wBattleTransitionSpiralDirection::
; 0 = outward, 1 = inward

wSlotMachineWheel3BottomTile::
	ds 1

wSlotMachineWheel3MiddleTile::

wFacingDirectionList::
; 4 bytes (also, the byte before the start of the list (wSlotMachineWheel3BottomTile)
;          is used a temp variable when the list is rotated)
; used when spinning the player's sprite
	ds 1

wSlotMachineWheel3TopTile::

wTempObtainedBadgesBooleans::
; 8 bytes
; temporary list created when displaying the badges on the trainer screen
; one byte for each badge; 0 = not obtained, 1 = obtained
	ds 1

wTempCoins2::
; 2 bytes
; temporary variable used to subtract the bet amount from the player's coins

wPayoutCoins::
; 2 bytes
	ds 2

wTradedPlayerMonOTID::

wSlotMachineFlags::
; These flags are set randomly and control when the wheels stop.
; bit 6: allow the player to win in general
; bit 7: allow the player to win with 7 or bar (plus the effect of bit 6)
	ds 1

wSlotMachineWheel1SlipCounter::
; wheel 1 can "slip" while this is non-zero

wCutTile::
; $3d = tree tile
; $52 = grass tile
	ds 1

wSlotMachineWheel2SlipCounter::
; wheel 2 can "slip" while this is non-zero

wTradedEnemyMonOT::
	ds 1

wSavedPlayerScreenY::

wSlotMachineRerollCounter::
; The remaining number of times wheel 3 will roll down a symbol until a match is
; found, when winning is enabled. It's initialized to 4 each bet.

wEmotionBubbleSpriteIndex::
; the index of the sprite the emotion bubble is to be displayed above
	ds 1

wWhichEmotionBubble::

wSlotMachineBet::
; how many coins the player bet on the slot machine (1 to 3)

wSavedPlayerFacingDirection::

wWhichAnimationOffsets::
; 0 = cut animation, 1 = boulder dust animation
	ds 9

wTradedEnemyMonOTID::
	ds 2

wStandingOnWarpPadOrHole::
; 0 = neither
; 1 = warp pad
; 2 = hole

wOAMBaseTile::

wGymTrashCanIndex::
	ds 1

wSymmetricSpriteOAMAttributes::
	ds 1

wMonPartySpriteSpecies::
	ds 1

wLeftGBMonSpecies::
; in the trade animation, the mon that leaves the left gameboy
	ds 1

wRightGBMonSpecies::
; in the trade animation, the mon that leaves the right gameboy
	ds 1

wFlags_0xcd60::
; bit 0: is player engaged by trainer (to avoid being engaged by multiple trainers simultaneously)
; bit 1: boulder dust animation (from using Strength) pending
; bit 3: using generic PC
; bit 5: don't play sound when A or B is pressed in menu
; bit 6: tried pushing against boulder once (you need to push twice before it will move)
	ds 1

	ds 9

wActionResultOrTookBattleTurn::
; This has overlapping related uses.
; When the player tries to use an item or use certain field moves, 0 is stored
; when the attempt fails and 1 is stored when the attempt succeeds.
; In addition, some items store 2 for certain types of failures, but this
; cannot happen in battle.
; In battle, a non-zero value indicates the player has taken their turn using
; something other than a move (e.g. using an item or switching pokemon).
; So, when an item is successfully used in battle, this value becomes non-zero
; and the player is not allowed to make a move and the two uses are compatible.
	ds 1

wJoyIgnore::
; Set buttons are ignored.
	ds 1

wDownscaledMonSize::
; size of downscaled mon pic used in pokeball entering/exiting animation
; $00 = 5×5
; $01 = 3×3

wNumMovesMinusOne::
; FormatMovesString stores the number of moves minus one here
	ds 1

UNION

wcd6d:: ds 4 ; buffer for various data

wStatusScreenCurrentPP::
; temp variable used to print a move's current PP on the status screen
	ds 1

	ds 6

wNormalMaxPPList::
; list of normal max PP (without PP up) values
	ds 9

NEXTU

wEvosMoves:: ds MAX_EVOLUTIONS * EVOLUTION_SIZE + 1
.end::

ENDU

wSerialOtherGameboyRandomNumberListBlock::
; buffer for transferring the random number list generated by the other gameboy

wTileMapBackup2::
; second buffer for temporarily saving and restoring current screen's tiles (e.g. if menus are drawn on top)
	ds 20 * 18

wNamingScreenNameLength::

wEvoOldSpecies::

wBuffer::
; Temporary storage area of 30 bytes.

wTownMapCoords::
; lower nybble is x, upper nybble is y

wLearningMovesFromDayCare::
; whether WriteMonMoves is being used to make a mon learn moves from day care
; non-zero if so

wChangeMonPicEnemyTurnSpecies::

wHPBarMaxHP::
	ds 1

wNamingScreenSubmitName::
; non-zero when the player has chosen to submit the name

wChangeMonPicPlayerTurnSpecies::

wEvoNewSpecies::
	ds 1

wAlphabetCase::
; 0 = upper case
; 1 = lower case

wEvoMonTileOffset::

wHPBarOldHP::
	ds 1

wEvoCancelled::
	ds 1

wNamingScreenLetter::

wHPBarNewHP::
	ds 2
wHPBarDelta::
	ds 1

wHPBarTempHP::
	ds 2

	ds 11

wHPBarHPDifference::
	ds 1
	ds 7

wAIItem::
; the item that the AI used
	ds 1

wUsedItemOnWhichPokemon::
	ds 1

wAnimSoundID::
; sound ID during battle animations
	ds 1

wBankswitchHomeSavedROMBank::
; used as a storage value for the bank to return to after a BankswitchHome (bankswitch in homebank)
	ds 1

wBankswitchHomeTemp::
; used as a temp storage value for the bank to switch to
	ds 1

wBoughtOrSoldItemInMart::
; 0 = nothing bought or sold in pokemart
; 1 = bought or sold something in pokemart
; this value is not used for anything
	ds 1

wBattleResult::
; $00 - win
; $01 - lose
; $02 - draw
	ds 1

wAutoTextBoxDrawingControl::
; bit 0: if set, DisplayTextID automatically draws a text box
	ds 1

wcf0d:: ds 1 ; used with some overworld scripts (not exactly sure what it's used for)

wTilePlayerStandingOn::
; used in CheckForTilePairCollisions2 to store the tile the player is on
	ds 1

wNPCNumScriptedSteps:: ds 1

wNPCMovementScriptFunctionNum::
; which script function within the pointer table indicated by
; wNPCMovementScriptPointerTableNum
	ds 1

wTextPredefFlag::
; bit 0: set when printing a text predef so that DisplayTextID doesn't switch
;        to the current map's bank
	ds 1

wPredefParentBank::
	ds 1

wSpriteIndex:: ds 1

wCurSpriteMovement2::
; movement byte 2 of current sprite
	ds 1

	ds 2

wNPCMovementScriptSpriteOffset::
; sprite offset of sprite being controlled by NPC movement script
	ds 1

wScriptedNPCWalkCounter::
	ds 1

	ds 1

wGBC::
	ds 1

wOnSGB::
; if running on SGB, it's 1, else it's 0
	ds 1

wDefaultPaletteCommand::
	ds 1

wPlayerHPBarColor::

wWholeScreenPaletteMonSpecies::
; species of the mon whose palette is used for the whole screen
	ds 1

wEnemyHPBarColor::
	ds 1

; 0: green
; 1: yellow
; 2: red
wPartyMenuHPBarColors::
	ds 6

wStatusScreenHPBarColor::
	ds 1

	ds 7

wCopyingSGBTileData::

wWhichPartyMenuHPBar::

wPalPacket::
	ds 1

wPartyMenuBlkPacket::
; $30 bytes
	ds 29

wExpAmountGained::
; 2-byte big-endian number
; the total amount of exp a mon gained

wcf4b::
; storage buffer for various strings
	ds 2

wGainBoostedExp::
	ds 1

	ds 17

wGymCityName::
	ds 17

wGymLeaderName::
	ds NAME_LENGTH

wItemList::
	ds 16

wListPointer::
	ds 2

wUnusedCF8D::
; 2 bytes
; used to store pointers, but never read
	ds 2

wItemPrices::
	ds 2

wcf91:: ds 1 ; used with a lot of things (too much to list here)

wWhichPokemon::
; which pokemon you selected
	ds 1

wPrintItemPrices::
; if non-zero, then print item prices when displaying lists
	ds 1

wHPBarType::
; type of HP bar
; $00 = enemy HUD in battle
; $01 = player HUD in battle / status screen
; $02 = party menu

wListMenuID::
; ID used by DisplayListMenuID
	ds 1

wRemoveMonFromBox::
; if non-zero, RemovePokemon will remove the mon from the current box,
; else it will remove the mon from the party

wMoveMonType::
; 0 = move from box to party
; 1 = move from party to box
; 2 = move from daycare to party
; 3 = move from party to daycare
	ds 1

wItemQuantity::
	ds 1

wMaxItemQuantity::
	ds 1

; LoadMonData copies mon data here
wLoadedMon:: party_struct wLoadedMon

wFontLoaded::
; bit 0: The space in VRAM that is used to store walk animation tile patterns
;        for the player and NPCs is in use for font tile patterns.
;        This means that NPC movement must be disabled.
; The other bits are unused.
	ds 1

wWalkCounter::
; walk animation counter
	ds 1

wTileInFrontOfPlayer::
; background tile number in front of the player (either 1 or 2 steps ahead)
	ds 1

wAudioFadeOutControl::
; The desired fade counter reload value is stored here prior to calling
; PlaySound in order to cause the current music to fade out before the new
; music begins playing. Storing 0 causes no fade out to occur and the new music
; to begin immediately.
; This variable has another use related to fade-out, as well. PlaySound stores
; the sound ID of the music that should be played after the fade-out is finished
; in this variable. FadeOutAudio checks if it's non-zero every V-Blank and
; fades out the current audio if it is. Once it has finished fading out the
; audio, it zeroes this variable and starts playing the sound ID stored in it.
	ds 1

wAudioFadeOutCounterReloadValue::
	ds 1

wAudioFadeOutCounter::
	ds 1

wLastMusicSoundID::
; This is used to determine whether the default music is already playing when
; attempting to play the default music (in order to avoid restarting the same
; music) and whether the music has already been stopped when attempting to
; fade out the current music (so that the new music can be begin immediately
; instead of waiting).
; It sometimes contains the sound ID of the last music played, but it may also
; contain $ff (if the music has been stopped) or 0 (because some routines zero
; it in order to prevent assumptions from being made about the current state of
; the music).
	ds 1

wUpdateSpritesEnabled::
; $00 = causes sprites to be hidden and the value to change to $ff
; $01 = enabled
; $ff = disabled
; other values aren't used
	ds 1

wEnemyMoveNum::
	ds 1
wEnemyMoveEffect::
	ds 1
wEnemyMovePower::
	ds 1
wEnemyMoveType::
	ds 1
wEnemyMoveAccuracy::
	ds 1
wEnemyMoveMaxPP::
	ds 1
wPlayerMoveNum::
	ds 1
wPlayerMoveEffect::
	ds 1
wPlayerMovePower::
	ds 1
wPlayerMoveType::
	ds 1
wPlayerMoveAccuracy::
	ds 1
wPlayerMoveMaxPP::
	ds 1


wEnemyMonSpecies2::
	ds 1
wBattleMonSpecies2::
	ds 1

wEnemyMonNick:: ds NAME_LENGTH

wEnemyMon:: battle_struct wEnemyMon

wEnemyMonBaseStats:: ds 5
wEnemyMonActualCatchRate:: ds 1
wEnemyMonBaseExp:: ds 1

wBattleMonNick:: ds NAME_LENGTH
wBattleMon:: battle_struct wBattleMon


wTrainerClass::
	ds 1

	ds 1

wTrainerPicPointer::
	ds 2
	ds 1

wTempMoveNameBuffer::

wLearnMoveMonName::
; The name of the mon that is learning a move.
	ds 16

wTrainerBaseMoney::
; 2-byte BCD number
; money received after battle = base money × level of highest-level enemy mon
	ds 2

wMissableObjectCounter::
	ds 1

	ds 1

wTrainerName::
; 13 bytes for the letters of the opposing trainer
; the name is terminated with $50 with possible
; unused trailing letters
	ds 13

wIsInBattle::
; lost battle, this is -1
; no battle, this is 0
; wild battle, this is 1
; trainer battle, this is 2
	ds 1

wPartyGainExpFlags::
; flags that indicate which party members should be be given exp when GainExperience is called
	flag_array 6

wCurOpponent::
; in a wild battle, this is the species of pokemon
; in a trainer battle, this is the trainer class + OPP_ID_OFFSET
	ds 1

wBattleType::
; in normal battle, this is 0
; in old man battle, this is 1
; in safari battle, this is 2
	ds 1

wDamageMultipliers::
; bits 0-6: Effectiveness
   ;  $0 = immune
   ;  $5 = not very effective
   ;  $a = neutral
   ; $14 = super-effective
; bit 7: STAB
	ds 1

wLoneAttackNo::
; which entry in LoneAttacks to use
wGymLeaderNo::
; it's actually the same thing as ^
	ds 1
wTrainerNo::
; which instance of [youngster, lass, etc] is this?
	ds 1

wCriticalHitOrOHKO::
; $00 = normal attack
; $01 = critical hit
; $02 = successful OHKO
; $ff = failed OHKO
	ds 1

wMoveMissed::
	ds 1

wPlayerStatsToDouble::
; always 0
	ds 1

wPlayerStatsToHalve::
; always 0
	ds 1

wPlayerBattleStatus1::
; bit 0 - bide
; bit 1 - thrash / petal dance
; bit 2 - attacking multiple times (e.g. double kick)
; bit 3 - flinch
; bit 4 - charging up for attack
; bit 5 - using multi-turn move (e.g. wrap)
; bit 6 - invulnerable to normal attack (using fly/dig)
; bit 7 - confusion
	ds 1

wPlayerBattleStatus2::
; bit 0 - X Accuracy effect
; bit 1 - protected by "mist"
; bit 2 - focus energy effect
; bit 4 - has a substitute
; bit 5 - need to recharge
; bit 6 - rage
; bit 7 - leech seeded
	ds 1

wPlayerBattleStatus3::
; bit 0 - toxic
; bit 1 - light screen
; bit 2 - reflect
; bit 3 - transformed
	ds 1

wEnemyStatsToDouble::
; always 0
	ds 1

wEnemyStatsToHalve::
; always 0
	ds 1

wEnemyBattleStatus1::
	ds 1
wEnemyBattleStatus2::
	ds 1
wEnemyBattleStatus3::
	ds 1

wPlayerNumAttacksLeft::
; when the player is attacking multiple times, the number of attacks left
	ds 1

wPlayerConfusedCounter::
	ds 1

wPlayerToxicCounter::
	ds 1

wPlayerDisabledMove::
; high nibble: which move is disabled (1-4)
; low nibble: disable turns left
	ds 1

	ds 1

wEnemyNumAttacksLeft::
; when the enemy is attacking multiple times, the number of attacks left
	ds 1

wEnemyConfusedCounter::
	ds 1

wEnemyToxicCounter::
	ds 1

wEnemyDisabledMove::
; high nibble: which move is disabled (1-4)
; low nibble: disable turns left
	ds 1

	ds 1

wPlayerNumHits::
; number of hits by player in attacks like Double Slap, etc.

wPlayerBideAccumulatedDamage::
; the amount of damage accumulated by the player while biding (2 bytes)

wUnknownSerialCounter2::
; 2 bytes

	ds 4

wEscapedFromBattle::
; non-zero when an item or move that allows escape from battle was used
	ds 1

wAmountMoneyWon::
; 3-byte BCD number

wObjectToHide::
	ds 1

wObjectToShow::
	ds 1

	ds 1

wDefaultMap::
; the map you will start at when the debug bit is set

wMenuItemOffset::

wAnimationID::
; ID number of the current battle animation
	ds 1

wNamingScreenType::

wPartyMenuTypeOrMessageID::

wTempTilesetNumTiles::
; temporary storage for the number of tiles in a tileset
	ds 1

wSavedListScrollOffset::
; used by the pokemart code to save the existing value of wListScrollOffset
; so that it can be restored when the player is done with the pokemart NPC
	ds 1

	ds 2

; base coordinates of frame block
wBaseCoordX::
	ds 1
wBaseCoordY::
	ds 1

; low health alarm counter/enable
; high bit = enable, others = timer to cycle frequencies
wLowHealthAlarm:: ds 1

wFBTileCounter::
; counts how many tiles of the current frame block have been drawn
	ds 1

wMovingBGTilesCounter2::
	ds 1

wSubAnimFrameDelay::
; duration of each frame of the current subanimation in terms of screen refreshes
	ds 1
wSubAnimCounter::
; counts the number of subentries left in the current subanimation
	ds 1

wSaveFileStatus::
; 1 = no save file or save file is corrupted
; 2 = save file exists and no corruption has been detected
	ds 1

wNumFBTiles::
; number of tiles in current battle animation frame block
	ds 1

wFlashScreenLongCounter::

wSpiralBallsBaseY::

wFallingObjectMovementByte::
; bits 0-6: index into FallingObjects_DeltaXs array (0 - 8)
; bit 7: direction; 0 = right, 1 = left

wNumShootingBalls::

wTradedMonMovingRight::
; $01 if mon is moving from left gameboy to right gameboy; $00 if vice versa

wOptionsInitialized::

wNewSlotMachineBallTile::

wCoordAdjustmentAmount::
; how much to add to the X/Y coord

wUnusedD08A::
	ds 1

wSpiralBallsBaseX::

wNumFallingObjects::

wSlideMonDelay::

wAnimCounter::
; generic counter variable for various animations

wSubAnimTransform::
; controls what transformations are applied to the subanimation
; 01: flip horizontally and vertically
; 02: flip horizontally and translate downwards 40 pixels
; 03: translate base coordinates of frame blocks, but don't change their internal coordinates or flip their tiles
; 04: reverse the subanimation
	ds 1

wEndBattleWinTextPointer::
	ds 2

wEndBattleLoseTextPointer::
	ds 2

	ds 2

wEndBattleTextRomBank::
	ds 1

	ds 1

wSubAnimAddrPtr::
; the address _of the address_ of the current subanimation entry
	ds 2

wSlotMachineAllowMatchesCounter::
; If non-zero, the allow matches flag is always set.
; There is a 1/256 (~0.4%) chance that this value will be set to 60, which is
; the only way it can increase. Winning certain payout amounts will decrement it
; or zero it.

wSubAnimSubEntryAddr::
; the address of the current subentry of the current subanimation
	ds 2

	ds 2

wOutwardSpiralTileMapPointer::
	ds 1

wPartyMenuAnimMonEnabled::

wTownMapSpriteBlinkingEnabled::
; non-zero when enabled. causes nest locations to blink on and off.
; the town selection cursor will blink regardless of what this value is

wUnusedD09B::
	ds 1

wFBDestAddr::
; current destination address in OAM for frame blocks (big endian)
	ds 2

wFBMode::
; controls how the frame blocks are put together to form frames
; specifically, after finishing drawing the frame block, the frame block's mode determines what happens
; 00: clean OAM buffer and delay
; 02: move onto the next frame block with no delay and no cleaning OAM buffer
; 03: delay, but don't clean OAM buffer
; 04: delay, without cleaning OAM buffer, and do not advance [wFBDestAddr], so that the next frame block will overwrite this one
	ds 1

wLinkCableAnimBulgeToggle::
; 0 = small
; 1 = big

wIntroNidorinoBaseTile::

wOutwardSpiralCurrentDirection::

wDropletTile::

wNewTileBlockID::

wWhichBattleAnimTileset::

wSquishMonCurrentDirection::
; 0 = left
; 1 = right

wSlideMonUpBottomRowLeftTile::
; the tile ID of the leftmost tile in the bottom row in AnimationSlideMonUp_
	ds 1

wDisableVBlankWYUpdate:: ds 1 ; if non-zero, don't update WY during V-blank

wSpriteCurPosX::
	ds 1
wSpriteCurPosY::
	ds 1
wSpriteWidth::
	ds 1
wSpriteHeight::
	ds 1
wSpriteInputCurByte::
; current input byte
	ds 1
wSpriteInputBitCounter::
; bit offset of last read input bit
	ds 1

wSpriteOutputBitOffset:: ; determines where in the output byte the two bits are placed. Each byte contains four columns (2bpp data)
; 3 -> XX000000   1st column
; 2 -> 00XX0000   2nd column
; 1 -> 0000XX00   3rd column
; 0 -> 000000XX   4th column
	ds 1

wSpriteLoadFlags::
; bit 0 determines used buffer (0 -> sSpriteBuffer1, 1 -> sSpriteBuffer2)
; bit 1 loading last sprite chunk? (there are at most 2 chunks per load operation)
	ds 1
wSpriteUnpackMode::
	ds 1
wSpriteFlipped::
	ds 1

wSpriteInputPtr::
; pointer to next input byte
	ds 2
wSpriteOutputPtr::
; pointer to current output byte
	ds 2
wSpriteOutputPtrCached::
; used to revert pointer for different bit offsets
	ds 2
wSpriteDecodeTable0Ptr::
; pointer to differential decoding table (assuming initial value 0)
	ds 2
wSpriteDecodeTable1Ptr::
; pointer to differential decoding table (assuming initial value 1)
	ds 2

wd0b5:: ds 1 ; used as a temp storage area for Pokemon Species, and other Pokemon/Battle related things

wNameListType::
	ds 1

wPredefBank::
	ds 1

wMonHeader::

wMonHIndex::
; In the ROM base stats data structure, this is the dex number, but it is
; overwritten with the internal index number after the header is copied to WRAM.
	ds 1

wMonHBaseStats::
wMonHBaseHP::
	ds 1
wMonHBaseAttack::
	ds 1
wMonHBaseDefense::
	ds 1
wMonHBaseSpeed::
	ds 1
wMonHBaseSpecial::
	ds 1

wMonHTypes::
wMonHType1::
	ds 1
wMonHType2::
	ds 1

wMonHCatchRate::
	ds 1
wMonHBaseEXP::
	ds 1
wMonHSpriteDim::
	ds 1
wMonHFrontSprite::
	ds 2
wMonHBackSprite::
	ds 2

wMonHMoves::
	ds NUM_MOVES

wMonHGrowthRate::
	ds 1

wMonHLearnset::
; bit field
	flag_array NUM_TMS + NUM_HMS
	ds 1
wMonHeaderEnd::

wSavedTileAnimations::
; saved at the start of a battle and then written back at the end of the battle
	ds 1

	ds 2

wDamage::
	ds 2

	ds 2

wRepelRemainingSteps::
	ds 1

wMoves::
; list of moves for FormatMovesString
	ds 4

wMoveNum::
	ds 1

wMovesString::
	ds 56

wUnusedD119::
	ds 1

wWalkBikeSurfStateCopy::
; wWalkBikeSurfState is sometimes copied here, but it doesn't seem to be used for anything
	ds 1

wInitListType::
; the type of list for InitList to init
	ds 1

wCapturedMonSpecies::
; 0 if no mon was captured
	ds 1

wFirstMonsNotOutYet::
; Non-zero when the first player mon and enemy mon haven't been sent out yet.
; It prevents the game from asking if the player wants to choose another mon
; when the enemy sends out their first mon and suppresses the "no will to fight"
; message when the game searches for the first non-fainted mon in the party,
; which will be the first mon sent out.
	ds 1

wPokeBallCaptureCalcTemp::

; lower nybble: number of shakes
; upper nybble: number of animations to play
wPokeBallAnimData::

wUsingPPUp::

wMaxPP::

; 0 for player, non-zero for enemy
wCalculateWhoseStats::

wTypeEffectiveness::

wMoveType::

wNumSetBits::

wd11e:: ds 1 ; used as a Pokemon and Item storage value. Also used as an output value for CountSetBits

wForcePlayerToChooseMon::
; When this value is non-zero, the player isn't allowed to exit the party menu
; by pressing B and not choosing a mon.
	ds 1

wNumRunAttempts::
; number of times the player has tried to run from battle
	ds 1

wEvolutionOccurred::
	ds 1

wVBlankSavedROMBank::
	ds 1

	ds 1

wIsKeyItem::
	ds 1

wTextBoxID::
	ds 1

wCurrentMapScriptFlags:: ds 1 ; not exactly sure what this is used for, but it seems to be used as a multipurpose temp flag value

wCurEnemyLVL::
	ds 1

wItemListPointer::
; pointer to list of items terminated by $FF
	ds 2

wListCount::
; number of entries in a list
	ds 1

wLinkState::
	ds 1

wTwoOptionMenuID::
	ds 1

wChosenMenuItem::
; the id of the menu item the player ultimately chose

wOutOfBattleBlackout::
; non-zero when the whole party has fainted due to out-of-battle poison damage
	ds 1

wMenuExitMethod::
; the way the user exited a menu
; for list menus and the buy/sell/quit menu:
; $01 = the user pressed A to choose a menu item
; $02 = the user pressed B to cancel
; for two-option menus:
; $01 = the user pressed A with the first menu item selected
; $02 = the user pressed B or pressed A with the second menu item selected
	ds 1

wDungeonWarpDataEntrySize::
; the size is always 6, so they didn't need a variable in RAM for this

wWhichPewterGuy::
; 0 = museum guy
; 1 = gym guy

wWhichPrizeWindow::
; there are 3 windows, from 0 to 2

wGymGateTileBlock::
; a horizontal or vertical gate block
	ds 1

wSavedSpriteScreenY::
	ds 1

wSavedSpriteScreenX::
	ds 1

wSavedSpriteMapY::
	ds 1

wSavedSpriteMapX::
	ds 1

	ds 5

wWhichPrize::
	ds 1

wIgnoreInputCounter::
; counts downward each frame
; when it hits 0, bit 5 (ignore input bit) of wd730 is reset
	ds 1

wStepCounter::
; counts down once every step
	ds 1

wNumberOfNoRandomBattleStepsLeft::
; after a battle, you have at least 3 steps before a random battle can occur
	ds 1

wPrize1::
	ds 1
wPrize2::
	ds 1
wPrize3::
	ds 1

	ds 1

wSerialRandomNumberListBlock::
; the first 7 bytes are the preamble

wPrize1Price::
	ds 2

wPrize2Price::
	ds 2

wPrize3Price::
	ds 2

	ds 1

wLinkBattleRandomNumberList::
; shared list of 9 random numbers, indexed by wLinkBattleRandomNumberListIndex
	ds 10

wSerialPlayerDataBlock::
; the first 6 bytes are the preamble

wPseudoItemID::
; When a real item is being used, this is 0.
; When a move is acting as an item, this is the ID of the item it's acting as.
; For example, out-of-battle Dig is executed using a fake Escape Rope item. In
; that case, this would be ESCAPE_ROPE.
	ds 1

wUnusedD153::
	ds 1

	ds 2

wEvoStoneItemID::
	ds 1

wSavedNPCMovementDirections2Index::
	ds 1

wPlayerName::
	ds NAME_LENGTH


wPartyDataStart::

wPartyCount::   ds 1
wPartySpecies:: ds PARTY_LENGTH
wPartyEnd::     ds 1

wPartyMons::
wPartyMon1:: party_struct wPartyMon1
wPartyMon2:: party_struct wPartyMon2
wPartyMon3:: party_struct wPartyMon3
wPartyMon4:: party_struct wPartyMon4
wPartyMon5:: party_struct wPartyMon5
wPartyMon6:: party_struct wPartyMon6

wPartyMonOT::    ds NAME_LENGTH * PARTY_LENGTH
wPartyMonNicks:: ds NAME_LENGTH * PARTY_LENGTH
wPartyMonNicksEnd::

wPartyDataEnd::


wMainDataStart::

wPokedexOwned::
	flag_array NUM_POKEMON
wPokedexOwnedEnd::

wPokedexSeen::
	flag_array NUM_POKEMON
wPokedexSeenEnd::


wNumBagItems::
	ds 1
wBagItems::
; item, quantity
	ds BAG_ITEM_CAPACITY * 2
	ds 1 ; end

wPlayerMoney::
	ds 3 ; BCD

wRivalName::
	ds NAME_LENGTH

wOptions::
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

wObtainedBadges::
	flag_array 8

	ds 1

wLetterPrintingDelayFlags::
; bit 0: If 0, limit the delay to 1 frame. Note that this has no effect if
;        the delay has been disabled entirely through bit 1 of this variable
;        or bit 6 of wd730.
; bit 1: If 0, no delay.
	ds 1

wPlayerID::
	ds 2

wMapMusicSoundID::
	ds 1

wMapMusicROMBank::
	ds 1

wMapPalOffset::
; offset subtracted from FadePal4 to get the background and object palettes for the current map
; normally, it is 0. it is 6 when Flash is needed, causing FadePal2 to be used instead of FadePal4
	ds 1

wCurMap::
	ds 1

wCurrentTileBlockMapViewPointer::
; pointer to the upper left corner of the current view in the tile block map
	ds 2

wYCoord::
; player's position on the current map
	ds 1

wXCoord::
	ds 1

wYBlockCoord::
; player's y position (by block)
	ds 1

wXBlockCoord::
	ds 1

wLastMap::
	ds 1

wUnusedD366::
	ds 1

wCurMapTileset::
	ds 1

wCurMapHeight::
; blocks
	ds 1

wCurMapWidth::
; blocks
	ds 1

wMapDataPtr::
	ds 2

wMapTextPtr::
	ds 2

wMapScriptPtr::
	ds 2

wMapConnections::
; connection byte
	ds 1

wMapConn1Ptr::
	ds 1

wNorthConnectionStripSrc::
	ds 2

wNorthConnectionStripDest::
	ds 2

wNorthConnectionStripWidth::
	ds 1

wNorthConnectedMapWidth::
	ds 1

wNorthConnectedMapYAlignment::
	ds 1

wNorthConnectedMapXAlignment::
	ds 1

wNorthConnectedMapViewPointer::
	ds 2

wMapConn2Ptr::
	ds 1

wSouthConnectionStripSrc::
	ds 2

wSouthConnectionStripDest::
	ds 2

wSouthConnectionStripWidth::
	ds 1

wSouthConnectedMapWidth::
	ds 1

wSouthConnectedMapYAlignment::
	ds 1

wSouthConnectedMapXAlignment::
	ds 1

wSouthConnectedMapViewPointer::
	ds 2

wMapConn3Ptr::
	ds 1

wWestConnectionStripSrc::
	ds 2

wWestConnectionStripDest::
	ds 2

wWestConnectionStripHeight::
	ds 1

wWestConnectedMapWidth::
	ds 1

wWestConnectedMapYAlignment::
	ds 1

wWestConnectedMapXAlignment::
	ds 1

wWestConnectedMapViewPointer::
	ds 2

wMapConn4Ptr::
	ds 1

wEastConnectionStripSrc::
	ds 2

wEastConnectionStripDest::
	ds 2

wEastConnectionStripHeight::
	ds 1

wEastConnectedMapWidth::
	ds 1

wEastConnectedMapYAlignment::
	ds 1

wEastConnectedMapXAlignment::
	ds 1

wEastConnectedMapViewPointer::
	ds 2

wSpriteSet::
; sprite set for the current map (11 sprite picture ID's)
	ds 11

wSpriteSetID::
; sprite set ID for the current map
	ds 1

wObjectDataPointerTemp::
	ds 2

	ds 2

wMapBackgroundTile::
; the tile shown outside the boundaries of the map
	ds 1

wNumberOfWarps::
; number of warps in current map
	ds 1

wWarpEntries::
; current map warp entries
	ds 128

wDestinationWarpID::
; if $ff, the player's coordinates are not updated when entering the map
	ds 1

	ds 128

wNumSigns::
; number of signs in the current map (up to 16)
	ds 1

wSignCoords::
; 2 bytes each
; Y, X
	ds 32

wSignTextIDs::
	ds 16

wNumSprites::
; number of sprites on the current map
	ds 1

; these two variables track the X and Y offset in blocks from the last special warp used
; they don't seem to be used for anything
wYOffsetSinceLastSpecialWarp::
	ds 1
wXOffsetSinceLastSpecialWarp::
	ds 1

wMapSpriteData::
; two bytes per sprite (movement byte 2, text ID)
	ds 32

wMapSpriteExtraData::
; two bytes per sprite (trainer class/item ID, trainer set ID)
	ds 32

wCurrentMapHeight2::
; map height in 2x2 meta-tiles
	ds 1

wCurrentMapWidth2::
; map width in 2x2 meta-tiles
	ds 1

wMapViewVRAMPointer::
; the address of the upper left corner of the visible portion of the BG tile map in VRAM
	ds 2

; In the comments for the player direction variables below, "moving" refers to
; both walking and changing facing direction without taking a step.

wPlayerMovingDirection::
; if the player is moving, the current direction
; if the player is not moving, zero
; map scripts write to this in order to change the player's facing direction
	ds 1

wPlayerLastStopDirection::
; the direction in which the player was moving before the player last stopped
	ds 1

wPlayerDirection::
; if the player is moving, the current direction
; if the player is not moving, the last the direction in which the player moved
	ds 1

wTilesetBank::
	ds 1

wTilesetBlocksPtr::
; maps blocks (4x4 tiles) to tiles
	ds 2

wTilesetGfxPtr::
	ds 2

wTilesetCollisionPtr::
; list of all walkable tiles
	ds 2

wTilesetTalkingOverTiles::
	ds 3

wGrassTile::
	ds 1

	ds 4

wNumBoxItems::
	ds 1
wBoxItems::
; item, quantity
	ds PC_ITEM_CAPACITY * 2
	ds 1 ; end

wCurrentBoxNum::
; bits 0-6: box number
; bit 7: whether the player has changed boxes before
	ds 2

wNumHoFTeams::
; number of HOF teams
	ds 1

wUnusedD5A3::
	ds 1

wPlayerCoins::
	ds 2 ; BCD

wMissableObjectFlags::
; bit array of missable objects. set = removed
	ds 32
wMissableObjectFlagsEnd::

	ds 7

wd5cd:: ds 1 ; temp copy of SPRITESTATEDATA1_IMAGEINDEX (used for sprite facing/anim)

wMissableObjectList::
; each entry consists of 2 bytes
; * the sprite ID (depending on the current map)
; * the missable object index (global, used for wMissableObjectFlags)
; terminated with $FF
	ds 17 * 2

wGameProgressFlags::
; $c8 bytes
wOaksLabCurScript::
	ds 1
wPalletTownCurScript::
	ds 1
	ds 1
wBluesHouseCurScript::
	ds 1
wViridianCityCurScript::
	ds 1
	ds 2
wPewterCityCurScript::
	ds 1
wRoute3CurScript::
	ds 1
wRoute4CurScript::
	ds 1
	ds 1
wViridianGymCurScript::
	ds 1
wPewterGymCurScript::
	ds 1
wCeruleanGymCurScript::
	ds 1
wVermilionGymCurScript::
	ds 1
wCeladonGymCurScript::
	ds 1
wRoute6CurScript::
	ds 1
wRoute8CurScript::
	ds 1
wRoute24CurScript::
	ds 1
wRoute25CurScript::
	ds 1
wRoute9CurScript::
	ds 1
wRoute10CurScript::
	ds 1
wMtMoon1FCurScript::
	ds 1
wMtMoonB2FCurScript::
	ds 1
wSSAnne1FRoomsCurScript::
	ds 1
wSSAnne2FRoomsCurScript::
	ds 1
wRoute22CurScript::
	ds 1
	ds 1
wRedsHouse2FCurScript::
	ds 1
wViridianMartCurScript::
	ds 1
wRoute22GateCurScript::
	ds 1
wCeruleanCityCurScript::
	ds 1
	ds 7
wSSAnneBowCurScript::
	ds 1
wViridianForestCurScript::
	ds 1
wMuseum1FCurScript::
	ds 1
wRoute13CurScript::
	ds 1
wRoute14CurScript::
	ds 1
wRoute17CurScript::
	ds 1
wRoute19CurScript::
	ds 1
wRoute21CurScript::
	ds 1
wSafariZoneGateCurScript::
	ds 1
wRockTunnelB1FCurScript::
	ds 1
wRockTunnel1FCurScript::
	ds 1
	ds 1
wRoute11CurScript::
	ds 1
wRoute12CurScript::
	ds 1
wRoute15CurScript::
	ds 1
wRoute16CurScript::
	ds 1
wRoute18CurScript::
	ds 1
wRoute20CurScript::
	ds 1
wSSAnneB1FRoomsCurScript::
	ds 1
wVermilionCityCurScript::
	ds 1
wPokemonTower2FCurScript::
	ds 1
wPokemonTower3FCurScript::
	ds 1
wPokemonTower4FCurScript::
	ds 1
wPokemonTower5FCurScript::
	ds 1
wPokemonTower6FCurScript::
	ds 1
wPokemonTower7FCurScript::
	ds 1
wRocketHideoutB1FCurScript::
	ds 1
wRocketHideoutB2FCurScript::
	ds 1
wRocketHideoutB3FCurScript::
	ds 1
wRocketHideoutB4FCurScript::
	ds 2
wRoute6GateCurScript::
	ds 1
wRoute8GateCurScript::
	ds 2
wCinnabarIslandCurScript::
	ds 1
wPokemonMansion1FCurScript::
	ds 2
wPokemonMansion2FCurScript::
	ds 1
wPokemonMansion3FCurScript::
	ds 1
wPokemonMansionB1FCurScript::
	ds 1
wVictoryRoad2FCurScript::
	ds 1
wVictoryRoad3FCurScript::
	ds 1
	ds 1
wFightingDojoCurScript::
	ds 1
wSilphCo2FCurScript::
	ds 1
wSilphCo3FCurScript::
	ds 1
wSilphCo4FCurScript::
	ds 1
wSilphCo5FCurScript::
	ds 1
wSilphCo6FCurScript::
	ds 1
wSilphCo7FCurScript::
	ds 1
wSilphCo8FCurScript::
	ds 1
wSilphCo9FCurScript::
	ds 1
wHallOfFameCurScript::
	ds 1
wChampionsRoomCurScript::
	ds 1
wLoreleisRoomCurScript::
	ds 1
wBrunosRoomCurScript::
	ds 1
wAgathasRoomCurScript::
	ds 1
wCeruleanCaveB1FCurScript::
	ds 1
wVictoryRoad1FCurScript::
	ds 1
	ds 1
wLancesRoomCurScript::
	ds 1
	ds 4
wSilphCo10FCurScript::
	ds 1
wSilphCo11FCurScript::
	ds 1
	ds 1
wFuchsiaGymCurScript::
	ds 1
wSaffronGymCurScript::
	ds 1
	ds 1
wCinnabarGymCurScript::
	ds 1
wGameCornerCurScript::
	ds 1
wRoute16Gate1FCurScript::
	ds 1
wBillsHouseCurScript::
	ds 1
wRoute5GateCurScript::
	ds 1
wPowerPlantCurScript::
wRoute7GateCurScript::
; overload
	ds 1
	ds 1
wSSAnne2FCurScript::
	ds 1
wSeafoamIslandsB3FCurScript::
	ds 1
wRoute23CurScript::
	ds 1
wSeafoamIslandsB4FCurScript::
	ds 1
wRoute18Gate1FCurScript::
	ds 1

	ds 78
wGameProgressFlagsEnd::

	ds 56

wObtainedHiddenItemsFlags::
	ds 14

wObtainedHiddenCoinsFlags::
	ds 2

wWalkBikeSurfState::
; $00 = walking
; $01 = biking
; $02 = surfing
	ds 1

	ds 10

wTownVisitedFlag::
	flag_array NUM_CITY_MAPS

wSafariSteps::
; starts at 502
	ds 2

wFossilItem::
; item given to cinnabar lab
	ds 1

wFossilMon::
; mon that will result from the item
	ds 1

	ds 2

wEnemyMonOrTrainerClass::
; trainer classes start at OPP_ID_OFFSET
	ds 1

wPlayerJumpingYScreenCoordsIndex::
	ds 1

wRivalStarter::
	ds 1

	ds 1

wPlayerStarter::
	ds 1

wBoulderSpriteIndex::
; sprite index of the boulder the player is trying to push
	ds 1

wLastBlackoutMap::
	ds 1

wDestinationMap::
; destination map (for certain types of special warps, not ordinary walking)
	ds 1

wUnusedD71B::
	ds 1

wTileInFrontOfBoulderAndBoulderCollisionResult::
; used to store the tile in front of the boulder when trying to push a boulder
; also used to store the result of the collision check ($ff for a collision and $00 for no collision)
	ds 1

wDungeonWarpDestinationMap::
; destination map for dungeon warps
	ds 1

wWhichDungeonWarp::
; which dungeon warp within the source map was used
	ds 1

wUnusedD71F::
	ds 1

	ds 8

wd728::
; bit 0: using Strength outside of battle
; bit 1: set by IsSurfingAllowed when surfing's allowed, but the caller resets it after checking the result
; bit 3: received Old Rod
; bit 4: received Good Rod
; bit 5: received Super Rod
; bit 6: gave one of the Saffron guards a drink
; bit 7: set by ItemUseCardKey, which is leftover code from a previous implementation of the Card Key
	ds 1

	ds 1

wBeatGymFlags::
; redundant because it matches wObtainedBadges
; used to determine whether to show name on statue and in two NPC text scripts
	ds 1

	ds 1

wd72c::
; bit 0: if not set, the 3 minimum steps between random battles have passed
; bit 1: prevent audio fade out
	ds 1

wd72d::
; This variable is used for temporary flags and as the destination map when
; warping to the Trade Center or Colosseum.
; bit 0: sprite facing directions have been initialised in the Trade Center
; bit 3: do scripted warp (used to warp back to Lavender Town from the top of the pokemon tower)
; bit 4: on a dungeon warp
; bit 5: don't make NPCs face the player when spoken to
; Bits 6 and 7 are set by scripts when starting major battles in the storyline,
; but they do not appear to affect anything. Bit 6 is reset after all battles
; and bit 7 is reset after trainer battles (but it's only set before trainer
; battles anyway).
	ds 1

wd72e::
; bit 0: the player has received Lapras in the Silph Co. building
; bit 1: set in various places, but doesn't appear to have an effect
; bit 2: the player has healed pokemon at a pokemon center at least once
; bit 3: the player has a received a pokemon from Prof. Oak
; bit 4: disable battles
; bit 5: set when a battle ends and when the player blacks out in the overworld due to poison
; bit 6: using the link feature
; bit 7: set if scripted NPC movement has been initialised
	ds 1

	ds 1

wd730::
; bit 0: NPC sprite being moved by script
; bit 5: ignore joypad input
; bit 6: print text with no delay between each letter
; bit 7: set if joypad states are being simulated in the overworld or an NPC's movement is being scripted
	ds 1

	ds 1

wd732::
; bit 0: play time being counted
; bit 1: remnant of debug mode; only set by the debug build.
; if it is set:
; 1. skips most of Prof. Oak's speech, and uses NINTEN as the player's name and SONY as the rival's name
; 2. does not have the player start in floor two of the player's house (instead sending them to [wLastMap])
; 3. allows wild battles to be avoided by holding down B
; furthermore, in the debug build:
; 4. allows trainers to be avoided by holding down B
; 5. skips Safari Zone step counter by holding down B
; 6. skips the NPC who blocks Route 3 before beating Brock by holding down B
; 7. skips Cerulean City rival battle by holding down B
; 8. skips Pokémon Tower rival battle by holding down B
; bit 2: the target warp is a fly warp (bit 3 set or blacked out) or a dungeon warp (bit 4 set)
; bit 3: used warp pad, escape rope, dig, teleport, or fly, so the target warp is a "fly warp"
; bit 4: jumped into hole (Pokemon Mansion, Seafoam Islands, Victory Road) or went down waterfall (Seafoam Islands), so the target warp is a "dungeon warp"
; bit 5: currently being forced to ride bike (cycling road)
; bit 6: map destination is [wLastBlackoutMap] (usually the last used pokemon center, but could be the player's house)
	ds 1

wFlags_D733::
; bit 0: running a test battle
; bit 1: prevent music from changing when entering new map
; bit 2: skip the joypad check in CheckWarpsNoCollision (used for the forced warp down the waterfall in the Seafoam Islands)
; bit 3: trainer wants to battle
; bit 4: use variable [wCurMapScript] instead of the provided index for next frame's map script (used to start battle when talking to trainers)
; bit 7: used fly out of battle
	ds 1

wBeatLorelei::
; bit 1: set when you beat Lorelei and reset in Indigo Plateau lobby
; the game uses this to tell when Elite 4 events need to be reset
	ds 1

	ds 1

wd736::
; bit 0: check if the player is standing on a door and make him walk down a step if so
; bit 1: the player is currently stepping down from a door
; bit 2: standing on a warp
; bit 6: jumping down a ledge / fishing animation
; bit 7: player sprite spinning due to spin tiles (Rocket hideout / Viridian Gym)
	ds 1

wCompletedInGameTradeFlags::
	ds 2

	ds 2

wWarpedFromWhichWarp::
	ds 1

wWarpedFromWhichMap::
	ds 1

	ds 2

wCardKeyDoorY::
	ds 1

wCardKeyDoorX::
	ds 1

	ds 2

wFirstLockTrashCanIndex::
	ds 1

wSecondLockTrashCanIndex::
	ds 1

	ds 2

wEventFlags::
	flag_array NUM_EVENTS


UNION
wGrassRate:: db
wGrassMons::
	ds 10 * 2

	ds 8

wWaterRate:: db
wWaterMons::
	ds 10 * 2

NEXTU
wLinkEnemyTrainerName::
; linked game's trainer name
	ds NAME_LENGTH

	ds 1

wSerialEnemyDataBlock::
;	ds $1a8

	ds 9

wEnemyPartyCount:: ds 1
wEnemyPartyMons::  ds PARTY_LENGTH + 1

wEnemyMons::
wEnemyMon1:: party_struct wEnemyMon1
wEnemyMon2:: party_struct wEnemyMon2
wEnemyMon3:: party_struct wEnemyMon3
wEnemyMon4:: party_struct wEnemyMon4
wEnemyMon5:: party_struct wEnemyMon5
wEnemyMon6:: party_struct wEnemyMon6

wEnemyMonOT::    ds NAME_LENGTH * PARTY_LENGTH
wEnemyMonNicks:: ds NAME_LENGTH * PARTY_LENGTH

ENDU


wTrainerHeaderPtr::
	ds 2

	ds 6

wOpponentAfterWrongAnswer::
; the trainer the player must face after getting a wrong answer in the Cinnabar
; gym quiz

wUnusedDA38::
	ds 1

wCurMapScript::
; index of current map script, mostly used as index for function pointer array
; mostly copied from map-specific map script pointer and written back later
	ds 1

	ds 7

wPlayTimeHours::
	ds 1
wPlayTimeMaxed::
	ds 1
wPlayTimeMinutes::
	ds 1
wPlayTimeSeconds::
	ds 1
wPlayTimeFrames::
	ds 1

wSafariZoneGameOver::
	ds 1

wNumSafariBalls::
	ds 1


wDayCareInUse::
; 0 if no pokemon is in the daycare
; 1 if pokemon is in the daycare
	ds 1

wDayCareMonName:: ds NAME_LENGTH
wDayCareMonOT::   ds NAME_LENGTH

wDayCareMon:: box_struct wDayCareMon

wMainDataEnd::


wBoxDataStart::

wNumInBox::  ds 1
wBoxSpecies:: ds MONS_PER_BOX + 1

wBoxMons::
wBoxMon1:: box_struct wBoxMon1
wBoxMon2:: ds BOX_STRUCT_LENGTH * (MONS_PER_BOX - 1)

wBoxMonOT::    ds NAME_LENGTH * MONS_PER_BOX
wBoxMonNicks:: ds NAME_LENGTH * MONS_PER_BOX
wBoxMonNicksEnd::

wBoxDataEnd::


SECTION "Stack", WRAM0

wStack::


INCLUDE "sram.asm"

INCLUDE "hram.asm"
