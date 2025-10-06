{pkgs, ...}: {
  programs.jjui = {
    enable = true;
    settings.keys = {
      preview = {
        scroll_up = ["{"];
        scroll_down = ["}"];
        half_page_up = ["["];
        half_page_down = ["]"];
        expand = ["="];
        shrink = ["-"];
      };
    };
  };
  home.packages = [
    (pkgs.writeShellScriptBin "__jj_ui" ''
      if [ $# -eq 1 ] && [ -f $1 ]; then
        jjui -r "files($1)"
      else
        jjui "''${@}"
      fi
    '')
  ];
}
