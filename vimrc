set nocompatible                "Put in VIM mode, not vi...standard vi is too old-school, even for me

"colorscheme desert
if has("gui_running")
"	colorscheme darkblue2
  set guifont=Monaco:h14.00
  "set columns=243
  "set lines=37
endif
"hi Normal guibg=#1e2021  " for some reason this isn't being set in my colorscheme...
"hi Normal guibg=white  " for some reason this isn't being set in my colorscheme...

" This is a hacked method of determining the platform we are on...
let s:platform = system("uname")
let s:on_linux = s:platform =~? "linux"
let s:on_mac   = has('macunix') || s:platform =~? 'Darwin'

"-------- Terminal setup
"set term=xterm-256color

"set t_Co=256                    "Set terminal to 256 colors

"-------- Syntax & coloring
syntax on                       "Turns on syntax highlighting...SHOULD BE AFTER 't_Co' & 'term' declarations
"colorscheme railscasts         "disabling until I get it linux-compatible
"colorscheme rubyblue


" Some of this was taken from or added to from the 'vimrc_example.vim' file
" shipped with OS X
"  Credit:
"   Maintainer:  Bram Moolenaar <Bram@vim.org>
"   Last change: 2008 Jul 02
"
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype on                     "Turns on file type detection
  filetype indent on              "Enable loading the plugin files for specific file types
  filetype plugin on              "Allow plugins to do fancy things with file-type detection
  set fileformats=unix,dos,mac    "This gives the end-of-line (<EOL>) formats that will be used/tried

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=90

  augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:>
  augroup END

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif " has("audocmd")

"-------- Folding
"set foldmethod=syntax               "Syntax highlighting items specify folds

"Not sure how I feel about these two yet
"Commenting out...probably not 'sane default' people would expect. Leaving 
"for reference...
"set foldopen=all                    "Auto-opens folds on all possible 'autocmds'
"set foldclose=all                   "Auto-closes folds on all possible autocmds

"set foldtext=getline(v:foldstart)   "Set text displayed in "foldbar" when code is folded
"set fillchars=fold:\                "Fill foldline "empty space" with...empty spaces (instead of default "-" character)
"set foldcolumn=1                    "Sets width of "foldcolumn" on left of screen used to display foldstatus indicators
"set foldlevel=9                     "Folds below 1-level. Class/Module-level definitions expanded...all others folded by default

"-------- Tabs
set softtabstop=2       "Tabs are 2-spaces...using instead of 'tabstop' as per:
                        "  'Tabs should always be displayed as mod-8 horizontal spaces so that your
                        "  code looks the same in less/more as in your editor; not everyone is going to
                        "  be using the same tab width setting as you, so using ?set sts? to get what you
                        "  want for indentation is a much better strategy and will let other people work
                        "  with your code easily, too.'
                        "   -Comment by 'Jeremy' in"  Jamis Buck's 'VIM Follow-up'
                        "    article, http://bit.ly/BRG8 

set shiftwidth=2        "Number of spaces to use for each step of (auto)indent
set expandtab           "Replace "tab" characters with the number of  spaces defined
                        " by "tabstop" (aka: "soft tabs")
set tabstop=2

set smarttab            "When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop'
                        " or 'softtabstop' is used in other places

set cindent             "Get the amount of indent for line according the C indenting rules
set cpoptions-=J        "Put 1 space character after a line ending with a "." when
                        " joining lines (with Shift-J). Without this option, 2-spaces would be retained

"-------- Window Preferences
set winminheight=0      "The minimal height of a window, when it's not the current window.
                        " Setting to zero windows will only display their
                        " associated 'status line

"-------- Searching
set hlsearch          "When there is a previous search pattern, highlight all its matches.
set ignorecase        "The case of normal letters is ignored when searching
set smartcase         "Override the 'ignorecase' option if the search pattern contains upper
                      " case characters. Essentially, this makes searches with
                      " capital letters case-sensitive. If you're going to go
                      " to all the effort of hitting both <Shift> AND a
                      " letter, your search tool better take it into
                      " consideration.

set list                      "Display unprintable characters, such as
                              " trailing spaces and tabs (Depends on
                              " "listchars" settings).
