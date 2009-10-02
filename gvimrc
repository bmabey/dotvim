"colorscheme railscasts

set guioptions-=T     "Hide the toolbar

" set window size
set lines=50
set columns=150

"-------- Local Overrides
"If you have options you'd like to override locally for
"some reason (don't want to store something in a
"publicly-accessible repository, machine-specific settings, etc.),
"you can create a '.local_gvimrc' file in your home directory
"(ie: ~/.local_gvimrc) and it will be 'sourced' here and override
"any settings in this file.
"
"NOTE: YOU MAY NOT WANT TO ADD ANY LINES BELOW THIS
if filereadable(expand('~/.local_gvimrc'))
  source ~/.local_gvimrc
end
