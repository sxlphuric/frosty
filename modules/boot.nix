{pkgs}: {
  boot = {
    plymouth.enable = true;

    # Use latest ZEN kernel.
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
