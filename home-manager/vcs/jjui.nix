{ pkgs, ... }:
{
  programs.jjui = {
    enable = true;
    settings.keys = {
      cancel = [ "q" ];
      inline_describe.mode = [ "m" ];
      preview = {
        mode = [ "enter" ];
        scroll_up = [ "{" ];
        scroll_down = [ "}" ];
        half_page_up = [ "[" ];
        half_page_down = [ "]" ];
        expand = [ "=" ];
        shrink = [ "-" ];
      };
      describe = [ "D" ];
      diff = [ "d" ];
    };
  };
  home.packages = [
    (pkgs.writeShellScriptBin "__custom_jjui" ''
      #!/usr/bin/env bash
      if [ $# -eq 1 ] && [ -f $1 ]; then
        jjui -r "files($1)"
      else
        jjui "''${@}"
      fi
    '')
  ];
}
