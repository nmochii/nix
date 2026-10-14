{
  nixpkgs,
  inputs,
}: {
  hostModule,
  system,
  user,
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs user;
  };
  modules =
    [
      ../nixos
      hostModule
    ]
    ++ (
      let
        homeConf = "${hostModule}/home.nix";
        uiConf = "${hostModule}/ui.nix";
      in
        if builtins.pathExists homeConf
        then [
          inputs.home-manager.nixosModules.home-manager
          ({pkgs, ...}: {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {
              inherit inputs system user;
              mylib = import ../lib {inherit pkgs;};
              ui =
                if builtins.pathExists uiConf
                then import uiConf
                else {};
            };
            home-manager.users.${user.name} = {
              home.sessionVariables = {
                EDITOR = user.editor;
              };

              imports = [
                inputs.agenix.homeManagerModules.default
                ../home-manager
                homeConf
              ];
            };
          })
        ]
        else []
    );
}
