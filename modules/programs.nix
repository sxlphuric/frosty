{
  pkgs,
  inputs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Programs (these are installed and CONFIGURED by nix and given bindings so you can configure them straight in the config.nix)
  programs.vim.enable = true;

  programs.niri.enable = false;
  programs.dms-shell.enable = false;

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
  environment.systemPackages = with pkgs; [
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
    qalculate-qt
    inputs.agenix.packages."${stdenv.hostPlatform.system}".default
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
