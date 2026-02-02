{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.vcs.enable {
  home.packages = [
    pkgs.meld
  ];
}
