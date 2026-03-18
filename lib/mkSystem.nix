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
    inherit user;
  };
  modules =
    [
      hostModule
      ({pkgs, ...}: let
        shellPkgs = {
          fish = pkgs.fish;
          nu = pkgs.nushell;
          bash = pkgs.bash;
        };
      in {
        users.users = {
          root.initialPassword = nixpkgs.lib.mkDefault "root";
          "${user.name}" = {
            initialPassword = user.name;
            isNormalUser = true;
            description = user.fullName;
            extraGroups = ["wheel"];
            shell = shellPkgs.${user.shell or "bash"};
          };
        };

        time.timeZone = "Europe/Paris";
        i18n = {
          defaultLocale = "en_US.UTF-8";
          extraLocaleSettings = {
            LC_ADDRESS = "fr_FR.UTF-8";
            LC_IDENTIFICATION = "fr_FR.UTF-8";
            LC_MEASUREMENT = "fr_FR.UTF-8";
            LC_MONETARY = "fr_FR.UTF-8";
            LC_NAME = "fr_FR.UTF-8";
            LC_NUMERIC = "fr_FR.UTF-8";
            LC_PAPER = "fr_FR.UTF-8";
            LC_TELEPHONE = "fr_FR.UTF-8";
            LC_TIME = "fr_FR.UTF-8";
          };
        };

        nix.settings = {
          experimental-features = ["nix-command" "flakes"];
        };
      })
    ]
    ++ (
      let
        homeConf = "${hostModule}/home.nix";
        uiConf = "${hostModule}/ui.nix";
      in
        if builtins.pathExists homeConf
        then [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.verbose = true;
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.${user.name} = {
              home.sessionVariables = {
                EDITOR = user.editor;
              };

              imports = [
                ../home-manager
                homeConf
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit user;
              ui =
                if builtins.pathExists uiConf
                then import uiConf
                else {};
            };
          }
        ]
        else []
    );
}
