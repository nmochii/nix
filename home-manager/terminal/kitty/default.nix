{
  config,
  lib,
  ...
}: {
  imports = [
    ./keybindings.nix
    ./prefs.nix
    ./theme.nix
  ];

  config = lib.mkIf config.modules.terminal.enable {
    programs.kitty.enable = true;
  };
}
