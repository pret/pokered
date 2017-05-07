; See song sections in main.asm:
; 	Songs i
; 	Songs ii
; 	Songs iii
; 	Songs I
; 	Songs II
; 	Songs III
; 	Songs IV
; 	Songs V

; e906e
	dbw BANK(Music_Nothing), Music_Nothing ; 0xe91a3
	dbw BANK(Music_TitleScreen), Music_TitleScreen ; 0xeb808
	dbw BANK(Music_Route1), Music_Route1 ; 0xec000
	dbw BANK(Music_Route3), Music_Route3 ; 0xec2ca
	dbw BANK(Music_Route12), Music_Route12 ; 0xec506
	dbw BANK(Music_MagnetTrain), Music_MagnetTrain ; 0xef5f0
	dbw BANK(Music_KantoGymBattle), Music_KantoGymBattle ; 0xec720
	dbw BANK(Music_KantoTrainerBattle), Music_KantoTrainerBattle ; 0xec9fa
	dbw BANK(Music_KantoWildBattle), Music_KantoWildBattle ; 0xed06d
	dbw BANK(Music_PokemonCenter), Music_PokemonCenter ; 0xed5c6
	dbw BANK(Music_LookHiker), Music_LookHiker ; 0xf7411
	dbw BANK(Music_LookLass), Music_LookLass ; 0xed79b
	dbw BANK(Music_LookOfficer), Music_LookOfficer ; 0xed82d
	dbw BANK(Music_HealPokemon), Music_HealPokemon ; 0xf0697
	dbw BANK(Music_LavenderTown), Music_LavenderTown ; 0xef72f
	dbw BANK(Music_Route2), Music_Route2 ; 0xed8dd
	dbw BANK(Music_MtMoon), Music_MtMoon ; 0xedb29
	dbw BANK(Music_ShowMeAround), Music_ShowMeAround ; 0xedbd8
	dbw BANK(Music_GameCorner), Music_GameCorner ; 0xedd6d
	dbw BANK(Music_Bicycle), Music_Bicycle ; 0xee119
	dbw BANK(Music_HallOfFame), Music_HallOfFame ; 0xf05bf
	dbw BANK(Music_ViridianCity), Music_ViridianCity ; 0xf4000
	dbw BANK(Music_CeladonCity), Music_CeladonCity ; 0xf435b
	dbw BANK(Music_TrainerVictory), Music_TrainerVictory ; 0xebeab
	dbw BANK(Music_WildPokemonVictory), Music_WildPokemonVictory ; 0xf4518
	dbw BANK(Music_GymLeaderVictory), Music_GymLeaderVictory ; 0xf462c
	dbw BANK(Music_MtMoonSquare), Music_MtMoonSquare ; 0xf4815
	dbw BANK(Music_Gym), Music_Gym ; 0xf48ae
	dbw BANK(Music_PalletTown), Music_PalletTown ; 0xf4b0c
	dbw BANK(Music_ProfOaksPokemonTalk), Music_ProfOaksPokemonTalk ; 0xf4c9f
	dbw BANK(Music_ProfOak), Music_ProfOak ; 0xf4dea
	dbw BANK(Music_LookRival), Music_LookRival ; 0xf4f79
	dbw BANK(Music_AfterTheRivalFight), Music_AfterTheRivalFight ; 0xf5127
	dbw BANK(Music_Surf), Music_Surf ; 0xf518a
	dbw BANK(Music_Evolution), Music_Evolution ; 0xf06e1
	dbw BANK(Music_NationalPark), Music_NationalPark ; 0xf54e8
	dbw BANK(Music_Credits), Music_Credits ; 0x1f31c
	dbw BANK(Music_AzaleaTown), Music_AzaleaTown ; 0xf57e8
	dbw BANK(Music_CherrygroveCity), Music_CherrygroveCity ; 0xf5b03
	dbw BANK(Music_LookKimonoGirl), Music_LookKimonoGirl ; 0xf79b8
	dbw BANK(Music_UnionCave), Music_UnionCave ; 0xf5c60
	dbw BANK(Music_JohtoWildBattle), Music_JohtoWildBattle ; 0xf5dc5
	dbw BANK(Music_JohtoTrainerBattle), Music_JohtoTrainerBattle ; 0xf6096
	dbw BANK(Music_Route30), Music_Route30 ; 0xefc01
	dbw BANK(Music_EcruteakCity), Music_EcruteakCity ; 0xef2d0
	dbw BANK(Music_VioletCity), Music_VioletCity ; 0xf0000
	dbw BANK(Music_JohtoGymBattle), Music_JohtoGymBattle ; 0xea50d
	dbw BANK(Music_ChampionBattle), Music_ChampionBattle ; 0xea9c1
	dbw BANK(Music_RivalBattle), Music_RivalBattle ; 0xe974f
	dbw BANK(Music_RocketBattle), Music_RocketBattle ; 0xe9b6f
	dbw BANK(Music_ElmsLab), Music_ElmsLab ; 0xea040
	dbw BANK(Music_DarkCave), Music_DarkCave ; 0xea2be
	dbw BANK(Music_Route29), Music_Route29 ; 0xf0386
	dbw BANK(Music_Route36), Music_Route36 ; 0xe94e9
	dbw BANK(Music_SSAqua), Music_SSAqua ; 0xead99
	dbw BANK(Music_LookYoungster), Music_LookYoungster ; 0xf66c3
	dbw BANK(Music_LookBeauty), Music_LookBeauty ; 0xeee3e
	dbw BANK(Music_LookRocket), Music_LookRocket ; 0xf74a2
	dbw BANK(Music_LookPokemaniac), Music_LookPokemaniac ; 0xebde1
	dbw BANK(Music_LookSage), Music_LookSage ; 0xee35e
	dbw BANK(Music_NewBarkTown), Music_NewBarkTown ; 0xeb2d3
	dbw BANK(Music_GoldenrodCity), Music_GoldenrodCity ; 0xeb453
	dbw BANK(Music_VermilionCity), Music_VermilionCity ; 0xeb676
	dbw BANK(Music_PokemonChannel), Music_PokemonChannel ; 0xee45f
	dbw BANK(Music_PokeFluteChannel), Music_PokeFluteChannel ; 0xf7b13
	dbw BANK(Music_TinTower), Music_TinTower ; 0xf6811
	dbw BANK(Music_SproutTower), Music_SproutTower ; 0xf6974
	dbw BANK(Music_BurnedTower), Music_BurnedTower ; 0xf6a99
	dbw BANK(Music_Lighthouse), Music_Lighthouse ; 0xee569
	dbw BANK(Music_LakeOfRage), Music_LakeOfRage ; 0xee6c5
	dbw BANK(Music_IndigoPlateau), Music_IndigoPlateau ; 0xee852
	dbw BANK(Music_Route37), Music_Route37 ; 0xee94b
	dbw BANK(Music_RocketHideout), Music_RocketHideout ; 0xeeb75
	dbw BANK(Music_DragonsDen), Music_DragonsDen ; 0xeece8
	dbw BANK(Music_JohtoWildBattleNight), Music_JohtoWildBattleNight ; 0xf605c
	dbw BANK(Music_RuinsOfAlphRadio), Music_RuinsOfAlphRadio ; 0xeedcb
	dbw BANK(Music_SuccessfulCapture), Music_SuccessfulCapture ; 0xf4602
	dbw BANK(Music_Route26), Music_Route26 ; 0xeefb2
	dbw BANK(Music_Mom), Music_Mom ; 0xf6bf2
	dbw BANK(Music_VictoryRoad), Music_VictoryRoad ; 0xf6c72
	dbw BANK(Music_PokemonLullaby), Music_PokemonLullaby ; 0xf6d79
	dbw BANK(Music_PokemonMarch), Music_PokemonMarch ; 0xf6e23
	dbw BANK(Music_GoldSilverOpening), Music_GoldSilverOpening ; 0xf7055
	dbw BANK(Music_GoldSilverOpening2), Music_GoldSilverOpening2 ; 0xf7308
	dbw BANK(Music_MainMenu), Music_MainMenu ; 0xf78fd
	dbw BANK(Music_RuinsOfAlphInterior), Music_RuinsOfAlphInterior ; 0xebd9e
	dbw BANK(Music_RocketTheme), Music_RocketTheme ; 0xf766d
	dbw BANK(Music_DancingHall), Music_DancingHall ; 0xef9bc
	dbw BANK(Music_ContestResults), Music_ContestResults ; 0xefb3e
	dbw BANK(Music_BugCatchingContest), Music_BugCatchingContest ; 0xf7c16
	dbw BANK(Music_LakeOfRageRocketRadio), Music_LakeOfRageRocketRadio ; 0xef5b1
	dbw BANK(Music_Printer), Music_Printer ; 0xf07fd
	dbw BANK(Music_PostCredits), Music_PostCredits ; 0xcfd9e
	
