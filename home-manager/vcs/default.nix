{user, ...}:
if builtins.hasAttr "vcs" user
then
  assert builtins.elem user.vcs ["jj" "git"]; {
    imports =
      [
        ./git.nix
        ./gitui.nix
        ./meld.nix
        ./tig.nix
      ]
      ++ (
        if user.vcs == "jj"
        then [
          ./jujutsu
          ./jjui.nix
        ]
        else []
      );
  }
else {}
