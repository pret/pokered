# Getting Started

A base rom of Pokémon Red is required to assemble **pokered.gbc**.

	Pokemon Red (UE) [S][!].gb
	(MD5: 3d45c1ee9abd5738df46d2bdda8b57dc)


# Linux

Linux dependencies. OSX users already have these after installing Xcode.

	sudo apt-get install make gcc bison git python python-setuptools


Set up the **pokered** repository:

	git clone git://github.com/iimarckus/pokered.git
	cd pokered

	./init.sh

Copy the Pokémon Red rom to this directory. Name it **baserom.gbc**.

Now **pokered.gbc** can be built from source.

	make red

This should take about 10-15 seconds. Subsequent builds are faster.


To build Pokémon Blue:

	make blue


# OSX

Download and install **Xcode**. Then follow the Linux instructions.


# Windows

Not yet.

