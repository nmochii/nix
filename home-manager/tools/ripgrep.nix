{
  config,
  lib,
  user,
  ...
}:
lib.mkIf config.modules.tools.enable {
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

  programs.fish.shellAbbrs = lib.mkIf (user.shell == "fish") {
    rgi = "rg -i";
    rgs = "rg -S";
  };
}
