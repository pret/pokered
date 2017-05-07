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
	dbw BANK(Music_RBYTitleScreen), Music_RBYTitleScreen ; 0xeb808
	dbw BANK(Music_Routes1), Music_Routes1 ; 0xec000
	dbw BANK(Music_Routes3), Music_Routes3 ; 0xec2ca
	dbw BANK(Music_Routes4), Music_Routes4 ; 0xec506
	dbw BANK(Music_MagnetTrain), Music_MagnetTrain ; unchanged
	dbw BANK(Music_GymLeaderBattle), Music_GymLeaderBattle ; 0xec720
	dbw BANK(Music_TrainerBattle), Music_TrainerBattle ; 0xec9fa
	dbw BANK(Music_WildBattle), Music_WildBattle ; 0xed06d
	dbw BANK(Music_PokemonCenter), Music_PokemonCenter ; unchanged
	dbw BANK(Music_LookHiker), Music_LookHiker ; unchanged
	dbw BANK(Music_LookLass), Music_LookLass ; unchanged
	dbw BANK(Music_LookOfficer), Music_LookOfficer ; unchanged
	dbw BANK(Music_HealPokemon), Music_HealPokemon ; unchanged
	dbw BANK(Music_Lavender), Music_Lavender ; 0xef72f
	dbw BANK(Music_Dungeon2), Music_Dungeon2 ; 0xed8dd
	dbw BANK(Music_Dungeon3), Music_Dungeon3 ; 0xedb29
	dbw BANK(Music_MuseumGuy), Music_MuseumGuy ; 0xedbd8
	dbw BANK(Music_RBYGameCorner), Music_RBYGameCorner ; 0xedd6d
	dbw BANK(Music_BikeRiding), Music_BikeRiding ; 0xee119
	dbw BANK(Music_HallOfFame), Music_HallOfFame ; unchanged
	dbw BANK(Music_Cities1), Music_Cities1 ; 0xf4000
	dbw BANK(Music_Celadon), Music_Celadon ; 0xf435b
	dbw BANK(Music_TrainerVictory), Music_TrainerVictory ; unchanged
	dbw BANK(Music_WildPokemonVictory), Music_WildPokemonVictory ; unchanged
	dbw BANK(Music_GymLeaderVictory), Music_GymLeaderVictory ; unchanged
	dbw BANK(Music_MtMoonSquare), Music_MtMoonSquare ; unchanged
	dbw BANK(Music_RBYGym), Music_RBYGym ; 0xf48ae
	dbw BANK(Music_RBYPalletTown), Music_RBYPalletTown ; 0xf4b0c
	dbw BANK(Music_OaksLab), Music_OaksLab ; 0xf4c9f
	dbw BANK(Music_MeetProfOak), Music_MeetProfOak ; 0xf4dea
	dbw BANK(Music_LookRival), Music_LookRival ; unchanged
	dbw BANK(Music_AfterTheRivalFight), Music_AfterTheRivalFight ; unchanged
	dbw BANK(Music_Surf), Music_Surf ; unchanged
	dbw BANK(Music_Evolution), Music_Evolution ; unchanged
	dbw BANK(Music_NationalPark), Music_NationalPark ; 0xf54e8
	dbw BANK(Music_Credits), Music_Credits ; 0x1f31c
	dbw BANK(Music_AzaleaTown), Music_AzaleaTown ; 0xf57e8
	dbw BANK(Music_CherrygroveCity), Music_CherrygroveCity ; 0xf5b03
	dbw BANK(Music_LookKimonoGirl), Music_LookKimonoGirl ; 0xf79b8
	dbw BANK(Music_UnionCave), Music_UnionCave ; 0xf5c60
	dbw BANK(Music_SinnohWildBattle), Music_SinnohWildBattle ; 0xf5dc5
	dbw BANK(Music_SinnohTrainerBattle), Music_SinnohTrainerBattle ; 0xf6096
	dbw BANK(Music_Route206), Music_Route206 ; 0xefc01
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
	dbw BANK(Music_JubilifeCity), Music_JubilifeCity ; 0xeb453
	dbw BANK(Music_Vermilion), Music_Vermilion ; 0xeb676
	dbw BANK(Music_PokemonChannel), Music_PokemonChannel ; 0xee45f
	dbw BANK(Music_PokeFluteChannel), Music_PokeFluteChannel ; 0xf7b13
	dbw BANK(Music_TinTower), Music_TinTower ; 0xf6811
	dbw BANK(Music_SproutTower), Music_SproutTower ; 0xf6974
	dbw BANK(Music_BurnedTower), Music_BurnedTower ; 0xf6a99
	dbw BANK(Music_Lighthouse), Music_Lighthouse ; 0xee569
	dbw BANK(Music_LakeOfRage), Music_LakeOfRage ; 0xee6c5
	dbw BANK(Music_IndigoPlateau), Music_IndigoPlateau ; unchanged
	dbw BANK(Music_Route37), Music_Route37 ; 0xee94b
	dbw BANK(Music_RocketHideout), Music_RocketHideout ; 0xeeb75
	dbw BANK(Music_DragonsDen), Music_DragonsDen ; 0xeece8
	dbw BANK(Music_SinnohWildBattle), Music_SinnohWildBattle ; 0xf605c
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

;Remixes and custom songs:

	dbw BANK(Music_JohtoGSC), Music_JohtoGSC 
	dbw BANK(Music_CeruleanGSC), Music_CeruleanGSC
	dbw BANK(Music_CinnabarGSC), Music_CinnabarGSC
	dbw BANK(Music_NuggetBridge), Music_NuggetBridge
	dbw BANK(Music_Shop), Music_Shop
	dbw BANK(Music_PokeathelonFinal), Music_PokeathelonFinal
	dbw BANK(Music_PokeRadar), Music_PokeRadar
	dbw BANK(Music_NaljoWildBattle), Music_NaljoWildBattle
	dbw BANK(Music_NaljoGymBattle), Music_NaljoGymBattle
	dbw BANK(Music_PalletBattle), Music_PalletBattle
