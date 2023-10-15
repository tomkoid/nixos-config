{ home, pkgs, system, inputs, ... }:

{
  home.packages = [
    pkgs.efm-langserver
    pkgs.rust-analyzer
    pkgs.lua-language-server
    pkgs.gopls
    pkgs.typescript
    pkgs.nil
    pkgs.rnix-lsp
  ];
}
