{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    inputs.dankMaterialShell.homeModules.dank-material-shell
    inputs.dankMaterialShell.homeModules.niri
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
