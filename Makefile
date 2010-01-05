pokered.gbc: pokered.asm
	rgbasm -opokered.obj pokered.asm
	xlink -z0 pokered.link
	rgbfix -p -v pokered.gbc
	cmp baserom.gbc pokered.gbc

clean:
	rm -f pokered.obj pokered.gbc
