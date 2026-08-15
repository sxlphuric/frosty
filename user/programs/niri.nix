let
  niriConfigDirectory = "/home/mushroom/.config/niri";
in {
  wayland.windowManager.niri = {
    enable = true;
    checkConfig = false;
    settings = {
      input = {
        touchpad = {
          tap = {};
          natural-scroll = {};
        };
        focus-follows-mouse._props.max-scroll-amount = "5%";
        keyboard.numlock = {};
      };

      hotkey-overlay.skip-at-startup = {};

      binds = {
        "Mod+Shift+Slash".show-hotkey-overlay = {};

        "Mod+T" = {
          _props.hotkey-overlay-title = "Open a Terminal: kitty";
          spawn = "kitty";
        };
      };
    };
    extraConfig = ''
      include "${niriConfigDirectory}/dms/colors.kdl"
      include "${niriConfigDirectory}/dms/layout.kdl"
      include "${niriConfigDirectory}/dms/alttab.kdl"
      include "${niriConfigDirectory}/dms/binds.kdl"
    '';
  };
}
