{
  imports = [
    ./keybinds.nix
    ./prefs.nix
    ../apps/office.nix
    ../apps/chromium.nix
    ../apps/firefox.nix
    ../apps/librewolf.nix
  ];

  programs.gnome-shell.enable = true;
  dconf.enable = true;
}
