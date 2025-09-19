{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--max-columns=150"
      "--max-columns-preview"
      "--glob=!.git/*"
      "--glob=!*-lock.json"
      "--glob=!*.lock"
      "--glob=!pylint.out"
      "--glob=!.venv/*"
      "--glob=!.npm/*"
      "--glob=!node_modules/*"
      "--glob=!*.xls*"
      "--glob=!*.min.**"
      "--glob=!*.map*"
      "--glob=!*.sum"
      "--glob=!*.mod"
    ];
  };

  programs.fish = {
    shellAbbrs = {
      rgi = "rg -i";
      rgs = "rg -S";
    };
  };
}
