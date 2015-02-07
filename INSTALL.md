# Linux

	sudo apt-get install make gcc bison git python python-setuptools
	sudo easy_install pypng

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo make install
	cd ..

	git clone --recursive git://github.com/iimarckus/pokered.git
	cd pokered

To build **pokered.gbc** and **pokeblue.gbc**:

	make

To build them individually:

	make red
	make blue


# Mac

In the shell, run:

	xcode-select --install
	sudo easy_install pypng

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo make install
	cd ..

	git clone --recursive git://github.com/iimarckus/pokered.git
	cd pokered

	make


# Windows

To build on Windows, use [**Cygwin**](http://cygwin.com/install.html) (32-bit).

In the installer, select the following packages: `make` `git` `gettext` `python` `python-setuptools`

Then get the most recent version of [**rgbds**](https://github.com/bentley/rgbds/releases/).
Put `rgbasm.exe`, `rgblink.exe` and `rgbfix.exe` in `C:\cygwin\usr\local\bin`.

In the **Cygwin terminal**:

	easy_install pypng
	git clone --recursive git://github.com/iimarckus/pokered.git
	cd pokered

	make
