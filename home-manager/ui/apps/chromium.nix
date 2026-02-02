{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.ui.enable {
  programs.chromium.enable = true;
}
