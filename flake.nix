{
  inputs = {
    assets = {
      url = "github:nmochii/nix/assets?dir=assets";
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
      url = "github:sodiboo/niri-flake/32bed686f4fd8274a5e4a58d071687a74e19821e";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell/9139fd2fb1d8e381f6eb8d0f84f20d59575f0fb2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    purple = {
      url = "github:erickochen/purple/d115c9c8e9f2a6278dd55bdf8d03e81ad692ae6f";
    };
    clin = {
      url = "github:reekta92/clin-rs/3acb07932a61fbd3b1483b18891fbef61d47ef8e";
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
