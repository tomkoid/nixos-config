{ home, pkgs, inputs, system, ... }:

let
  unstable = import inputs.unstable {
    inherit system;
  };
in
{
  home.packages = [
    unstable.bun
    unstable.go
  ];
}
