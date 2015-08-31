" Stored in .vim/colors/jellybeans.vim
colorscheme jellybeans

" -----------------------
"        SETTINGS
" -----------------------

filetype plugin on
filetype plugin indent on

" auto-indent on
set autoindent
" fix issue where backspace wasn't working in some situations
" See http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start
" Insert spaces when the tab key is pressed.
set expandtab
"
set foldmethod=indent
set foldlevel=99999
" Turn off automatic comment insertion
set formatoptions=ql
" I added this at some point, but I'm not sure what it actually does :/
set lbr
" Enable the mouse:
set mouse=a
" no C-style indenting
set nocin
" show line numbers
set number
" <, > etc shift by 2 spaces
set shiftwidth=2
" backspace deletes whole tab
set softtabstop=2
" 1 tab = 2 spaces
set tabstop=2

" Put swp files in this directory so they don't clutter up the working
" directory and cause problems (see e.g. this issue I was having with
" Ember CLI: https://github.com/broccolijs/broccoli/issues/94)
" Remember to actually create these directories with mkdir!
set backupdir=~/.vim/_backup//
set directory=~/.vim/_temp//

" Turn on syntax highlighting
syntax on

" -----------------------
"        MAPPINGS
" -----------------------

" map vs noremap are explained here: http://stackoverflow.com/a/3776182/1603071
" Remember: `remap` is a SETTING. `map` and `noremap` are COMMANDS.

" # Normal mode mappings:

" Turn off Q so it stops fucking putting me in Ex mode!
nnoremap Q <NOP>
" Same for K.
nnoremap K <NOP>
" Increase/decrease split window height:
nnoremap _ <C-w>-
nnoremap + <C-w>+

" # Insert mode mappings:

" Exit insert mode with 'ii'
imap ii <esc>

" # <leader> mappings:
nmap     <leader>a :set wrap!<CR>
nmap     <leader>c :close<CR>
" Echo the full path of the current file:
nmap     <leader>fp :echo expand('%:p')<cr>
" Open vimrc for editing!
nnoremap <leader>ev :split $MYVIMRC<cr>
nmap     <leader>i :set autoindent!<CR>
nmap     <leader>k :set formatoptions+=cro<CR>
" Toggle show whitespace:
nmap     <leader>l :set list!<CR>
nmap     <leader>nn :new<CR>
nmap     <leader>ne :next<CR>
nmap     <leader>o :set formatoptions-=cro<CR>
nmap     <leader>rc :e ~/.vimrc<CR>
nmap     <leader>rm :! rm %<CR>
nmap     <leader>rr :e config/routes.rb<CR>
nmap     <leader>ss :split<CR>
" Reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
nmap     <leader>t :NERDTree<CR>
nmap     <leader>v :vsplit<CR>
nmap     <leader>w :w<CR>
nmap     <leader>+ 50+
nmap     <leader>_ 50_

let @c = ':w !pbcopy'
let @d = 'df"'
" Go to 80th column
let @e = '80|'
let @i = "i*ea*"
let @k = "0/Read.more.at.location/dfli  **LWWDxxxa**j0Dj"
" convert snake_case to camelCase:
let @s = 'f_x~'
let @t = ':set tabstop=2:set softtabstop=2:set shiftwidth=2'
" convert camelCase to snake_case:
let @u = '/[A-Z0-9]/i_l~'
" Remove all trailing whitespace from the current file:
let @w = ':%s /\s\+$//'
let @y = ':set tabstop=4:set softtabstop=4:set shiftwidth=4'

" -----------------------
"        PLUGINS
" -----------------------

" ------ CtrlP ------

"  - https://github.com/kien/ctrlp.vim
"  - https://kien.github.io/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Ignore certain files in CtrlP:
set wildignore+=*.swp,*.zip,*.mp3,*.ogg,*/.git/*,*.jpg,*.jpeg,*.png,*.gif,*/bin/*,*.woff,*.ttf,*.svg,*.eot,*.otf,*.ico,*/public/system*,*/tmp/*,*/doc/*,*/js_doc/*,*node_modules*
let g:ctrlp_custom_ignore = {
  \  'dir':  '\v(\.git$\|\.yardoc\|public\/system|bin$\|log$\|node_modules|bower_components)$',
  \  'file': '\v(\.so$\|\.dat$|\.DS_Store$|\.mp3$|\.ogg$|\.jpg$|\.jpeg$|\.png$|\.gif|\.woff|\.ttf|\.svg|\.eot|\.otf|\.ico|\.log$)'
  \ }

" ------ Other -------

" Activate pathogen - https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Treat `do ... end`, `if ... end" etc as brackets
" Note that matchit.vim is included in the standard vim distribution, it just
" needs to be activated by this line.
runtime macros/matchit.vim

" -----------------------
"        MISC
" -----------------------

" Highlight columns past 80 characters. From
" http://stackoverflow.com/q/2447109/1603071
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27


" if not vimdiff:
if &diff
else
  " Automatically vsplit the windows when vim opens
  autocmd VimEnter * wincmd l
  autocmd VimEnter * wincmd v
  " The above messes up the backspace key, this fixes it (dunno why):
  " (See http://stackoverflow.com/questions/9701366/)
  imap ^? ^H
end


" See http://stackoverflow.com/questions/5477565
" Note 23rd Oct 2014... I just had issues with Vietnamese characters that were
" solved by running `set termencoding=utf-8`. Don't have time now to
" investigate further, but it may be worth setting this as a global setting.
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8            " better default than latin1
  setglobal fileencoding=utf-8  " change default file encoding when writing new files
endif
