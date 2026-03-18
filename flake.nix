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
    mkHome = import ./lib/mkHome.nix {
      inherit home-manager nixpkgs inputs;
    };
    mkSystem = import ./lib/mkSystem.nix {
      inherit nixpkgs inputs;
    };
  in {
    homeConfigurations = {
      "akhe@agent-mochi" = mkHome {
        hostModule = ./hosts/agent-mochi;
        system = "x86_64-linux";
        user = import ./users/akhe.nix;
      };
    };
    nixosConfigurations.virtual-mochi = mkSystem {
      hostModule = ./hosts/virtual-mochi;
      system = "x86_64-linux";
      user = import ./users/akhe.nix;
    };
  };
}
