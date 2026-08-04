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

    ./services.user/activitywatch.nix
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

    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # TODO port nvchad config

  programs.nvchad = {
    enable = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];

  };

}
