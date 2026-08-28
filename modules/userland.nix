{pkgs, ...}: {
  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [pkgs.kdePackages.qtmultimedia];
  };
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "lafayette";
    variant = "";
  };

  services.xserver.xkb.extraLayouts.lafayette = {
    description = "An ergonomic version of QWERTY for French programmers and typists";
    languages = ["eng" "fra"];
    symbolsFile = ../symbols/lafayette;
  };
}
