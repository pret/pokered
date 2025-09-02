_ErikSaraInSafariZoneText::
	text "Oh! She's already"
	line "in the SAFARI"
	cont "ZONE?"
	para "Guess I'll head"
	line "over there!"
	para "Thanks!"
	done

_SaraErikOutsideText::
	text "Oh! He's waiting"
	line "outside the"
	cont "SAFARI ZONE?"
	para "When you're done,"
	line "could you ask him"
	cont "to come in here?"
	para "I already paid for"
	line "entry, so we can"
	cont "meet up here."
	para "Thanks!"
	done

_WereMarineBiologists:
	para "We're marine"
	line "biologists!"
	done

_SaraReunitedText::
	text "SARA: Thanks for"
	line "finding my"
	cont "boyfriend!@"
	text_call _WereMarineBiologists
	para "We live out on"
	line "ROUTE 19!"
	para "You're welcome"
	line "to visit anytime!"
	prompt

_SaraOkayRicky::
	text "Come on, RICKY!"
	line "Time to start our"
	cont "research!"
	done

_ErikReunitedText::
	text "ERIK: Thanks for"
	line "helping me find"
	cont "my girlfriend!@"
	text_call _WereMarineBiologists
	para "Did you know there"
	line "are rare DRATINI"
	cont "in the waters of"
	cont "the SAFARI ZONE?"
	para "FISHERs sometimes"
	line "catch them."
	done

_ShouldntLookNoOneHome::
	text "No one's home, so"
	line "it's not right to"
	cont "poke about."
	done

_PeriscopeInitialText::
	text "Looks like some"
	line "sort of periscope"
	cont "piped through"
	cont "the glass floor."
	para "Does it look"
	line "underwater?"
	para "Seems to be turned"
	line "off currently."
	done

_ErikSarasHouseNoteNotHomeText::
	text "NOTE: We're off"
	line "studying DRATINI"
	cont "sightings in the"
	cont "SAFARI ZONE!"
	para "-SARA and ERIK"
	done

_ErikSarasHouseNoteHomeText::
	text "RESULTS: DRATINI"
	line "seems to enter"
	cont "the fresh water"
	cont "in the SAFARI"
	cont "ZONE by swimming"
	cont "upstream from"
	cont "the northern"
	cont "VERMILION SEAWAY."
	para "Perhaps this is"
	line "where juveniles"
	cont "go for safety?"
	done

_ErikSarasHousePhoneText::
	text "A bright blue"
	line "rotary phone!"
	para "MARINE SIGHTING"
	line "HOTLINE is"
	cont "written on it."
	done

_ErikSarasHouseDragonairEmailText::
	text "<PARA>Dear SARA"
	line "and ERIK,"
	para "I heard from MISTY"
	line "that she's seen"
	cont "DRAGONAIR while"
	cont "training at the"
	cont "SEAFOAM ISLANDS."
	para "Maybe you should"
	line "take a look?"
	para "-LORELEI"
	done

_ErikSarasHouseLeftBookText::
	text "SECRETS OF THE SEA@"
	text_end
_ErikSarasHouseLeftBookText2::
	text "<PARA>Coral reefs have"
	line "incredibly high"
	cont "biodiversity."
	para "It's theorized"
	line "that thousands of"
	cont "new species of"
	cont "#MON are still"
	cont "undiscovered in"
	cont "these habitats."
	done

_ErikSarasHouseCenterBookText::
	text "ABYSSAL SEA LIFE@"
	text_end
_ErikSarasHouseCenterBookText2::
	text "<PARA>DEEP SEA VOLCANIC"
	line "VENTS"
	para "A miraculous"
	line "habitat for life"
	cont "in the depths of"
	cont "the ocean."
	para "Small colonies of"
	line "#MON bask in"
	cont "the volcanic heat."
	done

_ErikSarasHouseRightBookText::
	text "ANCIENT OCEANS@"
	text_end
