{pkgs, ...}: {
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
}
