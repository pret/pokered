; This disassembly was created using Emulicious (https://www.emulicious.net)
.MEMORYMAP
SLOTSIZE $4000
SLOT 0 $0000
SLOT 1 $4000
DEFAULTSLOT 1
.ENDME
.ROMBANKMAP
BANKSTOTAL 64
BANKSIZE $4000
BANKS 64
.ENDRO

.enum $C000 export
wUnusedMusicByte db
wSoundID db
wMuteAudioAndPauseMusic db
wDisableChannelOutputWhenSfxEnds db
wStereoPanning db
wSavedVolume db
wChannelCommandPointers db
.ende

.enum $C012 export
wChannelCommandPointers_plus_C db
.ende

.enum $C016 export
wChannelReturnAddresses db
.ende

.enum $C026 export
wChannelSoundIDs db
.ende

.enum $C02A export
wChannelSoundIDs_plus_4 db
wChannelSoundIDs_plus_5 db
wChannelSoundIDs_plus_6 db
wChannelSoundIDs_plus_7 db
wChannelFlags1 db
.ende

.enum $C036 export
wChannelFlags2 db
.ende

.enum $C03E export
wChannelDutyCycles db
.ende

.enum $C046 export
wChannelDutyCyclePatterns db
.ende

.enum $C04E export
wChannelVibratoDelayCounters db
.ende

.enum $C056 export
wChannelVibratoExtents db
.ende

.enum $C05E export
wChannelVibratoRates db
.ende

.enum $C066 export
wChannelFrequencyLowBytes db
.ende

.enum $C06E export
wChannelVibratoDelayCounterReloadValues db
.ende

.enum $C076 export
wChannelPitchSlideLengthModifiers db
.ende

.enum $C07E export
wChannelPitchSlideFrequencySteps db
.ende

.enum $C086 export
wChannelPitchSlideFrequencyStepsFractionalPart db
.ende

.enum $C08E export
wChannelPitchSlideCurrentFrequencyFractionalPart db
.ende

.enum $C096 export
wChannelPitchSlideCurrentFrequencyHighBytes db
.ende

.enum $C09E export
wChannelPitchSlideCurrentFrequencyLowBytes db
.ende

.enum $C0A6 export
wChannelPitchSlideTargetFrequencyHighBytes db
.ende

.enum $C0AE export
wChannelPitchSlideTargetFrequencyLowBytes db
.ende

.enum $C0B6 export
wChannelNoteDelayCounters db
.ende

.enum $C0BE export
wChannelLoopCounters db
.ende

.enum $C0C6 export
wChannelNoteSpeeds db
.ende

.enum $C0CE export
wChannelNoteDelayCountersFractionalPart db
wChannelNoteDelayCountersFractionalPart_plus_1 db
wChannelNoteDelayCountersFractionalPart_plus_2 db
wChannelNoteDelayCountersFractionalPart_plus_3 db
wChannelNoteDelayCountersFractionalPart_plus_4 db
wChannelNoteDelayCountersFractionalPart_plus_5 db
wChannelNoteDelayCountersFractionalPart_plus_6 db
wChannelNoteDelayCountersFractionalPart_plus_7 db
.ende

.enum $C0E6 export
wMusicWaveInstrument db
wSfxWaveInstrument db
wMusicTempo db
wMusicTempo_plus_1 db
wSfxTempo db
wSfxTempo_plus_1 db
wSfxHeaderPointer db
wSfxHeaderPointer_plus_1 db
wNewSoundID db
wAudioROMBank db
wAudioSavedROMBank db
wFrequencyModifier db
wTempoModifier db
.ende

.enum $C100 export
wSpriteDataStart db
wSpritePlayerStateData1MovementStatus db
wSpritePlayerStateData1ImageIndex db
wSpritePlayerStateData1YStepVector db
wSpritePlayerStateData1YPixels db
wSpritePlayerStateData1XStepVector db
.ende

.enum $C107 export
wSpritePlayerStateData1IntraAnimFrameCounter db
wSpritePlayerStateData1AnimFrameCounter db
wSpritePlayerStateData1FacingDirection db
.ende

.enum $C110 export
wSprite01StateData1 db
.ende

.enum $C112 export
wSprite01StateData1ImageIndex db
.ende

.enum $C114 export
wSprite01StateData1YPixels db
.ende

.enum $C119 export
wSprite01StateData1FacingDirection db
.ende

.enum $C200 export
wSprite15StateData1End db
.ende

.enum $C206 export
wSpritePlayerStateData2MovementByte1 db
wSpritePlayerStateData2GrassPriority db
.ende

.enum $C20D export
wSpritePlayerStateData2PictureID db
.ende

.enum $C210 export
wSprite01StateData2 db
.ende

.enum $C219 export
wSprite01StateData2OrigFacingDirection db
.ende

.enum $C21D export
wSprite01StateData2PictureID db
wSprite01StateData2ImageBaseOffset db
.ende

.enum $C300 export
wShadowOAM db
.ende

.enum $C302 export
wShadowOAMSprite00TileID db
.ende

.enum $C328 export
wShadowOAMSprite10 db
.ende

.enum $C390 export
wShadowOAMSprite36 db
.ende

.enum $C3A0 export
wShadowOAMEnd db
.ende

.enum $C3AA export
wTileMap_plus_A db
.ende

.enum $C3B2 export
wTileMap_plus_12 db
.ende

.enum $C3B5 export
wTileMap_plus_15 db
wTileMap_plus_16 db
.ende

.enum $C3E1 export
wTileMap_plus_41 db
.ende

.enum $C42E export
wTileMap_plus_8E db
.ende

.enum $C436 export
wTileMap_plus_96 db
.ende

.enum $C440 export
wTileMap_plus_A0 db
.ende

.enum $C45C export
wTileMap_plus_BC db
.ende

.enum $C46B export
wTileMap_plus_CB db
.ende

.enum $C48E export
wTileMap_plus_EE db
.ende

.enum $C490 export
wTileMap_plus_F0 db
.ende

.enum $C4A4 export
wTileMap_plus_104 db
.ende

.enum $C4B8 export
wTileMap_plus_118 db
.ende

.enum $C4CC export
wTileMap_plus_12C db
.ende

.enum $C4D7 export
wTileMap_plus_137 db
.ende

.enum $C4E0 export
wTileMap_plus_140 db
wTileMap_plus_141 db
.ende

.enum $C4EB export
wTileMap_plus_14B db
.ende

.enum $C4F2 export
wTileMap_plus_152 db
.ende

.enum $C4F6 export
wTileMap_plus_156 db
.ende

.enum $C508 export
wSerialPartyMonsPatchList db
.ende

.enum $C6E8 export
wOverworldMap db
.ende

.enum $CBFC export
wOverworldMapEnd db
.ende

.enum $CC24 export
wTopMenuItemY db
wTopMenuItemX db
wCurrentMenuItem db
wTileBehindCursor db
wMaxMenuItem db
wMenuWatchedKeys db
wLastMenuItem db
.ende

.enum $CC2D export
wBattleAndStartSavedMenuItem db
.ende

.enum $CC30 export
wMenuCursorLocation db
wMenuCursorLocation_plus_1 db
.ende

.enum $CC34 export
wMenuJoypadPollCount db
.ende

.enum $CC37 export
wMenuWatchMovingOutOfBounds db
.ende

.enum $CC3A export
wTextDest db
wTextDest_plus_1 db
wDoNotWaitForButtonPressAfterDisplayingText db
wLinkMenuSelectionReceiveBuffer db
wSerialExchangeNybbleReceiveData db
.ende

.enum $CC42 export
wLinkMenuSelectionSendBuffer db
.ende

.enum $CC47 export
wEnteringCableClub db
wEnteringCableClub_plus_1 db
wMonDataLocation db
wMenuWrappingEnabled db
wCheckFor180DegreeTurn db
.ende

.enum $CC4E export
wPredefID db
wPredefHL db
wPredefHL_plus_1 db
wPredefDE db
.ende

.enum $CC57 export
wNPCMovementScriptPointerTableNum db
wNPCMovementScriptBank db
.ende

.enum $CC5B export
wAnimationType db
.ende

.enum $CC97 export
wNPCMovementDirections2 db
.ende

.enum $CCD3 export
wAddedToParty db
.ende

.enum $CD37 export
wFilteredBagItemsCount db
wSimulatedJoypadStatesIndex db
.ende

.enum $CD3A export
wUnusedOverrideSimulatedJoypadStatesIndex db
wOverrideSimulatedJoypadStatesMask db
.ende

.enum $CD3D export
wBadgeNumberTile db
wBadgeNameTile db
wBadgeOrFaceTiles db
.ende

.enum $CD50 export
wSavedPlayerFacingDirection db
.ende

.enum $CD60 export
wMiscFlags db
.ende

.enum $CD6B export
wJoyIgnore db
.ende

.enum $CD6D export
wBattleMenuCurrentPP db
.ende

.enum $CD77 export
wPPUpCountAndMaxPP_plus_4 db
.ende

.enum $CD81 export
wSerialOtherGameboyRandomNumberListBlock db
.ende

.enum $CEE9 export
wBuffer db
.ende

.enum $CF08 export
wBankswitchHomeSavedROMBank db
wBankswitchHomeTemp db
.ende

.enum $CF0C export
wAutoTextBoxDrawingControl db
.ende

.enum $CF0F export
wNPCNumScriptedSteps db
wNPCMovementScriptFunctionNum db
wTextPredefFlag db
wPredefParentBank db
wSpriteIndex db
wCurSpriteMovement2 db
.ende

.enum $CF17 export
wNPCMovementScriptSpriteOffset db
wScriptedNPCWalkCounter db
.ende

.enum $CF1A export
wOnCGB db
wOnSGB db
.ende

.enum $CF1F export
wPartyMenuHPBarColors db
.ende

.enum $CF8B export
wListPointer db
wListPointer_plus_1 db
wUnusedNamePointer db
wUnusedNamePointer_plus_1 db
wItemPrices db
wItemPrices_plus_1 db
wCurItem db
wWhichPokemon db
.ende

.enum $CF94 export
wHPBarType db
.ende

.enum $CFC4 export
wFontLoaded db
wWalkCounter db
.ende

.enum $CFC7 export
wAudioFadeOutControl db
wAudioFadeOutCounterReloadValue db
wAudioFadeOutCounter db
wLastMusicSoundID db
wUpdateSpritesEnabled db
.ende

.enum $D057 export
wIsInBattle db
.ende

.enum $D085 export
wMovingBGTilesCounter2 db
.ende

.enum $D08A export
wCoordAdjustmentAmount db
wAnimCounter db
.ende

.enum $D09B export
wPartyMenuAnimMonEnabled db
.ende

.enum $D0A0 export
wDisableVBlankWYUpdate db
wSpriteCurPosX db
wSpriteCurPosY db
wSpriteWidth db
wSpriteHeight db
wSpriteInputCurByte db
wSpriteInputBitCounter db
wSpriteOutputBitOffset db
wSpriteLoadFlags db
wSpriteUnpackMode db
wSpriteFlipped db
wSpriteInputPtr db
wSpriteInputPtr_plus_1 db
wSpriteOutputPtr db
wSpriteOutputPtr_plus_1 db
wSpriteOutputPtrCached db
wSpriteOutputPtrCached_plus_1 db
wSpriteDecodeTable0Ptr db
wSpriteDecodeTable0Ptr_plus_1 db
wSpriteDecodeTable1Ptr db
wSpriteDecodeTable1Ptr_plus_1 db
wCurSpecies db
wNameListType db
wPredefBank db
wMonHIndex db
.ende

.enum $D0C2 export
wMonHSpriteDim db
.ende

.enum $D119 export
wUnusedCurMapTilesetCopy db
wWalkBikeSurfStateCopy db
wInitListType db
.ende

.enum $D11E export
wCalculateWhoseStats db
.ende

.enum $D122 export
wVBlankSavedROMBank db
.ende

.enum $D125 export
wTextBoxID db
.ende

.enum $D12B export
wLinkState db
wTwoOptionMenuID db
wChosenMenuItem db
wMenuExitMethod db
.ende

.enum $D158 export
wPlayerName db
.ende

.enum $D163 export
wPartyCount db
wPartySpecies db
.ende

.enum $D34A export
wRivalName db
.ende

.enum $D358 export
wLetterPrintingDelayFlags db
.ende

.enum $D35B export
wMapMusicSoundID db
wMapMusicROMBank db
wMapPalOffset db
wCurMap db
wCurrentTileBlockMapViewPointer db
wCurrentTileBlockMapViewPointer_plus_1 db
wYCoord db
wXCoord db
wYBlockCoord db
wXBlockCoord db
.ende

.enum $D367 export
wCurMapHeader db
wCurMapHeight db
wCurMapWidth db
wCurMapDataPtr db
wCurMapDataPtr_plus_1 db
wCurMapTextPtr db
.ende

.enum $D36E export
wCurMapScriptPtr db
.ende

.enum $D370 export
wCurMapConnections db
wCurMapHeaderEnd db
wNorthConnectionStripSrc db
wNorthConnectionStripSrc_plus_1 db
wNorthConnectionStripDest db
wNorthConnectionStripDest_plus_1 db
wNorthConnectionStripLength db
wNorthConnectedMapWidth db
.ende

.enum $D37C export
wSouthConnectedMap db
wSouthConnectionStripSrc db
wSouthConnectionStripSrc_plus_1 db
wSouthConnectionStripDest db
wSouthConnectionStripDest_plus_1 db
wSouthConnectionStripLength db
wSouthConnectedMapWidth db
.ende

.enum $D387 export
wWestConnectedMap db
wWestConnectionStripSrc db
wWestConnectionStripSrc_plus_1 db
wWestConnectionStripDest db
wWestConnectionStripDest_plus_1 db
wWestConnectionStripLength db
wWestConnectedMapWidth db
wWestConnectedMapYAlignment db
wWestConnectedMapXAlignment db
wWestConnectedMapViewPointer db
wWestConnectedMapViewPointer_plus_1 db
wEastConnectedMap db
wEastConnectionStripSrc db
wEastConnectionStripSrc_plus_1 db
wEastConnectionStripDest db
wEastConnectionStripDest_plus_1 db
wEastConnectionStripLength db
wEastConnectedMapWidth db
.ende

.enum $D39D export
wSpriteSet db
.ende

.enum $D3A8 export
wSpriteSetID db
wObjectDataPointerTemp db
wObjectDataPointerTemp_plus_1 db
.ende

.enum $D3AD export
wMapBackgroundTile db
wNumberOfWarps db
wWarpEntries db
.ende

.enum $D42F export
wDestinationWarpID db
.ende

.enum $D4B0 export
wNumSigns db
wSignCoords db
.ende

.enum $D4E1 export
wNumSprites db
wYOffsetSinceLastSpecialWarp db
wXOffsetSinceLastSpecialWarp db
wMapSpriteData db
.ende

.enum $D504 export
wMapSpriteExtraData db
.ende

.enum $D524 export
wCurrentMapHeight2 db
wCurrentMapWidth2 db
wMapViewVRAMPointer db
wMapViewVRAMPointer_plus_1 db
wPlayerMovingDirection db
.ende

.enum $D52A export
wPlayerDirection db
wTilesetBank db
wTilesetBlocksPtr db
wTilesetBlocksPtr_plus_1 db
wTilesetGfxPtr db
wTilesetGfxPtr_plus_1 db
wTilesetCollisionPtr db
wTilesetCollisionPtr_plus_1 db
.ende

.enum $D535 export
wGrassTile db
.ende

.enum $D5CD export
wSavedSpriteImageIndex db
wToggleableObjectList db
.ende

.enum $D700 export
wWalkBikeSurfState db
.ende

.enum $D70D export
wSafariSteps db
.ende

.enum $D714 export
wPlayerJumpingYScreenCoordsIndex db
.ende

.enum $D718 export
wBoulderSpriteIndex db
.ende

.enum $D71C export
wTileInFrontOfBoulderAndBoulderCollisionResult db
.ende

.enum $D728 export
wStatusFlags1 db
.ende

.enum $D72D export
wCableClubDestinationMap db
wStatusFlags4 db
.ende

.enum $D730 export
wStatusFlags5 db
.ende

.enum $D732 export
wStatusFlags6 db
wStatusFlags7 db
.ende

.enum $D736 export
wMovementFlags db
.ende

.enum $D74B export
wEventFlags_plus_4 db
.ende

.enum $D790 export
wEventFlags_plus_49 db
.ende

.enum $D887 export
wGrassRate db
wGrassMons db
.ende

.enum $D89D export
wEnemyPartySpecies db
.ende

.enum $D8A4 export
wEnemyMon1 db
wEnemyMon1HP db
.ende

.enum $DA46 export
wSafariZoneGameOver db
wNumSafariBalls db
.ende

.enum $FF80 export
hDMARoutine db
hDMARoutine_plus_1 db
.ende

.enum $FF8A export
hSoftReset db
hBaseTileID db
hDownArrowBlinkCount2 db
hEnemySpeed db
hFourTileSpriteCount db
hCollidingSpriteOffset db
hCollidingSpriteTempYValue db
hCollidingSpriteTempXValue db
hCollidingSpriteAdjustedDistance db
hTilePlayerStandingOn db
hSpritePriority db
hDividend db
hExperience db
hFindPathNumSteps db
hFindPathFlags db
hDivisor db
hDivideBuffer db
hMultiplyBuffer db
hSavedNumToPrint db
hNPCPlayerRelativePosFlags db
hNPCPlayerRelativePosFlags_plus_1 db
.ende

.enum $FFA9 export
hSerialReceivedNewData db
hSerialConnectionStatus db
.ende

.enum $FFAC export
hSerialSendData db
hSerialReceiveData db
hSCX db
hSCY db
hWY db
hJoyLast db
hJoyReleased db
hJoyPressed db
hJoyHeld db
hJoy5 db
hJoy6 db
hJoy7 db
hLoadedROMBank db
hSavedROMBank db
hAutoBGTransferEnabled db
hAutoBGTransferPortion db
hAutoBGTransferDest db
hAutoBGTransferDest_plus_1 db
.ende

.enum $FFBF export
hSPTemp db
hSPTemp_plus_1 db
hVBlankCopyBGSource db
hVBlankCopyBGSource_plus_1 db
hVBlankCopyBGDest db
hVBlankCopyBGDest_plus_1 db
hVBlankCopyBGNumRows db
hVBlankCopySize db
hVBlankCopySource db
hVBlankCopySource_plus_1 db
hVBlankCopyDest db
hVBlankCopyDest_plus_1 db
hVBlankCopyDoubleSize db
hVBlankCopyDoubleSource db
hVBlankCopyDoubleSource_plus_1 db
hVBlankCopyDoubleDest db
hVBlankCopyDoubleDest_plus_1 db
hRedrawRowOrColumnMode db
hRedrawRowOrColumnDest db
hRedrawRowOrColumnDest_plus_1 db
hRandomAdd db
hRandomSub db
hFrameCounter db
hVBlankOccurred db
hTileAnimations db
hMovingBGTilesCounter1 db
.ende

.enum $FFDA export
hCurrentSpriteOffset db
.ende

.enum $FFE1 export
hStartTileID db
.ende

.enum $FFE4 export
hNewPartyLength db
hDividend2 db
.ende

.enum $FFE8 export
hMapROMBank db
hSpriteVRAMSlotAndFacing db
hCoordsInFrontOfPlayerMatch db
.ende

.enum $FFF4 export
hClearLetterPrintingDelayFlags db
.ende

.enum $FFF6 export
hUILayoutFlags db
.ende

.enum $FFF8 export
hJoyInput db
.ende

.enum $A000 export
sSpriteBuffer0 db
.ende

.enum $A187 export
sSpriteBuffer0_plus_187 db
sSpriteBuffer1 db
.ende

.enum $A30F export
sSpriteBuffer1_plus_187 db
sSpriteBuffer2 db
.ende

.enum $A497 export
sSpriteBuffer2_plus_187 db
.ende

; Pokemon data
.define BaseStats $43DE

; Map headers
.define PalletTown_h $42A1

; Sprite graphics pointers
.define RedSprite $4180

; Wild data
.define NUM_WILDMONS 10
.define WILDDATA_LENGTH 1 + NUM_WILDMONS * 2

; Ports
.define rP1 $00
.define rSB $01
.define rSC $02
.define rDIV $04
.define rTMA $06
.define rTAC $07
.define rIF $0F
.define rAUD1SWEEP $10
.define rAUD1ENV $12
.define rAUD1HIGH $14
.define rAUD2ENV $17
.define rAUD2HIGH $19
.define rAUD3ENA $1A
.define rAUD3LEVEL $1C
.define rAUD4ENV $21
.define rAUD4GO $23
.define rAUDVOL $24
.define rAUDTERM $25
.define rAUDENA $26
.define _AUD3WAVERAM $30
.define rLCDC $40
.define rSTAT $41
.define rSCY $42
.define rSCX $43
.define rLY $44
.define rDMA $46
.define rBGP $47
.define rOBP0 $48
.define rOBP1 $49
.define rWY $4A
.define rWX $4B
.define rIE $FF

