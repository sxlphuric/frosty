{
  networking = {
    hostName = "nixfx"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
            ipv4 = let routes = [
              { address = "192.168.10.0"; prefixLength = 28; via = "192.168.10.1"; }
              { address = "192.168.20.0"; prefixLength = 27; via = "192.168.10.1"; }
              { address = "192.168.30.0"; prefixLength = 30; via = "192.168.10.1"; }
              { address = "192.168.40.0"; prefixLength = 27; via = "192.168.10.1"; }
              { address = "192.168.50.0"; prefixLength = 30; via = "192.168.10.1"; }
            ];

            createNMRoute = { address, prefixLength, via }: "${address}/${toString prefixLength} ${via}";
            createNMRoutes = routes: "${builtins.concatStringsSep ";" (map createNMRoute routes)};";


            in {
              method = "manual";
              address1 = "192.168.10.11/28,192.168.10.1";
              dns = "192.168.10.1;1.1.1.1;1.0.0.1;";
              routes = ["192.168.10.0/28 192.168.10.1"];
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
