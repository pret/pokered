Sfx_PokeballsPlacedOnTable: ; f0941
	dbw $04, Sfx_PokeballsPlacedOnTable_Ch5
; f0944

Sfx_BallWiggle: ; f0944
	dbw $04, Sfx_BallWiggle_Ch5
; f0947

Sfx_Potion: ; f0947
	dbw $04, Sfx_Potion_Ch5
; f094a

Sfx_FullHeal: ; f094a
	dbw $04, Sfx_FullHeal_Ch5
; f094d

Sfx_Menu: ; f094d
	dbw $07, Sfx_Menu_Ch8
; f0950

Sfx_ReadText2: ; f0950
Sfx_ReadText: ; f0950
	dbw $04, Sfx_ReadText2_Ch5
; f0953

Sfx_Poison: ; f0953
	dbw $04, Sfx_Poison_Ch5
; f0956

Sfx_GotSafariBalls: ; f0956
	dbw $04, Sfx_GotSafariBalls_Ch5
; f0959

Sfx_BootPc: ; f0959
	dbw $04, Sfx_BootPc_Ch5
; f095c

Sfx_ShutDownPc: ; f095c
	dbw $04, Sfx_ShutDownPc_Ch5
; f095f

Sfx_ChoosePcOption: ; f095f
	dbw $04, Sfx_ChoosePcOption_Ch5
; f0962

Sfx_EscapeRope: ; f0962
	dbw $04, Sfx_EscapeRope_Ch5
; f0965

Sfx_PushButton: ; f0965
	dbw $04, Sfx_PushButton_Ch5
; f0968

Sfx_SecondPartOfItemfinder: ; f0968
	dbw $04, Sfx_SecondPartOfItemfinder_Ch5
; f096b

Sfx_WarpTo: ; f096b
	dbw $04, Sfx_WarpTo_Ch5
; f096e

Sfx_WarpFrom: ; f096e
	dbw $04, Sfx_WarpFrom_Ch5
; f0971

Sfx_ChangeDexMode: ; f0971
	dbw $04, Sfx_ChangeDexMode_Ch5
; f0974

Sfx_JumpOverLedge: ; f0974
	dbw $04, Sfx_JumpOverLedge_Ch5
; f0977

Sfx_GrassRustle: ; f0977
	dbw $07, Sfx_GrassRustle_Ch8
; f097a

Sfx_Fly: ; f097a
	dbw $07, Sfx_Fly_Ch8
; f097d

Sfx_Wrong: ; f097d
	dbw $44, Sfx_Wrong_Ch5
	dbw $05, Sfx_Wrong_Ch6
; f0983

Sfx_Squeak: ; f0983
	dbw $04, Sfx_Squeak_Ch5
; f0986

Sfx_Strength: ; f0986
	dbw $07, Sfx_Strength_Ch8
; f0989

Sfx_Boat: ; f0989
	dbw $44, Sfx_Boat_Ch5
	dbw $05, Sfx_Boat_Ch6
; f098f

Sfx_WallOpen: ; f098f
	dbw $04, Sfx_WallOpen_Ch5
; f0992

Sfx_PlacePuzzlePieceDown: ; f0992
	dbw $07, Sfx_PlacePuzzlePieceDown_Ch8
; f0995

Sfx_EnterDoor: ; f0995
	dbw $07, Sfx_EnterDoor_Ch8
; f0998

Sfx_SwitchPokemon: ; f0998
	dbw $44, Sfx_SwitchPokemon_Ch5
	dbw $05, Sfx_SwitchPokemon_Ch6
; f099e

Sfx_Tally: ; f099e
	dbw $44, Sfx_Tally_Ch5
	dbw $05, Sfx_Tally_Ch6
; f09a4

Sfx_Transaction: ; f09a4
	dbw $44, Sfx_Transaction_Ch5
	dbw $05, Sfx_Transaction_Ch6
; f09aa

Sfx_Bump: ; f09aa
	dbw $04, Sfx_Bump_Ch5
; f09ad

Sfx_ExitBuilding: ; f09ad
	dbw $07, Sfx_ExitBuilding_Ch8
; f09b0

Sfx_Save: ; f09b0
	dbw $44, Sfx_Save_Ch5
	dbw $05, Sfx_Save_Ch6
; f09b6

Sfx_Save_Ch5: ; f09b6
	dutycycle $2
	sound $2, $f1, $0700
	sound $1, $e1, $0600
	sound $1, $e1, $0680
	sound $1, $e1, $06c0
	sound $2, $e1, $0700
	sound $2, $e1, $07c0
	sound $f, $f2, $07e0
	endchannel
; f09d5

Sfx_Save_Ch6: ; f09d5
	dutycycle $2
	sound $2, $8, $0000
	sound $2, $a1, $0701
	sound $1, $91, $0601
	sound $1, $91, $0681
	sound $1, $91, $06c1
	sound $2, $91, $0701
	sound $2, $91, $07c1
	sound $f, $d2, $07e1
	endchannel
; f09f8

Sfx_Pokeflute: ; f09f8
	dbw $06, Sfx_Pokeflute_Ch7
; f09fb

Sfx_ElevatorEnd: ; f09fb
	dbw $04, Sfx_ElevatorEnd_Ch5
; f09fe

Sfx_ThrowBall: ; f09fe
	dbw $44, Sfx_ThrowBall_Ch5
	dbw $05, Sfx_ThrowBall_Ch6
; f0a04

Sfx_BallPoof: ; f0a04
	dbw $44, Sfx_BallPoof_Ch5
	dbw $07, Sfx_BallPoof_Ch8
; f0a0a

Sfx_Unknown3A: ; f0a0a
	dbw $44, Sfx_Unknown3A_Ch5
	dbw $07, Sfx_Unknown3A_Ch8
; f0a10

Sfx_Run: ; f0a10
	dbw $07, Sfx_Run_Ch8
; f0a13

Sfx_SlotMachineStart: ; f0a13
	dbw $44, Sfx_SlotMachineStart_Ch5
	dbw $05, Sfx_SlotMachineStart_Ch6
; f0a19

Sfx_Call: ; f0a19
	dbw $04, Sfx_Call_Ch5
; f0a1c

Sfx_Unknown60: ; f0a1c
	dbw $07, Sfx_Unknown60_Ch8
; f0a1f

Sfx_Unknown61: ; f0a1f
	dbw $07, Sfx_Unknown61_Ch8
; f0a22

Sfx_Unknown62: ; f0a22
	dbw $07, Sfx_Unknown62_Ch8
; f0a25

Sfx_Unknown63: ; f0a25
	dbw $07, Sfx_Unknown63_Ch8
; f0a28

Sfx_Burn: ; f0a28
	dbw $07, Sfx_Burn_Ch8
; f0a2b

Sfx_TitleScreenEntrance: ; f0a2b
	dbw $07, Sfx_TitleScreenEntrance_Ch8
; f0a2e

Sfx_Unknown66: ; f0a2e
	dbw $04, Sfx_Unknown66_Ch5
; f0a31

Sfx_GetCoinFromSlots: ; f0a31
	dbw $04, Sfx_GetCoinFromSlots_Ch5
; f0a34

Sfx_PayDay: ; f0a34
	dbw $44, Sfx_PayDay_Ch5
	dbw $05, Sfx_PayDay_Ch6
; f0a3a

Sfx_Metronome: ; f0a3a
	dbw $04, Sfx_Metronome_Ch5
; f0a3d

Sfx_Peck: ; f0a3d
	dbw $07, Sfx_Peck_Ch8
; f0a40

Sfx_Kinesis: ; f0a40
	dbw $04, Sfx_Kinesis_Ch5
; f0a43

Sfx_Lick: ; f0a43
	dbw $04, Sfx_Lick_Ch5
; f0a46

Sfx_Pound: ; f0a46
	dbw $07, Sfx_Pound_Ch8
; f0a49

Sfx_MovePuzzlePiece: ; f0a49
	dbw $07, Sfx_MovePuzzlePiece_Ch8
; f0a4c

Sfx_CometPunch: ; f0a4c
	dbw $07, Sfx_CometPunch_Ch8
; f0a4f

Sfx_MegaPunch: ; f0a4f
	dbw $07, Sfx_MegaPunch_Ch8
; f0a52

Sfx_Scratch: ; f0a52
	dbw $07, Sfx_Scratch_Ch8
; f0a55

Sfx_Vicegrip: ; f0a55
	dbw $07, Sfx_Vicegrip_Ch8
; f0a58

Sfx_RazorWind: ; f0a58
	dbw $07, Sfx_RazorWind_Ch8
; f0a5b

Sfx_Cut: ; f0a5b
	dbw $07, Sfx_Cut_Ch8
; f0a5e

Sfx_WingAttack: ; f0a5e
	dbw $07, Sfx_WingAttack_Ch8
; f0a61

Sfx_Whirlwind: ; f0a61
	dbw $07, Sfx_Whirlwind_Ch8
; f0a64

Sfx_Bind: ; f0a64
	dbw $07, Sfx_Bind_Ch8
; f0a67

Sfx_VineWhip: ; f0a67
	dbw $07, Sfx_VineWhip_Ch8
; f0a6a

Sfx_DoubleKick: ; f0a6a
	dbw $07, Sfx_DoubleKick_Ch8
; f0a6d

Sfx_MegaKick: ; f0a6d
	dbw $07, Sfx_MegaKick_Ch8
; f0a70

Sfx_Headbutt: ; f0a70
	dbw $07, Sfx_Headbutt_Ch8
; f0a73

Sfx_HornAttack: ; f0a73
	dbw $07, Sfx_HornAttack_Ch8
; f0a76

Sfx_Tackle: ; f0a76
	dbw $07, Sfx_Tackle_Ch8
; f0a79

Sfx_PoisonSting: ; f0a79
	dbw $07, Sfx_PoisonSting_Ch8
; f0a7c

Sfx_Powder: ; f0a7c
	dbw $07, Sfx_Powder_Ch8
; f0a7f

Sfx_Doubleslap: ; f0a7f
	dbw $07, Sfx_Doubleslap_Ch8
; f0a82

Sfx_Bite: ; f0a82
	dbw $44, Sfx_Bite_Ch5
	dbw $07, Sfx_Bite_Ch8
; f0a88

Sfx_JumpKick: ; f0a88
	dbw $07, Sfx_JumpKick_Ch8
; f0a8b

Sfx_Stomp: ; f0a8b
	dbw $07, Sfx_Stomp_Ch8
; f0a8e

Sfx_TailWhip: ; f0a8e
	dbw $07, Sfx_TailWhip_Ch8
; f0a91

Sfx_KarateChop: ; f0a91
	dbw $07, Sfx_KarateChop_Ch8
; f0a94

Sfx_Submission: ; f0a94
	dbw $07, Sfx_Submission_Ch8
; f0a97

Sfx_WaterGun: ; f0a97
	dbw $44, Sfx_WaterGun_Ch5
	dbw $07, Sfx_WaterGun_Ch8
; f0a9d

Sfx_SwordsDance: ; f0a9d
	dbw $07, Sfx_SwordsDance_Ch8
; f0aa0

Sfx_Thunder: ; f0aa0
	dbw $07, Sfx_Thunder_Ch8
; f0aa3

Sfx_Supersonic: ; f0aa3
	dbw $84, Sfx_Supersonic_Ch5
	dbw $05, Sfx_Supersonic_Ch6
	dbw $07, Sfx_Supersonic_Ch8
; f0aac

Sfx_Leer: ; f0aac
	dbw $84, Sfx_Leer_Ch5
	dbw $05, Sfx_Leer_Ch6
	dbw $07, Sfx_Leer_Ch8
; f0ab5

Sfx_Ember: ; f0ab5
	dbw $44, Sfx_Ember_Ch5
	dbw $07, Sfx_Ember_Ch8
; f0abb

Sfx_Bubblebeam: ; f0abb
	dbw $84, Sfx_Bubblebeam_Ch5
	dbw $05, Sfx_Bubblebeam_Ch6
	dbw $07, Sfx_Bubblebeam_Ch8
; f0ac4

Sfx_HydroPump: ; f0ac4
	dbw $44, Sfx_HydroPump_Ch5
	dbw $07, Sfx_HydroPump_Ch8
; f0aca

Sfx_Surf: ; f0aca
	dbw $84, Sfx_Surf_Ch5
	dbw $05, Sfx_Surf_Ch6
	dbw $07, Sfx_Surf_Ch8
; f0ad3

Sfx_Psybeam: ; f0ad3
	dbw $84, Sfx_Psybeam_Ch5
	dbw $05, Sfx_Psybeam_Ch6
	dbw $07, Sfx_Psybeam_Ch8
; f0adc

Sfx_Charge: ; f0adc
	dbw $84, Sfx_Charge_Ch5
	dbw $05, Sfx_Charge_Ch6
	dbw $07, Sfx_Charge_Ch8
; f0ae5

Sfx_Thundershock: ; f0ae5
	dbw $84, Sfx_Thundershock_Ch5
	dbw $05, Sfx_Thundershock_Ch6
	dbw $07, Sfx_Thundershock_Ch8
; f0aee

Sfx_Psychic: ; f0aee
	dbw $84, Sfx_Psychic_Ch5
	dbw $05, Sfx_Psychic_Ch6
	dbw $07, Sfx_Psychic_Ch8
; f0af7

Sfx_Screech: ; f0af7
	dbw $44, Sfx_Screech_Ch5
	dbw $05, Sfx_Screech_Ch6
; f0afd

Sfx_BoneClub: ; f0afd
	dbw $44, Sfx_BoneClub_Ch5
	dbw $05, Sfx_BoneClub_Ch6
; f0b03

Sfx_Sharpen: ; f0b03
	dbw $44, Sfx_Sharpen_Ch5
	dbw $05, Sfx_Sharpen_Ch6
; f0b09

Sfx_EggBomb: ; f0b09
	dbw $84, Sfx_EggBomb_Ch5
	dbw $05, Sfx_EggBomb_Ch6
	dbw $07, Sfx_EggBomb_Ch8
; f0b12

Sfx_Sing: ; f0b12
	dbw $44, Sfx_Sing_Ch5
	dbw $05, Sfx_Sing_Ch6
; f0b18

Sfx_HyperBeam: ; f0b18
	dbw $84, Sfx_HyperBeam_Ch5
	dbw $05, Sfx_HyperBeam_Ch6
	dbw $07, Sfx_HyperBeam_Ch8
; f0b21

Sfx_Shine: ; f0b21
	dbw $04, Sfx_Shine_Ch5
; f0b24

Sfx_Unknown5F: ; f0b24
	dbw $84, Sfx_Unknown5F_Ch5
	dbw $05, Sfx_Unknown5F_Ch6
Sfx_Sandstorm: ; f0b2a
	dbw $07, Sfx_Sandstorm_Ch8
; f0b2d

Sfx_HangUp: ; f0b2d
	dbw $04, Sfx_HangUp_Ch5
; f0b30

Sfx_NoSignal: ; f0b30
	dbw $04, Sfx_NoSignal_Ch5
; f0b33

Sfx_Elevator: ; f0b33
	dbw $c4, Sfx_Elevator_Ch5
	dbw $05, Sfx_Elevator_Ch6
	dbw $06, Sfx_Elevator_Ch7
	dbw $07, Sfx_Elevator_Ch8
; f0b3f

Sfx_DexFanfare5079: ; f0b3f
Sfx_LevelUp: ; f0b3f
	dbw $c4, Sfx_DexFanfare5079_Ch5
	dbw $05, Sfx_DexFanfare5079_Ch6
	dbw $06, Sfx_DexFanfare5079_Ch7
	dbw $07, Sfx_DexFanfare5079_Ch8
