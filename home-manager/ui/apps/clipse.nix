{pkgs, ...}: {
  services.clipse = {
    enable = true;
  };
  home.packages = [
    (pkgs.writeShellScriptBin "__copy" ''
      #!/usr/bin/env bash
      clipse -c "$@"
    '')
    (pkgs.writeShellScriptBin "__paste" ''
      #!/usr/bin/env bash
      clipse -p
    '')
  ];
}
