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

    extensions = [
      "nix"
      "zed-charmed-icons"
    ];

    mutableUserSettings = false;
    userSettings = {
      window_decorations = "server";
      languages = {
        Nix = {
          language_servers = ["nixd"];
          "formatter" = {
            external = {
              command = "nix";
              arguments = ["run" "nixpkgs#alejandra" "--" "--quiet" "."];
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
        # change DankShell to Ayu if DMS wasnt set up
        mode = "system";
        light = "DankShell Light";
        dark = "DankShell Dark";
      };
      icon_theme = {
        mode = "system";
        light = "Light Charmed Icons";
        dark = "Soft Charmed Icons";
      };
    };
  };
}