; f0b4b

Sfx_DexFanfare5079_Ch5: ; f0b4b
Sfx_LevelUp_Ch5: ; f0b4b
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $8, $b1
	octave 3
	note B_, 2
	note B_, 2
	note B_, 2
	intensity $b3
	octave 4
	note G#, 12
	endchannel
; f0b5f

Sfx_DexFanfare5079_Ch6: ; f0b5f
Sfx_LevelUp_Ch6: ; f0b5f
	togglesfx
	dutycycle $2
	notetype $8, $c1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	intensity $c3
	note B_, 12
	endchannel
; f0b6d

Sfx_DexFanfare5079_Ch7: ; f0b6d
Sfx_LevelUp_Ch7: ; f0b6d
	togglesfx
	notetype $8, $25
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 5
	note E_, 5
	intensity $35
	note E_, 3
	note __, 4
	endchannel
; f0b7f

Sfx_DexFanfare5079_Ch8: ; f0b7f
Sfx_LevelUp_Ch8: ; f0b7f
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 12
	endchannel
; f0b86

Sfx_KeyItem: ; f0b86
	dbw $c4, Sfx_KeyItem_Ch5
	dbw $05, Sfx_KeyItem_Ch6
	dbw $06, Sfx_KeyItem_Ch7
	dbw $07, Sfx_KeyItem_Ch8
; f0b92

Sfx_KeyItem_Ch5: ; f0b92
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $6, $b1
	octave 3
	note B_, 4
	note B_, 2
	note B_, 2
	note B_, 4
	octave 4
	note E_, 4
	intensity $b3
	note G#, 16
	endchannel
; f0ba8

Sfx_KeyItem_Ch6: ; f0ba8
	togglesfx
	dutycycle $2
	notetype $6, $c1
	octave 4
	note E_, 4
	note E_, 2
	note E_, 2
	note E_, 4
	note G#, 4
	intensity $c3
	note B_, 16
	endchannel
; f0bb8

Sfx_KeyItem_Ch7: ; f0bb8
	togglesfx
	notetype $6, $25
	octave 4
	note G#, 2
	note __, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 5
	note E_, 8
	intensity $35
	note E_, 4
	note __, 4
	endchannel
; f0bce

Sfx_KeyItem_Ch8: ; f0bce
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	endchannel
; f0bd5

Sfx_DexFanfare2049: ; f0bd5
	dbw $c4, Sfx_DexFanfare2049_Ch5
	dbw $05, Sfx_DexFanfare2049_Ch6
	dbw $06, Sfx_DexFanfare2049_Ch7
	dbw $07, Sfx_DexFanfare2049_Ch8
; f0be1

Sfx_DexFanfare2049_Ch5: ; f0be1
	togglesfx
	tempo 104
	volume $77
	dutycycle $2
	notetype $c, $88
	octave 3
	note A_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note A#, 2
	note __, 2
	note A_, 2
	note __, 6
	endchannel
; f0bfe

Sfx_DexFanfare2049_Ch6: ; f0bfe
	togglesfx
	dutycycle $2
	notetype $c, $c1
	octave 5
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 4
	note G_, 4
	note F_, 8
	endchannel
; f0c13

Sfx_DexFanfare2049_Ch7: ; f0c13
	togglesfx
	notetype $c, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 2
	note __, 6
	endchannel
; f0c27

Sfx_DexFanfare2049_Ch8: ; f0c27
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0c2f

Sfx_Item: ; f0c2f
	dbw $c4, Sfx_Item_Ch5
	dbw $05, Sfx_Item_Ch6
	dbw $06, Sfx_Item_Ch7
	dbw $07, Sfx_Item_Ch8
; f0c3b

Sfx_Item_Ch5: ; f0c3b
	togglesfx
	tempo 108
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b2
	octave 4
	note C_, 6
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 4
	note G_, 4
	note G_, 4
	note F_, 12
	note __, 12
	endchannel
; f0c54

Sfx_Item_Ch6: ; f0c54
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $8, $c3
	octave 4
	note A_, 6
	note A_, 2
	note A_, 2
	note A_, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A_, 12
	note __, 12
	endchannel
; f0c68

Sfx_Item_Ch7: ; f0c68
	togglesfx
	notetype $8, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 6
	intensity $35
	note F_, 4
	note __, 14
	endchannel
; f0c81

Sfx_Item_Ch8: ; f0c81
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0c89

Sfx_CaughtMon: ; f0c89
	dbw $c4, Sfx_CaughtMon_Ch5
	dbw $05, Sfx_CaughtMon_Ch6
	dbw $06, Sfx_CaughtMon_Ch7
	dbw $07, Sfx_CaughtMon_Ch8
; f0c95

Sfx_CaughtMon_Ch5: ; f0c95
	togglesfx
	tempo 112
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b3
	octave 4
	note C_, 6
	octave 3
	note A_, 6
	note F_, 12
	intensity $b1
	octave 4
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note G_, 2
	intensity $b3
	note F_, 12
	endchannel
; f0cb5

Sfx_CaughtMon_Ch6: ; f0cb5
	togglesfx
	dutycycle $2
	vibrato $8, $27
	notetype $8, $c3
	octave 4
	note A_, 6
	note F_, 6
	note C_, 12
	intensity $c1
	note A#, 2
	note A#, 2
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	intensity $c3
	note A_, 12
	endchannel
; f0cce

Sfx_CaughtMon_Ch7: ; f0cce
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 12
	note C_, 6
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note G_, 6
	note A#, 6
	note A_, 6
	intensity $35
	note A_, 3
	note __, 3
	endchannel
; f0ce2

Sfx_CaughtMon_Ch8: ; f0ce2
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0cea

Sfx_DexFanfare80109: ; f0cea
	dbw $c4, Sfx_DexFanfare80109_Ch5
	dbw $05, Sfx_DexFanfare80109_Ch6
	dbw $06, Sfx_DexFanfare80109_Ch7
	dbw $07, Sfx_DexFanfare80109_Ch8
; f0cf6

Sfx_DexFanfare80109_Ch5: ; f0cf6
	togglesfx
	tempo 112
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $c, $b1
	octave 4
	note D#, 2
	note D#, 1
	note D#, 1
	octave 3
	note A#, 2
	note A#, 1
	note A#, 1
	octave 4
	note D#, 2
	note D#, 1
	note D#, 1
	note F_, 2
	note F_, 1
	note F_, 1
	intensity $a5
	note A#, 16
	endchannel
; f0d17

Sfx_DexFanfare80109_Ch6: ; f0d17
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $c, $c1
	octave 4
	note G_, 2
	note G_, 1
	note G_, 1
	note D#, 2
	note D#, 1
	note D#, 1
	note G#, 2
	note G#, 1
	note G#, 1
	note A#, 2
	note A#, 1
	note A#, 1
	intensity $b5
	octave 5
	note D#, 16
	endchannel
; f0d32

Sfx_DexFanfare80109_Ch7: ; f0d32
	togglesfx
	notetype $c, $25
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 2
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 2
	octave 4
	note D#, 1
	note __, 1
	note C_, 2
	note D_, 1
	note __, 1
	octave 3
	note A#, 2
	note D#, 4
	intensity $35
	note D#, 3
	note __, 9
	endchannel
; f0d4e

Sfx_DexFanfare80109_Ch8: ; f0d4e
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0d56

Sfx_Fanfare2: ; f0d56
	dbw $84, Sfx_Fanfare2_Ch5
	dbw $05, Sfx_Fanfare2_Ch6
	dbw $07, Sfx_Fanfare2_Ch8
; f0d5f

UnknownSfx: ; f0d5f
	dbw $c4, UnknownSfx_Ch5
	dbw $05, UnknownSfx_Ch6
	dbw $06, UnknownSfx_Ch7
	dbw $07, UnknownSfx_Ch8
; f0d6b

UnknownSfx_Ch5: ; f0d6b
	togglesfx
	tempo 124
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $c, $b1
	octave 4
	note F_, 2
	note F_, 1
	note F_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note E_, 2
	note G_, 1
	note G_, 1
	note C_, 2
	note E_, 1
	note E_, 1
	intensity $a5
	note F_, 16
	endchannel
; f0d8a

UnknownSfx_Ch6: ; f0d8a
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $c, $c1
	octave 4
	note A_, 2
	note A_, 1
	note A_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	octave 5
	note C_, 2
	note C_, 1
	note C_, 1
	octave 4
	note A#, 2
	note A#, 1
	note A#, 1
	intensity $b5
	note A_, 16
	endchannel
; f0da6

UnknownSfx_Ch7: ; f0da6
	togglesfx
	notetype $c, $25
	octave 4
	note F_, 8
	note C_, 2
	note E_, 2
	note G_, 2
	note A#, 2
	note A_, 4
	intensity $35
	note A_, 3
	note __, 9
	endchannel
; f0db6

UnknownSfx_Ch8: ; f0db6
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0dbe

Sfx_Fanfare: ; f0dbe
	dbw $84, Sfx_Fanfare_Ch5
	dbw $05, Sfx_Fanfare_Ch6
	dbw $07, Sfx_Fanfare_Ch8
; f0dc7

Sfx_RegisterPhoneNumber: ; f0dc7
	dbw $c4, Sfx_RegisterPhoneNumber_Ch5
	dbw $05, Sfx_RegisterPhoneNumber_Ch6
	dbw $06, Sfx_RegisterPhoneNumber_Ch7
	dbw $07, Sfx_RegisterPhoneNumber_Ch8
; f0dd3

Sfx_RegisterPhoneNumber_Ch5: ; f0dd3
	togglesfx
	tempo 124
	volume $77
	dutycycle $3
	notetype $c, $a2
	note __, 2
	octave 3
	note C_, 4
	note G#, 4
	octave 4
	note C_, 2
	octave 3
	note F_, 1
	note G#, 2
	note C_, 1
	note F_, 2
	note A#, 3
	octave 4
	note C#, 3
	note C_, 2
	note __, 8
	endchannel
; f0def




Sfx_RegisterPhoneNumber_Ch6: ; f0df0
	togglesfx
	dutycycle $3
	notetype $c, $c2
	note __, 2
	octave 4
	note D#, 2
	note C#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note __, 1
	note G#, 3
	octave 5
	note C_, 2
	note D#, 3
	octave 4
	note G_, 3
	note G#, 2
	note __, 8
	endchannel
; f0e07




Sfx_RegisterPhoneNumber_Ch7: ; f0e08
	togglesfx
	notetype $c, $25
	note __, 2
	octave 3
	note D#, 7
	note __, 1
	note G#, 2
	note __, 1
	note C_, 2
	note __, 1
	note G#, 2
	note G_, 2
	note __, 1
	note A#, 3
	note G#, 2
	note __, 8
	endchannel
; f0e1b




Sfx_RegisterPhoneNumber_Ch8: ; f0e1c
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 2
	note __, 16
	note __, 16
	endchannel
; f0e25




Sfx_3RdPlace: ; f0e26
	dbw $84, Sfx_3RdPlace_Ch5
	dbw $05, Sfx_3RdPlace_Ch6
	dbw $06, Sfx_3RdPlace_Ch7
; f0e2f

Sfx_3RdPlace_Ch5: ; f0e2f
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $c, $a4
	octave 4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note D_, 6
	endchannel
; f0e44




Sfx_3RdPlace_Ch6: ; f0e45
	togglesfx
	dutycycle $2
	notetype $c, $b4
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	note A_, 1
	note __, 1
	note F_, 1
	note G_, 6
	endchannel
; f0e55




Sfx_3RdPlace_Ch7: ; f0e56
	togglesfx
	notetype $c, $25
	octave 3
	note A_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	note B_, 6
	endchannel
; f0e65




Sfx_GetEggFromDaycareLady: ; f0e66
Sfx_GetEggFromDaycareMan: ; f0e66
	dbw $c4, Sfx_GetEggFromDaycareLady_Ch5
	dbw $05, Sfx_GetEggFromDaycareLady_Ch6
	dbw $06, Sfx_GetEggFromDaycareLady_Ch7
	dbw $07, Sfx_GetEggFromDaycareLady_Ch8
; f0e72

Sfx_GetEggFromDaycareLady_Ch5: ; f0e72
Sfx_GetEggFromDaycareMan_Ch5: ; f0e72
	togglesfx
	tempo 120
	volume $77
	vibrato $12, $34
	dutycycle $2
	notetype $8, $a1
	note __, 2
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A#, 2
	octave 4
	note D_, 2
	intensity $a2
	note F_, 6
	intensity $a1
	dutycycle $3
	octave 3
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	intensity $a4
	note F_, 9
	note __, 9
	endchannel
; f0e9a




Sfx_GetEggFromDaycareLady_Ch6: ; f0e9b
Sfx_GetEggFromDaycareMan_Ch6: ; f0e9b
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $c2
	note __, 2
	octave 4
	note F_, 2
	note __, 2
	note A_, 2
	intensity $c1
	note A#, 2
	note A_, 2
	note A#, 2
	intensity $c2
	octave 5
	note C_, 6
	intensity $c1
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	intensity $c4
	note A_, 9
	note __, 9
	endchannel
; f0ebd




Sfx_GetEggFromDaycareLady_Ch7: ; f0ebe
Sfx_GetEggFromDaycareMan_Ch7: ; f0ebe
	togglesfx
	notetype $8, $25
	note __, 2
	octave 3
	note C_, 6
	octave 2
	note A#, 6
	octave 3
	note C_, 2
	note F_, 2
	note G_, 2
	note A#, 6
	note A_, 9
	note __, 9
	endchannel
; f0ecf




Sfx_GetEggFromDaycareLady_Ch8: ; f0ed0
Sfx_GetEggFromDaycareMan_Ch8: ; f0ed0
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note __, 2
	notetype $c
	note __, 16
	note __, 12
	endchannel
; f0edb




Sfx_MoveDeleted: ; f0edc
	dbw $c4, Sfx_MoveDeleted_Ch5
	dbw $05, Sfx_MoveDeleted_Ch6
	dbw $06, Sfx_MoveDeleted_Ch7
	dbw $07, Sfx_MoveDeleted_Ch8
; f0ee8

Sfx_MoveDeleted_Ch5: ; f0ee8
	togglesfx
	tempo 116
	volume $77
	dutycycle $2
	vibrato $c, $44
	notetype $c, $a4
	note __, 8
	octave 2
	note G_, 1
	note __, 2
	note C#, 1
	note E_, 1
	note D#, 1
	note E_, 4
	intensity $a1
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note G#, 2
	note B_, 2
	intensity $a6
	octave 3
	note D_, 10
	note __, 6
	endchannel
; f0f0c




Sfx_MoveDeleted_Ch6: ; f0f0d
	togglesfx
	dutycycle $3
	vibrato $c, $44
	notetype $c, $74
	octave 1
	note B_, 1
	octave 2
	note D_, 1
	note F_, 1
	note G#, 1
	intensity $94
	note D_, 1
	note F_, 1
	note G#, 1
	note B_, 1
	intensity $b4
	octave 3
	note C#, 1
	note __, 2
	octave 2
	note A#, 1
	octave 3
	note C#, 4
	note __, 2
	intensity $b1
	note C#, 2
	note D#, 2
	note E_, 2
	intensity $b6
	note F_, 16
	note __, 6
	endchannel
; f0f36




