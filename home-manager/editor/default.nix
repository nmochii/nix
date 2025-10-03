{user, ...}: {
  imports = [
    ./extras.nix
    ./${user.editor}
  ];
}
