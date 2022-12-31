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
     * also add to zsh
 * set EDITOR=vim
 * change curl --> wget (in vimrc?) because some machines don't have it installed by default
 * tmux-resurrect: restore specific programs
     * restore dstat (the command is actually "python[23]? dstat", not just "dstat")
     * restore `iostat`
     * restore vim tabs. Might need to use vim-obsession, as mentioned in https://github.com/tmux-plugins/tmux-resurrect/issues/238
 * htop settings? (do I have any?)
 * Indicate if shell is inside `ncdu` or `ranger` session (via powerline?)
     * `ncdu` does not by default expose a variable that marks that we're in a session. Maybe aliasing `ncdu` to `NCDU_SESSION=1 ncdu` would work?
 * Add [xkb-halfqwerty](https://github.com/kroq-gar78/xkb-halfqwerty) to `~/.config/xkb` somehow?
     * See here: https://askubuntu.com/questions/875163/is-it-possible-to-use-a-custom-keyboard-layout-without-sudo-access-if-so-how
 * vim: add visual feedback when creating a marker with 'm'? might need to do within airline
 * vim: print the JSON key path (https://github.com/mogelbrod/vim-jsonpath)
 * ipython: import numpy & others by default
 * tmux: highlight last pane (so you know where `;` will take you)
 * vim: set filetype=jsonc for `.config/waybar/config` (look here for hints? https://github.com/jamespeapen/swayconfig.vim )

## Bugs
 * my vimrc doesn't like function return type annotations to be strings. This happens (in Hugging Face transformers) when a class's method has a return type of itself. Argument annotations are fine (roughly checked). (Maybe the bug only happens inside class methods?)

## Longer-term items

 * Move to neovim?
 * Move to zsh?
    * Or at least include some good defaults
 * Alternative keyboard layouts?
 * tmux: inherit virtualenv from parent pane/window
