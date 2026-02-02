{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.ui.enable {
  programs.mpv = {
    enable = true;
  };
}
