let
  niriConfigDirectory = "/home/mushroom/.config/niri";
in {
  wayland.windowManager.niri = {
    enable = false;
    settings = {};

    /*extraConfig = ''
      include "${niriConfigDirectory}/dms/colors.kdl"
      include "${niriConfigDirectory}/dms/layout.kdl"
      include "${niriConfigDirectory}/dms/alttab.kdl"
      include "${niriConfigDirectory}/dms/binds.kdl"
      '';*/
  };
}
