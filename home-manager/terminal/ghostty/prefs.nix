{user, ...}: {
  programs.ghostty.settings = {
    font-family = "Iosevka Nerd Font";
    font-size = 14;
    maximize = true;
    window-decoration = false;
    theme = "Catppuccin Mocha";
    command = user.shell;
    mouse-hide-while-typing = true;
    mouse-scroll-multiplier = 1;
    background-opacity = 0.90;
    unfocused-split-opacity = 0.70;
  };
}
