{
  networking = {
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    localCommands = let
      ipRules = [
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
        profiles = {};
      };
    };
  };
}
