{user, ...}: {
  programs.eza = {
    enable = user.shell != "nu";
    git = true;
    icons = "auto";
  };

  home.shellAliases =
    if user.shell != "nu"
    then {
      l = "eza -l";
    }
    else {};

  programs.fish.shellAbbrs = {
    ls = "eza";
    sl = "eza";
    la = "eza -lag";
  };
}
