{
  security.sudo.enable = false;
  security.sudo-rs = {
    enable = true;
    extraRules = [
      {
        users = ["mushroom"];
        commands = let
          passwordlessCommand = command: {
            command = command;
            options = ["NOPASSWD"];
          };
        in [
          (passwordlessCommand "/run/current-system/sw/bin/nixos-rebuild")
          (passwordlessCommand "/run/current-system/sw/bin/nix-collect-garbage")
        ];
      }
    ];
  };
}
