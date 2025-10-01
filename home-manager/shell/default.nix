{user, ...}: {
  programs.bash.enable = true;
  imports = [
    ./carapace.nix
    ./direnv.nix
    ./${user.shell}.nix
    ./starship.nix
  ];

  home.shellAliases = {
    n = "nix-shell --run ${user.shell}";
  };
}
