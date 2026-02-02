{
  config,
  lib,
  ...
}: {
  imports = [
    ./keybinds.nix
    ./prefs.nix
  ];

  config = lib.mkIf config.modules.terminal.enable {
    programs.ghostty.enable = true;
  };
}
