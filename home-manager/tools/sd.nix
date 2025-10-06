{pkgs, ...}: {
  home.packages = [
    pkgs.sd
  ];

  programs.fish.shellAbbrs = {
    sed = "sd";
  };
}
