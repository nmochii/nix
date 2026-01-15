{pkgs, ...}: {
  imports = [
    ../apps/chromium.nix
    ../apps/wl-clipboard.nix
    ../apps/firefox.nix
    ../apps/mpv.nix
    ./dms.nix
    ./keybinds.nix
    ./prefs.nix
  ];

  home.packages = [
    pkgs.xwayland-satellite
  ];
  programs.niri.enable = true;
}
