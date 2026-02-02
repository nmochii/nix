{
  config,
  lib,
  pkgs,
  user,
  ...
}:
lib.mkIf config.modules.tools.enable {
  programs.gpg = {
    enable = true;
    homedir = "${user.SSoT}/gnupg";
    settings = {
      keyserver = "keys.openpgp.org";
    };
  };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600 * 2;
    maxCacheTtl = 3600 * 8;
    pinentry.package = pkgs.pinentry-curses;
  };
}
