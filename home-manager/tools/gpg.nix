{
  pkgs,
  user,
  ...
}:
{
  programs.gpg = {
    enable = true;
    homedir = "${user.config}/gnupg";
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
