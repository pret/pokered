; Reconciled from master RGBDS source: data/maps/badge_maps.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; MapBadgeFlags:
; Flags for gym badges (1 bit per badge)
.DB PEWTER_GYM, 1 << BIT_BOULDERBADGE
.DB CERULEAN_GYM, 1 << BIT_CASCADEBADGE
.DB VERMILION_GYM, 1 << BIT_THUNDERBADGE
.DB CELADON_GYM, 1 << BIT_RAINBOWBADGE
.DB FUCHSIA_GYM, 1 << BIT_SOULBADGE
.DB SAFFRON_GYM, 1 << BIT_MARSHBADGE
.DB CINNABAR_GYM, 1 << BIT_VOLCANOBADGE
.DB VIRIDIAN_GYM, 1 << BIT_EARTHBADGE
.DB -1 ; end