Sfx_MoveDeleted_Ch7: ; f0f37
	togglesfx
	notetype $6, $25
	octave 2
	note G#, 8
	note A_, 8
	note A#, 2
	note __, 4
	note A#, 1
	note __, 1
	note A#, 8
	note __, 4
	octave 3
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 2
	note A#, 2
	note __, 2
	notetype $c, $20
	note B_, 16
	note __, 6
	endchannel
; f0f52




Sfx_MoveDeleted_Ch8: ; f0f53
	togglesfx
	sfxtogglenoise $3
	notetype $c
	note F_, 8
	note __, 16
	note __, 16
	note __, 6
	endchannel
; f0f5d




Sfx_2ndPlace: ; f0f5e
	dbw $c4, Sfx_2ndPlace_Ch5
	dbw $05, Sfx_2ndPlace_Ch6
	dbw $06, Sfx_2ndPlace_Ch7
	dbw $07, Sfx_2ndPlace_Ch8
; f0f6a

Sfx_2ndPlace_Ch5: ; f0f6a
	togglesfx
	tempo 116
	volume $77
	dutycycle $2
	vibrato $c, $34
	notetype $8, $a1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	note F_, 2
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	intensity $a7
	note B_, 12
	note __, 6
	endchannel
; f0f91




Sfx_2ndPlace_Ch6: ; f0f92
	togglesfx
	dutycycle $2
	notetype $8, $b1
	octave 4
	note G_, 2
	note G_, 2
	note G_, 2
	note A_, 4
	note B_, 2
	intensity $b4
	octave 5
	note C_, 12
	intensity $b1
	note C_, 2
	note C_, 2
	note C_, 2
	intensity $b7
	note D_, 12
	note __, 6
	endchannel
; f0fac




Sfx_2ndPlace_Ch7: ; f0fad
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note G_, 12
	note __, 6
	endchannel
; f0fd1




Sfx_2ndPlace_Ch8: ; f0fd2
	togglesfx
	sfxtogglenoise $3
	notetype $8
Sfx_2ndPlace_branch_f0fd7: ; f0fd7
	note C#, 1
	loopchannel 6, Sfx_2ndPlace_branch_f0fd7
	note B_, 12
	note B_, 12
	note B_, 12
	note __, 6
	endchannel
; f0fe1




Sfx_1stPlace: ; f0fe2
	dbw $c4, Sfx_1stPlace_Ch5
	dbw $05, Sfx_1stPlace_Ch6
	dbw $06, Sfx_1stPlace_Ch7
	dbw $07, Sfx_1stPlace_Ch8
; f0fee

Sfx_1stPlace_Ch5: ; f0fee
	togglesfx
	tempo 124
	volume $77
	dutycycle $3
	vibrato $c, $34
	notetype $c, $a1
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	intensity $91
	note D_, 1
	octave 4
	note A#, 1
	note F_, 1
	note A#, 1
	intensity $81
	octave 5
	note D_, 1
	octave 4
	note A#, 1
	note F_, 1
	note D_, 1
	intensity $a1
	note C_, 2
	note E_, 2
	note G_, 2
	intensity $a7
	note A_, 10
	note __, 6
	endchannel
; f101f




Sfx_1stPlace_Ch6: ; f1020
	togglesfx
	dutycycle $3
	vibrato $c, $34
	notetype $c, $c1
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	intensity $b6
	octave 4
	note D_, 12
	intensity $c1
	note E_, 2
	note G_, 2
	octave 5
	note C_, 2
	intensity $b7
	note D_, 10
	note __, 6
	endchannel
; f103c




Sfx_1stPlace_Ch7: ; f103d
	togglesfx
	notetype $c, $25
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 6
	note F_, 6
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 10
	note __, 6
	endchannel
; f1053




Sfx_1stPlace_Ch8: ; f1054
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 4
	note D_, 4
	note D_, 4
	note B_, 12
	note B_, 10
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	notetype $c
	note B_, 10
	note __, 6
	endchannel
; f1068




Sfx_ChooseACard: ; f1069
	dbw $c4, Sfx_ChooseACard_Ch5
	dbw $05, Sfx_ChooseACard_Ch6
	dbw $06, Sfx_ChooseACard_Ch7
	dbw $07, Sfx_ChooseACard_Ch8
; f1075

Sfx_ChooseACard_Ch5: ; f1075
	togglesfx
	tempo 152
	volume $77
	dutycycle $3
	notetype $6, $a4
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note C#, 4
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note D_, 4
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note E_, 4
	intensity $71
	octave 3
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
	intensity $91
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note D#, 1
	intensity $a4
	note E_, 4
	note __, 12
	endchannel
; f10a8




Sfx_ChooseACard_Ch6: ; f10a9
	togglesfx
	dutycycle $3
	notetype $6, $b4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note E_, 4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note F_, 4
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note G_, 4
	note G#, 8
	note A_, 4
	note __, 12
	endchannel
; f10c8




Sfx_ChooseACard_Ch7: ; f10c9
	togglesfx
	notetype $6, $25
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note A_, 4
	octave 3
	note E_, 2
	octave 2
	note G#, 2
	note B_, 2
	note G#, 2
	note A_, 4
	note __, 12
	endchannel
; f10eb




Sfx_ChooseACard_Ch8: ; f10ec
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 2
	note C#, 2
	note B_, 4
	note D_, 2
	note C#, 2
	note B_, 4
	note D_, 2
	note C#, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note B_, 16
	endchannel
; f1103




Sfx_GetTm: ; f1104
	dbw $c4, Sfx_GetTm_Ch5
	dbw $05, Sfx_GetTm_Ch6
	dbw $06, Sfx_GetTm_Ch7
	dbw $07, Sfx_GetTm_Ch8
; f1110

Sfx_GetTm_Ch5: ; f1110
	togglesfx
	tempo 144
	volume $77
	dutycycle $3
	vibrato $8, $24
	notetype $c, $a3
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note G_, 6
	intensity $b1
	note E_, 2
	note F#, 2
	note G_, 2
	intensity $a5
	note F#, 8
	note __, 6
	endchannel
; f1130




Sfx_GetTm_Ch6: ; f1131
	togglesfx
	dutycycle $3
	vibrato $8, $24
	notetype $c, $b3
	octave 4
	note G_, 1
	note __, 1
	note D_, 1
	note G_, 1
	note B_, 6
	intensity $c1
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	intensity $b5
	note D_, 8
	note __, 6
	endchannel
; f114b




Sfx_GetTm_Ch7: ; f114c
	togglesfx
	notetype $6, $25
	octave 2
	note B_, 2
	note __, 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note C_, 4
	octave 2
	note A_, 16
	note __, 6
	endchannel
; f1169




Sfx_GetTm_Ch8: ; f116a
	togglesfx
	sfxtogglenoise $4
	notetype $6
	note D_, 4
	note C#, 2
	note D_, 2
	note B_, 8
	note D_, 4
	note C#, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note D_, 2
	note B_, 16
	note __, 6
	endchannel
; f117c




Sfx_GetBadge: ; f117d
	dbw $c4, Sfx_GetBadge_Ch5
	dbw $05, Sfx_GetBadge_Ch6
	dbw $06, Sfx_GetBadge_Ch7
	dbw $07, Sfx_GetBadge_Ch8
; f1189

Sfx_GetBadge_Ch5: ; f1189
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	vibrato $8, $24
	notetype $6, $92
	octave 4
	note F_, 3
	callchannel Sfx_GetBadge_branch_f11aa
	note A#, 3
	forceoctave $2
	callchannel Sfx_GetBadge_branch_f11aa
	forceoctave $0
	intensity $a7
	note A_, 16
	note __, 6
	endchannel
; f11a9




Sfx_GetBadge_branch_f11aa: ; f11aa
	note __, 5
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	note C#, 2
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	endchannel
; f11be

Sfx_GetBadge_Ch6: ; f11be
	togglesfx
	dutycycle $3
	vibrato $8, $24
	notetype $6, $b5
	octave 5
	note C#, 3
	note __, 3
	octave 4
	note G#, 1
	note __, 1
	note G#, 8
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 1
	intensity $95
	octave 5
	note C_, 1
	intensity $b5
	note C#, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 3
	note __, 3
	octave 4
	note A#, 1
	note __, 1
	note A#, 8
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	note __, 1
	intensity $95
	octave 5
	note D_, 1
	intensity $b5
	note D#, 8
	note F_, 16
	note __, 6
	endchannel
; f11f4




Sfx_GetBadge_Ch7: ; f11f5
	togglesfx
	notetype $6, $25
	octave 2
	note G#, 3
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note C#, 8
	note G#, 2
	note __, 2
	note F_, 2
	note __, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	note G#, 2
	note G_, 3
	note __, 3
	octave 3
	note D#, 1
	note __, 1
	note D#, 8
	note A#, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D#, 2
	note F_, 16
	note __, 6
	endchannel
; f121a




Sfx_GetBadge_Ch8: ; f121b
	togglesfx
	sfxtogglenoise $4
	notetype $6
Sfx_GetBadge_branch_f1220: ; f1220
	note B_, 12
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 2, Sfx_GetBadge_branch_f1220
	note B_, 16
	note __, 6
	endchannel
; f1235




Sfx_QuitSlots: ; f1236
	dbw $c4, Sfx_QuitSlots_Ch5
	dbw $05, Sfx_QuitSlots_Ch6
	dbw $06, Sfx_QuitSlots_Ch7
	dbw $07, Sfx_QuitSlots_Ch8
; f1242

Sfx_QuitSlots_Ch5: ; f1242
	togglesfx
	tempo 144
	volume $77
	dutycycle $2
	notetype $8, $82
	octave 3
	note G#, 2
	note __, 4
	note C#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note G#, 2
	octave 4
	note D_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note A#, 2
	note F#, 2
	note A#, 2
	note G#, 2
	note F#, 2
	intensity $97
	note G#, 14
	note __, 6
	endchannel
; f1265




Sfx_QuitSlots_Ch6: ; f1266
	togglesfx
	dutycycle $2
	notetype $8, $b3
	note __, 3
	octave 4
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note G#, 4
	note A#, 2
	intensity $c1
	note B_, 4
	note A#, 2
	note G#, 4
	note F_, 2
	note F#, 4
	note F_, 2
	note D#, 4
	intensity $b7
	note F_, 14
	note __, 6
	endchannel
; f1282




Sfx_QuitSlots_Ch7: ; f1283
	togglesfx
	notetype $8, $25
	octave 3
	note C#, 2
	note __, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note G#, 2
	note D_, 2
	note __, 2
	note D_, 2
	octave 2
	note G#, 2
	note B_, 2
	octave 3
	note D_, 2
	note D#, 2
	note __, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note __, 2
	note C#, 14
	note __, 6
	endchannel
; f12a0




Sfx_QuitSlots_Ch8: ; f12a1
	togglesfx
	sfxtogglenoise $3
	notetype $8
	note D#, 6
	note D_, 4
	note D#, 2
	note D#, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note B_, 14
	note __, 6
	endchannel
; f12b3




Sfx_Protect: ; f12b4
	dbw $44, Sfx_Protect_Ch5
	dbw $07, Sfx_Protect_Ch8
; f12ba

Sfx_Protect_Ch5: ; f12ba
	togglesfx
	notetype $1, $f1
	dutycycle $0
Sfx_Protect_branch_f12c0: ; f12c0
	octave 5
	note F_, 5
	note A_, 5
	octave 6
	note C_, 5
	note E_, 5
	octave 5
	note F#, 5
	note A#, 5
	octave 6
	note C#, 5
	note E_, 5
	loopchannel 3, Sfx_Protect_branch_f12c0
	intensity $c1
	octave 5
	note F_, 5
	note A_, 5
	intensity $91
	octave 6
	note C_, 5
	note E_, 5
	intensity $71
	octave 5
	note F#, 5
	note A#, 5
	intensity $51
	octave 6
	note C#, 5
	note E_, 5
	endchannel
; f12e5

Sfx_Protect_Ch8: ; f12e5
Sfx_Protect_branch_f12e5: ; f12e5
	noise $9, $9e, $0
	noise $9, $be, $11
	loopchannel 6, Sfx_Protect_branch_f12e5
	noise $9, $a7, $0
	noise $10, $75, $11
	endchannel
; f12f6

Sfx_Sketch: ; f12f6
	dbw $04, Sfx_Sketch_Ch5
; f12f9

Sfx_Sketch_Ch5: ; f12f9
	dutycycle $1
	soundinput $a5
Sfx_Sketch_branch_f12fd: ; f12fd
	sound $2, $f1, $06e0
	sound $d, $af, $05b0
	sound $4, $0, $0000
	sound $9, $f4, $0718
	loopchannel 3, Sfx_Sketch_branch_f12fd
	soundinput $8
	endchannel
; f1314

Sfx_RainDance: ; f1314
	dbw $07, Sfx_RainDance_Ch8
; f1317

Sfx_RainDance_Ch8: ; f1317
Sfx_RainDance_branch_f1317: ; f1317
	noise $b, $7d, $50
	noise $6, $7d, $4f
	noise $b, $7f, $47
	noise $f, $6e, $22
	loopchannel 3, Sfx_RainDance_branch_f1317
	noise $6, $6d, $50
	noise $5, $5d, $4f
	noise $5, $4f, $47
	noise $a, $32, $46
	endchannel
; f1334

Sfx_Aeroblast: ; f1334
	dbw $44, Sfx_Aeroblast_Ch5
	dbw $07, Sfx_Aeroblast_Ch8
; f133a

Sfx_Aeroblast_Ch5: ; f133a
	unknownmusic0xde $f2
	soundinput $f5
	sound $1c, $f8, $0580
	soundinput $8
	endchannel
; f1345

Sfx_Aeroblast_Ch8: ; f1345
	noise $4, $f8, $6c
	noise $4, $c8, $5c
	noise $4, $78, $5b
	noise $10, $31, $5a
	endchannel
; f1352

Sfx_Spark: ; f1352
	dbw $07, Sfx_Spark_Ch8
; f1355

Sfx_Spark_Ch8: ; f1355
Sfx_Spark_branch_f1355: ; f1355
	noise $4, $f8, $5d
	noise $4, $d8, $6f
	loopchannel 2, Sfx_Spark_branch_f1355
	endchannel
; f1360

Sfx_Curse: ; f1360
	dbw $44, Sfx_Curse_Ch5
	dbw $07, Sfx_Curse_Ch8
; f1366

Sfx_Curse_Ch5: ; f1366
	dutycycle $3
	sound $4, $f2, $0483
	sound $4, $f2, $0511
	sound $4, $f2, $0589
	sound $4, $f2, $05ed
	endchannel
; f1379

Sfx_Curse_Ch8: ; f1379
	noise $14, $9a, $9
	endchannel
; f137d

Sfx_Rage: ; f137d
	dbw $44, Sfx_Rage_Ch5
	dbw $07, Sfx_Rage_Ch8
; f1383

Sfx_Rage_Ch5: ; f1383
	dutycycle $0
	sound $3, $d1, $07b0
	sound $3, $d1, $07c2
	sound $18, $d2, $07d5
	endchannel
; f1392

Sfx_Rage_Ch8: ; f1392
	noise $3, $f4, $1a
	noise $3, $f4, $19
	noise $18, $f2, $18
	endchannel
; f139c

Sfx_Thief: ; f139c
	dbw $07, Sfx_Thief_Ch8
; f139f

Sfx_Thief_Ch8: ; f139f
Sfx_Thief_branch_f139f: ; f139f
	noise $0, $0, $0
	noise $4, $e1, $12
	noise $0, $0, $0
	noise $2, $b1, $22
	loopchannel 2, Sfx_Thief_branch_f139f
	endchannel
