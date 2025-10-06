{
  imports = [
    ../apps/chromium.nix
    ../apps/clipse.nix
    ../apps/firefox.nix
    ../apps/librewolf.nix
    ../apps/mpv.nix
    ../apps/office.nix
    ./keybinds.nix
    ./prefs.nix
  ];

  programs.gnome-shell.enable = true;
  dconf.enable = true;
}
