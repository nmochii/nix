{user, ...}: {
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

  home.shellAliases = {
    "age:olfeo:decrypt" = "age --decrypt -i ${user.config}/secrets/olfeo.age.txt";
    "age:olfeo:encrypt" = "age --encrypt -i ${user.config}/secrets/olfeo.age.txt";
  };
}