_ErikSarasHouseRightBookText2::
	text "<PARA>Millions of years"
	line "in the past,"
	para "primitive sea"
	line "organisms named"
	cont "OMANYTE / KABUTO"
	cont "reigned over the"
	cont "primordial froth."
	para "Both fed on micro-"
	line "organisms and"
	cont "vegetation on"
	cont "the sea floor."
	done

_ErikSarasHouseNorthGarbageText::
	text "<PARA>INSTALLING YOUR"
	line "SEAGLASS FLOORING"
	para "Quick start guide!"
	done

_ErikSarasHouseSouthGarbageText::
	text "A magazine is"
	line "in the garbage."
	para "The front page"
	line "is outrageous!"
	para "HAS ERIKA"
	line "FOUND LOVE?!"
	cont "SCANDALOUS!"
	para "<...>"
	para "TOP 5 OUTFITS"
	line "INSPIRED BY WATER"
	cont "#MON!"
	para "<...>"
	para "HOW TO MAKE YOUR"
	line "HAIR GORGEOUS!"
	cont "WE ASKED SABRINA!"
	para "<...>"
	para "WOW! LT.SURGE"
	line "CAUGHT TRAINING"
	cont "AT THE BEACH!"
	para "STEAMY!"
	done

_ErikSarasHouseBookText::
	text "MIGRATORY PATTERNS"
	line "OF MARINE #MON"
	para "They're reading"
	line "this!"
	done

_ErikSarasHousePeriscopeExplanation::
	text "ERIK: Those are"
	line "sea periscopes."
	para "They're attached"
	line "to long video"
	cont "cables that run"
	cont "underwater."
	para "I turned them on"
	line "earlier!"
	para "Have a look!"
	para "Maybe you'll see"
	line "something cool!"
	done

_PeriscopeLookedThroughThe::
	db "Looked into the"
	done

_ErikSarasHouseLeftPeriscopeIntro::
	text "@"
	text_call _PeriscopeLookedThroughThe
	line "CORAL REEF CAMERA."
	para "<...>"
	prompt

_ErikSarasHouseRightPeriscopeIntro::
	text "@"
	text_call _PeriscopeLookedThroughThe
	line "DEEP SEA CAMERA."
	para "<...>"
	prompt

_DeepSeaCameraMagikarp::
	text "A MAGIKARP with a"
	line "SHELLDER clamped"
	cont "onto it is slowly"
	cont "sinking down."
	para "It doesn't seem"
	line "to mind."
	done

_DeepSeaCameraTentacruel::
	text "A TENTACRUEL is"
	line "floating in front"
	cont "of the viewfinder"
	cont "menacingly."
	para "It's emitting a"
	line "sinister red glow."
	done

_DeepSeaCameraGyarados::
	text "Whoa! A GYARADOS"
	line "is chomping on a"
	cont "CLOYSTER's shell!"
	para "Such ferocity!"
	done

_DeepSeaCameraBubbles::
	text "Nothing but"
	line "big bubbles!"
	done

_CoralReefCameraStaryu::
	text "A STARYU is hiding"
	line "stealthily in the"
	cont "sand near coral"
	cont "that looks a bit"
	cont "like a brain."
	done

_CoralReefCameraHorsea::
	text "Many HORSEA are"
	line "weaving in and"
	cont "out of a distant"
	cont "kelp forest!"
	done

_CoralReefCameraKrabby::
	text "A KRABBY's picking"
	line "bits of algae off"
	cont "of a round rock."
	para "It's nibbling on"
	line "the algae happily."
	done

_CoralReefCameraGoldeen::
	text "A few GOLDEEN are"
	line "swirling around"
	cont "gracefully."
	para "Whoa! They quickly"
	line "scattered!"
	para "A VAPOREON popped"
	line "up out of nowhere!"
	done

_SaraHouseIntroText::
	text "SARA: Look who it"
	line "is! Come on in!"
	para "This is our little"
	line "slice of paradise!"
	done

_ErikHouseIntroText::
	text "ERIK: Welcome to"
	line "our humble abode!"
	para "Stay awhile if"
	line "you like!"
	done

_SaraInterestedQuestion::
	text "SARA: Interested"
	line "in our research?"
	done

