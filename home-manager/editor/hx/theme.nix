{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.editor.enable {
  programs.helix = {
    settings.theme = "custom";
    themes = {
      custom = {
        inherits = "carbon";
        # constructor = "orange";
        # string.fg = "light-green";
        # namespace = {
        #   fg = "blue";
        #   modifiers = ["bold"];
        # };
        palette = {
          #   foreground_gutter = "#504b84";
          background = "#070718";
        };
      };
    };
  };
}
