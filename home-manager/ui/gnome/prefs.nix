{
  lib,
  ui,
  assets,
  pkgs,
  ...
}:
let
  extensions = with pkgs.gnomeExtensions; [
    clipboard-history
    system-monitor
    places-status-indicator
  ];
in
{
  home.packages = [ ] ++ extensions;
  dconf.settings = {
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.gvariant.mkTuple [
          "xkb"
          "us+intl"
        ])
      ];
      xkb-options = [ "ctrl:nocaps" ];
    };
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file:///${assets}/${ui.wallpaper}";
    };
    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      enable-hot-corners = true;
      font-hinting = "slight";
      gtk-theme = "Yaru-dark";
      icon-theme = "Yaru";
      show-battery-percentage = true;
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = map (e: e.extensionUuid) extensions;
    };
    "org/gnome/shell/extensions/hidetopbar" = {
      enable-active-window = false;
      enable-intellihide = false;
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      hot-keys = false;
      dock-fixed = false;
      dock-position = "LEFT";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,minimize,maximize:appmenu";
      num-workspaces = 4;
    };
  };
}
