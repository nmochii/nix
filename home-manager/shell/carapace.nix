{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.shell.enable {
  programs.carapace = {
    enable = true;
  };
}
