{ pkgs, inputs, ...}: {

  imports = [
    inputs.nix4nvchad.homeManagerModules.default

    ./programs/starship.nix
    ./programs/shells.nix
    ./programs/kitty.nix
    ./programs/zed-editor.nix
  ];

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    maple-mono.NF-unhinted
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
