{user, ...}: {
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
        default-command = "log";
        editor = user.editor;
        conflict-marker-style = "snapshot";
        bookmark-list-sort-keys = [
          "committer-date"
          "name"
        ];
        diff-formater = [
          "difft"
          "--color=always"
          "$left"
          "$right"
        ];
      };
      revset-aliases = {
        "active(rev)" = "trunk()::rev";
        current = "active(@)";
        wip = "description('[wip]')";
        private = "description('[private]')";
        merge = "description('[merge]')";
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
        subprocess = true; # use git instread of libgit2, usually faster
        colocate = true;
      };
      template-aliases.default_commit_description = ''
        "

        JJ: Conventional commit : feat(lang)!: add support for french
        JJ: <type>[optional scope]: <description>
        JJ: [optional body]
        JJ: [optional footer(s)]
        JJ: types: fix|feat|!feat(breaking change)|build|chore|ci|docs|style|refactor|perf|test
        "
      '';
      aliases = {
        tug = [
          "bookmark"
          "move"
          "--from"
          "heads(::@- & bookmarks())"
          "--to"
          "@-"
        ];
        private = ["new" "-m" "[private]"];
        wip = ["new" "-m" "[wip]"];
        merge = ["new" "-m" "[merge]" "--no-edit"];
        merge-add = ["rebase" "-s" "merge" "-d" "merge-"];
        rebase-all = ["rebase" "-s" "roots(trunk()..mutable())" "-d" "trunk()"];
        bookmarks = ["bookmark" "list" "--tracked"];
        history = ["log" "-r" "::"];
        blame = ["file" "annotate"];
        fetch = ["git" "fetch"];
        push = ["git" "push" "-b"];
        clone = ["git" "clone"];
        init = ["git" "init"];
        ui = ["util" "exec" "__custom_jjui"];
      };
    };
  };
}