; Crystal adds the following songs:
	
	dbw BANK(Music_Clair), Music_Clair ; 0x1fa8d
	dbw BANK(Music_MobileAdapterMenu), Music_MobileAdapterMenu ; 0x17801f
	dbw BANK(Music_MobileAdapter), Music_MobileAdapter ; 0x1fc87
	dbw BANK(Music_BuenasPassword), Music_BuenasPassword ; 0x178153
	dbw BANK(Music_LookMysticalMan), Music_LookMysticalMan ; 0x17843b
	dbw BANK(Music_CrystalOpening), Music_CrystalOpening ; 0x1786e8
	dbw BANK(Music_BattleTowerTheme), Music_BattleTowerTheme ; 0x178889
	dbw BANK(Music_SuicuneBattle), Music_SuicuneBattle ; 0x178b81
	dbw BANK(Music_BattleTowerLobby), Music_BattleTowerLobby ; 0x17948b
	dbw BANK(Music_MobileCenter), Music_MobileCenter ; 0x17961d

; RBY songs:

	dbw BANK(Music_IntroBattle), Music_IntroBattle 
	dbw BANK(Music_YellowIntro), Music_YellowIntro 
	dbw BANK(Music_RBYTitleScreen), Music_RBYTitleScreen 
	dbw BANK(Music_Routes2), Music_Routes2 
	dbw BANK(Music_RBYPalletTown), Music_RBYPalletTown 
	dbw BANK(Music_MeetProfOak), Music_MeetProfOak 
	dbw BANK(Music_OaksLab), Music_OaksLab 
	dbw BANK(Music_MeetRival), Music_MeetRival 
	dbw BANK(Music_FarewellRival), Music_FarewellRival 
	dbw BANK(Music_Routes1), Music_Routes1 
	dbw BANK(Music_Cities1), Music_Cities1 
	dbw BANK(Music_Pokecenter), Music_Pokecenter 
	dbw BANK(Music_PkmnHealed), Music_PkmnHealed 
	dbw BANK(Music_Dungeon2), Music_Dungeon2 
	dbw BANK(Music_MuseumGuy), Music_MuseumGuy 
	dbw BANK(Music_RBYGym), Music_RBYGym 
	dbw BANK(Music_JigglypuffSong), Music_JigglypuffSong 
	dbw BANK(Music_Routes3), Music_Routes3 
	dbw BANK(Music_Dungeon3), Music_Dungeon3 
	dbw BANK(Music_MeetJessieJames), Music_MeetJessieJames 
	dbw BANK(Music_Cities2), Music_Cities2 
	dbw BANK(Music_Vermilion), Music_Vermilion 
	dbw BANK(Music_SSAnne), Music_SSAnne 
	dbw BANK(Music_Routes4), Music_Routes4 
	dbw BANK(Music_Lavender), Music_Lavender 
	dbw BANK(Music_PokemonTower), Music_PokemonTower 
	dbw BANK(Music_Celadon), Music_Celadon 
	dbw BANK(Music_RBYGameCorner), Music_RBYGameCorner 
	dbw BANK(Music_Dungeon1), Music_Dungeon1 
	dbw BANK(Music_BikeRiding), Music_BikeRiding
	dbw BANK(Music_SafariZone), Music_SafariZone 
	dbw BANK(Music_SurfingPikachu), Music_SurfingPikachu 
	dbw BANK(Music_SilphCo), Music_SilphCo 
	dbw BANK(Music_Surfing), Music_Surfing 
	dbw BANK(Music_Cinnabar), Music_Cinnabar 
	dbw BANK(Music_CinnabarMansion), Music_CinnabarMansion 
	dbw BANK(Music_RBYIndigoPlateau), Music_RBYIndigoPlateau 
	dbw BANK(Music_RBYHallOfFame), Music_RBYHallOfFame 
	dbw BANK(Music_RBYCredits), Music_RBYCredits 
	dbw BANK(Music_MeetMaleTrainer), Music_MeetMaleTrainer 
	dbw BANK(Music_MeetFemaleTrainer), Music_MeetFemaleTrainer 
	dbw BANK(Music_MeetEvilTrainer), Music_MeetEvilTrainer 
	dbw BANK(Music_WildBattle), Music_WildBattle ; 0xec9fa
	dbw BANK(Music_TrainerBattle), Music_TrainerBattle ; 0xec9fa
	dbw BANK(Music_GymLeaderBattle), Music_GymLeaderBattle ; 0xec9fa
	dbw BANK(Music_FinalBattle), Music_FinalBattle ; 0xec9fa
	dbw BANK(Music_DefeatedWildMon), Music_DefeatedWildMon 
	dbw BANK(Music_DefeatedTrainer), Music_DefeatedTrainer 
	dbw BANK(Music_DefeatedGymLeader), Music_DefeatedGymLeader 
	dbw BANK(Music_UnusedSong), Music_UnusedSong 
	dbw BANK(Music_YellowUnusedSong), Music_YellowUnusedSong 

