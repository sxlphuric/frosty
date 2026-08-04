{ pkgs, ... }: {
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
  };
}
