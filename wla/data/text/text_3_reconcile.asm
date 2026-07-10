; Explicit WLA-DX expansion of RGBDS text macros from data/text/text_3.asm.
_FileDataDestroyedText::
	.DB TX_START, "The file data is"
	.DB "<LINE>", "destroyed!"
	.DB "<PROMPT>"

_WouldYouLikeToSaveText::
	.DB TX_START, "Would you like to"
	.DB "<LINE>", "SAVE the game?"
	.DB "<DONE>"

_GameSavedText::
	.DB TX_START, "<PLAYER> saved"
	.DB "<LINE>", "the game!"
	.DB "<DONE>"

_OlderFileWillBeErasedText::
	.DB TX_START, "The older file"
	.DB "<LINE>", "will be erased to"
	.DB "<CONT>", "save. Okay?"
	.DB "<DONE>"

_WhenYouChangeBoxText::
	.DB TX_START, "When you change a"
	.DB "<LINE>", "#MON BOX, data"
	.DB "<CONT>", "will be saved."

	.DB "<PARA>", "Is that okay?"
	.DB "<DONE>"

_ChooseABoxText::
	.DB TX_START, "Choose a"
	.DB "<LINE>", "<PKMN> BOX.@"
	.DB TX_END

_EvolvedText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, " evolved"
	.DB "<DONE>"

_IntoText::
	.DB TX_START
	.DB "<LINE>", "into @"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "!"
	.DB "<DONE>"

_StoppedEvolvingText::
	.DB TX_START, "Huh? @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.DB "<LINE>", "stopped evolving!"
	.DB "<PROMPT>"

_IsEvolvingText::
	.DB TX_START, "What? @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.DB "<LINE>", "is evolving!"
	.DB "<DONE>"

_FellAsleepText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "fell asleep!"
	.DB "<PROMPT>"

_AlreadyAsleepText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "already asleep!"
	.DB "<PROMPT>"

_PoisonedText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "was poisoned!"
	.DB "<PROMPT>"

_BadlyPoisonedText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "badly poisoned!"
	.DB "<PROMPT>"

_BurnedText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "was burned!"
	.DB "<PROMPT>"

_FrozenText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "was frozen solid!"
	.DB "<PROMPT>"

_FireDefrostedText::
	.DB TX_START, "Fire defrosted"
	.DB "<LINE>", "<TARGET>!"
	.DB "<PROMPT>"

_MonsStatsRoseText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "@"
	.DB TX_END

_GreatlyRoseText::
	.DB TX_START, "<SCROLL>greatly@"
	.DB TX_END

_RoseText::
	.DB TX_START, " rose!"
	.DB "<PROMPT>"

_MonsStatsFellText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "@"
	.DB TX_END

_GreatlyFellText::
	.DB TX_START, "<SCROLL>greatly@"
	.DB TX_END

_FellText::
	.DB TX_START, " fell!"
	.DB "<PROMPT>"

_RanFromBattleText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "ran from battle!"
	.DB "<PROMPT>"

_RanAwayScaredText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "ran away scared!"
	.DB "<PROMPT>"

_WasBlownAwayText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "was blown away!"
	.DB "<PROMPT>"

_ChargeMoveEffectText::
	.DB TX_START, "<USER>@"
	.DB TX_END

_MadeWhirlwindText::
	.DB TX_START
	.DB "<LINE>", "made a whirlwind!"
	.DB "<PROMPT>"

_TookInSunlightText::
	.DB TX_START
	.DB "<LINE>", "took in sunlight!"
	.DB "<PROMPT>"

_LoweredItsHeadText::
	.DB TX_START
	.DB "<LINE>", "lowered its head!"
	.DB "<PROMPT>"

_SkyAttackGlowingText::
	.DB TX_START
	.DB "<LINE>", "is glowing!"
	.DB "<PROMPT>"

