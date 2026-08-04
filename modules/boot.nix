{ pkgs, ... }: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest ZEN kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
