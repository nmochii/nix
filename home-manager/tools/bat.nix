{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
    };
  };
}
