{ home, pkgs, system, inputs, ... }:

let
  unstable = import inputs.unstable {
    inherit system;
  };
in
{
  home.packages = [
    pkgs.efm-langserver
    pkgs.rust-analyzer
    pkgs.lua-language-server
    pkgs.gopls
    pkgs.typescript
    unstable.nil
    pkgs.rnix-lsp
    unstable.nixd
  ];
}
