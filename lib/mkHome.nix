{
  nixpkgs,
  home-manager,
  inputs,
}: {
  hostModule,
  system,
  user,
}:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;
  extraSpecialArgs = let
    uiConf = "${hostModule}/ui.nix";
  in {
    inherit inputs system user;
    mylib = import ../lib {inherit pkgs;};
    ui =
      if builtins.pathExists uiConf
      then import uiConf
      else {};
  };
  modules = [
    {
      home.username = user.name;
      home.homeDirectory = "/home/${user.name}";

      home.sessionVariables = {
        EDITOR = user.editor;
      };

      programs.home-manager.enable = true;

      home.shellAliases = {
        hms = "home-manager switch";
      };
    }
    ../home-manager
    hostModule
  ];
}
