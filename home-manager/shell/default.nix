{
  config,
  lib,
  user,
  ...
}:
if builtins.hasAttr "shell" user
then
  assert builtins.elem user.shell ["fish" "nu" "bash"]; {
    imports = [
      ./carapace.nix
      ./direnv.nix
      ./${user.shell}.nix
      ./starship.nix
    ];

    config = lib.mkIf config.modules.shell.enable {
      programs.bash.enable = true;
      home.shellAliases = {
        "nix:shell" = "nix repl --expr 'import <nixpkgs> {}'";
        n = "nix-shell --run ${user.shell}";
      };
    };
  }
else {}
