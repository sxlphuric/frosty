{ pkgs, inputs, ... }: {

  imports = [
    inputs.nix4nvchad.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight

    ./user/programs/starship.nix
    ./user/programs/shells.nix
    ./user/programs/kitty.nix
    ./user/programs/zed-editor.nix
    ./user/programs/zen-browser.nix
    ./user/programs/git.nix
    ./user/programs/cava.nix
    ./user/programs/fastfetch.nix
    ./user/programs/obsidian.nix
    ./user/programs/nvchad.nix

    ./user/services/activitywatch.nix
  ];

  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  xdg.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    maple-mono.NF-unhinted

    prismlauncher
    supertuxkart

    equibop
    kew

    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
