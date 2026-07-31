{ pkgs, inputs, ... }: {

  imports = [
    inputs.nix4nvchad.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight

    ./programs/starship.nix
    ./programs/shells.nix
    ./programs/kitty.nix
    ./programs/zed-editor.nix
    ./programs/zen-browser.nix
  ];

  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  xdg.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    maple-mono.NF-unhinted

    prismlauncher
  ];

  # TODO add the github helper (gh)

  programs.git = {
    enable = true;
    settings.user = {
      name = "Effectivement";
      email = "rnssaketo@proton.me";
    };
  };

  # TODO port nvchad config

  programs.nvchad = {
    enable = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];

  };

}
