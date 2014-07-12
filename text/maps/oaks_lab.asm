_OaksLabGaryText1:: ; 94d5b (25:4d5b)
	text $53, ": Yo"
	line $52, "! Gramps"
	cont "isn't around!"
	done

_OaksLabText40:: ; 94d79 (25:4d79)
	text $53, ": Heh, I"
	line "don't need to be"
	cont "greedy like you!"

	para "Go ahead and"
	line "choose, ", $52, "!"
	done

_OaksLabText41:: ; 94dbd (25:4dbd)
	text $53, ": My"
	line "#MON looks a"
	cont "lot stronger."
	done

_OaksLabText39:: ; 94ddf (25:4ddf)
	text "Those are #"
	line "BALLs. They"
	cont "contain #MON!"
	done

_OaksLabCharmanderText:: ; 94e06 (25:4e06)
	text "So! You want the"
	line "fire #MON,"
	cont "CHARMANDER?"
	done

_OaksLabSquirtleText:: ; 94e2f (25:4e2f)
	text "So! You want the"
	line "water #MON,"
	cont "SQUIRTLE?"
	done

_OaksLabBulbasaurText:: ; 94e57 (25:4e57)
	text "So! You want the"
	line "plant #MON,"
	cont "BULBASAUR?"
	done

_OaksLabMonEnergeticText:: ; 94e80 (25:4e80)
	text "This #MON is"
	line "really energetic!"
	prompt

_OaksLabReceivedMonText:: ; 94ea0 (25:4ea0)
	text $52, " received"
	line "a @"
	TX_RAM wcd6d
	text "!@@"

_OaksLabLastMonText:: ; 94eb6 (25:4eb6)
	text "That's PROF.OAK's"
	line "last #MON!"
	done

_OaksLabText_1d2f0:: ; 94ed2 (25:4ed2)
	text "OAK: Now, ", $52, ","
	line "which #MON do"
	cont "you want?"
	done

_OaksLabText_1d2f5:: ; 94ef8 (25:4ef8)
	text "OAK: If a wild"
	line "#MON appears,"
	cont "your #MON can"
	cont "fight against it!"
	done

_OaksLabText_1d2fa:: ; 94f36 (25:4f36)
	text "OAK: ", $52, ","
	line "raise your young"
	cont "#MON by making"
	cont "it fight!"
	done

_OaksLabDeliverParcelText1:: ; 94f69 (25:4f69)
	text "OAK: Oh, ", $52, "!"

	para "How is my old"
	line "#MON?"

	para "Well, it seems to"
	line "like you a lot."

	para "You must be"
	line "talented as a"
	cont "#MON trainer!"

	para "What? You have"
	line "something for me?"

	para $52, " delivered"
	line "OAK's PARCEL.@@"

_OaksLabDeliverParcelText2:: ; 9500f (25:500f)
	db $0
	para "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thank you!"
	done

_OaksLabAroundWorldText:: ; 95045 (25:5045)
	text "#MON around the"
	line "world wait for"
	cont "you, ", $52, "!"
	done

_OaksLabGivePokeballsText1:: ; 9506d (25:506d)
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para $52, " got 5"
	line "# BALLs!@@"

_OaksLabGivePokeballsText2:: ; 950f2 (25:50f2)
	db $0
	para "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and try"
	line "to catch it!"

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "could escape. You"
	cont "have to be lucky!"
	done

_OaksLabPleaseVisitText:: ; 9519e (25:519e)
	text "OAK: Come see me"
	line "sometimes."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done

_OaksLabText_1d31d:: ; 951e9 (25:51e9)
	text "OAK: Good to see "
	line "you! How is your "
	cont "#DEX coming? "
	cont "Here, let me take"
	cont "a look!"
	prompt

_OaksLabText_1d32c:: ; 95236 (25:5236)
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

_OaksLabText8:: ; 95268 (25:5268)
	text "?"
	done

_OaksLabText_1d340:: ; 9526b (25:526b)
	text "PROF.OAK is the"
	line "authority on"
	cont "#MON!"

	para "Many #MON"
	line "trainers hold him"
	cont "in high regard!"
	done

_OaksLabRivalWaitingText:: ; 952bb (25:52bb)
	text $53, ": Gramps!"
	line "I'm fed up with"
	cont "waiting!"
	done

_OaksLabChooseMonText:: ; 952df (25:52df)
	text "OAK: ", $53, "?"
	line "Let me think..."

	para "Oh, that's right,"
	line "I told you to"
	cont "come! Just wait!"

	para "Here, ", $52, "!"

	para "There are 3"
	line "#MON here!"

	para "Haha!"

	para "They are inside"
	line "the # BALLs."

	para "When I was young,"
	line "I was a serious"
	cont "#MON trainer!"

	para "In my old age, I"
	line "have only 3 left,"
	cont "but you can have"
	cont "one! Choose!"
	done

_OaksLabRivalInterjectionText:: ; 953dc (25:53dc)
	text $53, ": Hey!"
	line "Gramps! What"
	cont "about me?"
	done

_OaksLabBePatientText:: ; 953fc (25:53fc)
	text "OAK: Be patient!"
	line $53, ", you can"
	cont "have one too!"
	done

_OaksLabLeavingText:: ; 95427 (25:5427)
	text "OAK: Hey! Don't go"
	line "away yet!"
	done

_OaksLabRivalPickingMonText:: ; 95444 (25:5444)
	text $53, ": I'll take"
	line "this one, then!"
	done

