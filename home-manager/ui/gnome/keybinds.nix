{ui, ...}: {
  dconf.settings = {
    "org/gnome/media-keys" = {};
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "open preferred terminal";
      command = ui.terminal;
      binding = "<Super>Return";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
      help = [];
      screenreader = [];
      magnifier = [];
      magnifier-zoom-in = [];
      magnifier-zoom-out = [];
      screensaver = ["<Super>Backspace"]; # lockscreen
      control-center = [];
      volume-down = ["AudioLowerVolume"];
      volume-up = ["AudioRaiseVolume"];
      volume-mute = ["AudioMute"];
      mic-mute = ["AudioMicMute"];
    };
    "org/gnome/shell/extensions/tiling-assistant" = {
      restore-window = [];
      tile-maximize = [];
      tile-topleft-quarter = [];
      tile-topright-quarter = [];
      tile-top-half = [];
      tile-left-half = [];
      tile-right-half = [];
      tile-bottom-half = [];
      tile-bottomleft-quarter = [];
      tile-bottomright-quarter = [];
    };
    "org/gnome/shell/extensions/keybindings" = {
      toggle-application-view = ["<Shift><Super>Space"];
      screenshot = [];
      screenshot-window = [];
      show-screen-recording-ui = [];
      focus-active-notification = [];
      toggle-message-tray = [];
    };
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = ["<Super>a"];
      toggle-tiled-right = ["<Super>d"];
    };
    "org/gnome/shell/keybindings" = {
      open-new-application-1 = [];
      open-new-application-2 = [];
      open-new-application-3 = [];
      open-new-application-4 = [];
      open-new-application-5 = [];
      open-new-application-6 = [];
      open-new-application-7 = [];
      open-new-application-8 = [];
      open-new-application-9 = [];
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      toggle-application-view = [];
      toggle-message-tray = ["<super>n"];
      toggle-quick-settings = [];
    };
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [];
      toggle-message-tray = [];
      close = ["<Super>q"];
      maximize = ["<Super>w"];
      minimize = ["<Super>s"];
      switch-input-source = [];
      switch-input-source-backward = [];
      move-to-monitor-up = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-workspace-up = [];
      move-to-workspace-down = [];
      move-to-workspace-left = [];
      move-to-workspace-right = [];
      move-to-workspace-last = [];
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      toggle-maximized = ["<Super>m"];
      toggle-fullscreen = ["<Super>f"];
      unmaximize = [];
      resize-window = [];
      show-desktop = [];
      switch-applications = ["<Super>Tab"];
      switch-applications-backward = ["<Shift><Super>Tab"];
      switch-windows = [];
      switch-panels = [];
      switch-panels-backward = [];
      cycle-panels = [];
      cycle-panels-backward = [];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
      switch-group = [];
      switch-group-backward = [];
      cycle-group = [];
      cycle-group-backward = [];
      cycle-windows = [];
      cycle-windows-backward = [];
      panel-run-dialog = [];
      begin-move = [];
      begin-resize = [];
    };
  };
}
