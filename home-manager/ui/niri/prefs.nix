{
  programs.niri.settings = {
    layout = {
      gaps = 8;
      focus-ring.width = 1;
      center-focused-column = "on-overflow";
      default-column-width = {proportion = 3. / 7.;};
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
    input = {
      keyboard.xkb = {
        layout = "us";
        variant = "intl";
        options = "ctrl:nocaps";
      };
      touchpad.natural-scroll = false;
    };
    outputs = {
      DP-3 = {
        position = {
          x = 0;
          y = 0;
        };
      };
      DP-4 = {
        position = {
          x = 0;
          y = 0;
        };
      };
      DP-5 = {
        position = {
          x = 1920;
          y = -545;
        };
        transform.rotation = 90;
      };
      DP-7 = {
        position = {
          x = 1920;
          y = -545;
        };
        transform.rotation = 90;
      };
      eDP-1 = {
        position = {
          x = 3000;
          y = 0;
        };
        scale = 1.2;
      };
    };
  };
}
