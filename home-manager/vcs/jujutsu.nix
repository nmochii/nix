{
  user,
  pkgs,
  ...
}: let
  label = t: "(${t})";
  wip-label = label "wip";
  private-label = label "private";
  merge-label = label "mega merge";
  bookmark-pattern = "regex:'^\\[[^]]+\\] ?'";
in {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = user.fullName;
        email = user.email;
      };
      signing = (
        if user.gpgKey == ""
        then {}
        else {
          behavior = "drop";
          backend = "gpg";
          key = user.gpgKey;
        }
      );
      ui = {
        editor = user.editor;
        conflict-marker-style = "snapshot";
        bookmark-list-sort-keys = ["committer-date"];
        diff-editor = ":builtin";
        default-command = [
          "log"
          "--config"
          "template-aliases.'format_timestamp(ts)'='ts.local().ago()'"
        ];
      };
      merge-tools = {
        difft = {
          program = "difft";
          diff-args = ["--color=always" "$left" "$right"];
        };
      };
      revset-aliases = {
        "active(rev)" = "mutable()-::rev";
        current = "active(@)";
        wip = "description('${wip-label}')";
        private = "description('${private-label}')";
        merge = "description('${merge-label}')";
        blacklist = "wip | private | merge";
        "user(x)" = "author(x) | committer(x)";
      };
      revsets = {
        log-graph-prioritize = "coalesce(merge, trunk())";
      };
      git = {
        auto-local-bookmark = false;
        push-new-bookmarks = true;
        sign-on-push = user.gpgKey != "";
        private-commits = "blacklist";
        subprocess = true; # use git instread of libgit2
        colocate = false;
      };
      snapshot = {
        auto-update-stale = true;
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
        ui = ["util" "exec" "__jj_ui"];
        tug = ["util" "exec" "__jj_tug"];
        nn = ["new" "--no-edit"];
        private = ["new" "-m" private-label];
        wip = ["new" "-m" wip-label];
        merge = ["new" "-m" merge-label "--no-edit"];
        merge-add = ["rebase" "-s" "merge & current" "-d" "merge- & current" "-d"];
        retrunk = ["rebase" "-s" "roots(mutable())" "-d" "trunk()"];
        history = ["log" "-r" "::"];
        blame = ["file" "annotate"];
        fetch = ["git" "fetch"];
        push = ["git" "push" "-b"];
        clone = ["git" "clone"];
        init = ["git" "init"];
        difft = ["diff" "--tool" "difft"];
      };
    };
  };
  home.packages = [
    (pkgs.writeShellScriptBin "__jj_prompt" ''
      jj log -r "current & (bookmarks() | @)" --ignore-working-copy --no-graph -T "
        separate(' < ',
          if (current_working_copy, truncate_end(10, description.first_line().replace(${bookmark-pattern}, ${"''"}), '…')),
          bookmarks.map(|b| truncate_end(10, b.name(), '…')).join(' '),
        ) ++ ' '
      "
    '')
    (pkgs.writeShellScriptBin "__jj_tug" ''
      bookmarks=$(jj bookmark list -r current | cut -d: -f1 | grep -v @)
      for bookmark in $bookmarks; do
        jj bookmark move --ignore-working-copy --from "$bookmark" --to "heads(bookmarks('$bookmark')::roots(merge- | @-))" 2> /dev/null
      done
    '')
  ];
}
