{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.stateVersion = "25.05";

  modules = {
    editor.enable = true;
    shell.enable = true;
    terminal.enable = true;
    tools.enable = true;
    ui.enable = true;
    vcs.enable = true;
  };

  home.keyboard = {
    layout = "us";
    variant = "intl";
    options = ["ctrl:nocaps"];
  };

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  targets.genericLinux.nixGL.packages = inputs.nixgl.packages;
  targets.genericLinux.nixGL.defaultWrapper = "mesa";
  targets.genericLinux.nixGL.installScripts = ["mesa"];

  programs = {
    kitty.package = config.lib.nixGL.wrap pkgs.kitty;
    ghostty.package = config.lib.nixGL.wrap pkgs.ghostty;
    firefox.package = config.lib.nixGL.wrap pkgs.firefox;
    chromium.package = config.lib.nixGL.wrap pkgs.chromium;
    mpv.package = config.lib.nixGL.wrap pkgs.mpv;
    niri.package = config.lib.nixGL.wrap pkgs.niri;
  };
}
