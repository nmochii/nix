{
  config,
  lib,
  pkgs,
  user,
  ...
}:
lib.mkIf config.modules.tools.enable {
  home.packages = [
    pkgs.sd
  ];

  programs.fish.shellAbbrs = lib.mkIf (user.shell == "fish") {
    sed = "sd";
  };
}
