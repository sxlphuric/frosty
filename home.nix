{
  imports = [
    ./user/services.nix
    ./user/programs.nix
  ];

  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  xdg.enable = true;

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kde";
    QT_QPA_PLATFORM = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