_OaksLabRivalReceivedMonText:: ; 95461 (25:5461)
	text $53, " received"
	line "a @"
	TX_RAM wcd6d
	text "!@@"

_OaksLabRivalChallengeText:: ; 95477 (25:5477)
	text $53, ": Wait"
	line $52, "!"
	cont "Let's check out"
	cont "our #MON!"

	para "Come on, I'll take"
	line "you on!"
	done

_OaksLabText_1d3be:: ; 954b6 (25:54b6)
	text "WHAT?"
	line "Unbelievable!"
	cont "I picked the"
	cont "wrong #MON!"
	prompt

_OaksLabText_1d3c3:: ; 954e4 (25:54e4)
	text $53, ": Yeah! Am"
	line "I great or what?"
	prompt

_OaksLabRivalToughenUpText:: ; 95502 (25:5502)
	text $53, ": Okay!"
	line "I'll make my"
	cont "#MON fight to"
	cont "toughen it up!"

	para $52, "! Gramps!"
	line "Smell you later!"
	done

_OaksLabText21:: ; 95551 (25:5551)
	text $53, ": Gramps!"
	done

_OaksLabText22:: ; 9555d (25:555d)
	text $53, ": What did"
	line "you call me for?"
	done

_OaksLabText23:: ; 9557b (25:557b)
	text "OAK: Oh right! I"
	line "have a request"
	cont "of you two."
	done

_OaksLabText24:: ; 955a8 (25:55a8)
	text "On the desk there"
	line "is my invention,"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"

	para "It's a hi-tech"
	line "encyclopedia!"
	done

_OaksLabText25:: ; 9562a (25:562a)
	text "OAK: ", $52, " and"
	line $53, "! Take"
	cont "these with you!"

	para $52, " got"
	line "#DEX from OAK!@@"

_OaksLabText26:: ; 95664 (25:5664)
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world..."

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

_OaksLabText27:: ; 95741 (25:5741)
	text $53, ": Alright"
	line "Gramps! Leave it"
	cont "all to me!"

	para $52, ", I hate to"
	line "say it, but I"
	cont "don't need you!"

	para "I know! I'll"
	line "borrow a TOWN MAP"
	cont "from my sis!"

	para "I'll tell her not"
	line "to lend you one,"
	cont $52, "! Hahaha!"
	done

_OaksLabText_1d405:: ; 957eb (25:57eb)
	text "I study #MON as"
	line "PROF.OAK's AIDE."
	done

_OaksLabText_441cc:: ; 9580c (25:580c)
	text "#DEX comp-"
	line "letion is:"

	para "@"
	TX_NUM $ffdb, 1, 3
	text " #MON seen"
	line "@"
	TX_NUM $ffdc, 1, 3
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	prompt

_OaksLabText_44201:: ; 95858 (25:5858)
	text "You still have"
	line "lots to do."
	cont "Look for #MON"
	cont "in grassy areas!"
	done

_OaksLabText_44206:: ; 95893 (25:5893)
	text "You're on the"
	line "right track! "
	cont "Get a FLASH HM"
	cont "from my AIDE!"
	done

_OaksLabText_4420b:: ; 958cc (25:58cc)
	text "You still need"
	line "more #MON!"
	cont "Try to catch"
	cont "other species!"
	done

_OaksLabText_44210:: ; 95903 (25:5903)
	text "Good, you're"
	line "trying hard!"
	cont "Get an ITEMFINDER"
	cont "from my AIDE!"
	done

_OaksLabText_44215:: ; 9593d (25:593d)
	text "Looking good!"
	line "Go find my AIDE"
	cont "when you get 50!"
	done

_OaksLabText_4421a:: ; 9596d (25:596d)
	text "You finally got at"
	line "least 50 species!"
	cont "Be sure to get"
	cont "EXP.ALL from my"
	cont "AIDE!"
	done

_OaksLabText_4421f:: ; 959b8 (25:59b8)
	text "Ho! This is geting"
	line "even better!"
	done

_OaksLabText_44224:: ; 959d9 (25:59d9)
	text "Very good!"
	line "Go fish for some"
	cont "marine #MON!"
	done

_OaksLabText_44229:: ; 95a03 (25:5a03)
	text "Wonderful!"
	line "Do you like to"
	cont "collect things?"
	done

_OaksLabText_4422e:: ; 95a2e (25:5a2e)
	text "I'm impressed!"
	line "It must have been"
	cont "difficult to do!"
	done

_OaksLabText_44233:: ; 95a60 (25:5a60)
	text "You finally got at"
	line "least 100 species!"
	cont "I can't believe"
	cont "how good you are!"
	done

_OaksLabText_44238:: ; 95aa8 (25:5aa8)
	text "You even have the"
	line "evolved forms of"
	cont "#MON! Super!"
	done

_OaksLabText_4423d:: ; 95ad9 (25:5ad9)
	text "Excellent! Trade"
	line "with friends to"
	cont "get some more!"
	done

_OaksLabText_44242:: ; 95b0a (25:5b0a)
	text "Outstanding!"
	line "You've become a"
	cont "real pro at this!"
	done

_OaksLabText_44247:: ; 95b39 (25:5b39)
	text "I have nothing"
	line "left to say!"
	cont "You're the"
	cont "authority now!"
	done

_OaksLabText_4424c:: ; 95b6f (25:5b6f)
	text "Your #DEX is"
	line "entirely complete!"
	cont "Congratulations!"
	done

