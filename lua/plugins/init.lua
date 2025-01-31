return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  -- Preferred Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
      require("dashboard").setup {
        -- config
        config = {
          header = {
            "           -                  :          ",
            "         -+*=                 ++:        ",
            "       -+*++++:               ++*+:      ",
            "     -+*+++++++-              +++++=:    ",
            "   :-+++++++++++=             =++++++=:  ",
            "  -=--=++++++++=++:           =++++++++= ",
            " :=----=++++======+-          =+++++++++ ",
            "  -------+++=======+=         =++++++++= ",
            "  --------=+========+=:       =++++++++= ",
            "  ----------===========-      =+======== ",
            "  ---------: ===========-     ========== ",
            "  ---------:  -===========:   ========== ",
            "  ---------:   :===========:  ========== ",
            "  ---------:    :===========- -========= ",
            "  ---------:      -===================== ",
            "  ---------:       :==================== ",
            "  ---------:        :=================== ",
            "  -:-----:-:          -================= ",
            "  :-::::::-:           :============-==- ",
            "   :::::::::            :============-:  ",
            "     :::::::              -=========:    ",
            "       :::::               :=-====:      ",
            "         :::                :-==:        ",
            "                              :          ",
            "                                         ",
            "                                         ",
            "                                         ",
          },
        },
      }
    end,
  },
  -- Preferred Tabline
  {
    {
      "akinsho/bufferline.nvim",
      event = "VeryLazy",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        local colors = require("base46").get_theme_tb "base_30"

        require("bufferline").setup {
          options = {
            mode = "buffers", -- Show buffers instead of tabs
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            diagnostics = "nvim_lsp",
            separator_style = "slant",
            show_buffer_icons = true,
            show_close_icon = false,
            show_tab_indicators = true,
            always_show_bufferline = true,
          },
          highlights = {
            fill = {
              fg = colors.light_grey, -- Background of the bufferline
              bg = colors.black2, -- Background of the bufferline
            },
            background = {
              fg = colors.light_grey, -- Inactive buffer text
              bg = colors.black2, -- Inactive buffer background
            },
            buffer_selected = {
              fg = colors.white, -- Active buffer text
              bg = colors.black, -- Active buffer background
            },
            buffer_visible = {
              fg = colors.light_grey, -- Inactive buffer text
              bg = colors.black2, -- Inactive buffer background
            },
            separator = {
              fg = colors.black2, -- Separator color
              bg = colors.black2,
            },
            separator_selected = {
              fg = colors.black, -- Separator when buffer is active
              bg = colors.black,
            },
            close_button = {
              fg = colors.light_grey,
              bg = colors.black2,
            },
            close_button_selected = {
              fg = colors.red, -- Close button on active tab
              bg = colors.black,
            },
          },
        }
      end,
    },
  },
}
