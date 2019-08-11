# osx-setup

## Features

- **macOS Mojave:** Tested with macOS Mojave 10.14.6.
- **Completely Automated:** Homebrew, Cask and Mas.
- **Latest Versions:** Includes Python, Node, etc...

## Installation

```bash
git clone https://github.com/nekomamoushi/osx-setup.git && cd osx-setup
bash setup.sh
```

## Requirements

- [Xcode](https://apps.apple.com/fr/app/xcode/id497799835?mt=12)

## Overview 

### Table of Content

`Initialisation`

* Enter administrator account password only once
* Turn off sleep and set computer name/hostname
* Install macOS updates
* Install Xcode and Developer tools 

`Installation`

* Package Manager
  * [Homebrew](https://brew.sh/): The missing package mananger for macOS
  * [Mas](https://github.com/mas-cli/mas): Mac App Store command line interface

`Configuration`

- Set OSX preferences automatically
- Set Apps preferences automatically

### Initialisation

**macOs Updates**

```bash
sudo softwareupdate --install --all
```

**Developer Tools**

```bash
xcode-select --install
sudo xcodebuild -license accept
```

**Set Defaults for Sleep**

```bash
sudo pmset -a sleep "${VALUE}"
sudo pmset -a disksleep "${VALUE}"
```

**Set Hostname and Computer Name**

```bash
sudo scutil --set ComputerName "${NAME}"
sudo scutil --set HostName "${NAME}"
```

## Licence

The code is available under the [MIT](LICENSE) license.