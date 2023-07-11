{ pkgs ? import <nixpkgs> {}, system ? builtins.currentSystem }:

let
  devshell = import (fetchTarball "https://github.com/numtide/devshell/archive/master.tar.gz") { inherit system; };
  jdk = pkgs.jdk17_headless;


in
devshell.mkShell {
  name = "StudyBuddy Backend";

  motd = ''
    Entered the development environment.
  '';

  env = [
    {
      name = "JAVA_HOME";
      value = pkgs.jdk.home;
    }
  ];

  packages = with pkgs; [
    minikube
    jdk
    jetbrains.idea-ultimate
  ];
}