; f13b0

Sfx_Thief2: ; f13b0
	dbw $04, Sfx_Thief2_Ch5
; f13b3

Sfx_Thief2_Ch5: ; f13b3
	togglesfx
	notetype $2, $f4
	dutycycle $0
	octave 4
	note C#, 3
	note A#, 3
	intensity $d2
	note C#, 3
	note A#, 3
	intensity $b1
	note C_, 3
	note A_, 3
	intensity $81
	note C_, 3
	note A_, 3
	togglesfx
	endchannel
; f13ca

Sfx_SpiderWeb: ; f13ca
	dbw $44, Sfx_SpiderWeb_Ch5
	dbw $07, Sfx_SpiderWeb_Ch8
; f13d0

Sfx_SpiderWeb_Ch5: ; f13d0
	dutycycle $0
	sound $20, $7f, $0720
	soundinput $95
	sound $4, $f8, $0620
	sound $4, $e8, $0630
	sound $4, $d8, $0640
	sound $4, $95, $0620
	sound $4, $73, $0630
	sound $4, $51, $0640
	soundinput $8
	endchannel
; f13f3

Sfx_SpiderWeb_Ch8: ; f13f3
	noise $20, $ef, $0
	endchannel
; f13f7

Sfx_MindReader: ; f13f7
	dbw $44, Sfx_MindReader_Ch5
	dbw $07, Sfx_MindReader_Ch8
; f13fd

Sfx_MindReader_Ch5: ; f13fd
	togglesfx
	dutycycle $2
	notetype $2, $f1
	octave 5
	note C_, 3
	intensity $41
	note C_, 3
	intensity $f1
	note C#, 3
	intensity $41
	note C#, 3
	intensity $f1
	note D_, 3
	intensity $41
	note D_, 3
	togglesfx
	endchannel
; f1416

Sfx_MindReader_Ch8: ; f1416
	noise $11, $af, $19
	noise $12, $af, $18
	endchannel
; f141d

Sfx_Nightmare: ; f141d
	dbw $04, Sfx_Nightmare_Ch5
; f1420

Sfx_Nightmare_Ch5: ; f1420
	dutycycle $0
	soundinput $34
Sfx_Nightmare_branch_f1424: ; f1424
	sound $3, $ba, $0631
	sound $2, $0, $0000
	sound $3, $f8, $0621
	sound $2, $0, $0000
	sound $3, $f8, $0611
	sound $2, $0, $0000
	sound $3, $e8, $0601
	sound $2, $0, $0000
	sound $3, $e8, $05f1
	sound $2, $0, $0000
	loopchannel 2, Sfx_Nightmare_branch_f1424
	soundinput $8
	endchannel
; f1453

Sfx_Snore: ; f1453
	dbw $07, Sfx_Snore_Ch8
; f1456

Sfx_Snore_Ch8: ; f1456
	noise $2, $ea, $4b
	noise $2, $ea, $5b
	noise $2, $0, $0
	noise $4, $ee, $47
	noise $4, $ee, $46
	noise $4, $ee, $45
	endchannel
; f1469

Sfx_SweetKiss: ; f1469
	dbw $04, Sfx_SweetKiss_Ch5
; f146c

Sfx_SweetKiss_Ch5: ; f146c
	dutycycle $2
Sfx_SweetKiss_branch_f146e: ; f146e
	sound $2, $c1, $07c8
	sound $2, $d1, $07da
	loopchannel 2, Sfx_SweetKiss_branch_f146e
	sound $1a, $f1, $07e2
	endchannel
; f147f

Sfx_SweetKiss2: ; f147f
	dbw $04, Sfx_SweetKiss2_Ch5
; f1482

Sfx_SweetKiss2_Ch5: ; f1482
	dutycycle $0
	soundinput $97
	sound $2, $f4, $0772
	sound $4, $0, $0000
	sound $2, $c4, $0772
	sound $4, $0, $0000
	sound $2, $b4, $0772
	sound $4, $0, $0000
	sound $2, $a1, $0772
	soundinput $8
	endchannel
; f14a5

Sfx_BellyDrum: ; f14a5
	dbw $44, Sfx_BellyDrum_Ch5
	dbw $07, Sfx_BellyDrum_Ch8
; f14ab

Sfx_BellyDrum_Ch5: ; f14ab
	dutycycle $2
	soundinput $ac
	sound $c, $f1, $05a3
	soundinput $8
	endchannel
; f14b6

Sfx_BellyDrum_Ch8: ; f14b6
	noise $c, $b1, $6c
	endchannel
; f14ba

Sfx_Unknown7F: ; f14ba
	dbw $04, Sfx_Unknown7F_Ch5
; f14bd

Sfx_Unknown7F_Ch5: ; f14bd
	dutycycle $2
	soundinput $95
	sound $2, $c9, $03b3
	sound $5, $f8, $0463
	sound $4, $d1, $0543
	soundinput $8
	endchannel
; f14d0

Sfx_SludgeBomb: ; f14d0
	dbw $44, Sfx_SludgeBomb_Ch5
	dbw $07, Sfx_SludgeBomb_Ch8
; f14d6

Sfx_SludgeBomb_Ch5: ; f14d6
	dutycycle $2
	soundinput $c5
	sound $3, $f8, $0581
	sound $1, $0, $0000
	soundinput $cb
	sound $10, $f2, $05d1
	soundinput $8
	endchannel
; f14eb

Sfx_SludgeBomb_Ch8: ; f14eb
	noise $3, $e2, $6e
	noise $1, $0, $0
	noise $10, $e2, $6d
	endchannel
; f14f5

Sfx_Foresight: ; f14f5
	dbw $04, Sfx_Foresight_Ch5
; f14f8

Sfx_Foresight_Ch5: ; f14f8
	sound $3, $f4, $07b5
	sound $3, $f5, $07c8
	sound $8, $f4, $07da
	sound $2, $0, $0000
	sound $8, $c1, $07da
	sound $2, $0, $0000
	sound $8, $91, $07da
	endchannel
; f1515

Sfx_Spite: ; f1515
	dbw $04, Sfx_Spite_Ch5
; f1518

Sfx_Spite_Ch5: ; f1518
	togglesfx
	vibrato $0, $12
	dutycycle $3
	soundinput $fd
	notetype $3, $f8
	octave 3
	note F_, 3
	note G#, 3
	note B_, 3
	note E_, 3
	note G_, 3
	note A#, 3
	intensity $bf
	note D#, 3
	note F#, 3
	note A_, 3
	intensity $5f
	note D_, 3
	intensity $2f
	note F_, 3
	note G#, 3
	soundinput $8
	togglesfx
	endchannel
; f153a

Sfx_Outrage: ; f153a
	dbw $07, Sfx_Outrage_Ch8
; f153d

Sfx_Outrage_Ch8: ; f153d
	noise $b, $ea, $6c
	noise $b, $ea, $6b
	noise $b, $ea, $6a
	noise $b, $ea, $69
	noise $b, $e1, $59
	endchannel
; f154d

Sfx_PerishSong: ; f154d
	dbw $44, Sfx_PerishSong_Ch5
	dbw $05, Sfx_PerishSong_Ch6
; f1553

Sfx_PerishSong_Ch5: ; f1553
	togglesfx
	dutycycle $0
	vibrato $12, $53
	notetype $8, $af
	octave 4
	note A_, 9
	note G#, 9
	togglesfx
	endchannel
; f1561

Sfx_PerishSong_Ch6: ; f1561
	togglesfx
	dutycycle $0
	vibrato $12, $53
	notetype $8, $af
	octave 4
	note C_, 9
	octave 3
	note B_, 9
	togglesfx
	endchannel
; f1570

Sfx_GigaDrain: ; f1570
	dbw $44, Sfx_GigaDrain_Ch5
	dbw $07, Sfx_GigaDrain_Ch8
; f1576

Sfx_GigaDrain_Ch5: ; f1576
	dutycycle $2
	soundinput $97
	sound $4, $f8, $0680
	sound $14, $f8, $0680
	sound $14, $c8, $0660
	sound $14, $a8, $0670
	sound $14, $88, $0680
	sound $14, $f8, $0561
	sound $14, $c8, $0541
	sound $14, $a8, $0521
	sound $14, $88, $0511
	soundinput $8
	endchannel
; f15a1

Sfx_GigaDrain_Ch8: ; f15a1
	noise $4, $c8, $44
	noise $14, $c8, $50
	noise $14, $c8, $52
	noise $14, $c8, $54
	noise $14, $c8, $56
	noise $40, $c7, $57
	endchannel
; f15b4

Sfx_Attract: ; f15b4
	dbw $04, Sfx_Attract_Ch5
; f15b7

Sfx_Attract_Ch5: ; f15b7
	dutycycle $0
	soundinput $77
	sound $4, $a9, $06f0
	sound $c, $f8, $0720
	soundinput $7f
	sound $8, $f1, $0740
	soundinput $8
	endchannel
; f15cc

Sfx_Kinesis2: ; f15cc
	dbw $04, Sfx_Kinesis2_Ch5
; f15cf

Sfx_Kinesis2_Ch5: ; f15cf
	dutycycle $0
	sound $2, $f3, $0796
	sound $2, $23, $0796
	sound $14, $f1, $07c4
	endchannel
; f15de

Sfx_ZapCannon: ; f15de
	dbw $07, Sfx_ZapCannon_Ch8
; f15e1

Sfx_ZapCannon_Ch8: ; f15e1
Sfx_ZapCannon_branch_f15e1: ; f15e1
	noise $2, $e1, $49
	noise $0, $0, $0
	loopchannel 8, Sfx_ZapCannon_branch_f15e1
	noise $8, $e1, $49
	endchannel
; f15ef

Sfx_MeanLook: ; f15ef
	dbw $04, Sfx_MeanLook_Ch5
; f15f2

Sfx_MeanLook_Ch5: ; f15f2
	soundinput $77
	dutycycle $3
	sound $2, $f8, $0720
Sfx_MeanLook_branch_f15fa: ; f15fa
	sound $1, $88, $0660
	sound $2, $f8, $0790
	loopchannel 5, Sfx_MeanLook_branch_f15fa
	sound $c, $f8, $0700
	sound $c, $c8, $0720
	sound $c, $a8, $0700
	sound $c, $78, $0720
	sound $c, $48, $0700
	sound $c, $28, $0720
	soundinput $8
	endchannel
; f1621

Sfx_HealBell: ; f1621
	dbw $04, Sfx_HealBell_Ch5
; f1624

Sfx_HealBell_Ch5: ; f1624
	dutycycle $1
	sound $1, $f1, $07da
	sound $1, $d1, $07d9
	sound $1, $f1, $07da
	sound $8, $d1, $07db
	endchannel
; f1637

Sfx_Return: ; f1637
	dbw $04, Sfx_Return_Ch5
; f163a

Sfx_Return_Ch5: ; f163a
	dutycycle $0
Sfx_Return_branch_f163c: ; f163c
	soundinput $bf
	sound $8, $f1, $0759
	soundinput $57
	sound $8, $f1, $0759
	sound $10, $0, $0000
	loopchannel 2, Sfx_Return_branch_f163c
	soundinput $8
	endchannel
; f1653

Sfx_ExpBar: ; f1653
	dbw $04, Sfx_ExpBar_Ch5
; f1656

Sfx_ExpBar_Ch5: ; f1656
	dutycycle $2
	soundinput $d7
	sound $8, $e1, $0750
	soundinput $e7
	sound $8, $48, $06e0
	sound $8, $58, $06f8
	sound $8, $68, $0710
	sound $8, $78, $0728
	sound $8, $88, $0740
	sound $8, $98, $0758
	sound $10, $a8, $0770
	soundinput $8
	endchannel
; f167f

Sfx_MilkDrink: ; f167f
	dbw $04, Sfx_MilkDrink_Ch5
; f1682

Sfx_MilkDrink_Ch5: ; f1682
	dutycycle $2
Sfx_MilkDrink_branch_f1684: ; f1684
	soundinput $a4
	sound $2, $ea, $04e0
	sound $d, $f7, $0290
	soundinput $9e
	sound $4, $c9, $05e1
	sound $2, $0, $0000
	loopchannel 6, Sfx_MilkDrink_branch_f1684
	soundinput $8
	endchannel
; f169f

Sfx_Present: ; f169f
	dbw $04, Sfx_Present_Ch5
; f16a2

Sfx_Present_Ch5: ; f16a2
	dutycycle $2
	soundinput $d6
Sfx_Present_branch_f16a6: ; f16a6
	sound $2, $f1, $0740
	sound $1, $0, $0000
	loopchannel 3, Sfx_Present_branch_f16a6
	sound $10, $f1, $0780
	soundinput $8
	endchannel
; f16b9

Sfx_MorningSun: ; f16b9
	dbw $04, Sfx_MorningSun_Ch5
; f16bc

Sfx_MorningSun_Ch5: ; f16bc
	dutycycle $3
Sfx_MorningSun_branch_f16be: ; f16be
	sound $2, $f1, $07e4
	sound $2, $f1, $07e0
	sound $5, $f2, $07e7
	loopchannel 3, Sfx_MorningSun_branch_f16be
	sound $1, $0, $0000
	sound $8, $c2, $07e7
	sound $1, $0, $0000
	sound $8, $82, $07e7
	endchannel
; f16df

Sfx_Moonlight: ; f16df
	dbw $04, Sfx_Moonlight_Ch5
; f16e2

Sfx_Moonlight_Ch5: ; f16e2
	dutycycle $2
Sfx_Moonlight_branch_f16e4: ; f16e4
	sound $1, $f8, $07d0
	sound $4, $f1, $07e0
	loopchannel 2, Sfx_Moonlight_branch_f16e4
	sound $10, $f1, $07e0
	sound $10, $d1, $07e0
	sound $10, $81, $07e0
	endchannel
; f16fd

Sfx_Encore: ; f16fd
	dbw $44, Sfx_Encore_Ch5
	dbw $07, Sfx_Encore_Ch8
; f1703

Sfx_Encore_Ch5: ; f1703
	dutycycle $2
	soundinput $ce
	sound $10, $0, $0000
Sfx_Encore_branch_f170b: ; f170b
	sound $2, $f8, $0774
	sound $24, $0, $0000
	loopchannel 2, Sfx_Encore_branch_f170b
	soundinput $8
	endchannel
; f171a

Sfx_Encore_Ch8: ; f171a
	noise $30, $1f, $36
	noise $30, $76, $36
	endchannel
; f1721

Sfx_BeatUp: ; f1721
	dbw $07, Sfx_BeatUp_Ch8
; f1724

Sfx_BeatUp_Ch8: ; f1724
	noise $2, $e8, $69
	noise $6, $d8, $24
	noise $2, $e8, $6c
	noise $4, $c8, $46
	noise $6, $d1, $24
	endchannel
; f1734

Sfx_SweetScent: ; f1734
	dbw $04, Sfx_SweetScent_Ch5
; f1737

Sfx_SweetScent_Ch5: ; f1737
	dutycycle $2
	soundinput $96
	sound $6, $f8, $0760
	sound $6, $e8, $0720
	soundinput $df
	sound $16, $f1, $0730
	soundinput $8
	endchannel
; f174c

Sfx_BatonPass: ; f174c
	dbw $44, Sfx_BatonPass_Ch5
	dbw $07, Sfx_BatonPass_Ch8
; f1752

