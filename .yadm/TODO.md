# dotfile TODOs

 * Clean up .vimrc (and integrate with yadm)
     * Maybe https://github.com/airblade/vim-gitgutter ?
 * Clean up tmux.conf (and integrate with yadm)
     * Fetch TPM during clone/bootstrap
     * https://github.com/tmux-plugins/tmux-prefix-highlight
     * https://github.com/tmux-plugins/tmux-sensible ?
     * Install plugins during bootstrap. e.g. https://github.com/tmux-plugins/tpm/blob/master/docs/automatic_tpm_installation.md and https://yadm.io/docs/bootstrap
 * ssh-agent support for tmux
 * bash aliases
 * change curl --> wget (in vimrc?) because some machines don't have it installed by default
 * tmux-resurrect: restore dstat (the command is actually "python[23]? dstat", not just "dstat")

## Longer-term items

 * Move to neovim?
 * Alternative keyboard layouts?
 * tmux: inherit virtualenv from parent pane/window
