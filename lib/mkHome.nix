{
  nixpkgs,
  home-manager,
  inputs,
}: {
  hostModule,
  system,
  user,
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  extraSpecialArgs = let
    uiConf = "${hostModule}/ui.nix";
  in {
    inherit inputs system user;
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
