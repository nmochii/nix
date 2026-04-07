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
        bookmarks=$(jj bookmark list -r current | cut -d: -f1 | grep -Ev '@|main|master')
        for bookmark in $bookmarks; do
          jj bookmark move --ignore-working-copy --from "$bookmark" --to "latest(bookmarks('$bookmark')::@ ~ blacklist)" 2> /dev/null
        done
      '')
      (pkgs.writeShellScriptBin "__jj_branch" ''
        jj new --insert-after 'trunk()' --insert-before merge --no-edit "$@"
      '')
      (pkgs.writeShellScriptBin "__jj_pre_commit" ''
        which pre-commit || exit 1
        jj new \
          && pre-commit run --files $(jj diff -r "trunk()::@" --name-only --no-pager --ignore-working-copy) \
          && jj edit @- --ignore-working-copy \
          || jj desc -m "pre-commit"
      '')
    ];
  }
