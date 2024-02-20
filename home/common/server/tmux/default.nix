{pkg, ...}: {
  programs.tmux = {
    enable = true;

    shell = "${pkg.fish}";
    terminal = "xterm-kitty";
    extraConfig = ''
      set -as terminal-overrides ",xterm**:Tc"
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

      set -g set-clipboard on
    '';

    # bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "nc localhost 2224 -w0"
    # bind-key -n -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "nc localhost 2224 -w0"
    #
    # setw -g xterm-keys on
    # set -s escape-time 1                     # faster command sequences
    # set -sg repeat-time 600                   # increase repeat timeout
    # set -s focus-events on
    #
    # set -g prefix2 C-g                        # GNU-Screen compatible prefix
    # bind C-g send-prefix -2
    #
    # set -q -g status-utf8 on                  # expect UTF-8 (tmux < 2.2)
    # setw -q -g utf8 on
    #
    # set -g history-limit 5000                 # boost history
    #
    # set -s extended-keys on
    # set -as terminal-features 'xterm*:extkeys'
    #
    # # -- display -------------------------------------------------------------------
    #
    # set -g base-index 1           # start windows numbering at 1
    # setw -g pane-base-index 1     # make pane numbering consistent with windows
    #
    # setw -g automatic-rename on   # rename window to reflect current program
    # set -g renumber-windows on    # renumber windows when a window is closed
    #
    # set -g set-titles on          # set terminal title
    #
    # set -g display-panes-time 800 # slightly longer pane indicators display time
    # set -g display-time 1000      # slightly longer status messages display time
    #
    # set -g status-interval 10     # redraw status line every 10 seconds
    #
    # # clear both screen and history
    # bind -n C-l send-keys C-l \; run 'sleep 0.1' \; clear-history
    #
    # # activity
    # set -g monitor-activity on
    # set -g visual-activity off
    #
    #
    # # -- navigation ----------------------------------------------------------------
    #
    # # find session
    # bind C-f command-prompt -p find-session 'switch-client -t %%'
    #
    # # split current window horizontally
    # bind - split-window -v
    # # split current window vertically
    # bind | split-window -h
    #
    # # pane navigation
    # bind -r h select-pane -L  # move left
    # bind -r j select-pane -D  # move down
    # bind -r k select-pane -U  # move up
    # bind -r l select-pane -R  # move right
    # bind > swap-pane -D       # swap current pane with the next one
    # bind < swap-pane -U       # swap current pane with the previous one
    #
    # # pane resizing
    # bind -r H resize-pane -L 2
    # bind -r J resize-pane -D 2
    # bind -r K resize-pane -U 2
    # bind -r L resize-pane -R 2
    #
    # # window navigation
    # unbind n
    # unbind p
    # bind -r C-h previous-window # select previous window
    # bind -r C-l next-window     # select next window
    # bind Tab last-window        # move to last active window
  };
}
