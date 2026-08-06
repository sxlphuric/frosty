{pkgs, ...}: {
  # Bootloader.

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;

      extraEntries = let
        createLinuxGrubEntry = { name, path, shim ? false }: ''
          menuentry "${name}" {
            insmod part_gpt
            insmod fat

            search --no-floppy --fs-uuid --set=esp D2DA-0FFB
            chainloader (esp)${path}/${if shim then "shim.efi" else "grubx64.efi"}
          }
        '';
      in ''
        ${createLinuxGrubEntry { name = "OpenSUSE Tumbleweed Bootloader"; path = "/EFI/opensuse"; shim = true; }}
        ${createLinuxGrubEntry { name = "EndeavourOS Bootloader"; path = "/EFI/endeavouros"; }}
        '';
    };
  };

  # Use latest ZEN kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
