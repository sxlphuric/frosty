{
  imports = [
    ./services/tailscale.nix
    ./services/flatpak.nix
    ./services/printing.nix
  ];
  # List services that you want to enable:
  #
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
