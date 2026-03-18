{
  config,
  lib,
  ...
}: let
  label = t: "(${t})";
  wip-label = label "wip";
  private-label = label "private";
  merge-label = label "mega merge";
in
  lib.mkIf config.modules.vcs.enable {
    programs.jujutsu.settings = {
      revset-aliases = {
        "active(rev)" = "mutable()-::rev";
        current = "active(@)";
        wip = "description(substring:'${wip-label}')";
        private = "description(substring:'${private-label}')";
        merge = "description(substring:'${merge-label}')";
        blacklist = "wip | private | merge";
        "user(x)" = "author(x) | committer(x)";
      };
      template-aliases = {
        default_commit_description = ''
          "

          JJ: Conventional commit : feat(lang)!: add support for french
          JJ: <type>[optional scope][!: breaking changes]: <description>
          JJ: [optional body]
          JJ: [optional footer(s)]
          JJ: types: fix|feat|!feat(breaking change)|build|chore|ci|docs|style|refactor|perf|test
          "
        '';
      };
      aliases = {
        nn = ["new" "--no-edit"];
        private = ["new" "-m" private-label];
        wip = ["new" "-m" wip-label];
        merge = ["new" "-m" "merge-label"];
        merge-add = ["rebase" "-s" "merge & current" "-d" "merge- & current" "-d"];
        retrunk = ["rebase" "-s" "roots(mutable())" "-d" "trunk()"];
        blame = ["file" "annotate"];
        fetch = ["git" "fetch"];
        push = ["git" "push" "-b"];
        clone = ["git" "clone"];
        init = ["git" "init"];
        ui = ["util" "exec" "__jj_ui"];
        tug = ["util" "exec" "__jj_tug"];
        branch = ["util" "exec" "__jj_branch" "--"];
        pre-commit = ["util" "exec" "__jj_pre_commit"];
      };
    };
  }
