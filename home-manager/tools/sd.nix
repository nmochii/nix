{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.tools.enable {
  home.packages = [
    pkgs.sd
  ];

  programs.fish.shellAbbrs = lib.mkIf config.programs.fish.enable {
    sed = "sd";
  };
}
