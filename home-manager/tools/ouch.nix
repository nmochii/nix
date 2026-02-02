{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.tools.enable {
  home.packages = [
    pkgs.ouch
  ];

  home.shellAliases = {
    compress = "ouch compress";
    decompress = "ouch decompress";
    "decompress:list" = "ouch list";
  };
}
