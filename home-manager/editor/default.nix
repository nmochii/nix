{user, ...}:
if builtins.hasAttr "editor" user
then
  assert builtins.elem user.editor ["hx"]; {
    imports = [
      ./extras.nix
      ./${user.editor}
    ];
  }
else {}
