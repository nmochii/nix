{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.shell.enable {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
  };
}
