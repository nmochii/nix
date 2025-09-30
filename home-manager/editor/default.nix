{user, ...}: {
  imports =
    [
      ./extras.nix
    ]
    ++ (
      if user.editor == "hx"
      then [./helix]
      else []
    );
}
