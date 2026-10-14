{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (config.modules.tools.enable && config.modules.tools.extrasEnable) {
  home.packages = [
    pkgs.rustnet
  ];

  home.shellAliases = {
    rustnet = "sudo ${pkgs.rustnet}/bin/rustnet";
  };
}
