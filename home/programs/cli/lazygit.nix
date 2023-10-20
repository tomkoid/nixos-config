{ pkgs, ... }:

{
  # lazygit config
  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = {
      git = {
        commit = {
          signOff = true;
        };
        paging = {
          colorArg = "never";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
