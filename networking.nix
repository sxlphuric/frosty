{
  networking.networkmanager.enable = true;
  networking.interfaces.wlo1.ipv4.addresses = [
    {
      address = "192.168.2.188";
      prefixLength = 24;
    }
  ];

  networking.defaultGateway = "192.168.2.1";
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
}
