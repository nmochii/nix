{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.htop = {
    enable = true;
  };
}
