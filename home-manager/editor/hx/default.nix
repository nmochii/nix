{
  config,
  lib,
  ...
}: {
  imports = [
    ./languages.nix
    ./keybinds.nix
    ./settings.nix
    ./theme.nix
  ];

  config = lib.mkIf config.modules.editor.enable {
    programs.helix.enable = true;
  };
}
