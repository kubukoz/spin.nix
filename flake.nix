{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.gitignore-source.url = "github:hercules-ci/gitignore.nix";
  inputs.gitignore-source.inputs.nixpkgs.follows = "nixpkgs";
  inputs.spin.url = "github:spinnaker/spin/v1.22.0";
  inputs.spin.flake = false;

  outputs = { self, nixpkgs, flake-utils, spin, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        defaultPackage = pkgs.callPackage ./derivation.nix {
          inherit (inputs) gitignore-source;
          sources = spin;
        };
        checks = {
          defaultPackageBuild = self.defaultPackage.${system};
        };
      }
    );
}
