{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    settings = {
      mgr.ratio = [1 2 5];
    };
  };
}
