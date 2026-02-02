{ui, ...}:
assert builtins.elem ui.interface ["niri" "gnome"]; {
  imports =
    [
      ./apps
      ./${ui.interface}
    ]
    ++ (
      # Always import gnome as fallback
      if ui.interface == "gnome"
      then []
      else [./gnome]
    );
}
