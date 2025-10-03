{
  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    shellInit = ''
      if status --is-interactive
        eval (direnv hook fish)
      end
    '';
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
}
