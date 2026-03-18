{ui, ...}:
if builtins.hasAttr "terminal" ui
then
  assert builtins.elem ui.terminal ["ghostty" "kitty"]; {
    imports = [
      ./${ui.terminal}
    ];
  }
else {}
