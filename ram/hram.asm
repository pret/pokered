SECTION "HRAM", HRAM

; Initialized to 16.
; Decremented each input iteration if the player
; presses the reset sequence (A+B+SEL+START).
; Soft reset when 0 is reached.
hSoftReset:: db

UNION
hBaseTileID:: ; base tile ID to which offsets are added
hDexWeight::
hWarpDestinationMap::
hOAMTile::
hROMBankTemp::
hPreviousTileset::
hRLEByteValue::
	db

hTextID:: ; DisplayTextID's argument
hPartyMonIndex::
	db

hVRAMSlot::
	db

hFourTileSpriteCount::
hHalveItemPrices::
	db

NEXTU
hItemPrice:: ds 3 ; BCD number

NEXTU
hSlideAmount:: db

; the total number of tiles being shifted each time the pic slides by one tile
hSlidingRegionSize:: db

; -1 = left
;  0 = right
hSlideDirection:: db

NEXTU
hSpriteInterlaceCounter::
hSpriteWidth::  db ; in tiles
hSpriteHeight:: db ; in tiles
hSpriteOffset:: db

NEXTU
; counters for blinking down arrow
hDownArrowBlinkCount1:: db
hDownArrowBlinkCount2:: db

NEXTU
hMapStride::
hEastWestConnectedMapWidth::
hNorthSouthConnectionStripWidth::
	db
hMapWidth::
hNorthSouthConnectedMapWidth::
	db

NEXTU
hSpriteDataOffset:: db
hSpriteIndex:: db
hSpriteImageIndex::
hSpriteFacingDirection::
hSpriteMovementByte2::
	db

NEXTU
	ds 2
hLoadSpriteTemp1:: db
hLoadSpriteTemp2:: db

NEXTU
	ds 2
hEnemySpeed:: dw
ENDU

UNION
hSpriteOffset2:: db
hOAMBufferOffset:: db
hSpriteScreenX:: db
hSpriteScreenY:: db

NEXTU
hCollidingSpriteOffset:: db
hCollidingSpriteTempYValue:: db
hCollidingSpriteTempXValue:: db
hCollidingSpriteAdjustedDistance:: db
ENDU

hTilePlayerStandingOn:: db

hSpritePriority:: db

UNION
; Multiplication and division variables are meant
; to overlap for back-to-back usage. Big endian.
	UNION
		ds 1
	hMultiplicand:: ds 3
	hMultiplier:: db
		ds 1
	hMultiplyBuffer:: ds 4
	NEXTU
	hProduct:: ds 4
	NEXTU
	hDividend:: ds 4
	hDivisor:: db
	hDivideBuffer:: ds 5
	NEXTU
	hQuotient:: ds 4
	hRemainder:: db
	ENDU

NEXTU
; PrintNumber (big endian).
hPastLeadingZeros:: db ; last char printed
hNumToPrint:: ds 3
hPowerOf10:: ds 3
hSavedNumToPrint:: ds 3

NEXTU
hNPCMovementDirections2Index::
hNPCSpriteOffset::
; distance in steps between NPC and player
hNPCPlayerYDistance::
	db
hNPCPlayerXDistance::
	db
hFindPathNumSteps:: db
; bit 0: set when the end of the path's Y coordinate matches the target's
; bit 1: set when the end of the path's X coordinate matches the target's
; When both bits are set, the end of the path is at the target's position
; (i.e. the path has been found).
hFindPathFlags:: db
hFindPathYProgress:: db
hFindPathXProgress:: db
; 0 = from player to NPC
; 1 = from NPC to player
hNPCPlayerRelativePosPerspective:: db
	ds 1
; bit 0:
; 0 = target is to the south or aligned
; 1 = target is to the north
; bit 1:
; 0 = target is to the east or aligned
; 1 = target is to the west
hNPCPlayerRelativePosFlags:: db

NEXTU
hSwapItemID:: db
hSwapItemQuantity:: db

NEXTU
hSignCoordPointer:: dw

NEXTU
	ds 1
hMutateWY:: db
hMutateWX:: db

NEXTU
; temp value used when swapping bytes or words
hSwapTemp:: db
hExperience:: ds 3 ; big endian
ENDU

UNION
hMoney:: ds 3 ; BCD number
NEXTU
; some code zeroes this for no reason when writing a coin amount
hUnusedCoinsByte:: db
hCoins:: dw ; BCD number
ENDU

hDivideBCDDivisor::
hDivideBCDQuotient::
	ds 3 ; BCD number
hDivideBCDBuffer::
	ds 3 ; BCD number

	ds 1

hSerialReceivedNewData:: db
; $01 = using external clock
; $02 = using internal clock
; $ff = establishing connection
hSerialConnectionStatus:: db
hSerialIgnoringInitialData:: db
hSerialSendData:: db
hSerialReceiveData:: db

; these values are copied to rSCX, rSCY, and rWY during V-blank
hSCX:: db
hSCY:: db
hWY::  db

