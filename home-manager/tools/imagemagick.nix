{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.tools.enable {
  home.packages = [
    pkgs.imagemagick
  ];
}
