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
    syncthingSyncPort = 22000;
    syncthingUDPDiscoveryPort = 21027;
  in {
    # Open ports in the firewall.
    allowedTCPPorts = [syncthingSyncPort];
    allowedUDPPorts = [syncthingSyncPort syncthingUDPDiscoveryPort];

    trustedInterfaces = [tailscaleInterface];

    allowedTCPPortRanges = kdeConnectPortRanges;
    allowedUDPPortRanges = kdeConnectPortRanges;

    logRefusedPackets = true;
  };
}
