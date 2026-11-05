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

    # waydroid firewall configuration
    filterForward = true;
    extraForwardRules = ''
      iifname "waydroid0" accept
    '';

    extraInputRules = ''
      iifname "waydroid0" udp dport { 53, 67 } accept
      iifname "waydroid0" tcp dport 53 accept
    '';
  };
}
