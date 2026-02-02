{
  config,
  lib,
  ...
}: {
  imports = [
    ./keybinds.nix
    ./prefs.nix
  ];

  config = lib.mkIf config.modules.ui.enable {
    programs.gnome-shell.enable = true;
    dconf.enable = true;
  };
}
