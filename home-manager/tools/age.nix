{
  user,
  config,
  lib,
  pkgs,
  ...
}: let
  mkAgeAliases = import ../../lib/mkAgeAliases.nix;
in
  lib.mkIf config.modules.tools.enable {
    home.packages = [
      pkgs.age
    ];

    age.identityPaths = [
      "${user.SSoT}/secrets/personal.age.txt"
    ];
    home.shellAliases = mkAgeAliases "${user.SSoT}/secrets" "personal";
  }
