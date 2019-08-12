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

### Installation

#### Tap

| Tap                        | URL                                                        |
|----------------------------+------------------------------------------------------------|
| homebrew-core              | [link](https://github.com/Homebrew/homebrew-core)          |
| homebrew-cask              | [link](https://github.com/Homebrew/homebrew-cask)          |
| homebrew-fonts             | [link](https://github.com/Homebrew/homebrew-cask-fonts)    |
| homebrew-bundle            | [link](https://github.com/Homebrew/homebrew-bundle)        |
| homebrew-versions          | [link](https://github.com/Homebrew/homebrew-cask-versions) |

#### Tools

| Tools               | URL                                                   |
|---------------------+-------------------------------------------------------|
| bash                | [link](https://www.gnu.org/software/bash)             |
| bash-completion@2   | [link](https://github.com/scop/bash-completion)       |
| bash-git-prompt     | [link](https://github.com/magicmonty/bash-git-prompt) |
| diff-so-fancy       | [link](https://github.com/so-fancy/diff-so-fancy)     |
| fzf                 | [link](https://github.com/junegunn/fzf)               |
| git                 | [link](https://git-scm.com)                           |
| git-standup         | [link](https://github.com/kamranahmedse/git-standup)  |
| htop                | [link](https://github.com/hishamhm/htop)              |
| mas                 | [link](https://github.com/mas-cli/mas)                |
| nvm                 | [link](https://github.com/nvm-sh/nvm)                 |
| python              | [link](https://github.com/python)                     |
| python@2            | [link](https://github.com/python)                     |
| pipenv              | [link](https://github.com/pypa/pipenv)                |
| pyenv               | [link](https://github.com/pyenv/pyenv)                |
| the_silver_searcher | [link](https://geoff.greer.fm/ag)                     |
| tldr                | [link](https://github.com/tldr-pages/tldr)            |
| wget                | [link](https://www.gnu.org/software/wget/)            |
| zsh                 | [link](https://www.zsh.org)                           |
| zplug               | [link](https://github.com/zplug/zplug)                |

#### Casks

| Casks                  | URL                                                                  |
|------------------------+----------------------------------------------------------------------|
| 1password              | [link](https://1password.com)                                        |
| adoptopenjdk8          | [link](https://github.com/AdoptOpenJDK)                              |
| android-studio         | [link](https://developer.android.com/studio)                         |
| android-platform-tools | [link](https://developer.android.com/studio/releases/platform-tools) |
| android-sdk            | [link](https://developer.android.com/studio/releases/sdk-tools)      |
| boostnote              | [link](https://boostnote.io)                                         |
| dropbox                | [link](https://www.dropbox.com)                                      |
| evernote               | [link](https://evernote.com)                                         |
| iina                   | [link](https://iina.io/)                                             |
| firefox                | [link](https://www.mozilla.org/firefox)                              |
| font-fira-code         | [link](https://github.com/tonsky/FiraCode)                           |
| font-hack-nerd-font    | [link](https://github.com/ryanoasis/nerd-fonts)                      |
| font-iosevka           | [link](https://github.com/be5invis/Iosevka)                          |
| iterm2                 | [link](https://www.iterm2.com)                                       |
| macdown                | [link](https://macdown.uranusjr.com/)                                |
| numi                   | [link](https://numi.io/)                                             |
| qlcolorcode            | [link](https://github.com/sindresorhus/quick-look-plugins)           |
| qlmarkdown             | [link](https://github.com/sindresorhus/quick-look-plugins)           |
| quicklook-json         | [link](https://github.com/sindresorhus/quick-look-plugins)           |
| quicklook-csv          | [link](https://github.com/sindresorhus/quick-look-plugins)           |
| qlstephen              | [link](https://github.com/sindresorhus/quick-look-plugins)           |
| sublime-merge          | [link](https://github.com/sindresorhus/quick-look-plugins)           |
| sublime-text           | [link](https://www.sublimetext.com/3)                                |
| the-unarchiver         | [link](https://theunarchiver.co)                                     |
| transmission           | [link](https://transmissionbt.com/)                                  |
| vscodium               | [link](https://github.com/VSCodium/vscodium)                         |

#### Mas

| Mas                 | URL                                                                    |
|---------------------+------------------|--------------------------------------------- -------|
| Unsplash Wallpapers | [link](https://apps.apple.com/fr/app/unsplash-wallpapers/id1284863847) |
| Agenda.             | [link](https://apps.apple.com/fr/app/agenda/id1370289240)              |

## Licence

The code is available under the [MIT](LICENSE) license.
