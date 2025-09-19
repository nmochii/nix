{ user, ... }:
{
  imports = [
    ./git.nix
  ]
  ++ (
    if user.vcs == "jj" then
      [ ./jujutsu.nix ]
    else if user.vcs == "git" then
      [
        ./gitui.nix
        ./meld.nix
        ./tig.nix
      ]
    else
      [ ]
  );
}
