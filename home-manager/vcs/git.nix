{ user, ... }:
{
  programs.git = {
    enable = true;
    userName = user.fullName;
    userEmail = user.email;
    signing = (
      if user.gpgKey == "" then
        { }
      else
        {
          key = user.gpgKey;
          signByDefault = true;
        }
    );
    difftastic.enable = true;
    aliases = {
      cleanup = "!git branch --merged | grep -v '\\*\\|main\\|master' | xargs -n 1 -r git branch -d";
      history = "log --stat --oneline --graph --all";
      root = "rev-parse --show-toplevel";
      showx = "show --ext-diff";
      logx = "log --ext-diff";
    };
    ignores = [
      "node_modules"
      ".cache"
      ".direnv"
      ".envrc"
      ".venv"
      "scratch"
      "workspaces"
    ];
    extraConfig = {
      branch.sort = "-committerdate";
      diff.ansible-vault.textconv = "ansible-vault view";
      diff.algorithm = "histogram";
      fetch.prune = true;
      fetch.all = true;
      init.defaultBranch = "main";
      merge.tool = "meld";
      push.default = "current";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rerere.enabled = false;
    };
  };
}
