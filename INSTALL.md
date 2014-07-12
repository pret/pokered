# Linux

Dependencies:

	sudo apt-get install make gcc bison git python python-setuptools
	sudo easy_install pip

The assembler used is [**rgbds**](https://github.com/bentley/rgbds).

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo mkdir -p /usr/local/man/man{1,7}
	sudo make install
	cd ..
	rm -rf rgbds

Set up the repository.

	git clone git://github.com/iimarckus/pokered.git
	cd pokered
	git submodule init
	git submodule update
	sudo pip install -r extras/requirements.txt

To build **pokered.gbc** and **pokeblue.gbc**:

	make

This should take about 10 seconds. Subsequent builds are faster.

To build them individually:

	make red
	make blue


# OS X

Download and install **Command Line Tools for Xcode**.
Then open a terminal and follow the Linux instructions.


# Windows

It's recommended that you use a virtual machine running Linux or OS X.

If you insist on Windows, use [**Cygwin**](http://cygwin.com/install.html) (32-bit).

Dependencies are downloaded in the installer rather than the command line.
Select the following packages:
* make
* git
* gettext
* python
* python-setuptools

To install rgbds, extract the contents of
**http://iimarck.us/etc/rgbds.zip**
and put them in `C:\cygwin\usr\local\bin`.

Then set up the repository. In the **Cygwin terminal**:

	git clone git://github.com/iimarckus/pokered.git
	cd pokered
	git submodule init
	git submodule update
	easy_install git://github.com/drj11/pypng.git@master#egg=pypng

To build:

	make

