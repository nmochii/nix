{ user, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        setEnv = {
          TERM = "xterm-256color";
        };
        extraOptions = {
          StrictHostKeyChecking = "accept-new";
        };
      };
      "github.com" = {
        extraOptions = {
          IdentityFile = "${user.config}/ssh/github";
        };
      };
    };
  };
}
