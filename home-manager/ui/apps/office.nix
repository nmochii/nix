{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.modules.ui.enable {
  home.packages = with pkgs; [
    libreoffice-qt
  ];
}
