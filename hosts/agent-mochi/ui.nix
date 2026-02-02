{
  wallpaper = "wallpaper.jpg";
  terminal = "kitty"; # ghostty | kitty
  # awaiting fix for : https://github.com/ghostty-org/ghostty/issues/8208
  # terminal = "ghostty";
  interface = "niri"; # niri (dms) | gnome
  cursor-theme = "Yaru";
  monitors = {
    DP-3 = {
      position = {
        x = 0;
        y = 0;
      };
    };
    DP-4 = {
      position = {
        x = 0;
        y = 0;
      };
    };
    DP-5 = {
      position = {
        x = 1920;
        y = -545;
      };
      transform.rotation = 90;
    };
    DP-7 = {
      position = {
        x = 1920;
        y = -545;
      };
      transform.rotation = 90;
    };
    eDP-1 = {
      position = {
        x = 3000;
        y = 0;
      };
      scale = 1.2;
    };
  };
}