;Diamond and Pearl
	dbw BANK(Music_SinnohWildBattle), Music_SinnohWildBattle 
	dbw BANK(Music_SinnohTrainerBattle), Music_SinnohTrainerBattle 
	dbw BANK(Music_JubilifeCity), Music_JubilifeCity 
	dbw BANK(Music_Route206), Music_Route206 
	dbw BANK(Music_PokeRadar), Music_PokeRadar

;Remixes and custom songs:

	dbw BANK(Music_CeruleanGSC), Music_CeruleanGSC
	dbw BANK(Music_CinnabarGSC), Music_CinnabarGSC
	dbw BANK(Music_CinnabarRemix), Music_CinnabarRemix
	dbw BANK(Music_NuggetBridge), Music_NuggetBridge
	dbw BANK(Music_Shop), Music_Shop
	dbw BANK(Music_PokeathelonFinal), Music_PokeathelonFinal
	dbw BANK(Music_JohtoGSC), Music_JohtoGSC 
	dbw BANK(Music_KantoGymLeaderRemix), Music_KantoGymLeaderRemix 
	dbw BANK(Music_NaljoWildBattle), Music_NaljoWildBattle
	dbw BANK(Music_NaljoGymBattle), Music_NaljoGymBattle
	dbw BANK(Music_PalletBattle), Music_PalletBattle

