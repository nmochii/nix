{
  config,
  lib,
  ...
}:
lib.mkIf (config.modules.tools.enable && config.modules.tools.extrasEnable) {
  programs.eilmeldung.enable = true;
  home.shellAliases = {
    rss = "eilmeldung";
  };
}
