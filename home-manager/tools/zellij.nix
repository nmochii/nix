{lib, ...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = lib.mkForce "tokyo-night-light";
      show_startup_tips = false;
      support_kitty_keyboard_protocol = false;
      pane_frames = false;
      mouse_mode = true;
      copy_on_select = true;
      default_mode = "locked";
      ui.pane_frames.hide_session_name = true;
      "keybinds" = {
        unbind = [
          "Ctrl g"
          "Ctrl p"
          "Ctrl t"
          "Ctrl h"
          "Ctrl s"
          "Ctrl q"
          "Ctrl o"
          "Ctrl b"
          "Ctrl n"
        ];
        "shared_except \"locked\"" = {
          "bind \"Alt tab\"" = {
            SwitchToMode = "locked";
          };
        };
        "shared_except \"normal\"" = {
          "bind \"Alt tab\"" = {
            SwitchToMode = "normal";
          };
        };
        normal = {
          "bind \"p\"" = {
            SwitchToMode = "pane";
          };
          "bind \"t\"" = {
            SwitchToMode = "tab";
          };
          "bind \"r\"" = {
            SwitchToMode = "resize";
          };
          "bind \"m\"" = {
            SwitchToMode = "move";
          };
          "bind \"s\"" = {
            SwitchToMode = "search";
          };
          "bind \".\"" = {
            SwitchToMode = "session";
          };
        };
      };
    };
  };
}