; TCG songs:

	dbw BANK(Music_TCGTitleScreen), Music_TCGTitleScreen
	dbw BANK(Music_TCGDuelTheme1), Music_TCGDuelTheme1
	dbw BANK(Music_TCGDuelTheme2), Music_TCGDuelTheme2
	dbw BANK(Music_TCGDuelTheme3), Music_TCGDuelTheme3
	dbw BANK(Music_TCGPauseMenu), Music_TCGPauseMenu
	dbw BANK(Music_TCGPCMainMenu), Music_TCGPCMainMenu
	dbw BANK(Music_TCGDeckMachine), Music_TCGDeckMachine
	dbw BANK(Music_TCGCardPop), Music_TCGCardPop
	dbw BANK(Music_TCGOverworld), Music_TCGOverworld
	dbw BANK(Music_TCGPokemonDome), Music_TCGPokemonDome
	dbw BANK(Music_TCGChallengeHall), Music_TCGChallengeHall
	dbw BANK(Music_TCGClub1), Music_TCGClub1
	dbw BANK(Music_TCGClub2), Music_TCGClub2
	dbw BANK(Music_TCGClub3), Music_TCGClub3
	dbw BANK(Music_TCGRonald), Music_TCGRonald
	dbw BANK(Music_TCGImakuni), Music_TCGImakuni
	dbw BANK(Music_TCGHallOfHonor), Music_TCGHallOfHonor
	dbw BANK(Music_TCGCredits), Music_TCGCredits
	dbw BANK(Music_TCGMatchStart1), Music_TCGMatchStart1
	dbw BANK(Music_TCGMatchStart2), Music_TCGMatchStart2
	dbw BANK(Music_TCGMatchStart3), Music_TCGMatchStart3
	dbw BANK(Music_TCGMatchVictory), Music_TCGMatchVictory
	dbw BANK(Music_TCGMatchLoss), Music_TCGMatchLoss
	dbw BANK(Music_TCGDarkDiddly), Music_TCGDarkDiddly
	dbw BANK(Music_TCGBoosterPack), Music_TCGBoosterPack
	dbw BANK(Music_TCGMedal), Music_TCGMedal

