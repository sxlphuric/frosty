{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  sddm-astronaut-themed =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "pixel_sakura";
      themeConfig = {
        Font = "unscii";
        # HeaderTextColor = "#d5c4a1";
        # Background = "Backgrounds/your-custom-background.png";
      };
    }).overrideAttrs (oldAttrs: {
      installPhase =
        oldAttrs.installPhase
        + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/ScarletTree/contents/images_dark/5120x2880.png \
            $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/your-custom-background.png
        '';
    });
in {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Programs (these are installed and CONFIGURED by nix and given bindings so you can configure them straight in the config.nix)
  programs.vim.enable = true;

  programs.niri.enable = true;
  services.displayManager.defaultSession = "niri";
  programs.dms-shell = {
    enable = config.programs.niri.enable;
    systemd.target = "niri.service";
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  programs.gpu-screen-recorder.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Packages (these are just installed, no preconfiguration
  environment.systemPackages = with pkgs;
    [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      libreoffice-qt
      kitty
      git
      mpv
      most
      awatcher
      aw-server-rust
      ticktick
      kdePackages.filelight
      kdePackages.kclock
      gpu-screen-recorder-gtk
      kdePackages.kdeconnect-kde
      kdePackages.kamoso
      kdePackages.keysmith
      qalculate-qt
      inputs.agenix.packages."${stdenv.hostPlatform.system}".default
      vinegar
      pavucontrol
      pwvucontrol
      wiremix
      rubik
      inter
      kdePackages.qtmultimedia
      unscii
      nunito
    ]
    ++ [sddm-astronaut-themed];

  fonts.packages = [
    pkgs.unscii
    pkgs.nunito
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
