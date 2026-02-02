{
  config,
  lib,
  ...
}: {
  imports = [
    ./settings.nix
    ./aliases.nix
    ./scripts.nix
  ];

  config = lib.mkIf config.modules.vcs.enable {
    programs.jujutsu.enable = true;
  };
}