; TCG2 songs:

	dbw BANK(Music_TCG2TitleScreen), Music_TCG2TitleScreen
	dbw BANK(Music_TCG2HereComesGR), Music_TCG2HereComesGR
	dbw BANK(Music_TCG2GROverworld), Music_TCG2GROverworld
	dbw BANK(Music_TCG2Fort1), Music_TCG2Fort1
	dbw BANK(Music_TCG2Fort2), Music_TCG2Fort2
	dbw BANK(Music_TCG2Fort3), Music_TCG2Fort3
	dbw BANK(Music_TCG2Fort4), Music_TCG2Fort4
	dbw BANK(Music_TCG2GRCastle), Music_TCG2GRCastle
	dbw BANK(Music_TCG2GRChallengeCup), Music_TCG2GRChallengeCup
	dbw BANK(Music_TCG2GameCorner), Music_TCG2GameCorner
	dbw BANK(Music_TCG2GRBlimp), Music_TCG2GRBlimp
	dbw BANK(Music_TCG2GRDuelTheme1), Music_TCG2GRDuelTheme1
	dbw BANK(Music_TCG2GRDuelTheme2), Music_TCG2GRDuelTheme2
	dbw BANK(Music_TCG2GRDuelTheme3), Music_TCG2GRDuelTheme3
	dbw BANK(Music_TCG2Ishihara), Music_TCG2Ishihara
	dbw BANK(Music_TCG2Imakuni2), Music_TCG2Imakuni2
	dbw BANK(Music_TCG2Credits), Music_TCG2Credits
	dbw BANK(Music_TCG2Diddly1), Music_TCG2Diddly1
	dbw BANK(Music_TCG2Diddly2), Music_TCG2Diddly2
	dbw BANK(Music_TCG2Diddly3), Music_TCG2Diddly3
	dbw BANK(Music_TCG2Diddly4), Music_TCG2Diddly4
	dbw BANK(Music_TCG2Diddly5), Music_TCG2Diddly5
	dbw BANK(Music_TCG2Diddly6), Music_TCG2Diddly6

; Pinball songs:

	dbw BANK(Music_Pinballredfield), Music_Pinballredfield
	dbw BANK(Music_Pinballcatchem_red), Music_Pinballcatchem_red
	dbw BANK(Music_Pinballhurryup_red), Music_Pinballhurryup_red
	dbw BANK(Music_Pinballpokedex), Music_Pinballpokedex
	dbw BANK(Music_Pinballgengarstage_gastly), Music_Pinballgengarstage_gastly
	dbw BANK(Music_Pinballgengarstage_haunter), Music_Pinballgengarstage_haunter
	dbw BANK(Music_Pinballgengarstage_gengar), Music_Pinballgengarstage_gengar
	dbw BANK(Music_Pinballbluefield), Music_Pinballbluefield
	dbw BANK(Music_Pinballcatchem_blue), Music_Pinballcatchem_blue
	dbw BANK(Music_Pinballhurryup_blue), Music_Pinballhurryup_blue
	dbw BANK(Music_Pinballhiscorescreen), Music_Pinballhiscorescreen
	dbw BANK(Music_Pinballgameover), Music_Pinballgameover
	dbw BANK(Music_Pinballdiglettstage_digletts), Music_Pinballdiglettstage_digletts
	dbw BANK(Music_Pinballdiglettstage_dugtrio), Music_Pinballdiglettstage_dugtrio
	dbw BANK(Music_Pinballseelstage), Music_Pinballseelstage
	dbw BANK(Music_Pinballtitlescreen), Music_Pinballtitlescreen
	dbw BANK(Music_Pinballmewtwostage), Music_Pinballmewtwostage
	dbw BANK(Music_Pinballoptions), Music_Pinballoptions
	dbw BANK(Music_Pinballfieldselect), Music_Pinballfieldselect
	dbw BANK(Music_Pinballmeowthstage), Music_Pinballmeowthstage
	dbw BANK(Music_Pinballendcredits), Music_Pinballendcredits
	dbw BANK(Music_Pinballnameentry), Music_Pinballnameentry
