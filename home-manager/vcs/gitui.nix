{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.vcs.enable {
  programs.gitui.enable = true;
}