Sfx_BatonPass_Ch5: ; f1752
	dutycycle $2
	soundinput $f7
	sound $20, $f2, $0680
	sound $1, $f1, $0760
	sound $20, $0, $0000
	sound $1, $f1, $0760
	sound $1a, $0, $0000
	sound $1, $f1, $0760
	soundinput $8
	endchannel
; f1771

Sfx_BatonPass_Ch8: ; f1771
	noise $20, $f2, $20
	endchannel
; f1775

Sfx_EggCrack: ; f1775
	dbw $04, Sfx_EggCrack_Ch5
; f1778

Sfx_EggCrack_Ch5: ; f1778
	togglesfx
	notetype $1, $f1
	dutycycle $0
	octave 4
	note D#, 1
	note C_, 1
	note __, 1
	note F#, 1
	endchannel
; f1784

Sfx_Evolved: ; f1784
	dbw $04, Sfx_Evolved_Ch5
; f1787

Sfx_Evolved_Ch5: ; f1787
	togglesfx
	notetype $1, $c1
	octave 4
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 3
	note G_, 3
	note B_, 3
	octave 5
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 3
	note B_, 3
	octave 7
	note C_, 16
	endchannel
; f179b

Sfx_MasterBall: ; f179b
	dbw $04, Sfx_MasterBall_Ch5
; f179e

Sfx_MasterBall_Ch5: ; f179e
	togglesfx
	dutycycle $1
	notetype $2, $e1
	octave 6
	note B_, 2
	octave 7
	note D_, 2
	octave 6
	note B_, 2
	note G_, 2
	note B_, 2
	note A#, 2
	note A_, 2
	note A#, 2
	note A_, 2
	intensity $c1
	note G#, 2
	note G_, 2
	note F#, 2
	intensity $91
	note F_, 2
	note E_, 2
	note D#, 2
	intensity $61
	note D_, 2
	note C#, 2
	note C_, 2
	endchannel
; f17c0

Sfx_EggHatch: ; f17c0
	dbw $04, Sfx_EggHatch_Ch5
; f17c3

Sfx_EggHatch_Ch5: ; f17c3
	togglesfx
	notetype $2, $f1
	dutycycle $2
	octave 5
	note E_, 1
	note C_, 1
	note __, 1
	note G_, 1
	note D_, 1
	intensity $e2
	note B_, 7
	intensity $82
	note B_, 7
	intensity $42
	note B_, 7
	endchannel
; f17d9

Sfx_GsIntroCharizardFireball: ; f17d9
	dbw $07, Sfx_GsIntroCharizardFireball_Ch8
; f17dc

Sfx_GsIntroCharizardFireball_Ch8: ; f17dc
	noise $8, $cf, $4d
	noise $8, $f1, $37
Sfx_GsIntroCharizardFireball_branch_f17e2: ; f17e2
	noise $1, $f8, $4f
	noise $0, $c8, $26
	noise $1, $d8, $5f
	noise $0, $a8, $37
	loopchannel 12, Sfx_GsIntroCharizardFireball_branch_f17e2
	noise $3, $f8, $6f
	noise $4, $d8, $5f
	noise $c, $d8, $5c
	noise $28, $d3, $4f
	endchannel
; f17ff

Sfx_GsIntroPokemonAppears: ; f17ff
	dbw $07, Sfx_GsIntroPokemonAppears_Ch8
; f1802

Sfx_GsIntroPokemonAppears_Ch8: ; f1802
	noise $1, $88, $4f
	noise $2, $8f, $2
	noise $2, $5f, $12
	noise $2, $3f, $22
	noise $0, $f8, $27
	noise $1, $f8, $4f
	noise $8, $f1, $0
	endchannel
; f1818

Sfx_Flash: ; f1818
	dbw $04, Sfx_Flash_Ch5
; f181b

Sfx_Flash_Ch5: ; f181b
	dutycycle $1
	soundinput $ef
	sound $1, $40, $07e8
	sound $1, $60, $07e8
	sound $2, $80, $07e8
	sound $5, $a0, $07e8
	sound $6, $a0, $07e8
	sound $7, $80, $07e8
	sound $8, $60, $07e8
	sound $9, $30, $07e8
	sound $f, $12, $07e8
	soundinput $8
	endchannel
; f1846

Sfx_GameFreakLogoGs: ; f1846
	dbw $04, Sfx_GameFreakLogoGs_Ch5
; f1849

Sfx_GameFreakLogoGs_Ch5: ; f1849
	dutycycle $3
	soundinput $7f
	sound $4, $55, $07e2
	sound $5, $75, $07e2
	sound $6, $94, $07e2
	sound $7, $b4, $07e2
	sound $8, $b3, $07e2
	sound $9, $93, $07e2
	sound $a, $72, $07e2
	sound $a, $53, $07e2
	sound $a, $34, $07e2
	sound $a, $15, $07e2
	soundinput $8
	endchannel
; f1878

Sfx_DexFanfareLessThan20: ; f1878
	dbw $c4, Sfx_DexFanfareLessThan20_Ch5
	dbw $05, Sfx_DexFanfareLessThan20_Ch6
	dbw $06, Sfx_DexFanfareLessThan20_Ch7
	dbw $07, Sfx_DexFanfareLessThan20_Ch8
; f1884

Sfx_DexFanfareLessThan20_Ch5: ; f1884
	togglesfx
	tempo 124
	volume $77
	notetype $8, $b1
	octave 3
	note A_, 4
	note F#, 2
	note A_, 4
	note F#, 2
	note C#, 6
	note G_, 6
	note F#, 6
	note E_, 2
	note E_, 2
	note E_, 2
	note D_, 6
	endchannel
; f189a




Sfx_DexFanfareLessThan20_Ch6: ; f189b
	togglesfx
	notetype $8, $c1
	octave 3
	note B_, 4
	note A_, 2
	note B_, 4
	note A_, 2
	note D#, 6
	note A#, 6
	note A_, 6
	note A_, 2
	note A_, 2
	note G_, 2
	note F#, 6
	endchannel
; f18ac




Sfx_DexFanfareLessThan20_Ch7: ; f18ad
	togglesfx
	notetype $8, $25
	octave 4
	note D_, 6
	octave 3
	note A_, 2
	note __, 2
	note A_, 2
	note A#, 4
	note G_, 2
	octave 4
	note D#, 6
	note D_, 2
	note __, 4
	octave 3
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 2
	note __, 6
	endchannel
; f18c7




Sfx_DexFanfareLessThan20_Ch8: ; f18c8
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C#, 6
	note __, 16
	note __, 12
	endchannel
; f18d1




Sfx_DexFanfare140169: ; f18d2
	dbw $c4, Sfx_DexFanfare140169_Ch5
	dbw $05, Sfx_DexFanfare140169_Ch6
	dbw $06, Sfx_DexFanfare140169_Ch7
	dbw $07, Sfx_DexFanfare140169_Ch8
; f18de

Sfx_DexFanfare140169_Ch5: ; f18de
	togglesfx
	tempo 120
	volume $77
	dutycycle $3
	vibrato $12, $34
	notetype $6, $b1
	note __, 8
	octave 3
	note E_, 4
	note E_, 4
	note A_, 4
	octave 4
	note C#, 4
	intensity $a4
	note D_, 4
	note C_, 4
	octave 3
	note A_, 2
	note G_, 2
	note F#, 4
	note G_, 16
	octave 2
	note B_, 8
	note __, 8
	endchannel
; f1900




Sfx_DexFanfare140169_Ch6: ; f1901
	togglesfx
	dutycycle $2
	vibrato $12, $34
	notetype $6, $c1
	octave 4
	note E_, 4
	note F#, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	intensity $b4
	note F#, 4
	note G_, 4
	note A_, 4
	octave 5
	note C_, 4
	octave 4
	note B_, 16
	note G_, 8
	note __, 8
	endchannel
; f191d




Sfx_DexFanfare140169_Ch7: ; f191e
	togglesfx
	notetype $c, $25
	note __, 4
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note A_, 3
	note C#, 1
	note __, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 3
	octave 2
	note A_, 1
	note __, 1
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note G_, 3
	octave 2
	note B_, 1
	note __, 1
	note G_, 4
	note __, 4
	endchannel
; f193e




Sfx_DexFanfare140169_Ch8: ; f193f
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 4
Sfx_DexFanfare140169_branch_f1945: ; f1945
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 3, Sfx_DexFanfare140169_branch_f1945
	note D_, 8
	endchannel
; f1950




Sfx_DexFanfare170199: ; f1951
	dbw $c4, Sfx_DexFanfare170199_Ch5
	dbw $05, Sfx_DexFanfare170199_Ch6
	dbw $06, Sfx_DexFanfare170199_Ch7
	dbw $07, Sfx_DexFanfare170199_Ch8
; f195d

Sfx_DexFanfare170199_Ch5: ; f195d
	togglesfx
	tempo 112
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b4
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 6
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $c1
	note F_, 4
	note G_, 4
	note A_, 4
	notetype $c, $a8
	note A#, 12
	note __, 4
	endchannel
; f1981




Sfx_DexFanfare170199_Ch6: ; f1982
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $c4
	octave 3
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 6
	note __, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	intensity $d1
	octave 4
	note D#, 4
	note D#, 4
	note D#, 4
	notetype $c, $b8
	note D_, 12
	note __, 4
	endchannel
; f19a2




Sfx_DexFanfare170199_Ch7: ; f19a3
	togglesfx
	notetype $8, $25
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 6
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	notetype $c, $25
	octave 2
	note A#, 12
	note __, 4
	endchannel
; f19bf




Sfx_DexFanfare170199_Ch8: ; f19c0
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	note B_, 16
	endchannel
; f19d5




Sfx_DexFanfare200229: ; f19d6
	dbw $c4, Sfx_DexFanfare200229_Ch5
	dbw $05, Sfx_DexFanfare200229_Ch6
	dbw $06, Sfx_DexFanfare200229_Ch7
	dbw $07, Sfx_DexFanfare200229_Ch8
; f19e2

Sfx_DexFanfare200229_Ch5: ; f19e2
	togglesfx
	tempo 124
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	note A#, 4
	octave 4
	note D#, 4
	note G_, 4
	notetype $c, $a8
	note F#, 12
	note __, 4
	endchannel
; f1a03




Sfx_DexFanfare200229_Ch6: ; f1a04
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b2
	octave 3
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	note E_, 4
	note D_, 4
	note C_, 4
	note D#, 4
	note G_, 4
	note A#, 4
	notetype $c, $b8
	note A_, 12
	note __, 4
	endchannel
; f1a1e




Sfx_DexFanfare200229_Ch7: ; f1a1f
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 4
	note D#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note D_, 6
	note __, 6
	endchannel
; f1a49




Sfx_DexFanfare200229_Ch8: ; f1a4a
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note B_, 12
	endchannel
; f1a65




Sfx_DexFanfare230Plus: ; f1a66
	dbw $c4, Sfx_DexFanfare230Plus_Ch5
	dbw $05, Sfx_DexFanfare230Plus_Ch6
	dbw $06, Sfx_DexFanfare230Plus_Ch7
	dbw $07, Sfx_DexFanfare230Plus_Ch8
; f1a72

Sfx_DexFanfare230Plus_Ch5: ; f1a72
	togglesfx
	tempo 112
	volume $77
	vibrato $12, $34
	dutycycle $3
	notetype $8, $a5
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 14
	note __, 2
	dutycycle $2
	intensity $85
	octave 2
	note F_, 1
	note __, 1
	note F_, 6
	intensity $a5
	dutycycle $3
	octave 3
	note A_, 2
	note G_, 2
	note F_, 10
	note __, 2
	dutycycle $2
	intensity $85
	octave 2
	note F_, 1
	note __, 1
	note F_, 6
	intensity $a5
	dutycycle $3
	octave 3
	note A#, 12
	intensity $b2
	note G_, 4
	note A_, 4
	note A#, 4
	notetype $c, $a8
	note A_, 14
	note __, 2
	endchannel
; f1ab1




Sfx_DexFanfare230Plus_Ch6: ; f1ab2
	togglesfx
	vibrato $12, $34
	dutycycle $3
	notetype $8, $b5
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 14
	note __, 4
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 10
	note __, 4
	note A_, 2
	octave 4
	note C_, 2
	note D_, 2
	note D#, 12
	intensity $c2
	note G_, 4
	note G_, 4
	note G_, 4
	notetype $c, $b8
	note F#, 14
	note __, 2
	endchannel
; f1ad9




Sfx_DexFanfare230Plus_Ch7: ; f1ada
	togglesfx
	notetype $8, $25
	octave 3
	note G_, 6
	note A#, 4
	note F_, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 2
	note __, 2
	note D_, 1
	note __, 1
	note D_, 6
	note A_, 4
	note F_, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note C_, 1
	note __, 1
	note C_, 6
	note G_, 4
	note D#, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 4
	note G_, 4
	note D#, 4
	notetype $c, $25
	note D_, 14
	note __, 2
	endchannel
; f1b0b




Sfx_DexFanfare230Plus_Ch8: ; f1b0c
	togglesfx
	sfxtogglenoise $4
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
Sfx_DexFanfare230Plus_branch_f1b14: ; f1b14
	note D_, 6
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 2, Sfx_DexFanfare230Plus_branch_f1b14
	note D_, 6
	note D_, 2
	note D_, 2
	note C#, 1
	note C#, 1
	note D_, 4
	note D_, 4
	note D_, 4
Sfx_DexFanfare230Plus_branch_f1b2b: ; f1b2b
	note C#, 1
	loopchannel 18, Sfx_DexFanfare230Plus_branch_f1b2b
	note D_, 6
	endchannel
; f1b32




Sfx_NotVeryEffective: ; f1b33
	dbw $07, Sfx_NotVeryEffective_Ch8
; f1b36

Sfx_NotVeryEffective_Ch8: ; f1b36
	noise $4, $f1, $5f
	noise $1, $a0, $42
	noise $10, $f1, $53
	endchannel
; f1b40

Sfx_Damage: ; f1b40
	dbw $07, Sfx_Damage_Ch8
; f1b43

Sfx_Damage_Ch8: ; f1b43
	noise $4, $f1, $5e
	noise $1, $a0, $12
	noise $4, $f0, $32
	noise $10, $f1, $44
	endchannel
; f1b50

Sfx_SuperEffective: ; f1b50
	dbw $07, Sfx_SuperEffective_Ch8
; f1b53

Sfx_SuperEffective_Ch8: ; f1b53
	noise $3, $f1, $4f
	noise $1, $c8, $22
	noise $2, $f8, $3f
	noise $3, $d0, $15
	noise $20, $f2, $35
	endchannel
; f1b63

Sfx_BallBounce: ; f1b63
	dbw $44, Sfx_BallBounce_Ch5
	dbw $05, Sfx_BallBounce_Ch6
; f1b69

Sfx_BallBounce_Ch5: ; f1b69
	dutycycle $2
	sound $8, $e1, $0740
	sound $17, $0, $0000
	sound $8, $b1, $0740
	sound $17, $0, $0000
	sound $8, $81, $0740
	sound $17, $0, $0000
	sound $8, $51, $0740
	sound $17, $0, $0000
	endchannel
; f1b8c

Sfx_BallBounce_Ch6: ; f1b8c
	dutycycle $2
	sound $2, $8, $0000
	sound $8, $b1, $0741
	sound $17, $0, $0000
	sound $8, $81, $0741
	sound $17, $0, $0000
	sound $8, $51, $0741
	sound $17, $0, $0000
	sound $8, $21, $0741
	sound $17, $0, $0000
	endchannel
; f1bb3

