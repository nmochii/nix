{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.shell.enable {
  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
}
