{
  inputs,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = false;
      efi.efiSysMountPoint = "/efi";
      timeout = 0;
      systemd-boot = {
        enable = true;
        edk2-uefi-shell.enable = true;
        editor = false;
        configurationLimit = 50;
        xbootldrMountPoint = "/boot";
      };
    };
    plymouth = {
      theme = "chromeos";
      themePackages = [inputs.plymouth-theme-chromeos.packages.${pkgs.stdenv.hostPlatform.system}.default];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
