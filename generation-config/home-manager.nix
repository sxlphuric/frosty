{inputs,config,name,...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs; update_outofspace = config.update_outofspace;};
    users.mushroom.imports = [
      ../home.nix
      ../hosts/${name}/extra-home-packages.nix
    ];
  };
}
