{ui, ...}: {
  programs.niri.settings = {
    hotkey-overlay.hide-not-bound = true;
    binds = {
      "Mod+Shift+Slash".action.show-hotkey-overlay = [];
      "Mod+Return" = {
        hotkey-overlay.title = "Open terminal";
        action.spawn = ui.terminal;
      };
      "Mod+Tab".action.toggle-overview = [];
      "Mod+Q".action.close-window = [];

      "Mod+H".action.focus-column-left = [];
      "Mod+J".action.focus-window-down = [];
      "Mod+K".action.focus-window-up = [];
      "Mod+L".action.focus-column-right = [];

      "Mod+Shift+H".action.move-column-left = [];
      "Mod+Shift+J".action.move-window-down = [];
      "Mod+Shift+K".action.move-window-up = [];
      "Mod+Shift+L".action.move-column-right = [];

      "Mod+Ctrl+H".action.focus-monitor-left = [];
      "Mod+Ctrl+L".action.focus-monitor-right = [];

      "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [];
      "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [];

      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+Shift+1".action.move-window-to-workspace = 1;
      "Mod+Shift+2".action.move-window-to-workspace = 2;
      "Mod+Shift+3".action.move-window-to-workspace = 3;
      "Mod+Shift+4".action.move-window-to-workspace = 4;

      "Mod+Shift+Left".action.consume-or-expel-window-left = [];
      "Mod+Shift+Right".action.consume-or-expel-window-right = [];

      "Mod+Shift+W".action.reset-window-height = [];
      "Mod+W".action.expand-column-to-available-width = [];
      "Mod+F".action.maximize-column = [];
      "Mod+Shift+F".action.fullscreen-window = [];

      "Mod+C".action.center-column = [];
      "Mod+Ctrl+C".action.center-visible-columns = [];

      "Mod+Left".action.set-column-width = "-10%";
      "Mod+Right".action.set-column-width = "+10%";
      "Mod+Down".action.set-window-height = "+10%";
      "Mod+Up".action.set-window-height = "-10%";

      "Mod+Shift+E".action.quit = [];

      "Mod+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = [];
      };
      "Mod+Space".action.toggle-window-floating = [];
      "Mod+Shift+Space".action.switch-focus-between-floating-and-tiling = [];
    };
  };
}
