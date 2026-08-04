{
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_status$c$elixir$elm$golang$gradle$haskell$java$julia$nodejs$nim$rust$scala[](fg:#06969A)$docker_context[](fg:#33658A)$time[](fg:#33658A)[-](#D60270)[-](#9B4F96)[> ](#0038A8)";

      # Disable the blank line at the start of the prompt
      # add_newline = false

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      username = {
        show_always = true;
        style_user = "bg:#D60270";
        style_root = "bg:#D60270";
        format = "[ ]($style)";
        disabled = true;
      };

      # An alternative to the username module which displays a symbol that
      # represents the current operating system
      os = {
        style = "bg:#9A348E";
        disabled = true; # Disabled by default
      };

      directory = {
        style = "#9B4F96";
        format = "[$path/]($style)";
        truncation_length = 1;
        truncation_symbol = "";

        # Here is how you can shorten some long paths by text replacement
        # similar to mapped_locations in Oh My Posh:
        substitutions = {
          "~" = " ";
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
          "appdata" = " ";
          "coding" = "󰲌 ";
          "Videos" = " ";
          " /Replays" = " ";
          "󰲌 /nodejs/angular" = " ";
          "󰲌 /nodejs" = " ";
          "󰲌 /rust" = " ";
          "󰲌 /python" = " ";
          "󰲌 /java" = " ";
          ".config" = " ";
          "Desktop" = " ";
        };
      };
      # Keep in mind that the order matters. For example:
      # "Important Documents" = " 󰈙 "
      # will not be replaced, because "Documents" was already substituted before.
      # So either put "Important Documents" before "Documents" or use the substituted version:
      # "Important 󰈙 " = " 󰈙 "

      c = {
        symbol = " ";
        style = "#314095";
        format = "[ $symbol ]($style)";
      };

      cpp = {
        symbol = " ";
        style = "#004d89";
        format = "[ $symbol ]($style)";
      };

      docker_context = {
        symbol = " ";
        style = "#06969A";
        format = "[ $symbol $context ]($style)";
      };

      elixir = {
        symbol = " ";
        style = "#48205d";
        format = "[ $symbol ]($style)";
      };

      elm = {
        symbol = " ";
        style = "#86BBD8";
        format = "[ $symbol ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "#D1462C";
        format = "[ $branch ]($style)";
      };

      git_status = {
        style = "#E14F37";
        format = "[$all_status$ahead_behind ]($style)";
      };

      golang = {
        symbol = " ";
        style = "#5bbbc6";
        format = "[ $symbol ]($style)";
      };

      gradle = {
        style = "#005D2C";
        format = "[ $symbol ]($style)";
      };
      haskell = {
        symbol = " ";
        style = "#80457c";
        format = "[ $symbol ]($style)";
      };

      java = {
        symbol = " ";
        style = "#F89820";
        format = "[ $symbol ]($style)";
      };

      julia = {
        symbol = " ";
        style = "#3856BB";
        format = "[ $symbol ]($style)";
      };

      nodejs = {
        symbol = " ";
        style = "#71A602";
        format = "[ $symbol ]($style)";
      };

      nim = {
        symbol = "󰆥 ";
        style = "#DDCb47";
        format = "[ $symbol ]($style)";
      };

      rust = {
        symbol = " ";
        style = "#D64A00";
        format = "[ $symbol ]($style)";
      };

      scala = {
        symbol = " ";
        style = "#De3423";
        format = "[ $symbol ]($style)";
      };

      nix_shell = {
        symbol = "󱄅 ";
        # heuristic = true; Son ts broken
        disabled = true;
        style = "#004d89";
        format = "[ $symbol$state( ($name))]($style)";
      }; # the module only works with nix-shell...

      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "#D60270";
        format = "[ $time   ]($style)";
      };
    };
  };
}
