{user, ...}: {
  home.shellAliases = {
    icat = "kitten icat";
  };

  programs.kitty = {
    enableGitIntegration = true;
    settings = {
      shell = user.shell;
      env = ''
        SHELL=${user.shell}
      '';
      hide_window_decorations = true;
      font_family = "Iosevka Nerd Font";
      font_size = 14;
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      strip_trailing_spaces = "always";
      scrollback_lines = 5000;
      cursor_blink_interval = 0;
      cursor_trail = 100;
      cursor_trail_decay = "0.1 0.3";
      cursor_trail_start_threshold = 5;
      default_pointer_shape = "arrow";
      background_opacity = 0.90;
      allow_remote_control = true;
    };
  };
}
