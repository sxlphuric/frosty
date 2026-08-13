<div align="center">

### Frosty

![ReplayManagerIcon](https://github.com/sxlphuric/replay-manager/blob/main/assets/icon_256.png?raw=true)

**Yet another generic NixOS Config**

*Powered by flakes, hopes and dreams*

![Commit Activity](https://img.shields.io/github/commit-activity/m/sxlphuric/nixfx-nixos-config?style=flat)
![Stars](https://img.shields.io/github/stars/sxlphuric/nixfx-nixos-config?style=flat)
<!-- ![CI](https://img.shields.io/github/actions/workflow/status/sxlphuric/nixfx-nixos-config/rust.yml?label=CI&style=flat) -->

[Installation](#Installing) • [Lore](#Lore) • [Structure](#Structure)

</div>

---

## Overview

Frosty is my take on a NixOS configuration built with **flakes**. This is just a configuration I use on my personal devices, with the goal being having an all-in-one configuration.

### Key Features

- ❄️ **Flakes** - Comes with flakes pre-installed
- 🎞️ **Neovim Support** - Comes with NvChad out of the box
- 🔐 **Secrets** - Encrypt secrets effortlessly using agenix
- 🦾 **Robust** - Add multiple configurations for multiple systems

### Lore

#### nixfx
I nuked my EndeavourOS and cba to go fix it (it's the second time) so I guess I'm stuck here

#### mushroom-machine
My school forced me to get a chromebook so they could have control over me but I need my development tools so I installed NixOS on it
<!-- ## Screenshots -->
---

## Installing

> **Note:**
> I am assuming that you are on a fresh install of NixOS. If not, adjust instructions accordingly.

### Installing to home folder (recommended)

#### 1. Cloning the repository

Clone the repository to your local machine. This can be done with

```fish
# Go to home folder
cd

# Clone the repository
nix-shell "<nixpkgs>" -A pkg --run "git clone https://github.com/sxlphuric/nixfx-nixos-config"

# Rename local folder (optional)
mv nixfx-nixos-config nixos-config

# Go into the repository's folder
cd nixos-config
```

#### 2. Installation

Run this command to install the configuration. I recommend installing `nixfx` as `mushroom-machine` is a configuration made specifically for my Chromebook.

If you're **sure** you want to install `mushroom-machine`, switch all instances of `nixfx` to mushroom-machine in the commands below.

```fish
# Update hardware configuration (DO NOT skip this or your machine will boot into rescue mode)
cp /etc/nixos/hardware-configuration.nix nixfx
sudo chown mushroom nixfx/hardware-configuration.nix

# Install
sudo nixos-rebuild boot --flake .#nixfx --install-bootloader
```
Finally, reboot your system!

### Installing to /etc/nixos

> **Note:**
> Any `git` issues you get running this configuration are not my problem. I don't personally run this configuration and I don't know how to fix it.

#### 1. Cloning the repository

Clone the repository to your local machine. This can be done with

```fish
# Go to /etc
cd /etc

# Clone the repository
sudonix-shell "<nixpkgs>" -A pkg --run "git clone https://github.com/sxlphuric/nixfx-nixos-config"

# Go into the repository's folder
cd nixfx-nixos-config
```

#### 2. Installation

Run this command to install the configuration. I recommend installing `nixfx` as `mushroom-machine` is a configuration made specifically for my Chromebook.

If you're **sure** you want to install `mushroom-machine`, switch all instances of `nixfx` to mushroom-machine in the commands below.

```fish
# Update hardware configuration (DO NOT skip this or your machine will boot into rescue mode)
sudo cp /etc/nixos/hardware-configuration.nix nixfx

# Backup /etc/nixos
sudo mv /etc/nixos /etc/nixos.old

# Move nixfx-nixos-config to /etc/nixos
cd ..
sudo mv nixfx-nixos-config nixos

# Install
sudo nixos-rebuild boot --flake /etc/nixos#nixfx --install-bootloader
```
Finally, reboot your system!

### Post-install

To have a consistent theme, enable DankMaterialShell in `modules/programs.nix`. Then, add your wallpaper and fiddle around in the DMS settings until it looks good. Finally, turn it off.

## Structure
```
/
.zed
|_ tasks.json - Zed tasks for simplifying routine commands
assets - Readme assets
|_ icon.png - icon for the readme
modules - Common system configuration
|_ services
|  |_ flatpak.nix - Flatpak configuration and packages
|  |_ printing.nix - Printing configuration and drivers
|  |_ tailscale.nix - Tailscale configuration
|_ firewall.nix
|_ hardware.nix - Swap + Bluetooth configuration
|_ programs.nix - Program and packages installation
|_ services.nix - Services metafile, sourcing everything from services
|_ sudo.nix - Sudo-rs config
|_ userland.nix - General config (language, DE etc)
|_ users.nix - User creation
mushroom-machine - Chromebook system configuration
|_ modules
|  |_ audio.nix - Audio configuration specific to chromebooks
|  |_ boot.nix - Grub bootloader configuration
|  |_ networking.nix
|_ hardware-configuration.nix - Hardware scan results for the chromebook
nixfx - Laptop system configuration
|_ modules
|  |_ audio.nix - Generic audio configuration
|  |_ boot.nix - Grub bootloader configuration with extra entries
|  |_ networking.nix
|_ hardware-configuration.nix - Hardware scan results for my laptop
secrets
|_ SECRETS.md - Documentation and explanation on how to use secrets
|_ secrets.nix - Agenix configuration
|_ syncthingPassword.age
user - Home-manager configuration
|_ programs
|  |_ cava.nix
|  |_ fastfetch.nix - Shell splash configuration
|  |_ git.nix
|  |_ kitty.nix
|  |_ niri.nix
|  |_ nvchad.nix - Neovim configuration
|  |_ obsidian.nix
|  |_ shells.nix
|  |_ sober.nix - Roblox desktop entry
|  |_ starship.nix - Shell prompt configuration
|  |_ zed-editor.nix
|  |_ zen-browser.nix
|_ services
|  |_ activitywatch.nix - ActivityWatch configuration
|  |_ syncthing.nix - Syncthing configuration
|_ programs.nix
|_ services.nix
README.md - this file
flake.lock
flake.nix - Flake root
home.nix - Home configuration and environment variables
```

## TODO
- Find a good README icon and remove the replay manager one