set listchars=tab:>-,trail:.  "Strings to use in 'list' mode.
                              " trail:c  Character to show for trailing spaces.  When omitted,
                              "           trailing spaces are blank. In this
                              "           case, a trailing "." will be added.
                              "           This is used to identify people who use
                              "           IDE's.
                              " tab:xy	 Two characters to be used to show a Tab.  The first
                              "           char is used once.  The second char is repeated to
                              "           fill the space that the Tab normally occupies.
                              "           "tab:>-" will show a Tab that takes four spaces as
                              "           ">---".  When omitted, a Tab is show as ^I.

"set confirm           "Always confirms before performing an operation which
                      " may produce undesireable consequences (...within reason).
                      " An example would be saving a file before exiting with
                      " a ":q"


set vb                "Use visual bell instead of beeping when errors/messages
                      " occur. If _no_ bells or visual feedback you can
                      " replace this setting with:
                      "   :set vb t_vb=

"-------- Misc
set scrolloff=3                 "Put 3-lines of padding when scrolling up/down off screen to give context

if has('mouse')
  set mouse=a                     "Enables the use of the mouse...even in the terminal
endif

set ruler                       "Displays line number, column number, and %-location of
                                " cursor in file (on bottom of screen)

set number                      "Displays line numbers on the sidebar

set showmatch                   "When a bracket is inserted, briefly jump to the matching one.
set matchtime=1                 "Tenths of a second to show the matching paren, when 'showmatch' is set
set backspace=indent,eol,start  "Allows backspacing over autoindents and line breaks, allows deletion from before the point
                                " where the current insertion began

set cursorline                  "Highlights the line the cursor is currently on.
"set cursorcolumn                "Highlights the column the cursor is currently in. (Sometimes) Useful when checking
                                " indentation. Here mostly for personal reference

set hidden " I hate those stupid E37 errors when trying to switch from modified buffers

" For omnicompletion http://vim.wikia.com/wiki/Omni_completion
set ofu=syntaxcomplete#Complete

"-------- Mappings
"Set the map leader...this is the default character, just put it in here
" to be explicit. Mappings which include "<leader>" would start with this
" charachter. For example. "map <leader>f <some_command>" would create a mapping for
" \-f (backslash-f) to '<some_command>'
let mapleader=','
let maplocalleader='\'


" Allow for quicker management of windows
" close current split
" map <C-C> <C-W>c

" swap splits
" map <C-X> <C-W>x

" focus current split (close all other splits)
" map <C-O> <C-W>o

" close current buffer but leave window open with another open buffer
map <leader>cb :b # <BAR> bd #<CR>
"Hide the highlighted search results with "?"
"noremap ? :nohlsearch<CR>

"Set up TextMate-like cmd-T file searching using <leader>-f ('backslash'-f)
noremap <leader>f :FuzzyFinderTextMate<CR>
map <leader>r :ruby finder.rescan!<CR>
let g:fuzzy_matching_limit = 20
let g:fuzzy_ceiling = 20000
 
" FuzzyFinder Buffer
map ,b :FuzzyFinderBuffer<CR>


"Toggle NERDTree window using F3 key
noremap <F3> :NERDTreeToggle<CR>
noremap <Leader>nt :NERDTreeToggle<CR>


"-------- FuzzyFinderTextmate plugin settings
"Limit the number of matches returned to 50 in FuzzyFinder searches
let g:fuzzy_matching_limit='50'

"Ignore the following glob file patters in FuzzyFinder searches
let g:fuzzy_ignore='*.log, data/*, data_test/*, data_test/**'

" If we are in a Rails app, just search across the app, lib, config, spec, and test
" directories
if filereadable(expand('./vendor'))
  let g:fuzzy_roots=['app', 'lib', 'config', 'spec', 'test', 'features']
endif


"-------- Tag List bindings ---------------------------------
map <Leader>tl :TlistToggle<CR>
map <Leader>th :TlistHighlight<CR>
map <Leader>td :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <Leader>tf :!ctags %<CR>

map <Leader>rc :execute ":.,$s/".escape(@-,'[]/\.*')."/".escape(@.,'[]/\.*')."/c"<CR>



"-------- Most Recently Used File (MRU) plugin mapping & config
"Open Most Recently Used window with Ctl+o
"noremap <C-o> :MRU<CR>

"Set max entries in MRU option window
let MRU_Max_Entries = 30

