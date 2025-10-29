{pkgs, ...}: {
  imports = [
    ../apps/chromium.nix
    ../apps/firefox.nix
    ../apps/librewolf.nix
    ../apps/mpv.nix
    ../apps/office.nix
    ./dms.nix
    ./keybinds.nix
    ./prefs.nix
  ];

  home.packages = [
    pkgs.xwayland-satellite
  ];

  programs.niri = {
    enable = true;
    settings.binds = {
      "Mod+D" = {
        hotkey-overlay.title = "Toggle Application Launcher";
        action.spawn = ["dms" "ipc" "spotlight" "toggle"];
      };
      "Mod+Comma" = {
        hotkey-overlay.title = "Toggle Settings";
        action.spawn = ["dms" "ipc" "settings" "toggle"];
      };
      "Mod+M" = {
        hotkey-overlay.title = "Toggle Process List";
        action.spawn = ["dms" "ipc" "processlist" "toggle"];
      };
      "Mod+N" = {
        hotkey-overlay.title = "Toggle Notification Center";
        action.spawn = ["dms" "ipc" "notifications" "toggle"];
      };
      "Mod+P" = {
        hotkey-overlay.title = "Toggle Notepad";
        action.spawn = ["dms" "ipc" "notepad" "toggle"];
      };
      "Mod+V" = {
        hotkey-overlay.title = "Toggle Clipboard Manager";
        action.spawn = ["dms" "ipc" "clipboard" "toggle"];
      };
      "Mod+X" = {
        hotkey-overlay.title = "Toggle Power Menu";
        action.spawn = ["dms" "ipc" "powermenu" "toggle"];
      };
      "Super+Alt+L" = {
        hotkey-overlay.title = "Toggle Lock Screen";
        action.spawn = ["dms" "ipc" "lock" "lock"];
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = ["dms" "ipc" "audio" "decrement" "3"];
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn = ["dms" "ipc" "audio" "micmute"];
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn = ["dms" "ipc" "audio" "mute"];
      };
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn = ["dms" "ipc" "audio" "increment" "3"];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = ["dms" "ipc" "brightness" "decrement" "5" ""];
      };
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = ["dms" "ipc" "brightness" "increment" "5" ""];
      };
    };
  };
}