_ErikInterestedQuestion::
	text "ERIK: Wanna hear"
	line "what we're up to?"
	done

_SaraHouseFirstStepText::
	text "SARA: We're looking"
	line "into sightings of"
	cont "DRAGONAIR at the"
	cont "nearby SEAFOAM"
	cont "ISLANDS."
	para "Have you ever"
	line "been there?"
	done

_SaraSeafoamExplanationText::
	text "SARA: The SEAFOAM"
	line "ISLANDS are found"
	cont "west of here, on"
	cont "ROUTE 20."
	para "They're a system"
	line "of caves."
	para "Deeper down, the"
	line "tide flows into"
	cont "the caves."
	para "It's a fascinating"
	line "marine habitat!"
	prompt

_ErikDragonairResearch::
	text "ERIK: Recently the"
	line "lower levels of"
	cont "SEAFOAM ISLANDS"
	cont "have been cooled"
	cont "by some unknown"
	cont "phenomenon."
	para "They're very near"
	line "freezing cold!"
	para "But the most"
	line "intriguing aspect"
	cont "we just found<...>"
	para "For some reason"
	line "many DRAGONAIR"
	cont "are now gathering"
	cont "down there."
	para "SARA: Many are at"
	line "unusually high"
	cont "levels!"
	para "At levels they"
	line "usually would've"
	cont "evolved!"
	para "We're trying to"
	line "figure out why"
	cont "they aren't"
	cont "evolving!"
	prompt

_ErikWantsDragonairText::
	text "ERIK: Maybe if we"
	line "had a high level"
	cont "DRAGONAIR to take"
	cont "to the ISLANDS<...>"
	para "SARA: Sometimes I"
	line "regret our pledge"
	cont "not to catch any"
	cont "wild #MON<...>"
	prompt

_ShowedDragonairLowLevelText::
	text "ERIK: A DRAGONAIR!"
	line "<...>But it's a bit"
	cont "too low level."
	para "Try to get it to"
	line "at least level 45."
	done

_ShowedDragonairText::
	text "SARA: Perfect!"
	para "We can bring your"
	line "DRAGONAIR to the"
	cont "SEAFOAM ISLANDS!!"
	para "But a bit of a"
	line "warning<...>"
	para "It might not"
	line "evolve anymore"
	cont "if it goes there."
	para "Are you ready to"
	line "go with us?"
	done

_ShowedDragonairLetsDoThis::
	text "Alright!"
	para "RICKY!"
	para "Get the SCUBA"
	line "gear!"
	para "Let's do this!"
	done

_SeafoamIslandsB4FDragonairEventStartText::
	text "SARA: Okay! Here's"
	line "the plan!"
	para "We'll dive down"
	line "with @"
	text_ram wNameBuffer
	text_start
	cont "into the water"
	cont "and see what"
	cont "happens!"
	para "Ready RICKY?"
	para "Ready <PLAYER>?"
	para "ERIK: Time to wear"
	line "your scuba diving"
	cont "suit, <PLAYER>!"
	prompt

_SeafoamIslandsB4FDragonairEventStartText2::
	text "Let's dive down!"
	prompt

_DragonairEventDragonairText1::
	text "DRAGONAIR: Fwee?"
	done

_DragonairEventDragonairText2::
	text "DRAGONAIR: Draogh!"
	done

_DragonairEventErikText::
	text "ERIK: Wow! Look"
	line "at all these"
	cont "DRAGONAIR!"
	para "They seem to be"
	line "drawn to the big"
	cont "ice crystals."
	done

_DragonairEventSaraText::
	text "SARA: Fascinating!"
	para "Are the DRAGONAIR"
	line "trying to build"
	cont "resistance to the"
	cont "icy temperatures?"
	done

_DragonairEventCloysterText::
	text "Looks like this"
	line "CLOYSTER is very"
	cont "territorial."
	done

_DragonairEventCloysterText2::
	text "It won't let you"
	line "pass without a"
	cont "fight."
	para "Fight it with"
	line "your DRAGONAIR?"
	done

