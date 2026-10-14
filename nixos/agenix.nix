{inputs, user, ...}: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age.identityPaths = [
    "${user.SSoT}/secrets/personal.age.txt"
  ];
}
