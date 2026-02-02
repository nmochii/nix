{
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
    oyo = {
      url = "github:ahkohd/oyo";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    mkHome = {
      hostModule,
      user,
      system ? "x86_64-linux",
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
          ./home-manager
          hostModule
        ];
      };
  in {
    homeConfigurations = {
      "akhe@agent-mochi" = mkHome {
        hostModule = ./hosts/agent-mochi;
        user = import ./users/akhe.nix;
      };
    };
  };
}
