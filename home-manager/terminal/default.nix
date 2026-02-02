{ui, ...}:
assert builtins.elem ui.terminal ["ghostty" "kitty"]; {
  imports = [
    ./${ui.terminal}
  ];
}
