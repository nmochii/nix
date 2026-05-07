{pkgs, ...}: {
  home.packages = [
    pkgs.rustnet
  ];

  home.shellAliases = {
    rustnet = "sudo ${pkgs.rustnet}/bin/rustnet";
  };
}
