{
  programs.dankMaterialShell = {
    enable = true;
    niri = {
      enableKeybinds = false;
      enableSpawn = true;
    };
  };

  programs.niri = {
    settings = {
      spawn-at-startup = [
        {
          command = ["bash" "-c" "wl-paste --watch cliphist store &"];
        }
      ];
    };
  };
}
