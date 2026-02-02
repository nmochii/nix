{
  config,
  inputs,
  lib,
  system,
  ...
}: let
  yt-pkg = inputs.youtube.packages."${system}".default;
in
  lib.mkIf config.modules.tools.enable {
    home.packages = [
      yt-pkg
    ];

    home.shellAliases = {
      youtube = yt-pkg.meta.mainProgram;
    };
  }
