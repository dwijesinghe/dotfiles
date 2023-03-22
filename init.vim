" Personal init.vim - largely influenced by https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84 and youtube.com/watch?v=vdn_pKJUda8

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase               " case searching
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set noexpandtab
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set nowrap

" color schemes
    if (has("termguicolors"))
    set termguicolors
    endif
    syntax enable
" open new split panes to right and below
set splitright
set splitbelow

" Personal shortcuts
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-p> :Files ~/Code/<CR>
nnoremap <leader>p :BufferLinePick<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR> nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>l :set wrap!<CR>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>cca :%bd\|e#\|bd# <CR>

" text-case shortcuts
nnoremap gau :lua require('textcase').current_word('to_upper_case')<CR>
nnoremap gal :lua require('textcase').current_word('to_lower_case')<CR>
nnoremap gas :lua require('textcase').current_word('to_snake_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dash_case')<CR>
nnoremap gan :lua require('textcase').current_word('to_constant_case')<CR>
nnoremap gad :lua require('textcase').current_word('to_dot_case')<CR>
nnoremap gaa :lua require('textcase').current_word('to_phrase_case')<CR>
nnoremap gac :lua require('textcase').current_word('to_camel_case')<CR>
nnoremap gap :lua require('textcase').current_word('to_pascal_case')<CR>
nnoremap gat :lua require('textcase').current_word('to_title_case')<CR>
nnoremap gaf :lua require('textcase').current_word('to_path_case')<CR>

nnoremap gaU :lua require('textcase').lsp_rename('to_upper_case')<CR>
nnoremap gaL :lua require('textcase').lsp_rename('to_lower_case')<CR>
nnoremap gaS :lua require('textcase').lsp_rename('to_snake_case')<CR>
nnoremap gaD :lua require('textcase').lsp_rename('to_dash_case')<CR>
nnoremap gaN :lua require('textcase').lsp_rename('to_constant_case')<CR>
nnoremap gaD :lua require('textcase').lsp_rename('to_dot_case')<CR>
nnoremap gaA :lua require('textcase').lsp_rename('to_phrase_case')<CR>
nnoremap gaC :lua require('textcase').lsp_rename('to_camel_case')<CR>
nnoremap gaP :lua require('textcase').lsp_rename('to_pascal_case')<CR>
nnoremap gaT :lua require('textcase').lsp_rename('to_title_case')<CR>
nnoremap gaF :lua require('textcase').lsp_rename('to_path_case')<CR>

nnoremap geu :lua require('textcase').operator('to_upper_case')<CR>
nnoremap gel :lua require('textcase').operator('to_lower_case')<CR>
nnoremap ges :lua require('textcase').operator('to_snake_case')<CR>
nnoremap ged :lua require('textcase').operator('to_dash_case')<CR>
nnoremap gen :lua require('textcase').operator('to_constant_case')<CR>
nnoremap ged :lua require('textcase').operator('to_dot_case')<CR>
nnoremap gea :lua require('textcase').operator('to_phrase_case')<CR>
nnoremap gec :lua require('textcase').operator('to_camel_case')<CR>
nnoremap gep :lua require('textcase').operator('to_pascal_case')<CR>
nnoremap get :lua require('textcase').operator('to_title_case')<CR>
nnoremap gef :lua require('textcase').operator('to_path_case')<CR>

" Plugin Section powered by vimplug
call plug#begin('~/.vim/plugged')
    "Colorschemes
    Plug 'dracula/vim'
    Plug 'tyrannicaltoucan/vim-deep-space'
    Plug 'glepnir/zephyr-nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'navarasu/onedark.nvim'
    " Plug 'olimorris/onedarkpro.nvim'
    " Plug 'lukas-reineke/onedark.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yazeed1s/oh-lucy.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'NTBBloodbath/doom-one.nvim'
    Plug 'projekt0n/github-nvim-theme'
    Plug 'lunarvim/Onedarker.nvim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'AlexvZyl/nordic.nvim'
    " Plug 'kyazdani42/nvim-web-devicons'
    "Utilities
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Plug 'mhinz/vim-startify'
    Plug 'goolord/alpha-nvim'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-lualine/lualine.nvim'
    " List open buffers similar to VSCode tabs
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
    " Neccessary for several plugins
    Plug 'nvim-lua/plenary.nvim'
    " Fuzzy search
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    " Language Server Protocal
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
    Plug 'onsails/lspkind.nvim' 
    " Autocompletion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Commenting plugin
    Plug 'numToStr/Comment.nvim'
    " Better copy & paste
    Plug 'vim-scripts/ReplaceWithRegister'
    " Maximize buffer
    Plug 'szw/vim-maximizer'
    "Formatting and linting
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jayp0521/mason-null-ls.nvim'
    " Notifications
    Plug 'rcarriga/nvim-notify'
    " Easy navigation with tmux
    Plug 'christoomey/vim-tmux-navigator'
    " File explorer
    Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
    Plug 'nvim-tree/nvim-tree.lua'
    " Director Switcher
    Plug 'airblade/vim-rooter'
    " Image Viewing
    Plug 'm00qek/baleia.nvim', { 'tag': 'v1.2.0' }
    Plug 'samodostal/image.nvim'
    " Diagramming
    Plug 'jbyuki/venn.nvim'
    " Switch case
    Plug 'johmsalas/text-case.nvim'
    " Songwriting
    Plug 'dwijesinghe/viMusic'
    Plug 'm00qek/baleia.nvim', { 'tag': 'v1.2.0' }
call plug#end()

" Colorscheme Config
set background=dark
set termguicolors
" Material Config
let g:material_style = "deep ocean"
" Oh-Lucy Config
let g:oh_lucy_evening_italic_functions = 0
let g:oh_lucy_italic_comments = 0

let g:startify_center = 50

:luafile ~/Code/dotfiles/config.lua

" Colorizing
let s:baleia = luaeval("require('baleia').setup { }")
command! BaleiaColorize call s:baleia.once(bufnr('%'))