"Gist (http://gist.github.com) integration
" Gist plugin options. Be sure to add a 'github'
" section to your global .gitconfig file.
" Example of .gitconfig section:
" [github]
"   user = <your username>
"   token = <your account token>
" Set up clipboard to use OS X's 'pbcopy' command
if s:on_mac
  let g:gist_clip_command = 'pbcopy'
elseif s:on_linux
  let g:gist_clip_command = 'xclip -selection clipboard'
endif


"-------- Tab mappings
"Close tabs with tc
noremap tc :tabclose<CR>

"Create new tab with Ctl+t
noremap tt :tabnew<CR>


"-------- Autocommands
autocmd! BufWritePost .vimrc source %

"-------- Abbreviations
"Some lorem ispum text
abbreviate lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum bibendum hendrerit ante. Phasellus vitae enim id erat fringilla fermentum.  Pellentesque tellus. Cras eros magna, pretium ac, tincidunt id, tincidunt eget, mi. Fusce tristique sollicitudin eros. Nam augue nisi, volutpat non, cursus a, aliquam ac, magna. Sed rhoncus, ipsum vitae semper ultrices, ante nunc faucibus nunc, sed iaculis elit metus condimentum turpis. Suspendisse suscipit. Nulla eget nulla. Aliquam varius sem quis tortor. Proin eu dolor a lacus lobortis luctus. Phasellus interdum. Maecenas quis sem. Nulla facilisi.

"Typing 'hh' will give you a '=>'
abbreviate hh =>
imap <C-l> <Space>=><Space>

" RSpec and Ruby abbreviations...
iabbrev it,, it "should" do<CR>end<UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
iabbrev des,, describe "" do<CR><CR>end<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><BS>
iabbrev giv,, # given<CR><LEFT><BS><LEFT>
iabbrev exp,, # expect<CR><LEFT><BS><LEFT>
iabbrev the,, # then<CR><LEFT><BS><LEFT>
iabbrev whe,, # when<CR><LEFT><BS><LEFT>
iabbrev dbg require 'ruby-debug'; Debugger.start; debugger; 5+5


" shortcuts to rails.vim alternate-file commands
map <leader>ae :A<CR>
map <leader>av :AV<CR>
map <leader>as :AS<CR>

map <leader>ev :e ~/.vimrc<CR>


" Compile and view latex document
map <leader>lp ,ll<CR>,lv<CR>

" Move up and down lines regardless of formatting (move within line wraps)
nnoremap j gj
nnoremap k gk

" Allow for moving between windows using <CTRL>+normal vim movement keys (h j k l)
"Switch to the next "higher" windows with <C-K>
"noremap <C-J> <C-W>j<C-W>_   " These don't work for me.. the ones below work.
"Switch to the next "higher" windows with <C-J>
"noremap <C-K> <C-W>k<C-W>_

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l


" http://blog.ant0ine.com/2007/03/ack_and_vim_integration.html
" use :cc, :cp, :cn to navigate to the results
set grepprg=ack
map <leader>a :Ack 

" Set viewers for latex formats
" let g:Tex_ViewRule_dvi    'xdvi'
" let g:Tex_ViewRule_ps     'ghostview'
if s:on_mac
  let Tex_ViewRuleComplete_pdf = '/usr/bin/open -a Preview $*.pdf' 
end

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


function! s:ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction

map <leader>s :call <SID>ToggleScratch()<CR>

" delete all buffers
map bda :bufdo bd<CR>
" delete all trailing whitespace
map <leader>dw :%s/\s\+$//e<CR>

" blame
vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

"-------- Local Overrides
"If you have options you'd like to override locally for
"some reason (don't want to store something in a
"publicly-accessible repository, machine-specific settings, etc.),
"you can create a '.local_vimrc' file in your home directory
"(ie: ~/.local_vimrc) and it will be 'sourced' here and override
"any settings in this file.
"
"NOTE: YOU MAY NOT WANT TO ADD ANY LINES BELOW THIS
if filereadable(expand('~/.local_vimrc'))
  source ~/.local_vimrc
end

" clojure auto-complete
au Bufenter,Bufnewfile *.clj setl complete+=k~/.clj_completions

let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1

let clj_want_gorilla = 1
let vimclojure#NailgunClient = "/Users/bmabey/p/clojure/vimclojure/ng"
