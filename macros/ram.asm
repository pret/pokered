; Used in wram.asm

MACRO flag_array
	ds ((\1) + 7) / 8
ENDM

DEF BOX_STRUCT_LENGTH EQU 25 + NUM_MOVES * 2

MACRO box_struct
\1Species::    db
\1HP::         dw
\1BoxLevel::   db
\1Status::     db
\1Type::
\1Type1::      db
\1Type2::      db
\1CatchRate::  db
\1Moves::      ds NUM_MOVES
\1OTID::       dw
\1Exp::        ds 3
\1HPExp::      dw
\1AttackExp::  dw
\1DefenseExp:: dw
\1SpeedExp::   dw
\1SpecialExp:: dw
\1DVs::        ds 2
\1PP::         ds NUM_MOVES
ENDM

MACRO party_struct
	box_struct \1
\1Level::      db
\1Stats::
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
ENDM

MACRO battle_struct
\1Species::    db
\1HP::         dw
\1PartyPos::
\1BoxLevel::   db
\1Status::     db
\1Type::
\1Type1::      db
\1Type2::      db
\1CatchRate::  db
\1Moves::      ds NUM_MOVES
\1DVs::        ds 2
\1Level::      db
\1Stats::
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
\1PP::         ds NUM_MOVES
ENDM

MACRO spritestatedata1
\1PictureID::             db
\1MovementStatus::        db
\1ImageIndex::            db
\1YStepVector::           db
\1YPixels::               db
\1XStepVector::           db
\1XPixels::               db
\1IntraAnimFrameCounter:: db
\1AnimFrameCounter::      db
\1FacingDirection::       db
\1YAdjusted::             db
\1XAdjusted::             db
\1CollisionData::         db
	ds 3
\1End::
ENDM

MACRO spritestatedata2
\1WalkAnimationCounter:: db
	ds 1
\1YDisplacement::        db
\1XDisplacement::        db
\1MapY::                 db
\1MapX::                 db
\1MovementByte1::        db
\1GrassPriority::        db
\1MovementDelay::        db
\1OrigFacingDirection::  db
	ds 3
\1PictureID::            db
\1ImageBaseOffset::      db
	ds 1
\1End::
ENDM

MACRO sprite_oam_struct
\1YCoord::     db
\1XCoord::     db
\1TileID::     db
\1Attributes:: db
ENDM

MACRO map_connection_struct
\1ConnectedMap::            db
\1ConnectionStripSrc::      dw
\1ConnectionStripDest::     dw
\1ConnectionStripLength::   db
\1ConnectedMapWidth::       db
\1ConnectedMapYAlignment::  db
\1ConnectedMapXAlignment::  db
\1ConnectedMapViewPointer:: dw
ENDM

MACRO channel_struct
\1MusicID::           dw
\1MusicBank::         db
\1Flags1::            db ; 0:on/off 1:subroutine 2:looping 3:sfx 4:noise 5:rest
\1Flags2::            db ; 0:vibrato on/off 1:pitch slide 2:duty cycle pattern 4:pitch offset
\1Flags3::            db ; 0:vibrato up/down 1:pitch slide direction
\1MusicAddress::      dw
\1LastMusicAddress::  dw
                      dw
\1NoteFlags::         db ; 5:rest
\1Condition::         db ; conditional jumps
\1DutyCycle::         db ; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
\1VolumeEnvelope::    db ; hi:volume lo:fade
\1Frequency::         dw ; 11 bits
\1Pitch::             db ; 0:rest 1-c:note
\1Octave::            db ; 7-0 (0 is highest)
\1Transposition::     db ; raises existing octaves (to repeat phrases)
\1NoteDuration::      db ; frames remaining for the current note
\1Field16::           ds 1
                      ds 1
\1LoopCount::         db
\1Tempo::             dw
\1Tracks::            db ; hi:left lo:right
\1DutyCyclePattern::  db
\1VibratoDelayCount:: db ; initialized by \1VibratoDelay
\1VibratoDelay::      db ; number of frames a note plays until vibrato starts
\1VibratoExtent::     db
\1VibratoRate::       db ; hi:frames for each alt lo:frames to the next alt
\1PitchSlideTarget::  dw ; frequency endpoint for pitch slide
\1PitchSlideAmount::  db
\1PitchSlideAmountFraction::   db
\1Field25::           db
                      ds 1
\1PitchOffset::       dw
\1Field29::           ds 1
\1Field2a::           ds 2
\1Field2c::           ds 1
\1NoteLength::        db ; frames per 16th note
\1Field2e::           ds 1
\1Field2f::           ds 1
\1Field30::           ds 1
                      ds 1
ENDM
