{ pkgs, inputs, ... }: {
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight

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
  ];
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
