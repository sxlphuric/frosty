{pkgs, lib, ...}:{
  # Hardware/firmware fixes
  hardware.firmware = [pkgs.sof-firmware];

  # QOL improvements
  boot.blacklistedKernelModules = [
      "tpm"
      "tpm_tis"
      "tpm_tis_core"
      "tpm_crb"
  ];

  systemd.services = {
    "tpm2.target".wantedBy = lib.mkForce [];
    "dev-tpmrm0.device".wantedBy = lib.mkForce [];
    "dev-tpm0.device".wantedBy = lib.mkForce [];
    "systemd-tpm2-setup-early.service".wantedBy = lib.mkForce [];
  };

  # Performance improvements
  ## Store journald logs in RAM
  services.journald = {
    storage = "volatile";
    extraConfig =
    ''
      RuntimeMaxUse=64M
    '';
  };

  ## Tune sysctl settings
  boot.kernel.sysctl = {
    "vm.vfs_cache_pressure" = 75;
    "vm.dirty_background_ratio" = 3;
    "vm.dirty_ratio" = 7;
    "vm.page-cluster" = 0;
    "vm.swappiness" = 180;
  };

  ## Add zram swap to double 4gb ram into 8gb
  zramSwap = {
    enable = true;
    algorithm = "zstd";

    memoryPercent = 200;
    priority = 999;
    swapDevices = 1;
  };

  ## weekly service to remove unused blocks from emmc
  services.fstrim.enable = true;

  ## make emmc use mq-deadline scheduler
  services.udev.extraRules = ''
    ACTION=="add|change", SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", KERNEL=="mmcblk*", ATTR{queue/scheduler}="mq-deadline"
  '';
}
