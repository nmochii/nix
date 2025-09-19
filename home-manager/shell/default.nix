{
  user,
  lib,
  ...
}:
{
  programs.bash.enable = true;
  imports = [
    ./carapace.nix
    ./direnv.nix
    ./${user.shell}.nix
    ./starship.nix
  ];

  home.shellAliases = {
    n = "nix-shell --run fish";
    config = "cd /home/${user.name}/work/${user.name}/nix";
  };
}
