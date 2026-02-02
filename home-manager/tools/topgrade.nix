{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.topgrade = {
    enable = true;
  };
}
