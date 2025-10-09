{user, ...}: {
  programs.bash.enable = true;
  imports = [
    ./carapace.nix
    ./direnv.nix
    ./${user.shell}.nix
    ./starship.nix
  ];

  home.shellAliases = {
    "nix:shell" = "nix repl --expr 'import <nixpkgs> {}'";
    n = "nix-shell --run ${user.shell}";
  };
}
