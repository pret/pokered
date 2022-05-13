_CableClubNPCPleaseComeAgainText::
	text "Please come again!"
	done

_CableClubNPCMakingPreparationsText::
	text "We're making"
	line "preparations."
	cont "Please wait."
	done

_UsedStrengthText::
	text_ram wcd6d
	text " used"
	line "STRENGTH.@"
	text_end

_CanMoveBouldersText::
	text_ram wcd6d
	text " can"
	line "move boulders."
	prompt

_CurrentTooFastText::
	text "The current is"
	line "much too fast!"
	prompt

_CyclingIsFunText::
	text "Cycling is fun!"
	line "Forget SURFing!"
	prompt

_FlashLightsAreaText::
	text "A blinding FLASH"
	line "lights the area!"
	prompt

_WantToTeleportText::
	text "Warp to the last"
	line "#MON CENTER?"
	prompt

_PocketAbraFlavorText1::
	text_ram wPocketAbraNick
	text " "
	line "grabbed your"
	cont "hand quickly in"
	cont "anticipation."
	prompt

_PocketAbraFlavorText2::
	text_ram wPocketAbraNick
	text " looks"
	line "very excited!"
	prompt

_PocketAbraFlavorText3::
	text_ram wPocketAbraNick
	text " was"
	line "dozing off in"
	cont "your bag."
	prompt

_PocketAbraFlavorText4::
	text_ram wPocketAbraNick
	text " sat"
	line "on your shoulder"
	cont "comfily."
	prompt

_PocketAbraFlavorText5::
	text_ram wPocketAbraNick
	text " "
	line "focused with"
	cont "all its might!"
	prompt

_PocketAbraNo::
	text_ram wPocketAbraNick
	text " looks"
	line "disappointed..."
	prompt

_WarpToLastPokemonCenterText::
	text "Warp to the last"
	line "#MON CENTER."
	prompt

_CannotUseTeleportNowText::
	text_ram wcd6d
	text " can't"
	line "use TELEPORT now."
	prompt

_CannotFlyHereText::
	text_ram wcd6d
	text " can't"
	line "FLY here."
	prompt

_NotHealthyEnoughText::
	text "Not healthy"
	line "enough."
	prompt

_NewBadgeRequiredText::
	text "No! A new BADGE"
	line "is required."
	prompt

_CannotUseItemsHereText::
	text "You can't use items"
	line "here."
	prompt

_CannotGetOffHereText::
	text "You can't get off"
	line "here."
	prompt

_GotMonText::
	text "<PLAYER> got"
	line "@"
	text_ram wcd6d
	text "!@"
	text_end

_SentToBoxText::
	text "There's no more"
	line "room for #MON!"
	cont "@"
	text_ram wBoxMonNicks
	text " was"
	cont "sent to #MON"
	cont "BOX @"
	text_ram wStringBuffer
	text " on PC!"
	done

_BoxIsFullText::
	text "There's no more"
	line "room for #MON!"

	para "The #MON BOX"
	line "is full and can't"
	cont "accept any more!"

	para "Change the BOX at"
	line "a #MON CENTER!"
	done
