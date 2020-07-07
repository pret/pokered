; Used in wram.asm

flag_array: MACRO
	ds ((\1) + 7) / 8
ENDM

BOX_STRUCT_LENGTH EQU 25 + NUM_MOVES * 2

box_struct: MACRO
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

party_struct: MACRO
	box_struct \1
\1Level::      db
\1Stats::
\1MaxHP::      dw
\1Attack::     dw
\1Defense::    dw
\1Speed::      dw
\1Special::    dw
ENDM

battle_struct: MACRO
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

spritestatedata1: MACRO
\1PictureID:: db
\1MovementStatus:: db
\1ImageIndex:: db
\1YStepVector:: db
\1YPixels:: db
\1XStepVector:: db
\1XPixels:: db
\1IntraAnimFrameCounter:: db
\1AnimFrameCounter:: db
\1FacingDirection:: db
\1YAdjusted:: db
\1XAdjusted:: db
\1CollisionData:: db
	ds 3
\1End::
ENDM

spritestatedata2: MACRO
\1WalkAnimationCounter:: db
	ds 1
\1YDisplacement:: db
\1XDisplacement:: db
\1MapY:: db
\1MapX:: db
\1MovementByte1:: db
\1GrassPriority:: db
\1MovementDelay:: db
\1OrigFacingDirection:: db
	ds 3
\1PictureID:: db
\1ImageBaseOffset:: db
	ds 1
\1End::
ENDM
