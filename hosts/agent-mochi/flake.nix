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
    youtube = {
      url = "github:Benexl/yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # dms
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
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
    youtube,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    user = import ../../users/akhe.nix;
    ui = import ./ui.nix;
  in {
    homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit
          system
          user
          ui
          nixgl
          assets
          youtube
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
        dankMaterialShell.homeModules.dank-material-shell
        dankMaterialShell.homeModules.niri
      ];
    };
  };
}
