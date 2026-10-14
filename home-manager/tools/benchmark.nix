{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (config.modules.tools.enable && config.modules.tools.extrasEnable) {
  home.packages = [
    pkgs.hyperfine
  ];

  home.shellAliases = {
    benchmark = "hyperfine";
  };
}
