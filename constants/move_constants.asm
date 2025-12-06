; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - AttackAnimationPointers (see data/moves/animations.asm)
; - MoveSoundTable (see data/moves/sfx.asm)

; note: who the fuck cares about indexes

	const_def
	const NO_MOVE      
	const POUND        
	const KARATE_CHOP  
	const DOUBLESLAP   
	const COMET_PUNCH  
	const MEGA_PUNCH   
	const PAY_DAY      
	const FIRE_PUNCH   
	const ICE_PUNCH    
	const THUNDERPUNCH 
	const SCRATCH      
	const VICEGRIP     
	const GUILLOTINE   
	const RAZOR_WIND   
	const SWORDS_DANCE 
	const CUT          
	const GUST         
	const WING_ATTACK  
	const WHIRLWIND    
	const FLY          
	const BIND         
	const SLAM         
	const VINE_WHIP    
	const STOMP        
	const DOUBLE_KICK  
	const MEGA_KICK    
	const JUMP_KICK    
	const ROLLING_KICK 
	const SAND_ATTACK  
	const HEADBUTT     
	const HORN_ATTACK  
	const FURY_ATTACK  
	const HORN_DRILL   
	const TACKLE       
	const BODY_SLAM    
	const WRAP         
	const TAKE_DOWN    
	const THRASH       
	const DOUBLE_EDGE  
	const TAIL_WHIP    
	const POISON_STING 
	const TWINEEDLE    
	const PIN_MISSILE  
	const LEER         
	const BITE         
	const GROWL        
	const ROAR         
	const SING         
	const SUPERSONIC   
	const SONICBOOM    
	const DISABLE      
	const ACID         
	const EMBER        
	const FLAMETHROWER 
	const MIST         
	const WATER_GUN    
	const HYDRO_PUMP   
	const SURF         
	const ICE_BEAM     
	const BLIZZARD     
	const PSYBEAM      
	const BUBBLEBEAM   
	const AURORA_BEAM  
	const HYPER_BEAM   
	const PECK         
	const DRILL_PECK   
	const SUBMISSION   
	const LOW_KICK     
	const COUNTER      
	const SEISMIC_TOSS 
	const STRENGTH     
	const ABSORB       
	const MEGA_DRAIN   
	const LEECH_SEED   
	const GROWTH       
	const RAZOR_LEAF   
	const SOLARBEAM    
	const POISONPOWDER 
	const STUN_SPORE   
	const SLEEP_POWDER 
	const PETAL_DANCE  
	const STRING_SHOT  
	const DRAGON_RAGE  
	const FIRE_SPIN    
	const THUNDERSHOCK 
	const THUNDERBOLT  
	const THUNDER_WAVE 
	const THUNDER      
	const ROCK_THROW   
	const EARTHQUAKE   
	const FISSURE      
	const DIG          
	const TOXIC        
	const CONFUSION    
	const PSYCHIC_M    
	const HYPNOSIS     
	const MEDITATE     
	const AGILITY      
	const QUICK_ATTACK 
	const RAGE         
	const TELEPORT     
	const NIGHT_SHADE  
	const MIMIC        
	const SCREECH      
	const DOUBLE_TEAM  
	const RECOVER      
	const HARDEN       
	const MINIMIZE     
	const SMOKESCREEN  
	const CONFUSE_RAY  
	const WITHDRAW     
	const DEFENSE_CURL 
	const BARRIER      
	const LIGHT_SCREEN 
	const HAZE         
	const REFLECT      
	const FOCUS_ENERGY 
	const BIDE         
	const METRONOME    
	const MIRROR_MOVE  
	const SELFDESTRUCT 
	const EGG_BOMB     
	const LICK         
	const SMOG         
	const SLUDGE       
	const BONE_CLUB    
	const FIRE_BLAST   
	const WATERFALL    
	const CLAMP        
	const SWIFT        
	const SKULL_BASH   
	const SPIKE_CANNON 
	const CONSTRICT    
	const AMNESIA      
	const KINESIS      
	const SOFTBOILED   
	const HI_JUMP_KICK 
	const GLARE        
	const DREAM_EATER  
	const POISON_GAS   
	const BARRAGE      
	const LEECH_LIFE   
	const LOVELY_KISS  
	const SKY_ATTACK   
	const TRANSFORM    
	const BUBBLE       
	const DIZZY_PUNCH  
	const SPORE        
	const FLASH        
	const PSYWAVE      
	const SPLASH       
	const ACID_ARMOR   
	const CRABHAMMER   
	const EXPLOSION    
	const FURY_SWIPES  
	const BONEMERANG   
	const REST         
	const ROCK_SLIDE   
	const HYPER_FANG   
	const SHARPEN      
	const CONVERSION   
	const TRI_ATTACK   
	const SUPER_FANG   
	const SLASH        
	const SUBSTITUTE  

