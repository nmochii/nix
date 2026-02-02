{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./dms.nix
    ./keybinds.nix
    ./prefs.nix
  ];

  config = lib.mkIf config.modules.ui.enable {
    home.packages = [
      pkgs.xwayland-satellite
    ];
    programs.niri.enable = true;
  };
}
