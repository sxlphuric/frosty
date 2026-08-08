{pkgs, ...}: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [gutenprint];
  };

  hardware.printers.ensureDefaultPrinter = "Canon_MX920_series";
}
