{user, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "$nix_shell$directory$jobs$character";
      right_format = "$python$git_branch\${custom.jj}";
      directory.truncation_length = 3;
      character.success_symbol = "[>>](bold green)";
      character.error_symbol = "[>>](bold red)";
      python.format = "$virtualenv [$version](green) ";
      python.version_format = "$major.$minor";
      nix_shell.format = "[󰘧]($style) ";
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        disabled = user.vcs != "git";
      };
      # https://github.com/jj-vcs/jj/wiki/Starship
      custom.jj = {
        command = "__jj_prompt";
        when = "jj root --ignore-working-copy --quiet";
        symbol = "[](bold purple)";
        format = "[$symbol ($output)]($style) ";
        disabled = user.vcs != "jj";
      };
    };
  };
}
