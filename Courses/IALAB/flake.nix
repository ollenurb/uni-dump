{
  description = "IALAB Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    utils.lib.eachDefaultSystem (
      system:
      let
        p = import nixpkgs { inherit system; };
      in
      {
        devShell = p.mkShell rec {
          packages = with p; [
            swiProlog
            clingo
            clips
          ];
          name = "IALAB";
        };
      }
    );
}
