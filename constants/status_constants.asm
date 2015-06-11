; non-volatile statuses
SLP EQU %111 ; sleep counter
PSN EQU 3
BRN EQU 4
FRZ EQU 5
PAR EQU 6

; volatile statuses 1
StoringEnergy          EQU 0 ; Bide
ThrashingAbout         EQU 1 ; e.g. Thrash
AttackingMultipleTimes EQU 2 ; e.g. Double Kick, Fury Attack
Flinched               EQU 3
ChargingUp             EQU 4 ; e.g. Solar Beam, Fly
UsingTrappingMove      EQU 5 ; e.g. Wrap
Invulnerable           EQU 6 ; charging up Fly/Dig
Confused               EQU 7

; volatile statuses 2
UsingXAccuracy    EQU 0
ProtectedByMist   EQU 1
GettingPumped     EQU 2 ; Focus Energy
;                 EQU 3 ; unused?
HasSubstituteUp   EQU 4
NeedsToRecharge   EQU 5 ; Hyper Beam
UsingRage         EQU 6
Seeded            EQU 7

; volatile statuses 3
BadlyPoisoned    EQU 0
HasLightScreenUp EQU 1
HasReflectUp     EQU 2
Transformed      EQU 3
