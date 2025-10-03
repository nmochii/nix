{
  programs.helix = {
    settings.theme = "custom-night";
    themes = {
      custom-night = {
        inherits = "tokyonight";
        constructor = "orange";
        string.fg = "light-green";
        namespace = {
          fg = "blue";
          modifiers = ["bold"];
        };
        palette = {
          foreground_gutter = "#504b84";
          background = "#070718";
        };
      };
    };
  };
}
