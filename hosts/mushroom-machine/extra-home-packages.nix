{pkgs, config, ...}: {
  home.packages = with pkgs; [
    # android-studio
  ] ++ (if config.update_outofspace then [] else with pkgs;[android-studio airtame]);
}
