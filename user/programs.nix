{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight
    inputs.agenix.homeManagerModules.default

    ./programs/starship.nix
    ./programs/shells.nix
    ./programs/kitty.nix
    ./programs/zed-editor.nix
    ./programs/zen-browser.nix
    ./programs/git.nix
    ./programs/cava.nix
    ./programs/fastfetch.nix
    ./programs/obsidian.nix
    ./programs/nvchad.nix
    ./programs/sober.nix
    ./programs/niri.nix
    ./programs/eza.nix
  ];
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    maple-mono.NF-unhinted

    prismlauncher
    supertuxkart

    equibop
    kew

    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default

    tela-circle-icon-theme
    bibata-cursors
    bibata-cursors-translucent
    utterly-round-plasma-style
    darkly
    kdePackages.qt6ct
    osu-lazer-bin
    oshu
    inputs.niri-scratchpad-flake.packages.${pkgs.stdenv.hostPlatform.system}.default
    gnome-solanum
    gnome-calendar
    tty-clock
  ];
}
