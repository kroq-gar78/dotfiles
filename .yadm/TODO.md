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
     * ll, la
     * ackless/agless
 * set EDITOR=vim
 * change curl --> wget (in vimrc?) because some machines don't have it installed by default
 * tmux-resurrect: restore dstat (the command is actually "python[23]? dstat", not just "dstat")
     * restore `iostat`
     * restore vim tabs
 * htop settings? (do I have any?)
 * Indicate if shell is inside `ncdu` or `ranger` session (via powerline?)
 * Add [xkb-halfqwerty](https://github.com/kroq-gar78/xkb-halfqwerty) to `~/.config/xkb` somehow?
     * See here: https://askubuntu.com/questions/875163/is-it-possible-to-use-a-custom-keyboard-layout-without-sudo-access-if-so-how
 * vim: add visual feedback when creating a marker with 'm'?

## Longer-term items

 * Move to neovim?
 * Move to zsh?
    * Or at least include some good defaults
 * Alternative keyboard layouts?
 * tmux: inherit virtualenv from parent pane/window
