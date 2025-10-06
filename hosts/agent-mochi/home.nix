{
  config,
  pkgs,
  nixgl,
  user,
  ...
}: {
  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = "25.05"; # do not touch

  home.keyboard = {
    layout = "us";
    variant = "intl";
    options = ["ctrl:swapcaps"];
  };

  home.sessionVariables = {
    EDITOR = user.editor;
    PAGER = user.pager;
  };

  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  home.shellAliases = {
    hms = "home-manager switch";
  };

  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = ["mesa"];

  programs = {
    kitty.package = config.lib.nixGL.wrap pkgs.kitty;
    ghostty.package = config.lib.nixGL.wrap pkgs.ghostty;
    firefox.package = config.lib.nixGL.wrap pkgs.firefox;
    chromium.package = config.lib.nixGL.wrap pkgs.chromium;
  };
}
