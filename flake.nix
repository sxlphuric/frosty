let
    makeNixPkgsInput = url: {
      url = url;
      inputs.nixpkgs.follows = "nixpkgs";
    };
in
{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = (makeNixPkgsInput "github:nix-community/home-manager");
    nix4nvchad = (makeNixPkgsInput "github:nix-community/nix4nvchad");
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixfx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          
          home-manager.nixosModules.home-manager
          
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};

            home-manager.users.mushroom.imports = [./home.nix];
          }
        ];
      };
    };
  };
}
