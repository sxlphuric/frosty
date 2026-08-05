{
  imports = [
    ./user/services.nix
    ./user/programs.nix
  ];

  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  xdg.enable = true;
}
