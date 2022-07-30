# Instructions

These instructions explain how to set up the tools required to build **pokered**, including [**rgbds**](https://github.com/gbdev/rgbds), which assembles the source files into a ROM.

If you run into trouble, ask for help on IRC or Discord (see [README.md](README.md)).

- [Prepare the environment](#prepare-the-environment)
  * [Windows 10 or 11](#windows-10-or-11)
  * [Windows (alternate)](#windows-alternate)
  * [macOS](#macos)
  * [Linux](#linux)
    + [Debian or Ubuntu](#debian-or-ubuntu)
    + [OpenSUSE](#opensuse)
    + [Arch Linux](#arch-linux)
    + [Termux](#termux)
    + [Other distros](#other-distros)
- [Build pokered](#build-pokered)
  * [Build with a local rgbds version](#build-with-a-local-rgbds-version)


# Prepare the environment

The tools that are available to you differ based on your OS.

## Windows 10 or 11

Download and install [**Windows Subsystem for Linux**](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Then open the **WSL terminal**.

Update WSL's software before continuing. If you chose Debian, Ubuntu, or another distribution that uses `apt-get`, then enter this command:

```bash
apt-get update && apt-get upgrade
```

WSL has its own file system that's not accessible from Windows, but Windows files *are* accessible from WSL. So you're going to want to install **pokered** within Windows. You'll have to change the **current working directory** every time you open WSL.

For example, if you want to store **pokered** in `C:\Users\<user>\Desktop`, enter this command:

```bash
cd /home/<user>/
```

(Replace `<user>` in the example path with your WSL username.)

If this works, then follow [the instructions for **Linux**](#linux) below for whatever distribution you installed for WSL.

Otherwise, continue reading below for [the older Windows instructions](#windows-alternate).


## Windows (alternate)

*These instructions are the only option for older versions of Windows, but they also work for Windows 10 or 11 if you prefer not to use the [above](#windows-10-or-11).*

Download [**Cygwin**](http://cygwin.com/install.html): use the installer **setup-x86_64.exe** for 64-bit Windows, **setup-x86.exe** for 32-bit.

Run setup and leave the default settings. At the "**Select Packages**" step, choose to install the following, all of which are in the "**Devel**" category:

- `make`
- `git`
- `gcc-core`

Double click on the text that says "**Skip**" next to each package to select the most recent version to install. Click "**Next**" and go through the remaining installer screens until it's finished.

Once you have finished installing Cygwin, follow the [**rgbds** install instructions](https://rgbds.gbdev.io/install#pre-built) (click **Windows**, then **Cygwin, MSYS2**) to install **rgbds 0.5.2**.

***Note** (ignore this if you have never installed **rgbds** before):  
If you already have an older version of **rgbds**, you will need to update to **0.5.2**. If a version newer than **0.5.2** does not work, try downloading **0.5.2.***

Now open the **Cygwin terminal** and enter the following commands. You can open the terminal by double-clicking `Cygwin.bat`, which is in ``C:\cygwin64\``.

Cygwin has its own Unix-like file system that's stored within Windows but uses different syntax.
* In Windows, the Cygwin terminal's default **current working directory** is `C:\cygwin64\home\<user>`.
* In Cygwin, this same directory is called `/cygdrive/c/cygwin64/home/<user>`. 

(Replace `<user>` in the example path with your username.)
  
If you store **pokered** somewhere other than the default directory, you'll have to change the **current working directory** in the Cygwin terminal every time you open Cygwin. For example, if you store **pokered** in `C:\Users\<user>\Desktop` you must enter this command:

```bash
cd /cygdrive/c/Users/<user>/Desktop
```

With the Cygwin terminal open and your **current working directory** set to wherever you want to store **pokered**, you're ready to [build **pokered**](#build-pokered).


## macOS

Install [**Homebrew**](https://brew.sh/). Follow the official instructions.

Open **Terminal** and prepare to enter commands.

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#pre-built) for macOS to install **rgbds 0.5.2**.

Now you're ready to [build **pokered**](#build-pokered).


## Linux

Open **Terminal** and enter the following commands, depending on which distro you're using.

### Debian or Ubuntu

To install the software required for **pokered**:

```bash
sudo apt-get install make gcc git
```

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.5.2** from source.

### OpenSUSE

To install the software required for **pokered**:

```bash
sudo zypper install make gcc git
```

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.5.2** from source.

### Arch Linux

To install the software required for **pokered**:

```bash
sudo pacman -S make gcc git
```

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#pre-built) for Arch Linux to install **rgbds 0.5.2**.

If you want to compile and install **rgbds** yourself instead, then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.5.2** from source.

### Termux

To install the software required for **pokered**:

```bash
sudo apt install make clang git sed
```

To install **rgbds**:

```bash
sudo apt install rgbds
```

If you want to compile and install **rgbds** yourself instead, then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.5.2** from source.

### Other distros

If your distro is not listed here, try to find the required software in its repositories:

- `make`
- `gcc` (or `clang`)
- `git`
- `rgbds`

If `rgbds` is not available, you'll need to follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.5.2** from source.

Now you're ready to [build **pokered**](#build-pokered).


# Build pokered

To download the **pokered** source files:

```bash
git clone https://github.com/pret/pokered
cd pokered
```

To build **pokered.gbc** and **pokeblue.gbc**:

```bash
make
```

## Build with a local rgbds version

If you have different projects that require different versions of **rgbds**, it might not be convenient to install **rgbds 0.5.2** globally. Instead, you can put its files in a directory within **pokered**, such as `pokered/rgbds-0.5.2/`. Then specify it when you run `make`:

```bash
make RGBDS=rgbds-0.5.2/
```
