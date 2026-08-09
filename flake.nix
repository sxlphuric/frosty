{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad-config = {
      url = "github:sxlphuric/nvchad-config";
      flake = false;
    };
    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvchad-config";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    helium = {
      url = "github:AlvaroParker/helium-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    obsidian-extensions = {
      url = "github:karaolidis/nix-obsidian-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpak.url = "github:in-a-dil-emma/declarative-flatpak/latest";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix4nvchad,
    agenix,
    obsidian-extensions,
    flatpak,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixfx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          agenix.nixosModules.default
          flatpak.nixosModules.default

          home-manager.nixosModules.home-manager
          
          {
            # so I was looking at this code and genuinely just realized that this is literally just a module
            # todo: separate into nixpkgs.overlays.nix and home-manager.config.nix
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};

            home-manager.users.mushroom.imports = [./home.nix];

            nixpkgs.overlays = [
              inputs.obsidian-extensions.overlays.default
            ];
          }
        ];
      };
    };
  };
}