_DragonairEventLowLevelText::
	text "It's too low level."
	done

_DragonairEventNoPartyMenuText::
	text "No! This is"
	line "@"
	text_ram wBattleMonNick
	text "'s fight!"
	prompt

_DragonairEventCloysterBeatenText::
	text "The CLOYSTER"
	line "acknowledges your"
	cont "DRAGONAIR's power."
	para "It lets you pass."
	done

_DragonairEventTransformText::
	text "@"
	text_ram wNameBuffer
	text " went"
	line "near the ice"
	cont "crystals."
	prompt

_DragonairEventTransformText2::
	text "@"
	text_ram wNameBuffer
	text " was"
	line "filled with the"
	cont "freezing power of"
	cont "winter!@"
	sound_get_item_2
	text "<PARA>It gained the ICE"
	line "Type!"
	para "Its base stats"
	line "increased!"
	prompt

_DragonairEventTransformText3::
	text "SARA: WOW! What"
	line "a discovery!"
	para "ERIK: I can't wait"
	line "to record all"
	cont "this data!"
	para "SARA: Let's go home"
	line "and get some food!"
	done

_DragonairEventAlready::
	text "It's already been"
	line "powered up."
	done

_DragonairEventEnd::
	text "SARA: So DRAGONAIR"
	line "seem to gather in"
	cont "SEAFOAM ISLANDS"
	cont "to acclimatize to"
	cont "the cold."
	para "ERIK: And in the"
	line "process they"
	cont "evolved new icy"
	cont "powers! Wow!"
	para "SARA: Usually they"
	line "evolve into"
	cont "DRAGONITE, which"
	cont "hates ice!"
	para "ERIK: The frigid"
	line "splendor of all"
	cont "the DRAGONAIR was"
	cont "so beautiful!"
	para "Hey, <PLAYER>!"
	para "Take a look at"
	line "my computer if"
	cont "you want to check"
	cont "your DRAGONAIR's"
	cont "new abilities!"
	done

_ErikSarasHouseComputerAfterText::
	text "WINTER DRAGONAIR"
	line "ANALYSIS"
	para "DRAGON / ICE type."
	para "BASE STATS:"
	para "HP: 91 ATTACK: 84"
	line "DEFENSE: 75"
	para "SPEED: 80"
	line "SPECIAL: 130"
	done

_ErikSarasHouseGoBackErikText::
	text "ERIK: So what do"
	line "you think about"
	cont "the analysis of"
	cont "DRAGONAIR on my"
	cont "computer?"
	para "Or should we go"
	line "back for more"
	cont "research?"
	prompt

_ErikSarasHouseGoBackSaraText::
	text "SARA: RICKY and"
	line "I have been"
	cont "itching to go see"
	cont "the ice crystals!"
	prompt

_ErikSarasHouseGoBackQuestionText::
	text "Do you have"
	line "another DRAGONAIR"
	cont "to bring to the"
	cont "SEAFOAM ISLANDS?"
	prompt

_DragonairEventLeaveText::
	text "ERIK: That darn"
	line "CLOYSTER won't let"
	cont "you go through!"
	para "Want to go back"
	line "home for now?"
	prompt

_DragonairEventHealText::
	text "SARA: Ack!"
	para "Why won't that"
	line "CLOYSTER get out"
	cont "of the way?!"
	para "Here let me heal"
	line "your #MON!"
	prompt

_DragonairEventSaraReturnText::
	text "SARA: Ahh, I'll"
	line "never get tired"
	cont "of seeing these"
	cont "graceful #MON"
	cont "floating about."
	done

_DragonairEventErikReturnText::
	text "ERIK: I feel such"
	line "serenity when"
	cont "swimming with"
	cont "these beautiful"
	cont "DRAGONAIR."
	done

_ErikSarasHouseSecondNoteText::
	text "RESULTS: DRAGONAIR"
	line "evolved special"
	cont "abilities in the"
	cont "presence of ice."
	para "The source of the"
	line "cold temperatures"
	cont "in the SEAFOAM"
	cont "ISLANDS is still"
	cont "unknown."
	done
