{
  imports = [
    inputs.agenix.nixosModules.default
    ./hardware-configuration.nix
    ./configuration.nix
  ];
}
