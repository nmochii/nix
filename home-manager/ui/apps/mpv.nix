{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = [
      pkgs.mpvScripts.uosc
    ];
    bindings = {
      "<" = "script-binding uosc/prev";
      ">" = "script-binding uosc/next";
      m = "script-binding uosc/menu";
      o = "script-binding uosc/open-file";
      p = "script-binding uosc/items";
    };
  };
}
