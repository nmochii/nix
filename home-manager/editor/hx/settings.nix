{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.editor.enable {
  programs.helix.settings = {
    editor = {
      line-number = "relative";
      completion-trigger-len = 1;
      completion-replace = false;
      continue-comments = false;
      auto-info = true;
      auto-completion = true;
      auto-format = true;
      soft-wrap.enable = true;
      end-of-line-diagnostics = "warning";
      inline-diagnostics = {
        cursor-line = "hint";
        max-diagnostics = 1;
      };
      lsp = {
        display-messages = true;
        auto-signature-help = true;
        display-inlay-hints = false;
        display-signature-help-docs = true;
        snippets = true;
      };
      cursorline = true;
      cursorcolumn = true;
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      whitespace.characters = {
        newline = "$";
      };
      whitespace.render = {
        tab = "all";
        newline = "all";
      };
      indent-guides.render = true;
    };
  };
}