Sfx_SweetScent2: ; f1bb3
	dbw $44, Sfx_SweetScent2_Ch5
	dbw $07, Sfx_SweetScent2_Ch8
; f1bb9

Sfx_SweetScent2_Ch5: ; f1bb9
	soundinput $af
	dutycycle $1
	sound $6, $f8, $05f0
	sound $2, $f1, $0620
	sound $10, $f1, $0650
	soundinput $8
	endchannel
; f1bcc

Sfx_SweetScent2_Ch8: ; f1bcc
	noise $2, $e8, $22
	noise $11, $aa, $0
Sfx_SweetScent2_branch_f1bd2: ; f1bd2
	noise $4, $d9, $10
	noise $8, $91, $0
	noise $2, $61, $7
	loopchannel 5, Sfx_SweetScent2_branch_f1bd2
	noise $4, $99, $0
	noise $a, $61, $0
	noise $6, $59, $0
	noise $2, $21, $7
	endchannel
; f1bec

Sfx_HitEndOfExpBar: ; f1bec
	dbw $44, Sfx_HitEndOfExpBar_Ch5
	dbw $05, Sfx_HitEndOfExpBar_Ch6
; f1bf2

Sfx_HitEndOfExpBar_Ch5: ; f1bf2
	dutycycle $2
	sound $1, $e1, $0789
	sound $1, $e1, $07a2
	sound $10, $e1, $07b1
	endchannel
; f1c01

Sfx_HitEndOfExpBar_Ch6: ; f1c01
	dutycycle $2
	sound $1, $e1, $07a2
	sound $1, $e1, $07b1
	sound $10, $e1, $07c4
	endchannel
; f1c10

Sfx_GiveTrademon: ; f1c10
	dbw $04, Sfx_GiveTrademon_Ch5
; f1c13

Sfx_GiveTrademon_Ch5: ; f1c13
	sound $20, $0, $0000
	dutycycle $1
	soundinput $a7
	sound $1b, $f4, $0750
	sound $1b, $d4, $0750
	sound $1b, $b4, $0750
	sound $1b, $94, $0750
	sound $1b, $74, $0750
	sound $1b, $54, $0750
	sound $1b, $34, $0750
	sound $1b, $14, $0750
	soundinput $8
	endchannel
; f1c3e

Sfx_GetTrademon: ; f1c3e
	dbw $04, Sfx_GetTrademon_Ch5
; f1c41

Sfx_GetTrademon_Ch5: ; f1c41
	sound $20, $0, $0000
	dutycycle $2
	soundinput $bf
	sound $1b, $14, $07bc
	sound $1b, $34, $07bc
	sound $1b, $54, $07bc
	sound $1b, $74, $07bc
	sound $1b, $94, $07bc
	sound $1b, $b4, $07bc
	sound $1b, $d4, $07bc
	sound $1b, $f4, $07bc
	soundinput $8
	endchannel
; f1c6c

Sfx_TrainArrived: ; f1c6c
	dbw $84, Sfx_TrainArrived_Ch5
	dbw $05, Sfx_TrainArrived_Ch6
	dbw $07, Sfx_TrainArrived_Ch8
; f1c75

Sfx_TrainArrived_Ch6: ; f1c75
	tone $0008
	sound $8, $0, $0000
Sfx_TrainArrived_Ch5: ; f1c7c
	dutycycle $2
	sound $4, $5f, $0691
	sound $4, $6f, $0694
	sound $4, $78, $0697
	sound $4, $7f, $069a
	sound $4, $68, $06ae
	sound $10, $6f, $06ab
	sound $68, $65, $06a8
	endchannel
; f1c9b

Sfx_TrainArrived_Ch8: ; f1c9b
	noise $5, $af, $10
	noise $4, $9f, $20
	noise $4, $8f, $21
	noise $4, $7f, $22
	noise $4, $8f, $21
	noise $4, $9f, $20
	noise $4, $9f, $10
	noise $68, $a3, $0
	endchannel
; f1cb4

Sfx_2Boops: ; f1cb4
	dbw $04, Sfx_2Boops_Ch5
; f1cb7

Sfx_2Boops_Ch5: ; f1cb7
	dutycycle $2
Sfx_2Boops_branch_f1cb9: ; f1cb9
	soundinput $79
	sound $1, $99, $0563
	sound $4, $f2, $04b5
	soundinput $43
	sound $10, $f8, $05cd
	loopchannel 2, Sfx_2Boops_branch_f1cb9
	soundinput $8
	endchannel
; f1cd0

Sfx_UnknownCB: ; f1cd0
	dbw $07, Sfx_UnknownCB_Ch8
; f1cd3

Sfx_Menu_Ch8: ; f1cd3
	noise $1, $e2, $33
	noise $8, $e1, $22
	endchannel
; f1cda

Sfx_Pokeflute_Ch7: ; f1cda
	tempo 256
	volume $77
	togglesfx
	vibrato $10, $14
	notetype $c, $10
	octave 5
	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 2
	note G_, 2
	octave 6
	note C_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 5
	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 8
	note __, 12
	endchannel
; f1cf8

Sfx_PlacePuzzlePieceDown_Ch8: ; f1cf8
	noise $2, $f7, $24
	noise $2, $f7, $34
	noise $4, $f7, $44
	noise $8, $f4, $55
	noise $8, $f1, $44
	endchannel
; f1d08

Sfx_EnterDoor_Ch8: ; f1d08
	noise $9, $f1, $44
	noise $8, $d1, $43
	endchannel
; f1d0f

Sfx_SwitchPokemon_Ch5: ; f1d0f
	dutycycle $2
	sound $8, $e1, $0740
	endchannel
; f1d16

Sfx_SwitchPokemon_Ch6: ; f1d16
	dutycycle $2
	sound $2, $8, $0000
	sound $8, $b1, $0741
	endchannel
; f1d21

Sfx_PokeballsPlacedOnTable_Ch5: ; f1d21
	dutycycle $2
	soundinput $3a
	sound $4, $f2, $0200
	soundinput $22
	sound $8, $e2, $0200
	soundinput $8
	endchannel
; f1d32

Sfx_BallWiggle_Ch5: ; f1d32
	dutycycle $2
	soundinput $3a
	sound $4, $f2, $0400
	soundinput $22
	sound $8, $e2, $0400
	soundinput $8
	endchannel
; f1d43

Sfx_Tally_Ch5: ; f1d43
	dutycycle $2
	sound $4, $f1, $0780
	endchannel
; f1d4a

Sfx_Tally_Ch6: ; f1d4a
	dutycycle $2
	sound $1, $8, $0000
	sound $4, $a1, $0761
	endchannel
; f1d55

Sfx_Transaction_Ch5: ; f1d55
	dutycycle $2
	sound $4, $e1, $0700
	sound $18, $f2, $07e0
	endchannel
; f1d60

Sfx_Transaction_Ch6: ; f1d60
	dutycycle $2
	sound $1, $8, $0000
	sound $4, $91, $06c1
	sound $18, $a2, $07a1
	endchannel
; f1d6f

Sfx_Bump_Ch5: ; f1d6f
	dutycycle $2
	soundinput $5a
	sound $f, $f1, $0300
	soundinput $8
	endchannel
; f1d7a

Sfx_ExitBuilding_Ch8: ; f1d7a
	noise $2, $f1, $54
	noise $c, $71, $23
	noise $2, $b1, $54
	noise $c, $61, $23
	noise $6, $41, $54
	endchannel
; f1d8a

Sfx_ReadText2_Ch5: ; f1d8a
Sfx_ReadText_Ch5: ; f1d8a
	dutycycle $2
	sound $0, $91, $07c0
	sound $0, $81, $07d0
	sound $0, $91, $07c0
	sound $c, $a1, $07d0
	endchannel
; f1d9d

Sfx_Potion_Ch5: ; f1d9d
	dutycycle $2
	soundinput $17
	sound $f, $f0, $04f0
	sound $f, $f2, $0650
	soundinput $8
	endchannel
; f1dac

Sfx_Poison_Ch5: ; f1dac
Sfx_Poison_branch_f1dac: ; f1dac
	dutycycle $0
	soundinput $14
	sound $4, $f2, $0600
	loopchannel 4, Sfx_Poison_branch_f1dac
	sound $f, $f3, $0600
	soundinput $8
	endchannel
; f1dbf

Sfx_FullHeal_Ch5: ; f1dbf
	dutycycle $2
	soundinput $14
	sound $4, $f2, $0600
	sound $4, $f2, $0600
	soundinput $17
	sound $f, $f2, $0600
	soundinput $8
	endchannel
; f1dd4

Sfx_GotSafariBalls_Ch5: ; f1dd4
	dutycycle $2
	soundinput $15
	sound $f, $f0, $04f0
	sound $f, $f2, $0650
	soundinput $8
	endchannel
; f1de3

Sfx_BootPc_Ch5: ; f1de3
	dutycycle $2
	sound $f, $f2, $07c0
	sound $f, $0, $0000
	sound $3, $a1, $0780
	sound $3, $a1, $0700
	sound $3, $a1, $0740
	sound $3, $a1, $0700
	sound $3, $a1, $0780
	sound $3, $a1, $0700
	sound $3, $a1, $07c0
	sound $8, $a1, $0700
	endchannel
; f1e0e

Sfx_ShutDownPc_Ch5: ; f1e0e
	dutycycle $2
	sound $4, $f0, $0600
	sound $4, $f0, $0400
	sound $4, $f0, $0200
	sound $1, $0, $0000
	endchannel
; f1e21

Sfx_ChoosePcOption_Ch5: ; f1e21
	dutycycle $2
	sound $6, $f0, $0700
	sound $4, $0, $0000
	sound $6, $f0, $0700
	sound $1, $0, $0000
	endchannel
; f1e34

Sfx_EscapeRope_Ch5: ; f1e34
	dutycycle $1
	soundinput $17
	sound $f, $d7, $0600
	sound $f, $b7, $0580
	sound $f, $87, $0500
	sound $f, $47, $0480
	sound $f, $17, $0400
	soundinput $8
	endchannel
; f1e4f

Sfx_PushButton_Ch5: ; f1e4f
	dutycycle $2
	sound $4, $0, $0000
	sound $2, $f1, $0680
	sound $1, $0, $0000
	sound $4, $f1, $0780
	sound $4, $0, $0000
	endchannel
; f1e66

Sfx_SecondPartOfItemfinder_Ch5: ; f1e66
	dutycycle $2
	soundinput $2c
	sound $4, $f2, $0500
	soundinput $22
	sound $2, $f1, $0500
	soundinput $8
	sound $1, $0, $0000
	endchannel
; f1e7b

Sfx_WarpTo_Ch5: ; f1e7b
	dutycycle $1
	soundinput $17
	sound $f, $d7, $0500
	sound $f, $b7, $0580
	sound $f, $87, $0600
	sound $f, $47, $0680
	sound $f, $17, $0700
	soundinput $8
	endchannel
; f1e96

Sfx_WarpFrom_Ch5: ; f1e96
	dutycycle $1
	soundinput $17
	sound $f, $d7, $0700
	sound $f, $b7, $0680
	sound $f, $87, $0600
	sound $f, $47, $0580
	sound $f, $17, $0500
	soundinput $8
	endchannel
; f1eb1

Sfx_ChangeDexMode_Ch5: ; f1eb1
	dutycycle $1
	soundinput $16
	sound $f, $d2, $0500
	soundinput $8
	endchannel
; f1ebc

Sfx_JumpOverLedge_Ch5: ; f1ebc
	dutycycle $2
	soundinput $95
	sound $f, $f2, $0400
	soundinput $8
	endchannel
; f1ec7

Sfx_GrassRustle_Ch8: ; f1ec7
	noise $2, $f1, $32
	noise $2, $0, $0
	noise $2, $f1, $22
	noise $1, $0, $0
	endchannel
; f1ed4

Sfx_Fly_Ch8: ; f1ed4
	noise $2, $f1, $12
	noise $2, $0, $0
	noise $2, $a1, $12
	noise $2, $0, $0
	noise $2, $d1, $12
	noise $2, $0, $0
	noise $2, $81, $12
	noise $2, $0, $0
	noise $2, $b1, $12
	noise $2, $0, $0
	noise $2, $61, $12
	noise $2, $0, $0
	noise $2, $91, $12
	noise $2, $0, $0
	noise $2, $41, $12
	noise $2, $0, $0
	endchannel
; f1f05

Sfx_Wrong_Ch5: ; f1f05
	dutycycle $3
	soundinput $5a
	sound $4, $f0, $0500
	soundinput $8
	sound $4, $0, $0000
	sound $f, $f0, $0500
	sound $1, $0, $0000
	endchannel
; f1f1c

Sfx_Wrong_Ch6: ; f1f1c
	dutycycle $3
	sound $4, $f0, $0401
	sound $4, $0, $0000
	sound $f, $f0, $0401
	sound $1, $0, $0000
	endchannel
; f1f2f

Sfx_Squeak_Ch5: ; f1f2f
	dutycycle $0
	soundinput $17
	sound $f, $d2, $0700
	soundinput $8
	endchannel
; f1f3a

Sfx_Strength_Ch8: ; f1f3a
	noise $4, $a2, $23
	noise $8, $f1, $34
	noise $f, $0, $0
	noise $2, $f7, $24
	noise $2, $f7, $34
	noise $4, $f7, $44
	noise $8, $f4, $55
	noise $8, $f1, $44
	endchannel
; f1f53

Sfx_Boat_Ch5: ; f1f53
	dutycycle $2
	sound $f, $f0, $0500
	sound $4, $0, $0000
	sound $f, $f0, $0500
	sound $f, $f0, $0500
	sound $f, $f0, $0500
	sound $f, $f0, $0500
	sound $f, $f2, $0500
	endchannel
; f1f72

Sfx_Boat_Ch6: ; f1f72
	dutycycle $3
	sound $f, $f0, $0482
	sound $4, $0, $0000
	sound $f, $f0, $0482
	sound $f, $f0, $0482
	sound $f, $f0, $0482
	sound $f, $f0, $0482
	sound $f, $f2, $0482
	endchannel
; f1f91

Sfx_WallOpen_Ch5: ; f1f91
	dutycycle $1
	soundinput $3a
	sound $4, $f2, $0500
	soundinput $22
	sound $4, $e2, $0500
	soundinput $3a
	sound $4, $f2, $0700
	soundinput $22
	sound $f, $e2, $0700
	soundinput $8
	endchannel
; f1fae

Sfx_ElevatorEnd_Ch5: ; f1fae
	dutycycle $2
	sound $f, $f3, $0730
	sound $8, $65, $0730
	sound $f, $f4, $0700
	sound $f, $74, $0700
	sound $f, $44, $0700
	sound $f, $24, $0700
	endchannel
; f1fc9

Sfx_ThrowBall_Ch5: ; f1fc9
	dutycycle $2
	soundinput $2f
	sound $f, $f2, $0780
	endchannel
; f1fd2

Sfx_ThrowBall_Ch6: ; f1fd2
	dutycycle $2
	sound $f, $c2, $0782
	endchannel
; f1fd9

Sfx_Shine_Ch5: ; f1fd9
	dutycycle $0
	sound $0, $d2, $0700
	sound $0, $d2, $0740
	sound $0, $d2, $0780
	sound $0, $d2, $07c0
	sound $a, $e1, $07e0
	sound $1, $0, $0000
	endchannel
; f1ff4

Sfx_BallPoof_Ch5: ; f1ff4
	dutycycle $2
	soundinput $16
	sound $f, $f2, $0400
	soundinput $8
	endchannel
