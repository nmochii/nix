{
  home.shell.enableNushellIntegration = true;

  programs.nushell = {
    enable = true;
    environmentVariables = {
      config.edit_mode = "emacs";
    };
    settings = {
      show_banner = false;
    };
    shellAliases = {
      fg = "job unfreeze";
      jobs = "job list";
      l = "ls";
      ll = "ls -l";
      la = "ls -la";
    };
  };
}
