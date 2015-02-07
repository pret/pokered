RockTunnelPokecenterScript: ; 493ba (12:53ba)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

RockTunnelPokecenterTextPointers: ; 493c0 (12:53c0)
	dw RockTunnelPokecenterText1
	dw RockTunnelPokecenterText2
	dw RockTunnelPokecenterText3
	dw RockTunnelPokecenterText4

RockTunnelPokecenterText1: ; 493c8 (12:53c8)
	db $ff

RockTunnelPokecenterText2: ; 493c9 (12:53c9)
	TX_FAR _RockTunnelPokecenterText1
	db "@"

RockTunnelPokecenterText3: ; 493ce (12:53ce)
	TX_FAR _RockTunnelPokecenterText3
	db "@"

RockTunnelPokecenterText4: ; 493d3 (12:53d3)
	db $f6
