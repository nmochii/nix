rec {
  description = "Home Manager configuration of akhe";

  inputs = {
    assets = {
      url = "path:/home/akhe/work/akhe/nix/assets";
      flake = false;
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    {
      agenix,
      home-manager,
      assets,
      nixgl,
      nixpkgs,
      ...
    }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      user = import ../../users/akhe.nix;
      ui = import ./ui.nix;
    in
    {
      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit
            user
            ui
            nixgl
            assets
            ;
        };

        modules = [
          ./age.nix
          agenix.homeManagerModules.default
          ../../home-manager/editor
          ../../home-manager/extras/olfeo
          ../../home-manager/shell
          ../../home-manager/terminal
          ../../home-manager/tools
          ../../home-manager/ui
          ../../home-manager/vcs
          ./home.nix
        ];
      };
    };
}
