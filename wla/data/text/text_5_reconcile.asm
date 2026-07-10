; Explicit WLA-DX expansion of RGBDS text macros from data/text/text_5.asm.
_CableClubNPCPleaseComeAgainText::
	.DB TX_START, "Please come again!"
	.DB "<DONE>"

_CableClubNPCMakingPreparationsText::
	.DB TX_START, "We're making"
	.DB "<LINE>", "preparations."
	.DB "<CONT>", "Please wait."
	.DB "<DONE>"

_UsedStrengthText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " used"
	.DB "<LINE>", "STRENGTH.@"
	.DB TX_END

_CanMoveBouldersText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " can"
	.DB "<LINE>", "move boulders."
	.DB "<PROMPT>"

_CurrentTooFastText::
	.DB TX_START, "The current is"
	.DB "<LINE>", "much too fast!"
	.DB "<PROMPT>"

_CyclingIsFunText::
	.DB TX_START, "Cycling is fun!"
	.DB "<LINE>", "Forget SURFing!"
	.DB "<PROMPT>"

_FlashLightsAreaText::
	.DB TX_START, "A blinding FLASH"
	.DB "<LINE>", "lights the area!"
	.DB "<PROMPT>"

_WarpToLastPokemonCenterText::
	.DB TX_START, "Warp to the last"
	.DB "<LINE>", "#MON CENTER."
	.DB "<DONE>"

_CannotUseTeleportNowText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " can't"
	.DB "<LINE>", "use TELEPORT now."
	.DB "<PROMPT>"

_CannotFlyHereText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " can't"
	.DB "<LINE>", "FLY here."
	.DB "<PROMPT>"

_NotHealthyEnoughText::
	.DB TX_START, "Not healthy"
	.DB "<LINE>", "enough."
	.DB "<PROMPT>"

_NewBadgeRequiredText::
	.DB TX_START, "No! A new BADGE"
	.DB "<LINE>", "is required."
	.DB "<PROMPT>"

_CannotUseItemsHereText::
	.DB TX_START, "You can't use items"
	.DB "<LINE>", "here."
	.DB "<PROMPT>"

_CannotGetOffHereText::
	.DB TX_START, "You can't get off"
	.DB "<LINE>", "here."
	.DB "<PROMPT>"

_GotMonText::
	.DB TX_START, "<PLAYER> got"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "!@"
	.DB TX_END

_SentToBoxText::
	.DB TX_START, "There's no more"
	.DB "<LINE>", "room for #MON!"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wBoxMonNicks
	.DB TX_START, " was"
	.DB "<CONT>", "sent to #MON"
	.DB "<CONT>", "BOX @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " on PC!"
	.DB "<DONE>"

_BoxIsFullText::
	.DB TX_START, "There's no more"
	.DB "<LINE>", "room for #MON!"

	.DB "<PARA>", "The #MON BOX"
	.DB "<LINE>", "is full and can't"
	.DB "<CONT>", "accept any more!"

	.DB "<PARA>", "Change the BOX at"
	.DB "<LINE>", "a #MON CENTER!"
	.DB "<DONE>"
