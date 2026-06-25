{
  user,
  config,
  mylib,
  ...
}: {
  xdg.configFile."yamlfmt/.yamlfmt".text = ''
    formatter:
      retain_line_breaks: true
      indentless_arrays: true
  '';
  home.file."${config.xdg.configHome}/ruff/pyproject.toml".source = mylib.mkToml "ruff-pyproject" {
    tool.ruff = {
      line-length = 100;
      target-version = "py311";
    };
  };

  age.identityPaths = [
    "${user.SSoT}/secrets/olfeo.age.txt"
  ];
  home.shellAliases = mylib.mkAgeAliases "${user.SSoT}/secrets" "olfeo";
}
