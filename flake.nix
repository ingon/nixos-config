{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    opvaultfx.url = "github:ingon/opvaultfx/master";
    connet.url = "github:connet-dev/connet";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, opvaultfx, connet, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      overlay-unstable = final: prev: {
        unstable = pkgs-unstable;
        opvaultfx = opvaultfx.packages.${system}.default;
      };
    in
    {
      formatter.x86_64-linux = pkgs.nixpkgs-fmt;
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          connet.packages."x86_64-linux".default
        ];
      };
      nixosConfigurations = {
        fw = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
            nixos-hardware.nixosModules.framework-11th-gen-intel
            ./hosts/fw/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.niki = import ./hosts/fw/home-niki.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
            connet.nixosModules.default
          ];
        };
      };
    };
}
