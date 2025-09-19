{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "$nix_shell$directory$jobs$character";
      right_format = "$python$git_branch";
      directory.truncation_length = 3;
      character.success_symbol = "[>>](bold green)";
      character.error_symbol = "[>>](bold red)";
      python.format = "$virtualenv [$version](green) ";
      python.version_format = "$major.$minor";
      nix_shell.format = "[󰘧]($style) ";
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        always_show_remote = true;
      };
    };
  };
}
