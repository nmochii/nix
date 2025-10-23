{
  description = "Home Manager configuration";

  inputs = {
    assets = {
      url = "github:nmochii/nix?dir=assets";
      flake = false;
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    agenix.url = "github:ryantm/agenix";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
    };
  };

  outputs = {
    assets,
    nixpkgs,
    home-manager,
    nixgl,
    agenix,
    niri,
    dankMaterialShell,
    ...
  }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    user = import ../../users/akhe.nix;
    ui = import ./ui.nix;
  in {
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
        niri.homeModules.niri
        dankMaterialShell.homeModules.dankMaterialShell.default
        dankMaterialShell.homeModules.dankMaterialShell.niri
      ];
    };
  };
}
