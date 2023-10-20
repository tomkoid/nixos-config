{ pkgs, ... }:

{
  # lazygit config
  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = {
      overrideGpg = true;
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
