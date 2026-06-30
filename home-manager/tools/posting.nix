{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.posting = {
    enable = true;
    settings = {
      theme = "textual-dark";
    };
  };
}
