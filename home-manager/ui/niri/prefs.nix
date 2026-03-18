{
  config,
  lib,
  ui,
  ...
}:
lib.mkIf config.modules.ui.enable {
  programs.niri.settings = {
    layout = {
      gaps = 8;
      focus-ring.width = 1;
      center-focused-column = "never";
      default-column-width = {proportion = 2. / 5.;};
    };
    window-rules = [
      {
        geometry-corner-radius = {
          top-left = 4.;
          top-right = 4.;
          bottom-left = 4.;
          bottom-right = 4.;
        };
        clip-to-geometry = true;
      }
    ];
    cursor = {
      size = 24;
      theme = ui.cursor-theme;
    };
    input = {
      keyboard.xkb = {
        layout = "us";
        variant = "intl";
        options = "ctrl:nocaps";
      };
      touchpad.natural-scroll = false;
    };
  };
}
