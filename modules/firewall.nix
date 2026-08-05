{config, ...}: {
  networking.nftables.enable = true;
  networking.firewall = let
    kdeConnectPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    tailscaleInterface = config.services.tailscale.interfaceName;
  in {
    # Open ports in the firewall.
    # allowedTCPPorts = [ ... ];
    # allowedUDPPorts = [ ... ];

    trustedInterfaces = [ tailscaleInterface ];

    allowedTCPPortRanges = kdeConnectPortRanges;
    allowedUDPPortRanges = kdeConnectPortRanges;
  };
}
