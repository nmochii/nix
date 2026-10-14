{
  config,
  lib,
  ...
}:
lib.mkIf (config.modules.tools.enable && config.modules.tools.extrasEnable) {
  programs.posting = {
    enable = true;
    settings = {
      theme = "textual-dark";
    };
  };
}
