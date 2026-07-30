{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;
    font.name = "Maple Mono NF";
    font.size = 11;

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      shell = "fish";
    };

    extraConfig = ''
      include ./dank-theme.conf
      include ./dank-tabs.conf
    '';
  };
}
