{inputs, ...}: {
  imports = [
    inputs.agenix.homeManagerModules.default
    inputs.niri.homeModules.niri
    inputs.dankMaterialShell.homeModules.dank-material-shell
    inputs.dankMaterialShell.homeModules.niri
    ./age.nix
    ./home.nix
    ../../home-manager/extras/olfeo
  ];
}
