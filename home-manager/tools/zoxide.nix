{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.zoxide = {
    enable = true;
  };
}
