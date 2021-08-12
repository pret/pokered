_FileDataDestroyedText:: ;Textos datos guardados
	text "¡Destruidos datos"
	line "del archivo!"
	prompt

_WouldYouLikeToSaveText::
	text "¿Quieres GUARDAR"
	line "el juego?"
	done

_GameSavedText::
	text "¡<PLAYER>"
	line "guardó el juego!"
	done

_OlderFileWillBeErasedText::
	text "Será borrado el"
	line "archivo anterior."
	cont "¿De acuerdo?"
	done

_WhenYouChangeBoxText::
	text "Si cambias una"
	line "CAJA de <PKMN>,"
	cont "sus datos serán"
	cont "guardados."

	para "¿Estás de"
	line "acuerdo?"
	done

_ChooseABoxText::
	text "Elige una CAJA"
	line "de <PKMN>.@"
	text_end

_EvolvedText:: ;Evolución Pokémon
	text "¡@"
	text_ram wcf4b
	text " evol."
	done

_IntoText::
	text_start
	line "en @"
	text_ram wcd6d
	text "!"
	done

_StoppedEvolvingText::
	text "¿Eh? ¡@"
	text_ram wcf4b
	text_start
	line "dejó de evolucionar!"
	prompt

_IsEvolvingText::
	text "¡@"
	text_ram wcf4b
	text_start
	line "está evolucionando!"
	done

_FellAsleepText:: ;Estados en combate
	text "¡<TARGET>"
	line "está dormido!"
	prompt

_AlreadyAsleepText::
	text "¡<TARGET>"
	line "ya está dormido!"
	prompt

_PoisonedText::
	text "¡<TARGET>"
	line "fue envenenado!"
	prompt

_BadlyPoisonedText::
	text "¡<TARGET>"
	line "está envenenado!"
	prompt

_BurnedText::
	text "¡<TARGET>"
	line "fue quemado!"
	prompt

_FrozenText::
	text "¡<TARGET>"
	line "está congelado!"
	prompt

_FireDefrostedText::
	text "¡<TARGET>"
	line "se desheló!"
	prompt

_MonsStatsRoseText:: ;Cambio de stat
	text "¡@"
	text_ram wcf4b
	text " de"
	line "<USER>"
	cont "@"
	text_end

_GreatlyRoseText::
	text "<SCROLL>mucho @"
	text_end

_RoseText::
	text "creció!"
	prompt

_MonsStatsFellText::
	text "¡@"
	text_ram wcf4b
	text " de"
	line "<TARGET>"
	cont "@"
	text_end

_GreatlyFellText::
	text "<SCROLL>mucho @"
	text_end

_FellText::
	text "bajó!"
	prompt

_RanFromBattleText:: ;Interrupción combate
	text "¡<USER>"
	line "huyó del combate!"
	prompt

_RanAwayScaredText::
	text "¡<TARGET>"
	line "huyó asustado!"
	prompt

_WasBlownAwayText::
	text "¡<TARGET>"
	line "desapareció!"
	prompt

_ChargeMoveEffectText::
	text "¡<USER>@"
	text_end

_MadeWhirlwindText:: ;Descripción movimientos y acciones en combate
	text_start
	line "creó un remolino!"
	prompt

_TookInSunlightText::
	text_start
	line "recogió luz-sol!"
	prompt

_LoweredItsHeadText::
	text_start
	line "bajó su cabeza!"
	prompt

_SkyAttackGlowingText::
	text_start
	line "está brillando!"
	prompt

_FlewUpHighText::
	text_start
	line "voló muy alto!"
	prompt

_DugAHoleText::
	text_start
	line "cavó un hoyo!"
	prompt

_BecameConfusedText::
	text "¡<TARGET>"
	line "se hizo un lío!"
	prompt

_MimicLearnedMoveText::
	text "¡<USER>"
	line "aprendió"
	cont "@"
	text_ram wcd6d
	text "!"
	prompt

_MoveWasDisabledText::
	text "¡@"
	text_ram wcd6d
	text " de"
	line "<TARGET>"
	cont "fue desactivado!"
	prompt

_NothingHappenedText::
	text "¡No pasó nada!"
	prompt

_NoEffectText::
	text "¡Sin efecto!"
	prompt

_ButItFailedText::
	text "Pero, ¡falló! "
	prompt

_DidntAffectText::
	text "¡No afectó a"
	line "<TARGET>!"
	prompt

_IsUnaffectedText::
	text "<TARGET>"
	line "no sintió nada!"
	prompt

_ParalyzedMayNotAttackText::
	text "¡<TARGET>"
	line "está paralizado!"
	cont "¡Quizá no ataque!"
	prompt

_SubstituteText::
	text "¡Esto creó un"
	line "SUSTITUTO!"
	prompt

_HasSubstituteText::
	text "¡<USER>"
	line "tiene SUSTITUTO!"
	prompt

_TooWeakSubstituteText::
	text "¡Muy débil para"
	line "crear SUSTITUTO!"
	prompt

_CoinsScatteredText::
	text "¡Hay monedas por"
	line "todas partes!"
	prompt

_GettingPumpedText::
	text "¡<USER>"
	line "se está inflando!"
	prompt

_WasSeededText::
	text "¡<TARGET>"
	line "fue infectado!"
	prompt

_EvadedAttackText::
	text "¡<TARGET>"
	line "esquivó ataque!"
	prompt

_HitWithRecoilText::
	text "¡<USER>"
	line "es re-golpeado!"
	prompt

_ConvertedTypeText::
	text "¡Convertido al"
	line "de <TARGET>!"
	prompt

_StatusChangesEliminatedText::
	text "¡Eliminado TODO"
	line "cambio de ESTADO!"
	prompt

_StartedSleepingEffect::
	text "¡<USER>"
	line "se durmió!"
	done

_FellAsleepBecameHealthyText::
	text "¡<USER>"
	line "se durmió y"
	cont "se curó!"
	done

_RegainedHealthText::
	text "¡<USER>"
	line "fue curado!"
	prompt

_TransformedText::
	text "¡<USER>"
	line "se transformó en"
	cont "@"
	text_ram wcd6d
	text "!"
	prompt

_LightScreenProtectedText::
	text "¡<USER>"
	line "está protegido"
	cont "contra ataques"
	cont "especiales!"
	prompt

_ReflectGainedArmorText::
	text "¡<USER>"
	line "ganó blindaje!"
	prompt

_ShroudedInMistText::
	text "¡<USER>"
	line "padece neblina!"
	prompt

_SuckedHealthText::
	text "¡Tomó vida de"
	line "<TARGET>!"
	prompt

_DreamWasEatenText::
	text "¡Tomó sueños de"
	line "<TARGET>!"
	prompt

_TradeCenterText1::
	text "!"
	done

_ColosseumText1::
	text "!"
	done
