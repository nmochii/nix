{user, ...}: let
  mkAgeAliases = import ../../../lib/mkAgeAliases.nix;
in {
  xdg.configFile."yamlfmt/.yamlfmt".text = ''
    formatter:
      retain_line_breaks: true
      indentless_arrays: true
  '';

  xdg.configFile."ruff/pyproject.toml".text = ''
    [tool.ruff]
    line-length = 100
    target-version = "py311"
  '';

  age.identityPaths = [
    "${user.SSoT}/secrets/olfeo.age.txt"
  ];
  home.shellAliases = mkAgeAliases "${user.SSoT}/secrets" "olfeo";
}
