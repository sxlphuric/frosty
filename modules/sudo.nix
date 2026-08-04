{
  security.sudo.enable = false;
  security.sudo-rs = {
    enable = true;
    extraRules = [
      {
        users = [ "mushroom" ];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/etc/profiles/per-user/mushroom/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
