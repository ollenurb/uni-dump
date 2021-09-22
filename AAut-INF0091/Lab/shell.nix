{ pkgs ? import <nixpkgs> {} }:

let
  mach-nix = import (
    builtins.fetchGit {
      url = "https://github.com/DavHau/mach-nix/";
      ref = "2.0.0";
    }
  );

  overridedPython = mach-nix.mkPython {
    python = pkgs.python38;
    requirements = ''
      scikit-learn
      matplotlib
      pydotplus
      graphviz
    '';
  };
in
pkgs.mkShell {
  buildInputs = [
    overridedPython
    pkgs.graphviz
  ];
}
