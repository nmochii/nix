{
  programs.kitty.enable = true;

  imports = [
    ./keybindings.nix
    ./prefs.nix
    ./theme.nix
  ];
}
