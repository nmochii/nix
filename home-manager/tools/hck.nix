{pkgs, ...}: {
  home.packages = [
    pkgs.hck
  ];

  programs.fish.shellAbbrs = {
    cut = "hck";
  };
}
