{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs (system: pkgs: {
      sung = pkgs.callPackage ./default.nix {};

      default = inputs.self.packages.${system}.sung;
    }) inputs.nixpkgs.legacyPackages;
  };
}
