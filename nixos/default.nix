{lib, ...}: {
  options.modules = {
    audio.enable = lib.mkEnableOption "audio (PipeWire)";
    network.enable = lib.mkEnableOption "network (NetworkManager)";
  };

  imports = [
    ./agenix.nix
    ./audio
    ./common.nix
    ./network
  ];
}
