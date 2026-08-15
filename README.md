<div align="center">

### Frosty

<img src="https://github.com/sxlphuric/frosty/blob/main/assets/icon.png?raw=true" width="256"/>


**Yet another generic NixOS Config**

*Powered by flakes, hopes and dreams*

![Commit Activity](https://img.shields.io/github/commit-activity/m/sxlphuric/frosty?style=flat)
![Stars](https://img.shields.io/github/stars/sxlphuric/frosty?style=flat)

[Installation](#Installing) • [Lore](#Lore) • [Structure](#Structure)

</div>

---

## Overview

Frosty is my take on a NixOS configuration built with **flakes**. This is just a setup I use on my personal devices, with the goal being having an all-in-one and simple design.

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
nix-shell "<nixpkgs>" -A pkg --run "git clone https://github.com/sxlphuric/frosty"

# Rename local folder
mv frosty nixos-config

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

## Post-install

### Theming

#### General app theming

To have a consistent theme, enable DankMaterialShell in `modules/programs.nix`. Then, add your wallpaper and fiddle around in the DMS settings until it looks good. Then, press "apply QT settings" and "apply GTK settings". Finally, turn it off.

#### Zen Browser theming

To theme Zen Browser, you need to link your DMS generated theme to the Zen Browser theme directory.

```fish
PROFILE_DIR="$(find "$HOME/.config/zen" -maxdepth 1 -type d -name "*Default Profile" 2>/dev/null | head -n 1)"
[ -z "$PROFILE_DIR" ] && exit
mkdir -p "$PROFILE_DIR/chrome"
ln -sf "$HOME/.config/DankMaterialShell/zen.css" "$PROFILE_DIR/chrome/userChrome.css"
```
Then, you need to add this snippet to your `userChrome.css` to remove the shadow around the viewport.

```css
#tabbrowser-tabbox #tabbrowser-tabpanels .browserSidebarContainer {
  --zen-big-shadow: none !important;
}
```
Finally, we need to tweak some settings in `about:config` to fix theming.
- Set `browser.tabs.inTitlebar` to `0` to enable system titlebar theming
- Set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true` to enable userChrome.css theming
- Set `widget.gtk.non-native-titlebar-buttons` to `true` to enable titlebar button theming
- Set `zen.theme.content-element-separation` to `1` to minimize Zen viewport borders while keeping corner roundness



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
- Add README for mushroom-machine chromebook specific configuration (audio drivers, performance etc.)
- Finish pixel theme
- Finish porting niri config
- Replace ls with eza
- install dankshell plugins: declaratively
