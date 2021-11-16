{ pkgs ? import <nixpkgs> {} }:

let
  # import mach-nix
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
    ref = "refs/tags/3.3.0";
  }) {};

  overridedPython = mach-nix.mkPython {
    python = "python38";
    requirements = ''
      scikit-learn
      matplotlib
      pydotplus
      graphviz
      jupyterlab
    '';
  };
in
pkgs.mkShell {
  buildInputs = [
    overridedPython
    pkgs.graphviz
  ];
#  shellHook = ''
#    jupyter-notebook
#  '';
}