; f1fff

Sfx_BallPoof_Ch8: ; f1fff
	noise $f, $a2, $22
	endchannel
; f2003

Sfx_Unknown3A_Ch5: ; f2003
	sound $f, $d1, $0200
	soundinput $8
	endchannel
; f200a

Sfx_Unknown3A_Ch8: ; f200a
	noise $4, $f5, $33
	noise $8, $f4, $22
	noise $f, $f2, $21
	endchannel
; f2014

Sfx_Run_Ch8: ; f2014
	noise $2, $61, $23
	noise $2, $a1, $33
	noise $2, $c1, $33
	noise $2, $51, $11
	noise $2, $f1, $33
	noise $2, $41, $11
	noise $2, $c1, $33
	noise $2, $31, $11
	noise $2, $81, $33
	noise $2, $31, $11
	noise $8, $41, $33
	endchannel
; f2036

Sfx_SlotMachineStart_Ch5: ; f2036
	dutycycle $2
	soundinput $44
	sound $f, $f0, $04f0
	soundinput $17
	sound $f, $f2, $0650
	soundinput $8
	endchannel
; f2047

Sfx_SlotMachineStart_Ch6: ; f2047
	dutycycle $2
	sound $f, $92, $0600
	sound $f, $92, $0782
	endchannel
; f2052

Sfx_Call_Ch5: ; f2052
	soundinput $67
	sound $4, $f7, $07a0
	sound $4, $f7, $07a0
	sound $4, $f7, $07a0
	sound $4, $f7, $07a0
	sound $4, $f7, $07a0
	soundinput $8
	sound $4, $0, $0000
	endchannel
; f206f

Sfx_Peck_Ch8: ; f206f
	noise $2, $a1, $12
	endchannel
; f2073

Sfx_Kinesis_Ch5: ; f2073
	dutycycle $1
	soundinput $af
	sound $f, $f2, $0780
	soundinput $8
	endchannel
; f207e

Sfx_Lick_Ch5: ; f207e
	dutycycle $1
	soundinput $97
	sound $f, $f2, $0500
	soundinput $8
	endchannel
; f2089

Sfx_Pound_Ch8: ; f2089
	noise $2, $a1, $22
	endchannel
; f208d

Sfx_MovePuzzlePiece_Ch8: ; f208d
	noise $8, $f1, $54
	endchannel
; f2091

Sfx_CometPunch_Ch8: ; f2091
	noise $f, $8f, $11
	noise $4, $ff, $12
	noise $a, $f1, $55
	endchannel
; f209b

Sfx_MegaPunch_Ch8: ; f209b
	noise $f, $8f, $34
	noise $8, $f2, $35
	noise $a, $f1, $55
	endchannel
; f20a5

Sfx_Scratch_Ch8: ; f20a5
	noise $f, $9f, $23
	noise $8, $f1, $21
	endchannel
; f20ac

Sfx_Vicegrip_Ch8: ; f20ac
	noise $2, $e1, $4b
	noise $a, $f1, $44
	noise $2, $e1, $3a
	noise $6, $f1, $34
	endchannel
; f20b9

Sfx_RazorWind_Ch8: ; f20b9
	noise $2, $f4, $44
	noise $2, $f4, $14
	noise $f, $f1, $32
	endchannel
; f20c3

Sfx_Cut_Ch8: ; f20c3
	noise $4, $8f, $55
	noise $2, $f4, $44
	noise $8, $f4, $22
	noise $f, $f2, $21
	endchannel
; f20d0

Sfx_WingAttack_Ch8: ; f20d0
Sfx_WingAttack_branch_f20d0: ; f20d0
	noise $8, $4f, $23
	noise $4, $c4, $22
	noise $6, $f2, $23
	loopchannel 4, Sfx_WingAttack_branch_f20d0
	endchannel
; f20de

Sfx_Whirlwind_Ch8: ; f20de
	noise $8, $4f, $33
	noise $4, $c4, $22
	noise $6, $f2, $23
	noise $f, $f2, $22
	endchannel
; f20eb

Sfx_Bind_Ch8: ; f20eb
	noise $8, $ff, $32
	noise $8, $f4, $43
	noise $8, $f2, $54
	noise $8, $f1, $65
	endchannel
; f20f8

Sfx_VineWhip_Ch8: ; f20f8
	noise $1, $c2, $33
	noise $2, $f2, $21
	noise $1, $e2, $33
	noise $1, $c2, $32
	noise $1, $92, $12
	noise $1, $b2, $31
	noise $c, $91, $10
	noise $8, $f2, $41
	endchannel
; f2111

Sfx_DoubleKick_Ch8: ; f2111
	noise $1, $94, $23
	noise $1, $b4, $22
	noise $8, $f1, $44
	endchannel
; f211b

Sfx_MegaKick_Ch8: ; f211b
	noise $2, $94, $33
	noise $4, $b4, $22
	noise $4, $f1, $44
	noise $8, $f1, $55
	endchannel
; f2128

Sfx_Headbutt_Ch8: ; f2128
	noise $4, $ff, $55
	noise $8, $f1, $65
	endchannel
; f212f

Sfx_HornAttack_Ch8: ; f212f
	noise $2, $84, $43
	noise $2, $c4, $22
	noise $8, $f2, $34
	endchannel
; f2139

Sfx_Tackle_Ch8: ; f2139
	noise $4, $f1, $34
	noise $f, $f2, $64
	endchannel
; f2140

Sfx_PoisonSting_Ch8: ; f2140
	noise $2, $f1, $22
	noise $f, $f2, $12
	endchannel
; f2147

Sfx_Powder_Ch8: ; f2147
	noise $2, $c2, $1
	noise $f, $f4, $1
	noise $f, $f2, $1
	endchannel
; f2151

Sfx_Doubleslap_Ch8: ; f2151
	noise $8, $f1, $32
	noise $8, $f1, $33
	endchannel
; f2158

Sfx_Bite_Ch5: ; f2158
	dutycycle $0
	soundinput $3a
	sound $4, $f2, $0200
	soundinput $22
	sound $8, $e2, $0200
	soundinput $8
	endchannel
; f2169

Sfx_Bite_Ch8: ; f2169
	noise $0, $d1, $42
	noise $4, $a1, $32
	noise $0, $d1, $22
	noise $6, $a1, $32
	endchannel
; f2176

Sfx_JumpKick_Ch8: ; f2176
	noise $3, $92, $31
	noise $3, $b2, $32
	noise $3, $c2, $33
	noise $8, $f1, $54
	endchannel
; f2183

Sfx_Stomp_Ch8: ; f2183
	noise $c, $f1, $54
	noise $8, $f1, $64
	endchannel
; f218a

Sfx_TailWhip_Ch8: ; f218a
	noise $2, $f1, $33
	noise $2, $c1, $32
	noise $2, $a1, $31
	noise $f, $82, $32
	noise $8, $f1, $34
	endchannel
; f219a

Sfx_KarateChop_Ch8: ; f219a
	noise $2, $d2, $32
	noise $f, $f2, $43
	endchannel
; f21a1

Sfx_Submission_Ch8: ; f21a1
	noise $2, $f2, $43
	noise $4, $b5, $32
	noise $9, $86, $31
	noise $7, $64, $0
	noise $f, $f2, $55
	endchannel
; f21b1

Sfx_WaterGun_Ch5: ; f21b1
	dutycycle $1
	soundinput $97
	sound $f, $f2, $0700
	soundinput $8
	endchannel
; f21bc

Sfx_WaterGun_Ch8: ; f21bc
	noise $f, $3f, $22
	noise $f, $f2, $21
	endchannel
; f21c3

Sfx_SwordsDance_Ch8: ; f21c3
	noise $f, $4f, $41
	noise $8, $8f, $41
	noise $8, $cf, $41
	noise $8, $f2, $42
	noise $f, $f2, $41
	endchannel
; f21d3

Sfx_Thunder_Ch8: ; f21d3
	noise $a, $ff, $50
	noise $f, $ff, $51
	noise $8, $f2, $51
	noise $6, $ff, $52
	noise $6, $ff, $53
	noise $8, $ff, $54
	noise $f, $f2, $54
	endchannel
; f21e9

Sfx_Supersonic_Ch5: ; f21e9
	dutycycle $2
	sound $f, $3f, $07c0
Sfx_Supersonic_branch_f21ef: ; f21ef
	sound $f, $df, $07c0
	loopchannel 4, Sfx_Supersonic_branch_f21ef
	sound $f, $d1, $07c0
	endchannel
; f21fc

Sfx_Supersonic_Ch6: ; f21fc
	unknownmusic0xde $b3
	sound $f, $2f, $07c8
Sfx_Supersonic_branch_f2202: ; f2202
	sound $f, $cf, $07c7
	loopchannel 4, Sfx_Supersonic_branch_f2202
	sound $f, $c1, $07c8
	endchannel
; f220f

Sfx_Supersonic_Ch8: ; f220f
Sfx_Supersonic_branch_f220f: ; f220f
	noise $3, $97, $12
	noise $3, $a1, $11
	loopchannel 10, Sfx_Supersonic_branch_f220f
	endchannel
; f221a

Sfx_Leer_Ch5: ; f221a
Sfx_Leer_branch_f221a: ; f221a
	dutycycle $0
	sound $0, $f1, $07c0
	sound $0, $f1, $0700
	loopchannel 12, Sfx_Leer_branch_f221a
	endchannel
; f2229

Sfx_Leer_Ch6: ; f2229
Sfx_Leer_branch_f2229: ; f2229
	unknownmusic0xde $b3
	sound $0, $e1, $07c1
	sound $0, $e1, $0701
	loopchannel 12, Sfx_Leer_branch_f2229
	endchannel
; f2238

Sfx_Leer_Ch8: ; f2238
Sfx_Leer_branch_f2238: ; f2238
	noise $1, $d1, $49
	noise $1, $d1, $29
	loopchannel 6, Sfx_Leer_branch_f2238
	endchannel
; f2243

Sfx_Ember_Ch5: ; f2243
Sfx_Ember_branch_f2243: ; f2243
	unknownmusic0xde $c9
	sound $b, $f3, $0120
	sound $9, $d3, $0150
	loopchannel 5, Sfx_Ember_branch_f2243
	sound $8, $e3, $0130
	sound $f, $c2, $0110
	endchannel
; f225a

Sfx_Ember_Ch8: ; f225a
Sfx_Ember_branch_f225a: ; f225a
	noise $a, $f3, $35
	noise $e, $f6, $45
	loopchannel 4, Sfx_Ember_branch_f225a
	noise $c, $f4, $bc
	noise $c, $f5, $9c
	noise $f, $f4, $ac
	endchannel
; f226e

Sfx_Bubblebeam_Ch5: ; f226e
Sfx_Bubblebeam_branch_f226e: ; f226e
	unknownmusic0xde $39
	sound $4, $f4, $0600
	sound $3, $c4, $0500
	sound $5, $b5, $0600
	sound $d, $e2, $06c0
	loopchannel 3, Sfx_Bubblebeam_branch_f226e
	sound $8, $d1, $0600
	endchannel
; f2289

Sfx_Bubblebeam_Ch6: ; f2289
Sfx_Bubblebeam_branch_f2289: ; f2289
	unknownmusic0xde $8d
	sound $5, $e4, $05e0
	sound $4, $b4, $04e0
	sound $6, $a5, $05e8
	sound $e, $d1, $06a0
	loopchannel 3, Sfx_Bubblebeam_branch_f2289
	endchannel
; f22a0

Sfx_Bubblebeam_Ch8: ; f22a0
Sfx_Bubblebeam_branch_f22a0: ; f22a0
	noise $5, $c3, $33
	noise $3, $92, $43
	noise $a, $b5, $33
	noise $f, $c3, $32
	loopchannel 2, Sfx_Bubblebeam_branch_f22a0
	endchannel
; f22b1

Sfx_HydroPump_Ch5: ; f22b1
Sfx_HydroPump_branch_f22b1: ; f22b1
	unknownmusic0xde $d2
	sound $3, $81, $0300
	sound $3, $c1, $0400
	sound $3, $f1, $0500
	sound $3, $b1, $0400
	sound $3, $71, $0300
	loopchannel 5, Sfx_HydroPump_branch_f22b1
	sound $8, $81, $0400
	endchannel
; f22d0

Sfx_HydroPump_Ch8: ; f22d0
Sfx_HydroPump_branch_f22d0: ; f22d0
	noise $3, $62, $22
	noise $3, $a2, $32
	noise $3, $d2, $33
	noise $3, $92, $23
	noise $3, $52, $12
	loopchannel 5, Sfx_HydroPump_branch_f22d0
	noise $8, $81, $12
	endchannel
; f22e7

Sfx_Surf_Ch5: ; f22e7
Sfx_Surf_branch_f22e7: ; f22e7
	unknownmusic0xde $39
	sound $f, $f4, $0500
	sound $f, $c4, $0400
	sound $f, $e2, $05c0
	loopchannel 3, Sfx_Surf_branch_f22e7
	endchannel
; f22fa

Sfx_Surf_Ch6: ; f22fa
Sfx_Surf_branch_f22fa: ; f22fa
	unknownmusic0xde $8d
	sound $7, $e4, $0430
	sound $f, $b4, $0330
	sound $f, $a2, $0438
	loopchannel 4, Sfx_Surf_branch_f22fa
	endchannel
; f230d

Sfx_Surf_Ch8: ; f230d
Sfx_Surf_branch_f230d: ; f230d
	noise $9, $f4, $44
	noise $9, $f2, $43
	noise $f, $f4, $42
	noise $f, $f4, $41
	loopchannel 3, Sfx_Surf_branch_f230d
	endchannel
; f231e

Sfx_Psybeam_Ch5: ; f231e
Sfx_Psybeam_branch_f231e: ; f231e
	unknownmusic0xde $a1
	sound $a, $f1, $0640
	sound $a, $f3, $0680
	sound $a, $f2, $0620
	loopchannel 4, Sfx_Psybeam_branch_f231e
	sound $a, $f1, $0640
	endchannel
; f2335

Sfx_Psybeam_Ch6: ; f2335
Sfx_Psybeam_branch_f2335: ; f2335
	unknownmusic0xde $b3
	sound $a, $f3, $0571
	sound $7, $e3, $0531
	sound $a, $f1, $0551
	loopchannel 4, Sfx_Psybeam_branch_f2335
	sound $a, $f1, $0571
	endchannel
; f234c

Sfx_Psybeam_Ch8: ; f234c
Sfx_Psybeam_branch_f234c: ; f234c
	noise $2, $d1, $4a
	noise $2, $d2, $2a
	loopchannel 21, Sfx_Psybeam_branch_f234c
	endchannel
; f2357

Sfx_Charge_Ch5: ; f2357
Sfx_Charge_branch_f2357: ; f2357
	dutycycle $0
	sound $2, $f1, $0200
	sound $3, $f1, $0700
	sound $4, $f1, $0500
	sound $5, $f1, $07f0
	loopchannel 8, Sfx_Charge_branch_f2357
	endchannel
; f236e

Sfx_Charge_Ch6: ; f236e
Sfx_Charge_branch_f236e: ; f236e
	unknownmusic0xde $b3
	sound $2, $e1, $0302
	sound $3, $e1, $07f2
	sound $4, $e1, $0602
	sound $5, $e1, $0702
	loopchannel 8, Sfx_Charge_branch_f236e
	endchannel
; f2385

