{
  imports = [
    ./generation-config/home-manager.nix
    ./generation-config/nixpkgs.nix
  ];

  system.stateVersion = "26.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
