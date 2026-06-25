{
  inputs,
  system,
  config,
  lib,
  user,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        setEnv = ''
          TERM=xterm-256color
        '';
      };
      "github.com" = {
        IdentityFile = "${user.SSoT}/ssh/github";
      };
    };
  };

  home.packages = [
    inputs.purple.packages.${system}.default
  ];

  home.shellAliases = {
    "ssh:ui" = "purple --config ${user.SSoT}/ssh/purple/conf";
  };
}