hJoyLast::     db
hJoyReleased:: db
hJoyPressed::  db
hJoyHeld::     db
hJoy5::        db
hJoy6::        db
hJoy7::        db

hLoadedROMBank:: db
hSavedROMBank::  db

; is automatic background transfer during V-blank enabled?
; if nonzero, yes
; if zero, no
hAutoBGTransferEnabled:: db

; 00 = top third of background
; 01 = middle third of background
; 02 = bottom third of background
hAutoBGTransferPortion:: db

; the destination address of the automatic background transfer
hAutoBGTransferDest:: dw

hRedrawMapViewRowOffset:: db

; temporary storage for stack pointer during memory transfers that use pop
; to increase speed
hSPTemp:: dw

; source address for VBlankCopyBgMap function
; the first byte doubles as the byte that enabled the transfer.
; if it is 0, the transfer is disabled
; if it is not 0, the transfer is enabled
; this means that XX00 is not a valid source address
hVBlankCopyBGSource:: dw

; destination address for VBlankCopyBgMap function
hVBlankCopyBGDest:: dw

; number of rows for VBlankCopyBgMap to copy
hVBlankCopyBGNumRows:: db

; size of VBlankCopy transfer in 16-byte units
hVBlankCopySize:: db

; source address for VBlankCopy function
hVBlankCopySource:: dw

; destination address for VBlankCopy function
hVBlankCopyDest:: dw

; size of source data for VBlankCopyDouble in 8-byte units
hVBlankCopyDoubleSize:: db

; source address for VBlankCopyDouble function
hVBlankCopyDoubleSource:: dw

; destination address for VBlankCopyDouble function
hVBlankCopyDoubleDest:: dw

; controls whether a row or column of 2x2 tile blocks is redrawn in V-blank
; 00 = no redraw
; 01 = redraw column
; 02 = redraw row
hRedrawRowOrColumnMode:: db

hRedrawRowOrColumnDest:: dw

hRandomAdd:: db
hRandomSub:: db

hFrameCounter:: db ; decremented every V-blank (used for delays)

; V-blank sets this to 0 each time it runs.
; So, by setting it to a nonzero value and waiting for it to become 0 again,
; you can detect that the V-blank handler has run since then.
hVBlankOccurred:: db

; Controls which tiles are animated.
; 0 = no animations (breaks Surf)
; 1 = water tile $14 is animated
; 2 = water tile $14 and flower tile $03 are animated
hTileAnimations:: db

hMovingBGTilesCounter1:: db

	ds 1

hCurrentSpriteOffset:: db ; multiple of $10

UNION
hPlayerFacing:: db
hPlayerYCoord:: db
hPlayerXCoord:: db

NEXTU

; $00 = bag full
; $01 = got item
; $80 = didn't meet required number of owned mons
; $FF = player cancelled
hOaksAideResult::
hOaksAideRequirement:: ; required number of owned mons
	db
hOaksAideRewardItem:: db
hOaksAideNumMonsOwned:: db

NEXTU
hVendingMachineItem:: db
hVendingMachinePrice:: ds 3 ; BCD number

NEXTU
hGymGateIndex:: db
hGymGateAnswer:: db

NEXTU
hDexRatingNumMonsSeen:: db
hDexRatingNumMonsOwned:: db

NEXTU
hItemToRemoveID:: db
hItemToRemoveIndex:: db

NEXTU
hItemCounter::
hSavedCoordIndex::
hToggleableObjectIndex::
hGymTrashCanRandNumMask::
hInteractedWithBookshelf::
	db
ENDU

	ds 1

hBackupGymGateIndex::
hUnlockedSilphCoDoors::
	db

; the first tile ID in a sequence of tile IDs that increase by 1 each step
hStartTileID:: db

	ds 2

hNewPartyLength:: db

UNION
hDividend2:: db
hDivisor2::  db
hQuotient2:: db

NEXTU
hIsToggleableObjectOff:: db
ENDU

hMapROMBank:: db

hSpriteVRAMSlotAndFacing:: db

hCoordsInFrontOfPlayerMatch::
hSpriteAnimFrameCounter::
	db

UNION
hSpriteScreenYCoord:: db
hSpriteScreenXCoord:: db
hSpriteMapYCoord::    db
hSpriteMapXCoord::    db

NEXTU
hItemAlreadyFound:: db
	ds 2
hDidntFindAnyHiddenEvent:: db

NEXTU
	ds 1
hSavedMapTextPtr:: dw
	ds 1
ENDU

	ds 4

hWhoseTurn:: db ; 0 on player's turn, 1 on enemy's turn

hClearLetterPrintingDelayFlags:: db

	ds 1

; bit 0: draw HP fraction to the right of bar instead of below (for party menu)
; bit 1: menu is double spaced
; bit 2: text is single spaced
hUILayoutFlags:: db

hFieldMoveMonMenuTopMenuItemX:: db

hJoyInput:: db

hDisableJoypadPolling:: db

	ds 5

ENDSECTION
