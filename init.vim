" Personal init.vim - largely influenced by https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84 and youtube.com/watch?v=vdn_pKJUda8

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase               " case searching
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
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
nnoremap <C-n> :NvimTreeToggle ~/Code/<CR>
nnoremap <C-p> :Files ~/Code/<CR>
nnoremap <leader>p :BufferLinePick<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR> nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>l :set wrap!<CR>
nnoremap <leader>/ :noh<CR>

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
    " Plug 'kyazdani42/nvim-web-devicons'
    "Utilities
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'mhinz/vim-startify'
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
call plug#end()

" Colorscheme Config
set background=dark
set termguicolors
" Material Config
let g:material_style = "deep ocean"
" Oh-Lucy Config
let g:oh_lucy_evening_italic_functions = 0
let g:oh_lucy_italic_comments = 0

" vim-startify Config
let g:startify_custom_header = startify#pad(split(system('figlet -w 100 VIM2020'), '\n'))
let g:startify_custom_header = startify#center([
            \ '                    ______                   ',
            \ '                   /     /\                  ',
            \ '                  /     /##\                 ',
            \ '                 /     /####\                ',
            \ '                /     /######\               ',
            \ '               /     /########\              ',
            \ '              /     /##########\             ',
            \ '             /     /#####/\#####\            ',
            \ '            /     /#####/++\#####\           ',
            \ '           /     /#####/++++\#####\          ',
            \ '          /     /#####/\+++++\#####\         ',
            \ '         /     /#####/  \+++++\#####\        ',
            \ '        /     /#####/    \+++++\#####\       ',
            \ '       /     /#####/      \+++++\#####\      ',
            \ '      /     /#####/        \+++++\#####\     ',
            \ '     /     /#####/__________\+++++\#####\    ',
            \ '    /                        \+++++\#####\   ',
            \ '   /__________________________\+++++\####/   ',
            \ '   \+++++++++++++++++++++++++++++++++\##/    ',
            \ '    \+++++++++++++++++++++++++++++++++\/     ',
            \ '     ``````````````````````````````````      ',
            \ ' __   _ _______  _____  _    _ _____ _______ ',
            \ ' | \  | |______ |     |  \  /    |   |  |  | ',
            \ ' |  \_| |______ |_____|   \/   __|__ |  |  | ',
            \ ])

let g:startify_custom_header = startify#center([
            \ '                                                     ', 
            \ '        🟩                                  🟩        ', 
            \ '      🟩🟩🟩                                🟩🟩      ', 
            \ '    🟩🟩🟩🟩🟩                              🟩🟩🟩    ', 
            \ '  🟩🟩🟩🟩🟩🟩🟩                            🟩🟩🟩🟩  ', 
            \ '🟦🟦🟩🟩🟩🟩🟩🟩🟩                          🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟩🟩🟩🟩🟩🟩🟩                        🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟩🟩🟩🟩🟩🟩🟩                      🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦🟩🟩🟩🟩🟩🟩🟩                    🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦  🟩🟩🟩🟩🟩🟩🟩                  🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦    🟩🟩🟩🟩🟩🟩🟩                🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦      🟩🟩🟩🟩🟩🟩🟩              🟩🟩🟩🟩🟩',  
            \ '🟦🟦🟦🟦🟦        🟩🟩🟩🟩🟩🟩🟩            🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦          🟩🟩🟩🟩🟩🟩🟩          🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦            🟩🟩🟩🟩🟩🟩🟩        🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦              🟩🟩🟩🟩🟩🟩🟩      🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦                🟩🟩🟩🟩🟩🟩🟩    🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦                  🟩🟩🟩🟩🟩🟩🟩  🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦                    🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦                      🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦                        🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩', 
            \ '🟦🟦🟦🟦🟦                          🟩🟩🟩🟩🟩🟩🟩🟩🟩', 
            \ '  🟦🟦🟦🟦                            🟩🟩🟩🟩🟩🟩🟩  ',   
            \ '    🟦🟦🟦                              🟩🟩🟩🟩🟩    ', 
            \ '      🟦🟦                                🟩🟩🟩      ', 
            \ '        🟦                                  🟩        ', 
            \ '                                                      ', 
            \ '                                                      ', 
            \ '       __   _ _______  _____  _    _ _____ _______    ',
            \ '       | \  | |______ |     |  \  /    |   |  |  |    ',
            \ '       |  \_| |______ |_____|   \/   __|__ |  |  |    ',
            \ ])
let g:startify_lists = [
            \ { 'type': 'files', 'header': startify#center(['Recent Files'])},
            \ ]
let g:startify_center = 50

lua << END

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('lualine').setup {
    -- disable netrw at the very start of your init.lua (strongly advised)
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
        },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require('material').setup({
    lualine_style = 'stealth'
})

require('bufferline').setup({
    options = {
        separator_style = "thin",
        -- offsets = {
        --     {
        --         filetype = "NvimTree",
        --         text = "Explorer",
        --         highlight = "Directory",
        --         separator = true -- use a "true" to enable the default, or set your own character
        --     }
        -- },
        -- enforce_regular_tabs = false,
        -- truncate_names = false
    },
    highlights = {
        buffer_selected = {
            italic = false
        }
    },
})

-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()

require("catppuccin").setup({
    flavour = "mocha" -- latte, frappe, macchiato, mocha
})

--LSP Setup
--Set up lspconfig
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require('lspconfig')['pyright'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local saga = require'lspsaga'

saga.init_lsp_saga({
  -- keybinds for navigation in lspsaga window
  move_in_saga = { prev = "<C-k>", next = "<C-j>" },
  -- use enter to open file with finder
  finder_action_keys = {
    open = "<CR>",
  },
  -- use enter to open file with definition preview
  definition_action_keys = {
    edit = "<CR>",
  },
})

-- disable virtual_text (inline) diagnostics and use floating window
-- format the message such that it shows source, message and
-- the error code. Show the message with <space>e
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = {
		border = "single",
		format = function(diagnostic)
			return string.format(
				"%s (%s) [%s]",
				diagnostic.message,
				diagnostic.source,
				diagnostic.code or diagnostic.user_data.lsp.code
			)
		end,
	},
})

-- Set up nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    }
})

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
  })
    })
    

require('Comment').setup()

require('mason').setup()

require('mason-lspconfig').setup({
  -- list of servers for mason to install
  ensure_installed = {
      "pyright",
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "sumneko_lua",
      "emmet_ls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

require('mason-null-ls').setup({
    ensure_installed = {
        "black",
        "flake8",
        "isort",
        "mypy"
    }
})

require('nvim-tree').setup({
  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "〉", -- arrow when folder is closed
          arrow_open = "﹀", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  view = {
    width = 35,
  },
})

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({

    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.mypy,
    },
    -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})

require("nvim-treesitter.configs").setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "python",
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
  },
  -- auto install above language parsers
  auto_install = true,
})

vim.notify = require("notify")
vim.opt.clipboard:append("unnamedplus")
vim.cmd('colorscheme onedarker')

END

