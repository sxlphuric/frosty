{
  networking = {
    hostName = "nixfx"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;

    networkmanager = {
      enable = true;
      ensureProfiles = {
        profiles = {
          "Wired connection 1" = {
            connection = {
              id = "eno1-wiredconnection1";
              type = "ethernet";
              interface-name = "eno1";
              autoconnect = true;
            };
            ipv4 = {
              method = "manual";
              address1 = "192.168.10.11/28,192.168.10.1";
              dns = "192.168.10.1;1.1.1.1;1.0.0.1;";
            };
          };
          "SSID" = {
            connection = {
              id = "wlo1-ssid";
              type = "wifi";
              interface-name = "wlo1";
              autoconnect = "true";
            };
            wifi = {
              ssid = "SSID";
              mode = "infrastructure";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "PSK";
            };
            ipv4 = {
              method = "manual";
              address1 = "192.168.2.188/24,192.168.2.1";
              dns = "192.168.2.190;1.1.1.1;1.0.0.1";
            };
          };
        };
      };
    };
  };
}
