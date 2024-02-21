{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-256color";
    historyLimit = 100000;
    mouse = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
        set -g @catppuccin_flavour 'mocha'
        '';
      } 
      {
        plugin = tmuxPlugins.sensible;
      } 
      {
        plugin = tmuxPlugins.yank;
      }
    ];

    extraConfig = ''
    set-option -g renumber-windows on
    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle 
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    bind -n M-Left previous-window
    bind -n M-Right next-window
    bind -n M-Space new-window -c "#{pane_current_path}"
    # exit from the window
    bind -n M-w kill-window

    bind '"' split-window -v -c "#{pane_current_path}" 
    bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}
