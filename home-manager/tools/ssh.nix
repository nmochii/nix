{user, ...}: {
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
          IdentityFile = "${user.config}/ssh/github";
        };
      };
    };
  };
}
