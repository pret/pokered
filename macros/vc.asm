vc_hook: MACRO
if DEF(_RED_VC) || DEF(_BLUE_VC)
.VC_\1::
endc
ENDM

vc_patch: MACRO
if DEF(_RED_VC) || DEF(_BLUE_VC)
	assert !DEF(CURRENT_VC_PATCH), "Already started a vc_patch"
CURRENT_VC_PATCH EQUS "\1"
.VC_{CURRENT_VC_PATCH}::
endc
ENDM

vc_patch_end: MACRO
if DEF(_RED_VC) || DEF(_BLUE_VC)
	assert DEF(CURRENT_VC_PATCH), "No vc_patch started"
.VC_{CURRENT_VC_PATCH}_End::
	PURGE CURRENT_VC_PATCH
endc
ENDM

vc_assert: MACRO
if DEF(_RED_VC) || DEF(_BLUE_VC)
	assert \#
endc
ENDM
