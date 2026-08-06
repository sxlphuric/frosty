{pkgs, ...}: {
  # Bootloader.

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;

      extraEntriesBeforeNixOS = true;
      extraEntries = let
        createLinuxGrubEntry = { name, path }: ''
          menuentry "${name}" {
            insmod part_gpt
            insmod fat

            search --no-floppy --set=root <ESP-FS-UUID>
            chainloader ${path}/grubx64.efi
          }
        '';
      in ''
        ${createLinuxGrubEntry { name = "OpenSUSE Tumbleweed Bootloader"; path = "/EFI/opensuse"; }}
        ${createLinuxGrubEntry { name = "EndeavourOS Bootloader"; path = "/EFI/endeavouros"; }}
      '';
    };
  };

  # Use latest ZEN kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
