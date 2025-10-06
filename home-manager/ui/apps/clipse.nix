{pkgs, ...}: {
  services.clipse = {
    enable = true;
  };
  home.packages = [
    (pkgs.writeShellScriptBin "__copy" ''
      clipse -c "$@"
    '')
    (pkgs.writeShellScriptBin "__paste" ''
      clipse -p
    '')
  ];
}
