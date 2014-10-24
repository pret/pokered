PikachuFanText::
	text "Won't you admire"
IF DEF(_YELLOW)
	line "my CLEFAIRY's"
ELSE
	line "my PIKACHU's"
ENDC
	cont "adorable tail?"
	done

PikachuFanBetterText::
IF DEF(_YELLOW)
	text "Humph! My CLEFAIRY"
ELSE
	text "Humph! My PIKACHU"
ENDC
	line "is twice as cute"
	cont "as that one!"
	done

IF DEF(_YELLOW)
PikachuFanPrintText::
	text "Our CHAIRMAN's new"
	line "hobby is taking"
	cont "#MON photos."

	para "He gave me a nice"
	line "PRINT of my cute"
	cont "CLEFAIRY."
	done
ENDC

SeelFanText::
	text "I just love my"
	line "SEEL!"

	para "It squeals when I"
	line "hug it!"
	done

SeelFanBetterText::
	text "Oh dear!"

	para "My SEEL is far"
	line "more attractive!"
	done

IF DEF(_YELLOW)
SeelFanPrintText::
	text "I'm going to hook"
	line "up the cable to"
	cont "get a photo PRINT"
	cont "of my SEEL!"
	done
ENDC

FanClubPikachuText::
IF DEF(_YELLOW)
	text "CLEFAIRY: Pippii!"
ELSE
	text "PIKACHU: Chu!"
	line "Pikachu!"
ENDC
	done

FanClubSeelText::
	text "SEEL: Kyuoo!"
	done

FanClubMeetChairText::
	text "I chair the"
	line "#MON Fan Club!"

IF DEF(_YELLOW)
	para "I have more than"
	line "100 #MON. I"
	cont "love them all!"
ELSE
	para "I have collected"
	line "over 100 #MON!"
ENDC

	para "I'm very fussy"
	line "when it comes to"
	cont "#MON!"

	para "So..."

IF DEF(_YELLOW)
	para "Did you come to"
	line "hear me brag"
ELSE
	para "Did you come"
	line "visit to hear"
ENDC
	cont "about my #MON?"
	done

FanClubChairStoryText::
	text "Good!"
	line "Then listen up!"

	para "My favorite"
	line "RAPIDASH..."

	para "It...cute..."
	line "lovely...smart..."
	cont "plus...amazing..."
	cont "you think so?..."
	cont "oh yes...it..."
	cont "stunning..."
	cont "kindly..."
	cont "love it!"

	para "Hug it...when..."
	cont "sleeping...warm"
	cont "and cuddly..."
	cont "spectacular..."
	cont "ravishing..."
	cont "...Oops! Look at"
	cont "the time! I kept"
	cont "you too long!"

	para "Thanks for hearing"
	line "me out! I want"
	cont "you to have this!"
	prompt

ReceivedBikeVoucherText::
	text $52, " received"
	line "a @"
	TX_RAM wcf4b
	text "!@@"

ExplainBikeVoucherText::
	db $0
	para "Exchange that for"
	line "a BICYCLE!"

	para "Don't worry, my"
	line "FEAROW will FLY"
	cont "me anywhere!"

	para "So, I don't need a"
	line "BICYCLE!"

	para "I hope you like"
	line "cycling!"
	done

FanClubNoStoryText::
	text "Oh. Come back"
	line "when you want to"
	cont "hear my story!"
	done

FanClubChairFinalText::
	text "Hello, ", $52, "!"

	para "Did you come see"
	line "me about my"
	cont "#MON again?"

	para "No? Too bad!"
	done

FanClubBagFullText::
	text "Make room for"
	line "this!"
	done

IF DEF(_YELLOW)
FanClubChairPrintText1::
	text "Hi there, ",$52,"!"
	line "Have you seen my"
	cont "#MON photos?"

	para "I have them framed"
	line "up on that wall."

	para "Ah, I know!"

	para "Would you like me"
	line "to take a photo"
	cont "of your #MON?"
	done

FanClubChairPrintText2::
	text "No? That's really"
	line "disappointing."
	done

FanClubChairPrintText3::
	text "OK, I'm done."
	done

FanClubChairPrintText4::
	text "Maybe we won't"
	line "PRINT this now."
	done
ENDC

_FanClubText6:: ; 9a948 (26:6948)
IF DEF(_YELLOW)
	text "Our CHAIRMAN is"
ELSE
	text "Our Chairman is"
ENDC
	line "very vocal about"
	cont "#MON."
	done

_FanClubText7:: ; 9a970 (26:6970)
	text "Let's all listen"
	line "politely to other"
	cont "trainers!"
	done

_FanClubText8:: ; 9a99d (26:699d)
	text "If someone brags,"
	line "brag right back!"
	done

