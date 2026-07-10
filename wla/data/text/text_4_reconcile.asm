; Explicit WLA-DX expansion of RGBDS text macros from data/text/text_4.asm.
_PokemartGreetingText::
	.DB TX_START, "Hi there!"
	.DB "<NEXT>", "May I help you?"
	.DB "<DONE>"

_PokemonFaintedText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.DB "<LINE>", "fainted!"
	.DB "<DONE>"

_PlayerBlackedOutText::
	.DB TX_START, "<PLAYER> is out of"
	.DB "<LINE>", "useable #MON!"

	.DB "<PARA>", "<PLAYER> blacked"
	.DB "<LINE>", "out!"
	.DB "<PROMPT>"

_RepelWoreOffText::
	.DB TX_START, "REPEL's effect"
	.DB "<LINE>", "wore off."
	.DB "<DONE>"

_PokemartBuyingGreetingText::
	.DB TX_START, "Take your time."
	.DB "<DONE>"

_PokemartTellBuyPriceText::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "?"
	.DB "<LINE>", "That will be"
	.DB "<CONT>", "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	.DB TX_START, ". OK?"
	.DB "<DONE>"

_PokemartBoughtItemText::
	.DB TX_START, "Here you are!"
	.DB "<LINE>", "Thank you!"
	.DB "<PROMPT>"

_PokemartNotEnoughMoneyText::
	.DB TX_START, "You don't have"
	.DB "<LINE>", "enough money."
	.DB "<PROMPT>"

_PokemartItemBagFullText::
	.DB TX_START, "You can't carry"
	.DB "<LINE>", "any more items."
	.DB "<PROMPT>"

_PokemonSellingGreetingText::
	.DB TX_START, "What would you"
	.DB "<LINE>", "like to sell?"
	.DB "<DONE>"

_PokemartTellSellPriceText::
	.DB TX_START, "I can pay you"
	.DB "<LINE>", "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	.DB TX_START, " for that."
	.DB "<DONE>"

_PokemartItemBagEmptyText::
	.DB TX_START, "You don't have"
	.DB "<LINE>", "anything to sell."
	.DB "<PROMPT>"

_PokemartUnsellableItemText::
	.DB TX_START, "I can't put a"
	.DB "<LINE>", "price on that."
	.DB "<PROMPT>"

_PokemartThankYouText::
	.DB TX_START, "Thank you!"
	.DB "<DONE>"

_PokemartAnythingElseText::
	.DB TX_START, "Is there anything"
	.DB "<LINE>", "else I can do?"
	.DB "<DONE>"

_LearnedMove1Text::
	.DB TX_RAM
	.DW wLearnMoveMonName
	.DB TX_START, " learned"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!@"
	.DB TX_END

_WhichMoveToForgetText::
	.DB TX_START, "Which move should"
	.DB "<NEXT>", "be forgotten?"
	.DB "<DONE>"

_AbandonLearningText::
	.DB TX_START, "Abandon learning"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "?"
	.DB "<DONE>"

_DidNotLearnText::
	.DB TX_RAM
	.DW wLearnMoveMonName
	.DB TX_START
	.DB "<LINE>", "did not learn"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!"
	.DB "<PROMPT>"

_TryingToLearnText::
	.DB TX_RAM
	.DW wLearnMoveMonName
	.DB TX_START, " is"
	.DB "<LINE>", "trying to learn"
	.DB "<CONT>", "@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "!"

	.DB "<PARA>", "But, @"
	.DB TX_RAM
	.DW wLearnMoveMonName
	.DB TX_START
	.DB "<LINE>", "can't learn more"
	.DB "<CONT>", "than 4 moves!"

	.DB "<PARA>", "Delete an older"
	.DB "<LINE>", "move to make room"
	.DB "<CONT>", "for @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START, "?"
	.DB "<DONE>"

_OneTwoAndText::
	.DB TX_START, "1, 2 and...@"
	.DB TX_END

_PoofText::
	.DB TX_START, " Poof!@"
	.DB TX_END

_ForgotAndText::
	.DB TX_START
	.DB "<PARA>", "@"
	.DB TX_RAM
	.DW wLearnMoveMonName
	.DB TX_START, " forgot"
	.DB "<LINE>", "@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START, "!"

	.DB "<PARA>", "And..."
	.DB "<PROMPT>"

_HMCantDeleteText::
	.DB TX_START, "HM techniques"
	.DB "<LINE>", "can't be deleted!"
	.DB "<PROMPT>"

_PokemonCenterWelcomeText::
	.DB TX_START, "Welcome to our"
	.DB "<LINE>", "#MON CENTER!"

	.DB "<PARA>", "We heal your"
	.DB "<LINE>", "#MON back to"
	.DB "<CONT>", "perfect health!"
	.DB "<PROMPT>"

_ShallWeHealYourPokemonText::
	.DB TX_START, "Shall we heal your"
	.DB "<LINE>", "#MON?"
	.DB "<DONE>"

_NeedYourPokemonText::
	.DB TX_START, "OK. We'll need"
	.DB "<LINE>", "your #MON."
	.DB "<DONE>"

_PokemonFightingFitText::
	.DB TX_START, "Thank you!"
	.DB "<LINE>", "Your #MON are"
	.DB "<CONT>", "fighting fit!"
	.DB "<PROMPT>"

_PokemonCenterFarewellText::
	.DB TX_START, "We hope to see"
	.DB "<LINE>", "you again!"
	.DB "<DONE>"

_CableClubNPCAreaReservedFor2FriendsLinkedByCableText::
	.DB TX_START, "This area is"
	.DB "<LINE>", "reserved for 2"
	.DB "<CONT>", "friends who are"
	.DB "<CONT>", "linked by cable."
	.DB "<DONE>"

_CableClubNPCWelcomeText::
	.DB TX_START, "Welcome to the"
	.DB "<LINE>", "Cable Club!"
	.DB "<DONE>"

_CableClubNPCPleaseApplyHereHaveToSaveText::
	.DB TX_START, "Please apply here."

	.DB "<PARA>", "Before opening"
	.DB "<LINE>", "the link, we have"
	.DB "<CONT>", "to save the game."
	.DB "<DONE>"

_CableClubNPCPleaseWaitText::
	.DB TX_START, "Please wait.@"
	.DB TX_END

_CableClubNPCLinkClosedBecauseOfInactivityText::
	.DB TX_START, "The link has been"
	.DB "<LINE>", "closed because of"
	.DB "<CONT>", "inactivity."

	.DB "<PARA>", "Please contact"
	.DB "<LINE>", "your friend and"
	.DB "<CONT>", "come again!"
	.DB "<DONE>"
