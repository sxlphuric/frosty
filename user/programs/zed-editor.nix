{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;

    extraPackages = with pkgs; [
      nil
      nixd
      alejandra
    ];

    mutableUserSettings = false;
    userSettings = {
      terminal = {
        dock = "right";
        shell.program = lib.getExe pkgs.fish;
      };
      git_panel = {
        dock = "left";
      };
      agent = {
        dock = "right";
        favorite_models = [];
        model_parameters = [];
      };
      project_panel = {
        dock = "left";
      };
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 15;
      theme = {
        mode = "system";
        light = "Ayu Light";
        dark = "Ayu Dark";
      };
    };
  };
}
