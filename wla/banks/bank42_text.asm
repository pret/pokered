; Native WLA-DX structured form of RGBDS Text 11 / data/text/text_7.asm.
; String bytes are encoded through the authoritative Pokemon charmap.
.DEFINE TX_START $00
.DEFINE TX_RAM $01
.DEFINE TX_END $50
.DEFINE wInGameTradeGiveMonName $CD13
.DEFINE wInGameTradeReceiveMonName $CD1E
.STRINGMAPTABLE pokemon "wla/pokemon.tbl"

_ItemUseText001::
	.DB TX_START
	.STRINGMAP pokemon, "<PLAYER> used@"
	.DB TX_END

_ItemUseText002::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.STRINGMAP pokemon, "!"
	.STRINGMAP pokemon, "<DONE>"

_GotOnBicycleText1::
	.DB TX_START
	.STRINGMAP pokemon, "<PLAYER> got on the@"
	.DB TX_END

_GotOnBicycleText2::
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.STRINGMAP pokemon, "!"
	.STRINGMAP pokemon, "<PROMPT>"

_GotOffBicycleText1::
	.DB TX_START
	.STRINGMAP pokemon, "<PLAYER> got off@"
	.DB TX_END

_GotOffBicycleText2::
	.DB TX_START
	.STRINGMAP pokemon, "the @"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.STRINGMAP pokemon, "."
	.STRINGMAP pokemon, "<PROMPT>"

_ThrewAwayItemText::
	.DB TX_START
	.STRINGMAP pokemon, "Threw away"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.STRINGMAP pokemon, "."
	.STRINGMAP pokemon, "<PROMPT>"

_IsItOKToTossItemText::
	.DB TX_START
	.STRINGMAP pokemon, "Is it OK to toss"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.STRINGMAP pokemon, "?"
	.STRINGMAP pokemon, "<PROMPT>"

_TooImportantToTossText::
	.DB TX_START
	.STRINGMAP pokemon, "That's too impor-"
	.STRINGMAP pokemon, "<LINE>tant to toss!"
	.STRINGMAP pokemon, "<PROMPT>"

_AlreadyKnowsText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.STRINGMAP pokemon, " knows"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wStringBuffer
	.DB TX_START
	.STRINGMAP pokemon, "!"
	.STRINGMAP pokemon, "<PROMPT>"

_ConnectCableText::
	.DB TX_START
	.STRINGMAP pokemon, "Okay, connect the"
	.STRINGMAP pokemon, "<LINE>cable like so!"
	.STRINGMAP pokemon, "<PROMPT>"

_TradedForText::
	.DB TX_START
	.STRINGMAP pokemon, "<PLAYER> traded"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, " for"
	.STRINGMAP pokemon, "<CONT>@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "!@"
	.DB TX_END

_WannaTrade1Text::
	.DB TX_START
	.STRINGMAP pokemon, "I'm looking for"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "! Wanna"

	.STRINGMAP pokemon, "<PARA>trade one for"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "? "
	.STRINGMAP pokemon, "<DONE>"

_NoTrade1Text::
	.DB TX_START
	.STRINGMAP pokemon, "Awww!"
	.STRINGMAP pokemon, "<LINE>Oh well..."
	.STRINGMAP pokemon, "<DONE>"

_WrongMon1Text::
	.DB TX_START
	.STRINGMAP pokemon, "What? That's not"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "!"

	.STRINGMAP pokemon, "<PARA>If you get one,"
	.STRINGMAP pokemon, "<LINE>come back here!"
	.STRINGMAP pokemon, "<DONE>"

_Thanks1Text::
	.DB TX_START
	.STRINGMAP pokemon, "Hey thanks!"
	.STRINGMAP pokemon, "<DONE>"

_AfterTrade1Text::
	.DB TX_START
	.STRINGMAP pokemon, "Isn't my old"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START
	.STRINGMAP pokemon, " great?"
	.STRINGMAP pokemon, "<DONE>"

_WannaTrade2Text::
	.DB TX_START
	.STRINGMAP pokemon, "Hello there! Do"
	.STRINGMAP pokemon, "<LINE>you want to trade"

	.STRINGMAP pokemon, "<PARA>your @"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "<LINE>for @"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "?"
	.STRINGMAP pokemon, "<DONE>"

_NoTrade2Text::
	.DB TX_START
	.STRINGMAP pokemon, "Well, if you"
	.STRINGMAP pokemon, "<LINE>don't want to..."
	.STRINGMAP pokemon, "<DONE>"

_WrongMon2Text::
	.DB TX_START
	.STRINGMAP pokemon, "Hmmm? This isn't"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "."

	.STRINGMAP pokemon, "<PARA>Think of me when"
	.STRINGMAP pokemon, "<LINE>you get one."
	.STRINGMAP pokemon, "<DONE>"

_Thanks2Text::
	.DB TX_START
	.STRINGMAP pokemon, "Thanks!"
	.STRINGMAP pokemon, "<DONE>"

_AfterTrade2Text::
	.DB TX_START
	.STRINGMAP pokemon, "The @"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, " you"
	.STRINGMAP pokemon, "<LINE>traded to me"

	.STRINGMAP pokemon, "<PARA>went and evolved!"
	.STRINGMAP pokemon, "<DONE>"

_WannaTrade3Text::
	.DB TX_START
	.STRINGMAP pokemon, "Hi! Do you have"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "?"

	.STRINGMAP pokemon, "<PARA>Want to trade it"
	.STRINGMAP pokemon, "<LINE>for @"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "?"
	.STRINGMAP pokemon, "<DONE>"

_NoTrade3Text::
	.DB TX_START
	.STRINGMAP pokemon, "That's too bad."
	.STRINGMAP pokemon, "<DONE>"

_WrongMon3Text::
	.DB TX_START
	.STRINGMAP pokemon, "...This is no"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "."

	.STRINGMAP pokemon, "<PARA>If you get one,"
	.STRINGMAP pokemon, "<LINE>trade it with me!"
	.STRINGMAP pokemon, "<DONE>"

_Thanks3Text::
	.DB TX_START
	.STRINGMAP pokemon, "Thanks pal!"
	.STRINGMAP pokemon, "<DONE>"

_AfterTrade3Text::
	.DB TX_START
	.STRINGMAP pokemon, "How is my old"
	.STRINGMAP pokemon, "<LINE>@"
	.DB TX_RAM
	.DW wInGameTradeReceiveMonName
	.DB TX_START
	.STRINGMAP pokemon, "?"

	.STRINGMAP pokemon, "<PARA>My @"
	.DB TX_RAM
	.DW wInGameTradeGiveMonName
	.DB TX_START
	.STRINGMAP pokemon, " is"
	.STRINGMAP pokemon, "<LINE>doing great!"
	.STRINGMAP pokemon, "<DONE>"

_NothingToCutText::
	.DB TX_START
	.STRINGMAP pokemon, "There isn't"
	.STRINGMAP pokemon, "<LINE>anything to CUT!"
	.STRINGMAP pokemon, "<PROMPT>"

_UsedCutText::
	.DB TX_RAM
	.DW wNameBuffer
	.DB TX_START
	.STRINGMAP pokemon, " hacked"
	.STRINGMAP pokemon, "<LINE>away with CUT!"
	.STRINGMAP pokemon, "<PROMPT>"

Bank42TextEnd::