_FlewUpHighText::
	.DB TX_START
	.DB "<LINE>", "flew up high!"
	.DB "<PROMPT>"

_DugAHoleText::
	.DB TX_START
	.DB "<LINE>", "dug a hole!"
	.DB "<PROMPT>"

_BecameConfusedText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "became confused!"
	.DB "<PROMPT>"

_MimicLearnedMoveText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "learned"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "!"
	.DB "<PROMPT>"

_MoveWasDisabledText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, " was"
	.DB "<CONT>", "disabled!"
	.DB "<PROMPT>"

_NothingHappenedText::
	.DB TX_START, "Nothing happened!"
	.DB "<PROMPT>"

_NoEffectText::
	.DB TX_START, "No effect!"
	.DB "<PROMPT>"

_ButItFailedText::
	.DB TX_START, "But, it failed! "
	.DB "<PROMPT>"

_DidntAffectText::
	.DB TX_START, "It didn't affect"
	.DB "<LINE>", "<TARGET>!"
	.DB "<PROMPT>"

_IsUnaffectedText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "is unaffected!"
	.DB "<PROMPT>"

_ParalyzedMayNotAttackText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "paralyzed! It may"
	.DB "<CONT>", "not attack!"
	.DB "<PROMPT>"

_SubstituteText::
	.DB TX_START, "It created a"
	.DB "<LINE>", "SUBSTITUTE!"
	.DB "<PROMPT>"

_HasSubstituteText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "has a SUBSTITUTE!"
	.DB "<PROMPT>"

_TooWeakSubstituteText::
	.DB TX_START, "Too weak to make"
	.DB "<LINE>", "a SUBSTITUTE!"
	.DB "<PROMPT>"

_CoinsScatteredText::
	.DB TX_START, "Coins scattered"
	.DB "<LINE>", "everywhere!"
	.DB "<PROMPT>"

_GettingPumpedText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "getting pumped!"
	.DB "<PROMPT>"

_WasSeededText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "was seeded!"
	.DB "<PROMPT>"

_EvadedAttackText::
	.DB TX_START, "<TARGET>"
	.DB "<LINE>", "evaded attack!"
	.DB "<PROMPT>"

_HitWithRecoilText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "hit with recoil!"
	.DB "<PROMPT>"

_ConvertedTypeText::
	.DB TX_START, "Converted type to"
	.DB "<LINE>", "<TARGET>'s!"
	.DB "<PROMPT>"

_StatusChangesEliminatedText::
	.DB TX_START, "All STATUS changes"
	.DB "<LINE>", "are eliminated!"
	.DB "<PROMPT>"

_StartedSleepingEffect::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "started sleeping!"
	.DB "<DONE>"

_FellAsleepBecameHealthyText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "fell asleep and"
	.DB "<CONT>", "became healthy!"
	.DB "<DONE>"

_RegainedHealthText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "regained health!"
	.DB "<PROMPT>"

_TransformedText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "transformed into"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "!"
	.DB "<PROMPT>"

_LightScreenProtectedText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "protected against"
	.DB "<CONT>", "special attacks!"
	.DB "<PROMPT>"

_ReflectGainedArmorText::
	.DB TX_START, "<USER>"
	.DB "<LINE>", "gained armor!"
	.DB "<PROMPT>"

_ShroudedInMistText::
	.DB TX_START, "<USER>'s"
	.DB "<LINE>", "shrouded in mist!"
	.DB "<PROMPT>"

_SuckedHealthText::
	.DB TX_START, "Sucked health from"
	.DB "<LINE>", "<TARGET>!"
	.DB "<PROMPT>"

_DreamWasEatenText::
	.DB TX_START, "<TARGET>'s"
	.DB "<LINE>", "dream was eaten!"
	.DB "<PROMPT>"

_TradeCenterOpponentText::
	.DB TX_START, "!"
	.DB "<DONE>"

_ColosseumOpponentText::
	.DB TX_START, "!"
	.DB "<DONE>"
