{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.shell.enable {
  home.shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;
  };
}
