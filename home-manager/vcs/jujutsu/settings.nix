{
  config,
  lib,
  user,
  ...
}:
lib.mkIf config.modules.vcs.enable {
  programs.jujutsu.settings = {
    user = {
      name = user.fullName;
      email = user.email;
    };
    signing =
      if user.gpgKey == ""
      then {}
      else {
        behavior = "drop";
        backend = "gpg";
        key = user.gpgKey;
      };
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
    remotes = {
      origin = {
        auto-track-bookmarks = "glob:*";
      };
    };
    git = {
      auto-local-bookmark = false;
      sign-on-push = user.gpgKey != "";
      private-commits = "blacklist";
      subprocess = true; # use git instead of libgit2
      colocate = false;
    };
    snapshot = {
      auto-update-stale = true;
    };
    revsets = {
      log-graph-prioritize = "coalesce(merge, trunk())";
    };
  };
}
