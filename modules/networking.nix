{
  networking = {
    hostName = "nixfx"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    localCommands = let
      ipRules = [
        {
          index = 54;
          priority = 10000;
        }
      ];

      parseIpRule = {
        source ? "all",
        index,
        priority ? 32768,
        incoming ? true,
      }: ''
        ip rule add ${
          if incoming
          then "from"
          else "to"
        } ${source} lookup ${toString index} priority ${toString priority}
      '';

      parseIpRules = tables: builtins.concatStringsSep "\n" (map parseIpRule ipRules);
    in
      parseIpRules ipRules;

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
              route1 = "192.168.10.0/28,192.168.10.1";
              route2 = "192.168.20.0/27,192.168.10.1";
              route3 = "192.168.30.0/30,192.168.10.1";
              route4 = "192.168.40.0/27,192.168.10.1";
              route5 = "192.168.50.0/30,192.168.10.1";
              route-table = 54;
              route-metric = 100;
            };
          };
                  };
      };
    };
  };
}