; New moves 
	const EXTREMESPEED 
	const MACH_PUNCH
	const SUPERPOWER
	const CLOSE_COMBAT
	const DRAIN_PUNCH
	const ROOST
	const AIR_CUTTER
	const AERIAL_ACE
	const AIR_SLASH
	const BRAVE_BIRD
	const HURRICANE
	const SLUDGE_BOMB
	const POISON_JAB
	const MUD_SLAP
	const MUD_SHOT
	const EARTH_POWER
	const DRILL_RUN
	const ROCK_TOMB
	const HEAD_SMASH
	const STONE_EDGE
	const BUG_BITE
	const X_SCISSOR
	const INFESTATION
	const SHADOW_BALL
	const SHADOW_PUNCH
	const SHADOW_SNEAK
	const SHADOW_CLAW
	const IRON_TAIL
	const SMART_STRIKE
	const BULLET_PUNCH
	const FLASH_CANNON
	const IRON_HEAD
	const WILL_O_WISP
	const FLARE_BLITZ
	const BLAST_BURN
	const HEAT_WAVE
	const WATER_PULSE
	const AQUA_JET
	const SCALD
	const HYDRO_CANNON
	const GIGA_DRAIN
	const MAGICAL_LEAF
	const BULLET_SEED
	const LEAF_STORM
	const ENERGY_BALL
	const FRENZY_PLANT
;	const ZAP_CANNON
	const SHOCK_WAVE
	const WILD_CHARGE
	const VOLT_TACKLE
	const ZEN_HEADBUTT
	const PSYCHO_CUT
	const ICICLE_CRASH
	const ICICLE_SPEAR
	const POWDER_SNOW
	const TWISTER
	const DRAGONBREATH
	const OUTRAGE
	const DRAGON_CLAW
	const DRACO_METEOR
	const FEINT_ATTACK
	const CRUNCH
	const NIGHT_SLASH
	const DARK_PULSE
	const CHARM
	const DRAININGKISS
	const PLAY_ROUGH
	const MOONBLAST
	const DAZZLE_GLEAM
	const DBLIRONBASH
	const DRAGONHAMMER
	const FREEZINGLARE
	const TUNDERUSKICK
	const FIERY_WRATH
	const STRUGGLE     
DEF NUM_ATTACKS EQU const_value - 1

DEF CANNOT_MOVE EQU $ff

	; Separate other battle animations
	const_def
	const NO_ANIM

	const SHOWPIC_ANIM
	const STATUS_AFFECTED_ANIM
	const ANIM_A8
	const ENEMY_HUD_SHAKE_ANIM
	const TRADE_BALL_DROP_ANIM
	const TRADE_BALL_SHAKE_ANIM
	const TRADE_BALL_TILT_ANIM
	const TRADE_BALL_POOF_ANIM
	const XSTATITEM_ANIM ; use X Attack/Defense/Speed/Special
	const XSTATITEM_DUPLICATE_ANIM
	const SHRINKING_SQUARE_ANIM
	const ANIM_B1
	const ANIM_B2
	const ANIM_B3
	const ANIM_B4
	const ANIM_B5
	const ANIM_B6
	const ANIM_B7
	const ANIM_B8
	const ANIM_B9
	const BURN_PSN_ANIM ; Plays when a monster is burned or poisoned
	const ANIM_BB
	const SLP_PLAYER_ANIM
	const SLP_ANIM ; sleeping monster
	const CONF_PLAYER_ANIM
	const CONF_ANIM ; confused monster
	const SLIDE_DOWN_ANIM
	const TOSS_ANIM ; toss Poké Ball
	const SHAKE_ANIM ; shaking Poké Ball when catching monster
	const POOF_ANIM ; puff of smoke
	const BLOCKBALL_ANIM ; trainer knocks away Poké Ball
	const GREATTOSS_ANIM ; toss Great Ball
	const ULTRATOSS_ANIM ; toss Ultra Ball or Master Ball
	const SHAKE_SCREEN_ANIM
	const HIDEPIC_ANIM ; monster disappears
	const ROCK_ANIM ; throw rock
	const BAIT_ANIM ; throw bait

DEF NUM_ALTERNATIVE_ANIMS EQU const_value - 1
