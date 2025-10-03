{
  programs.helix = {
    enable = true;
  };

  imports = [
    ./languages.nix
    ./keybinds.nix
    ./settings.nix
    ./theme.nix
  ];
}
