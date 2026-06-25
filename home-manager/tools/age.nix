{
  user,
  config,
  lib,
  pkgs,
  mylib,
  ...
}:
lib.mkIf config.modules.tools.enable {
    home.packages = [
      pkgs.age
    ];

    age.identityPaths = [
      "${user.SSoT}/secrets/personal.age.txt"
    ];
    home.shellAliases = mylib.mkAgeAliases "${user.SSoT}/secrets" "personal";
  }
