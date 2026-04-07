{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.vcs.enable {
  home.packages = [
    pkgs.meld
  ];

  programs.jujutsu.settings = lib.mkIf config.programs.jujutsu.enable {
    merge-tools.meld = {
      program = "meld";
    };
    ui.merge-tool = "meld";
  };
}
