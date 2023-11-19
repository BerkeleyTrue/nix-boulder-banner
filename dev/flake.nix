{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    boulder.url = "../";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [
        inputs.boulder.flakeModule
      ];

      perSystem = {
        pkgs,
        lib,
        config,
        ...
      }: {
        formatter = pkgs.alejandra;

        boulder.commands = [
          {
            category = "development";
            exec = pkgs.writeShellScriptBin "boulder" ''
              echo "Welcome to Boulder!"
            '';
            description = "say hello";
          }
        ];

        devShells.default = pkgs.mkShell {
          inputsFrom = [config.boulder.devShell];
        };
      };
    };
}
