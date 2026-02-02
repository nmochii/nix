{
  config,
  lib,
  user,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        setEnv = {
          TERM = "xterm-256color";
        };
      };
      "github.com" = {
        extraOptions = {
          IdentityFile = "${user.SSoT}/ssh/github";
        };
      };
    };
  };
}
