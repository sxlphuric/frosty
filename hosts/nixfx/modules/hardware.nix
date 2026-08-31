{
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 6 * 1024; # yeah that means 6gb
    }
  ];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
