{pkgs, ...}: {
  # Bootloader.

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
    };
  };

  # Use latest ZEN kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
