_ChiefMonologue::
	text "CHIEF: <PLAYER>!"
	line "Congratulations"
	cont "for making it"
	cont "this far. I'm" 
	cont "sure it was an"
	cont "arduous task."

	para "However, I can't" 
	line "let you leave"
	cont "this place. You"
	cont "are still looking"
	cont "for the ultimate"
	cont "#MON, aren't"
	cont "you?"

	para "That MASTER"
	line "BALL... I should"
	cont "never have given"
	cont "it to you! With"
	cont "MEWTWO loose and"
	cont "GIOVANNI gone,"
	cont "our company is"
	cont "going under!"

	para "Now there's only"
	line "one way to catch" 
	cont "MEWTWO, and it's"
	cont "in your hands!" 
	
	para "<PLAYER>! Give me"
	line "that BALL!"
	prompt

_ChiefDefeatedText::
	text "No!"
	line "I...I..."
	prompt

_ChiefVictoryText::
	text "Ha!"
	line "Now hand it over!"
	prompt

_ChiefAfterBattleText::
	text "CHIEF: I suppose"
	line "the child that"
	cont "brought down"
	cont "GIOVANNI has to"
	cont "be stronger than"
	cont "me. No product"
	cont "I have can"
	cont "trounce you."

	para "I wanted to make"
	line "an ultimate BALL"
	cont "for a perfect"
	cont "#MON."
	
	para "Something we can"
	line "mass produce."
	
	para "Perhaps it wasn't"
	line "meant to be..." 

	para "Go."
	
	para "Otherwise..."
	line "MEWTWO's hatred"
	cont "will crush this"
	cont "world."
	
	done

_CandyJarPreReceiveText::
	text "I want you to"
	line "have this."
	
	done

_ReceivedCandyJarText::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CandyJarExplanationText::
	text "When researching"
	line "MEW, GIOVANNI"
	cont "discovered one"
	cont "more mythical"
	cont "#MON."
	
	para "Its name is"
	line "MELTAN. It loves"
	cont "a certain kind"
	cont "of CANDY."
	
	para "Give it this"
	line "JAR. It will"
	cont "become extremely"
	cont "powerful."
	done

_CandyJarNoRoomText::
	text "Ah, your BAG"
	line "is full. I'll"
	cont "hold onto this"
	cont "for you, then."
	done
