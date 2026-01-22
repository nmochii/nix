{
  programs.difftastic = {
    enable = true;
    git.enable = true;
  };

  programs.jujutsu.settings = {
    merge-tools.difft = {
      program = "difft";
      diff-args = ["--color=always" "$left" "$right"];
    };
    aliases.difft = ["diff" "--tool" "difft"];
  };
}
