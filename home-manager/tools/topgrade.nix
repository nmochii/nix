{
  config,
  lib,
  ...
}:
lib.mkIf (config.modules.tools.enable && config.modules.tools.extrasEnable) {
  programs.topgrade = {
    enable = true;
  };
}
