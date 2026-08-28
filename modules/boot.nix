{pkgs}: {

  # Use latest ZEN kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
