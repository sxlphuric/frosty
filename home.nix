{pkgs,...}: {
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

  gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      cursorTheme = {
        name = "Bibata-Modern-Ice-Right";
        package = pkgs.bibata-cursors;
      };
      font = {
        name = "Rubik Regular";
        size = 10;
        package = pkgs.rubik;
      };
  };
}
