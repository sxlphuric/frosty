{inputs,...}: {
  nixpkgs.overlays = [
    inputs.obsidian-extensions.overlays.default
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16" #for matrix cleints
  ];

  nixpkgs.config.permittedUnfreePackages = [
    "airtame-application-4.15.0"
    "xmind-26.05.01106-202608091931"
  ];
}
