{
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
        disabled = true;
      };
      # https://github.com/jj-vcs/jj/wiki/Starship
      custom.jj = {
        command = ''
          jj log --revisions @ --limit 1 --ignore-working-copy --no-graph --color always  --template '
            separate(" ",
              bookmarks.map(|x| truncate_end(10, x.name(), "…")).join(" "),
              truncate_end(10, description.first_line(), "…"),
              if(conflict, "conflict"),
              if(divergent, "divergent"),
              if(hidden, "hidden"),
            )'
        '';
        detect_folders = [".jj"];
        symbol = "[](bold purple)";
        format = "[$symbol ($output)]($style) ";
      };
    };
  };
}
