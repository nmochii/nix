{
  config,
  lib,
  user,
  ...
}:
lib.mkIf config.modules.shell.enable {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      format = "$nix_shell$directory$jobs$ssh$character";
      right_format = "$cmd_duration$python$git_branch\${custom.jj}";
      cmd_duration = {
        show_milliseconds = true;
        format = "[$duration]($style) ";
        style = "bold yellow";
      };
      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
      };
      character = {
        success_symbol = "[>>](bold green)";
        error_symbol = "[>>](bold red)";
      };
      python = {
        format = "$virtualenv [$version](green) ";
        version_format = "$major.$minor";
      };
      nix_shell.format = "[󰘧]($style) ";
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        disabled = user.vcs != "git";
      };
      # https://github.com/jj-vcs/jj/wiki/Starship
      custom.jj = {
        command = "__jj_prompt";
        when = "jj root --ignore-working-copy --quiet";
        symbol = "[](bold purple)";
        format = "[$symbol ($output)]($style) ";
        disabled = user.vcs != "jj";
        shell = ["sh" "--norc" "--noprofile"];
      };
    };
  };
}