Sfx_Charge_Ch8: ; f2385
Sfx_Charge_branch_f2385: ; f2385
	noise $2, $d3, $10
	noise $3, $d3, $11
	noise $2, $d2, $10
	noise $5, $d2, $12
	loopchannel 9, Sfx_Charge_branch_f2385
	endchannel
; f2396

Sfx_Thundershock_Ch5: ; f2396
Sfx_Thundershock_branch_f2396: ; f2396
	unknownmusic0xde $2b
	sound $3, $f1, $07f0
	sound $4, $f2, $0200
	loopchannel 8, Sfx_Thundershock_branch_f2396
	endchannel
; f23a5

Sfx_Thundershock_Ch6: ; f23a5
Sfx_Thundershock_branch_f23a5: ; f23a5
	unknownmusic0xde $b3
	sound $4, $e2, $0202
	sound $4, $e1, $07e2
	loopchannel 9, Sfx_Thundershock_branch_f23a5
	endchannel
; f23b4

Sfx_Thundershock_Ch8: ; f23b4
Sfx_Thundershock_branch_f23b4: ; f23b4
	noise $4, $ff, $43
	noise $4, $f2, $44
	loopchannel 9, Sfx_Thundershock_branch_f23b4
	endchannel
; f23bf

Sfx_Psychic_Ch5: ; f23bf
	dutycycle $2
	soundinput $f7
	sound $8, $c4, $07bd
	sound $8, $c4, $07be
	sound $8, $c4, $07bf
	sound $8, $c4, $07c0
	sound $f, $c4, $07c1
	sound $f, $f2, $07c0
	soundinput $8
	endchannel
; f23de

Sfx_Psychic_Ch6: ; f23de
	dutycycle $2
	sound $8, $c4, $0770
	sound $8, $c4, $0761
	sound $8, $c4, $0762
	sound $8, $c4, $0763
	sound $f, $c4, $0764
	sound $f, $f2, $0764
	endchannel
; f23f9

Sfx_Psychic_Ch8: ; f23f9
	noise $f, $3f, $14
	noise $f, $cf, $13
	noise $f, $cf, $12
	noise $f, $cf, $11
	noise $f, $cf, $10
	noise $f, $c2, $10
	endchannel
; f240c

Sfx_Screech_Ch5: ; f240c
	dutycycle $2
	sound $f, $ff, $07e0
	sound $f, $ff, $07e0
	sound $f, $ff, $07e0
	sound $f, $ff, $07e0
	sound $f, $f2, $07e0
	endchannel
; f2423

Sfx_Screech_Ch6: ; f2423
	dutycycle $3
	sound $f, $ff, $07e2
	sound $f, $ff, $07e1
	sound $f, $ff, $07e2
	sound $f, $ff, $07e1
	sound $f, $f2, $07e2
	endchannel
; f243a

Sfx_BoneClub_Ch5: ; f243a
	dutycycle $2
	soundinput $af
	sound $8, $f1, $0700
	soundinput $8
	endchannel
; f2445

Sfx_BoneClub_Ch6: ; f2445
	dutycycle $3
	sound $8, $f1, $0701
	endchannel
; f244c

Sfx_Sharpen_Ch5: ; f244c
	dutycycle $2
	sound $6, $f1, $0500
	sound $6, $f1, $0580
	sound $6, $f1, $0600
	sound $6, $f1, $0680
	sound $8, $f1, $0700
	endchannel
; f2463

Sfx_Sharpen_Ch6: ; f2463
	dutycycle $3
	sound $6, $e1, $0510
	sound $6, $e1, $0590
	sound $6, $e1, $0610
	sound $6, $e1, $0690
	sound $8, $e1, $0710
	endchannel
; f247a

Sfx_EggBomb_Ch5: ; f247a
	unknownmusic0xde $ed
	sound $8, $ff, $03f8
	sound $f, $ff, $0400
	sound $f, $f3, $0400
	endchannel
; f2489

Sfx_EggBomb_Ch6: ; f2489
	unknownmusic0xde $b4
	sound $8, $ef, $03c0
	sound $f, $ef, $03c0
	sound $f, $e3, $03c0
	endchannel
; f2498

Sfx_EggBomb_Ch8: ; f2498
	noise $4, $ff, $51
	noise $8, $ff, $54
	noise $f, $ff, $55
	noise $f, $f3, $56
	endchannel
; f24a5

Sfx_Sing_Ch5: ; f24a5
	togglesfx
	vibrato $a, $24
	dutycycle $2
	notetype $a, $87
	octave 5
	note G_, 8
	octave 6
	note F_, 4
	note D#, 4
	octave 5
	note G_, 8
	endchannel
; f24b6

Sfx_Sing_Ch6: ; f24b6
	togglesfx
	vibrato $a, $23
	dutycycle $2
	notetype $b, $67
	octave 5
	note G_, 8
	notetype $a, $67
	octave 6
	note F_, 4
	note D#, 4
	octave 5
	note G_, 8
	endchannel
; f24ca

Sfx_HyperBeam_Ch5: ; f24ca
	dutycycle $0
	sound $2, $f1, $0780
	sound $2, $f1, $0700
	sound $2, $f1, $0790
	sound $2, $f1, $0700
	sound $2, $f1, $07a0
	sound $2, $f1, $0700
	sound $2, $f1, $07b0
	sound $2, $f1, $0700
	sound $2, $f1, $07c0
	sound $2, $f1, $0700
	sound $2, $f1, $07d0
Sfx_HyperBeam_branch_f24f8: ; f24f8
	sound $2, $f1, $0700
	sound $2, $f1, $07e0
	loopchannel 12, Sfx_HyperBeam_branch_f24f8
	sound $f, $f1, $0700
	endchannel
; f2509

Sfx_HyperBeam_Ch6: ; f2509
	unknownmusic0xde $b3
	sound $2, $f1, $0781
	sound $2, $f1, $0701
	sound $2, $f1, $0791
	sound $2, $f1, $0701
	sound $2, $f1, $07a1
	sound $2, $f1, $0701
	sound $2, $f1, $07b1
	sound $2, $f1, $0701
	sound $2, $f1, $07c1
	sound $2, $f1, $0701
	sound $2, $f1, $07d1
Sfx_HyperBeam_branch_f2537: ; f2537
	sound $2, $f1, $0701
	sound $2, $f1, $07e1
	loopchannel 12, Sfx_HyperBeam_branch_f2537
	sound $f, $f1, $0701
	endchannel
; f2548

Sfx_HyperBeam_Ch8: ; f2548
Sfx_HyperBeam_branch_f2548: ; f2548
	noise $1, $d1, $49
	noise $1, $d1, $29
	loopchannel 26, Sfx_HyperBeam_branch_f2548
	endchannel
; f2553

Sfx_Unknown60_Ch8: ; f2553
	noise $6, $20, $10
	noise $6, $2f, $40
	noise $6, $4f, $41
	noise $6, $8f, $41
	noise $6, $cf, $42
	noise $8, $d7, $42
	noise $f, $e7, $43
	noise $f, $f2, $43
	endchannel
; f256c

Sfx_UnknownCB_Ch8: ; f256c
	noise $1, $10, $10
	noise $2, $20, $10
	noise $2, $30, $20
	noise $2, $40, $20
	noise $2, $50, $21
	noise $2, $60, $22
	noise $4, $70, $22
	noise $8, $80, $22
	noise $f, $94, $22
	endchannel
; f2588

Sfx_Unknown61_Ch8: ; f2588
	noise $4, $d1, $41
	endchannel
; f258c

Sfx_Unknown62_Ch8: ; f258c
	noise $4, $c1, $42
	endchannel
; f2590

Sfx_Unknown63_Ch8: ; f2590
	noise $2, $6f, $21
	noise $2, $af, $31
	noise $f, $f2, $41
	endchannel
; f259a

Sfx_Burn_Ch8: ; f259a
	noise $2, $d2, $32
	noise $f, $f2, $43
	endchannel
; f25a1

Sfx_TitleScreenEntrance_Ch8: ; f25a1
	noise $2, $70, $22
	noise $2, $80, $23
	noise $2, $90, $24
	noise $2, $a0, $25
	noise $2, $b0, $26
	noise $f, $c2, $26
	endchannel
; f25b4

Sfx_Unknown66_Ch5: ; f25b4
	dutycycle $2
	sound $1, $f2, $06a0
	sound $1, $f2, $06e0
	sound $8, $f1, $0700
	endchannel
; f25c3

Sfx_GetCoinFromSlots_Ch5: ; f25c3
	dutycycle $2
	sound $2, $f1, $0700
	sound $8, $81, $07e0
	endchannel
; f25ce

Sfx_PayDay_Ch5: ; f25ce
	dutycycle $3
	sound $5, $e1, $0700
	sound $2, $e1, $0780
	sound $f, $f1, $07c0
	endchannel
; f25dd

Sfx_PayDay_Ch6: ; f25dd
	dutycycle $2
	sound $4, $c1, $06c1
	sound $2, $c1, $0741
	sound $f, $d1, $0781
	endchannel
; f25ec

Sfx_Metronome_Ch5: ; f25ec
	dutycycle $2
	soundinput $5f
	sound $4, $40, $07e0
	sound $4, $60, $07e0
	sound $4, $80, $07e0
	sound $8, $a0, $07e0
	sound $8, $a0, $07e0
	sound $8, $80, $07e0
	sound $8, $60, $07e0
	sound $8, $30, $07e0
	sound $f, $12, $07e0
	soundinput $8
	endchannel
; f2617

Sfx_Unknown5F_Ch5: ; f2617
Sfx_Unknown5F_branch_f2617: ; f2617
	sound $2, $f7, $0601
	sound $2, $f7, $0701
	loopchannel 8, Sfx_Unknown5F_branch_f2617
	endchannel
; f2624

Sfx_Unknown5F_Ch6: ; f2624
	sound $1, $f7, $ffff
	sound $2, $f7, $0602
	sound $2, $f7, $0702
	loopchannel 8, Sfx_Unknown5F_branch_f2617
	endchannel
; f2635

Sfx_Fanfare2_Ch5: ; f2635
	togglesfx
	sfxpriorityon
	tempo 256
	volume $77
	tone $0001
	dutycycle $3
	notetype $6, $b5
	octave 3
	note G#, 4
	notetype $4, $b2
	note F_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	note F#, 2
	note A#, 2
	octave 4
	note C_, 4
	note C_, 2
	notetype $4, $b6
	note C#, 12
	sfxpriorityoff
	endchannel
; f2658

Sfx_Fanfare2_Ch6: ; f2658
	togglesfx
	dutycycle $2
	notetype $6, $c5
	octave 4
	note C#, 6
	notetype $4, $c1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $4, $c2
	note D#, 2
	note C#, 2
	note D#, 2
	note E_, 4
	note E_, 2
	notetype $4, $c6
	note F_, 12
	endchannel
; f2673

Sfx_Fanfare2_Ch8: ; f2673
	togglesfx
	notetype $6
	note C_, 1
	octave 5
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	notetype $4
	note C_, 1
	note C#, 2
	note __, 2
	note C#, 2
	note D#, 2
	note __, 2
	note F_, 2
	note G#, 6
	endchannel
; f2687

Sfx_Fanfare_Ch5: ; f2687
	togglesfx
	sfxpriorityon
	tempo 256
	volume $77
	dutycycle $3
	tone $0001
	notetype $6, $b3
	octave 3
	note F_, 4
	note C#, 4
	note F#, 4
	note D#, 4
	note G#, 4
	note F_, 4
	note A#, 4
	note F#, 4
	notetype $4, $b3
	note A#, 4
	note B_, 4
	octave 4
	note C_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	notetype $4, $b6
	note C#, 12
	sfxpriorityoff
	endchannel
; f26af

Sfx_Fanfare_Ch6: ; f26af
	togglesfx
	dutycycle $2
	notetype $6, $c4
	octave 4
	note C#, 4
	notetype $4, $c4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note D#, 6
	note D#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note F_, 6
	note F_, 2
	note C#, 2
	note F_, 2
	note F#, 6
	note F#, 2
	note D#, 2
	note F#, 2
	note C#, 4
	note D#, 4
	note E_, 4
	note F_, 4
	note F#, 4
	note G#, 4
	notetype $4, $c6
	note F#, 12
	endchannel
; f26d8

Sfx_Fanfare_Ch8: ; f26d8
	togglesfx
	notetype $6
	note C_, 1
	octave 4
	note A#, 4
	note __, 4
	note B_, 4
	note __, 4
	octave 5
	note C#, 4
	note __, 4
	note D#, 4
	note __, 4
	notetype $4
	note C_, 1
	note F_, 4
	note D#, 4
	note C#, 4
	note A#, 4
	note G#, 4
	note F_, 4
	note F#, 6
	endchannel
; f26f1

Sfx_HangUp_Ch5: ; f26f1
	dutycycle $2
	sound $4, $b8, $077b
	sound $2, $21, $077b
	sound $10, $0, $0000
Sfx_HangUp_branch_f26ff: ; f26ff
Sfx_NoSignal_Ch5: ; f26ff
Sfx_NoSignal_branch_f26ff: ; f26ff
	dutycycle $2
	sound $14, $e8, $070b
	sound $1c, $0, $0000
	loopchannel 3, Sfx_HangUp_branch_f26ff
	endchannel
; f270e

Sfx_Sandstorm_Ch8: ; f270e
Sfx_Sandstorm_branch_f270e: ; f270e
Sfx_Unknown5F_Ch8: ; f270e
Sfx_Unknown5F_branch_f270e: ; f270e
	noise $1, $f8, $41
	noise $2, $9c, $24
	noise $0, $0, $0
	noise $3, $59, $16
	noise $2, $0, $0
	loopchannel 3, Sfx_Sandstorm_branch_f270e
	endchannel
; f2722

Sfx_Elevator_Ch5: ; f2722
	dutycycle $2
	soundinput $5a
Sfx_Elevator_branch_f2726: ; f2726
	sound $2, $f1, $0300
	loopchannel 48, Sfx_Elevator_branch_f2726
	soundinput $8
	dutycycle $2
	sound $f, $f3, $0730
	sound $8, $65, $0730
	sound $f, $f4, $0700
	sound $f, $74, $0700
	sound $f, $44, $0700
	sound $f, $24, $0700
	endchannel
; f274b

Sfx_Elevator_Ch6: ; f274b
Sfx_Elevator_Ch7: ; f274b
	sound $60, $0, $0000
	sound $53, $0, $0000
	endchannel
; f2754

Sfx_Elevator_Ch8: ; f2754
	noise $60, $0, $0
	noise $53, $0, $0
	endchannel
; f275b

Sfx_StopSlot: ; f275b
	dbw $04, Sfx_StopSlot_Ch5
; f275e

Sfx_StopSlot_Ch5: ; f275e
	dutycycle $2
	sound $1, $f8, $0760
	sound $4, $82, $0760
	endchannel
; f2769

Sfx_GlassTing: ; f2769
	dbw $04, Sfx_GlassTing_Ch5
; f276c

Sfx_GlassTing_Ch5: ; f276c
	dutycycle $2
	sound $20, $d1, $07dc
	endchannel
; f2773

Sfx_GlassTing2: ; f2773
	dbw $44, Sfx_GlassTing2_Ch5
	dbw $05, Sfx_GlassTing2_Ch6
; f2779

Sfx_GlassTing2_Ch5: ; f2779
	dutycycle $2
	sound $10, $f1, $07dc
	endchannel
; f2780

Sfx_GlassTing2_Ch6: ; f2780
	dutycycle $2
	sound $10, $d1, $07dd
	endchannel
; f2787
