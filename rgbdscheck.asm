MAJOR EQU 0
MINOR EQU 5
PATCH EQU 0

wrong_rgbds: MACRO
	fail "pokered requires rgbds v0.5.0 or newer."
ENDM

IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	wrong_rgbds
ELSE
IF (__RGBDS_MAJOR__ < MAJOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ < MINOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ == MINOR && __RGBDS_PATCH__ < PATCH) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ == MINOR && __RGBDS_PATCH__ == PATCH && DEF(__RGBDS_RC__))
	wrong_rgbds
ENDC
ENDC
