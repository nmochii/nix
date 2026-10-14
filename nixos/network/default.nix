{
  user,
  config,
  lib,
  ...
}:
lib.mkIf config.modules.network.enable {
  networking.networkmanager.enable = true;

  users.users.${user.name}.extraGroups = ["networkmanager"];
}
