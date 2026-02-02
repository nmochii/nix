{user, ...}:
assert builtins.elem user.editor ["hx"]; {
  imports = [
    ./extras.nix
    ./${user.editor}
  ];
}
