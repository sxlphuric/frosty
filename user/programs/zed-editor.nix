{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;

    extraPackages = with pkgs; [
      nixd
      alejandra
    ];

    mutableUserSettings = false;
    userSettings = {
      languages = {
        Nix = {
          language_servers = ["nixd"];
          "formatter" = {
            external = {
              command = "alejandra";
              arguments = ["--quiet" "."];
            };
          };
        };
      };
      lsp = {
        nixd.settings.nixd = {
          nixpkgs.expr = "import (builtins.getFlake \"/home/mushroom/nixos-config\").inputs.nixpkgs { }";
          options = {
            nixos.expr = "(builtins.getFlake \"/home/mushroom/nixos-config\").nixosConfigurations.nixfx.options";
            home-manager.expr = "(builtins.getFlake \"/home/mushroom/nixos-config\").homeConfigurations.mushroom.options";
          };
        };
      };
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
