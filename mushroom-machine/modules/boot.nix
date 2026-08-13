{pkgs, ...}: {
  # Bootloader.

  boot.loader = {
    efi.canTouchEfiVariables = false;
    timeout = 5;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
      efiInstallAsRemovable = true;
    };
  };

  # Use latest ZEN kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
