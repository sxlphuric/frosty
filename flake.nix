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
    cb-ucm-conf-src = {
      url = "github:WeirdTreeThing/alsa-ucm-conf-cros";
      flake = false;
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-scratchpad-flake = {
      url = "github:gvolpe/niri-scratchpad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plymouth-theme-chromeos = {
      url = "path:packages/plymouth-theme-chromeos/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix4nvchad,
    agenix,
    obsidian-extensions,
    flatpak,
    cb-ucm-conf-src,
    hjem,
    niri-scratchpad-flake,
    plymouth-theme-chromeos,
    ...
  } @ inputs: {
    nixosConfigurations = let
      # change this to attr set (name) if we get more attributes
      mkNixosConfig = name:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/${name}/hardware-configuration.nix
            ./hosts/${name}/modules/audio.nix
            ./hosts/${name}/modules/networking.nix
            ./hosts/${name}/modules/boot.nix
            ./hosts/${name}/modules/hardware.nix
            ./hosts/${name}/extra-config.nix
            ./hosts/${name}/extra-packages.nix

            # common
            ./modules/firewall.nix
            ./modules/users.nix
            ./modules/userland.nix
            ./modules/sudo.nix
            ./modules/services.nix
            ./modules/programs.nix
            ./modules/boot.nix

            ./hjem.nix

            agenix.nixosModules.default
            flatpak.nixosModules.default
            home-manager.nixosModules.home-manager
            hjem.nixosModules.default
            {
              system.stateVersion = "26.05";
              nix.settings.experimental-features = ["nix-command" "flakes"];
              networking.hostName = "${name}";
              # so I was looking at this code and genuinely just realized that this is literally just a module
              # todo: separate into nixpkgs.overlays.nix and home-manager.config.nix
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs;};

              home-manager.users.mushroom.imports = [
                ./home.nix
                ./hosts/${name}/extra-home-packages.nix
              ];

              nixpkgs.overlays = [
                inputs.obsidian-extensions.overlays.default
              ];

              nixpkgs.config.permittedInsecurePackages = [
                "olm-3.2.16" #for matrix cleints
              ];
            }
          ];
        };
    in {
      nixfx = mkNixosConfig "nixfx";
      mushroom-machine = mkNixosConfig "mushroom-machine";
    };
  };
}
