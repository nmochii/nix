{pkgs, ...}: {
  programs.jjui = {
    enable = true;
    settings = {
      # https://github.com/idursun/jjui/blob/main/internal/config/default/config.toml
      keys.preview = {
        scroll_up = ["{"];
        scroll_down = ["}"];
        half_page_up = ["["];
        half_page_down = ["]"];
        expand = ["="];
        shrink = ["-"];
      };
      preview = {
        # add difft
        revision_command = ["show" "--color" "always" "-r" "$change_id" "--tool" "difft"];
        oplog_command = ["op" "show" "$operation_id" "--color" "always" "--tool" "difft"];
        file_command = ["diff" "--color" "always" "-r" "$change_id" "$file" "--tool" "difft"];
      };
    };
  };
  home.packages = [
    (pkgs.writeShellScriptBin "__jj_ui" ''
      if [ $# -eq 1 ] && [ -e $1 ]; then
        jjui -r "files($1)"
      elif [ $# -eq 0 ]; then
        jjui -r ".."
      else
        jjui "''${@}"
      fi
    '')
  ];
}
