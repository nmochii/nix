{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.difftastic = {
    enable = true;
    git.enable = true;
  };

  programs.jujutsu.settings = lib.mkIf config.programs.jujutsu.enable {
    merge-tools.difft = {
      program = "difft";
      diff-args = ["--color=always" "$left" "$right"];
    };
    aliases.difft = ["diff" "--tool" "difft"];
  };
}
