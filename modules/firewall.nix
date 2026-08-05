{
  networking.firewall = let
    kdeConnectPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  in {
    # Open ports in the firewall.
    # allowedTCPPorts = [ ... ];
    # allowedUDPPorts = [ ... ];

    allowedTCPPortRanges = kdeConnectPortRanges;
    allowedUDPPortRanges = kdeConnectPortRanges;
  };
}
