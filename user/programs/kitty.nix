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
      window_padding_width = 12;
      hide_window_decorations = false;
      mouse_hide_wait = 0.0;
      cursor_shape = "block";
      cursor_blink_interval = 1;
      cursor_trail = 1;

      scrollback_lines = 5000;
      scrollback_pager_history_size = 10;

      copy_on_select = true;
      strip_trailing_spaces = "smart";
    };

    keybindings = {
      "ctrl+shift+n" = "new_window";
      "ctrl+t" = "new_tab";
      "ctrl+plus" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+0" = "change_font_size all 0";
    };

    extraConfig = ''
      notify_on_cmd_finish unfocused 20
      cursor_trail_decay 0.1 0.4
      include ./dank-theme.conf
      include ./dank-tabs.conf
    '';
  };
}
