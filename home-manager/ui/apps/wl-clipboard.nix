{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.ui.enable {
  home.packages = [
    pkgs.wl-clipboard
  ];
}
