{
  config,
  lib,
  pkgs,
  ...
}: let
  bookmark-pattern = "regex:'^\\[[^]]+\\] ?'";
in
  lib.mkIf config.modules.vcs.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "__jj_prompt" ''
        jj log -r "current & (bookmarks() | @)" --ignore-working-copy --no-graph -T "
          separate(' < ',
            if (current_working_copy, truncate_end(10, description.first_line().replace(${bookmark-pattern}, ${"''"}), '…')),
            bookmarks.map(|b| truncate_end(10, b.name(), '…')).join(' '),
          ) ++ ' '
        "
      '')
      (pkgs.writeShellScriptBin "__jj_tug" ''
        bookmarks=$(jj bookmark list -r current | cut -d: -f1 | grep -v @)
        for bookmark in $bookmarks; do
          jj bookmark move --ignore-working-copy --from "$bookmark" --to "heads(bookmarks('$bookmark')::roots(merge- | @-))" 2> /dev/null
        done
      '')
    ];
  }
