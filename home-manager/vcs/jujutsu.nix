{ user, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = user.fullName;
        email = user.email;
      };
      signing = (
        if user.gpgKey == "" then
          null
        else
          {
            behavior = "own";
            backend = "gpg";
            key = user.gpgKey;
          }
      );
      aliases = {
        bookmarks = [
          "bookmark"
          "list"
          "--tracked"
        ];
        history = [
          "log"
          "-r"
          "::"
        ];
        blame = [
          "file"
          "annotate"
        ];
        fetch = [
          "git"
          "fetch"
        ];
        push = [
          "git"
          "push"
          "-b"
        ];
        clone = [
          "git"
          "clone"
          "--colocate"
        ];
        init = [
          "git"
          "init"
          "--colocate"
        ];
      };
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
      template-aliases.default_commit_description = ''
        "

        JJ: Conventional commit : feat(lang)!: add support for french
        JJ: <type>[optional scope]: <description>
        JJ: [optional body]
        JJ: [optional footer(s)]
        JJ: types: fix|feat|!feat(breaking change)|build|chore|ci|docs|style|refactor|perf|test
        "
      '';
      git = {
        auto-local-bookmark = false;
        push-new-bookmarks = true;
      };
    };
  };
}
