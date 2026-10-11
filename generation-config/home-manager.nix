{inputs,name,...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.mushroom.imports = [
      ../home.nix
      ../hosts/${name}/extra-home-packages.nix
    ];
  };
}
