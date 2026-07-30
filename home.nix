{ pkgs, ...}: {
  
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
  ];
  
  home.stateVersion = "26.05";

  home.packages = with pkgs; [

  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Effectivement";
      email = "rnssaketo@proton.me";
    };
  };

  programs.nvchad = {
    enable = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];

  };
}
