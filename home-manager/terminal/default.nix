{
  ui,
  config,
  lib,
  ...
}: let
  hasTerminal = builtins.hasAttr "terminal" ui;
in {
  imports =
    if hasTerminal
    then
      assert builtins.elem ui.terminal ["ghostty" "kitty"]; [
        ./${ui.terminal}
      ]
    else [];

  config = lib.mkIf config.modules.terminal.enable {
    assertions = [
      {
        assertion = hasTerminal;
        message = "modules.terminal.enable requires hosts/<name>/ui.nix with terminal (ghostty | kitty)";
      }
    ];
  };
}
