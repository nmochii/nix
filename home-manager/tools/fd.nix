{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.fd.enable = true;
}
