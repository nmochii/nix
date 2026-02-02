{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.jq = {
    enable = true;
  };
}
