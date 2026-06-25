{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.tools.enable {
  home.packages = [
    pkgs.hck
  ];

  programs.fish.shellAbbrs = lib.mkIf config.programs.fish.enable {
    cut = "hck";
  };
}
