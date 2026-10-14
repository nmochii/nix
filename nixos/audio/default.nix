{
  user,
  config,
  lib,
  ...
}:
lib.mkIf config.modules.audio.enable {
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.${user.name}.extraGroups = ["audio"];
}
