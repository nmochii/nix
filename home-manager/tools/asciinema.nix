{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.asciinema = {
    enable = true;
  };
}
