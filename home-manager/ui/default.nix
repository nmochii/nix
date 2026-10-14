{
  ui,
  config,
  lib,
  ...
}: let
  hasInterface = builtins.hasAttr "interface" ui;
in {
  imports =
    if hasInterface
    then
      assert builtins.elem ui.interface ["niri" "gnome"];
        [
          ./apps
          ./${ui.interface}
        ]
        ++ (
          if ui.interface == "gnome"
          then []
          else [./gnome]
        )
    else [];

  config = lib.mkIf config.modules.ui.enable {
    assertions = [
      {
        assertion = hasInterface;
        message = "modules.ui.enable requires hosts/<name>/ui.nix with interface (niri | gnome)";
      }
    ];
  };
}
