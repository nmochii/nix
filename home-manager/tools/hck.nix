{
  config,
  lib,
  pkgs,
  user,
  ...
}:
lib.mkIf config.modules.tools.enable {
  home.packages = [
    pkgs.hck
  ];

  programs.fish.shellAbbrs = lib.mkIf (user.shell == "fish") {
    cut = "hck";
  };
}
