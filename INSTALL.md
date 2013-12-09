# Getting Started

A base rom of Pokémon Red is required to assemble **pokered.gbc**.

	Pokemon Red (UE) [S][!].gb
	(MD5: 3d45c1ee9abd5738df46d2bdda8b57dc)


# Linux

Linux dependencies. OSX users already have these after installing Xcode.

	sudo apt-get install make gcc bison git python python-setuptools

Install **rgbds**, a Game Boy assembler:

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	make
	sudo make install

	cd ..

Set up the pokered repository:

	git clone git://github.com/iimarckus/pokered.git
	cd pokered

	git submodule init
	git submodule update

	sudo easy_install pip
	pip install -r extras/requirements.txt

Put your base rom in the pokered repository. Name it "baserom.gbc".

	make red

This should take about 10-15 seconds. Subsequent builds are faster.


To build Pokémon Blue:

	make blue


# OSX

Download and install **Xcode**. Then follow the Linux instructions.


# Windows

Not yet.

