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
    pkgs.nodePackages_latest.typescript
    pkgs.nodePackages_latest.typescript-language-server
    pkgs.nodePackages_latest.svelte-language-server
    pkgs.nodePackages_latest.eslint
    pkgs.vscode-extensions.dbaeumer.vscode-eslint
    unstable.vscode-langservers-extracted
    pkgs.nodePackages_latest.prettier
    unstable.nil
    unstable.nixpkgs-fmt
    pkgs.rnix-lsp
    unstable.nixd
  ];
}
