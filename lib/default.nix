{pkgs}: {
  mkAgeAliases = import ./mkAgeAliases.nix;
  mkToml = import ./mkToml.nix {inherit pkgs;};
}
