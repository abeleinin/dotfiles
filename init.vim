:set number
:set nowrap 
:set smarttab
:set noerrorbells
:set vb t_vb=
:set expandtab
:set shiftwidth=2
:set incsearch
:set tabstop=2
:set backspace=indent,eol,start
let mapleader=","

call plug#begin()

Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'wlangstroth/vim-racket'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-orgmode/orgmode'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'abeleinin/papyrus'

call plug#end()

if has("autocmd")
	autocmd filetypedetect BufReadPost *.rkt,*.rktl,*.rktd set filetype=scheme
  autocmd filetypedetect BufReadPost *.md,*.tex set wrap linebreak | set spell spelllang=en_us 
endif

if has('termguicolors')
	set termguicolors
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = ['coc-python', 'coc-tsserver', 'coc-json']
let g:coc_node_path = '/usr/local/bin/node'

let g:papyrus_template = 'lecture'
let g:papyrus_viewer = 'zathura'
let g:papyrus_latex_engine = 'xelatex'
map <leader>vc :PapyrusCompile<CR>
map <leader>va :PapyrusAutoCompile<CR>
map <leader>vo :PapyrusView<CR>
map <leader>vs :PapyrusStart<CR>

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_zathura_sync_method = 'synctex'
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'
autocmd FileType tex VimtexCompile

map <leader>n :NERDTree %<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>

let g:lightline = {
      \ 'colorscheme': 'material',
      \ }

let g:AutoPairs = {'(':')', '[':']', '{':'}' ,'"':'"', '```':'```', '"""':'"""', "'''":"'''"}
let g:material_terminal_italics = 1
let g:material_theme_style = 'default-community'
colorscheme material 

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

