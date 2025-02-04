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
    config = function()
      local nvimtree = require "nvim-tree"
      local colors = require("base46").get_theme_tb "base_30"

      -- Apply Base46 colors to NvimTree highlights
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = colors.blue })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = colors.blue })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = colors.cyan, bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = colors.light_grey })
      vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = colors.grey })
      vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = colors.green })
      vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = colors.orange })
      vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = colors.yellow })
      vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = colors.red })
      -- Setup NvimTree with recommended settings
      nvimtree.setup {
        renderer = {
          highlight_git = true, -- Enable Git status highlighting
          highlight_opened_files = "name", -- Highlight opened files
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
        view = {
          width = 35,
          side = "left",
        },
        git = {
          enable = true, -- Enable Git integration
        },
      }
    end,
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
      -- Apply Base46 colors to Dashboard highlights
      local colors = require("base46").get_theme_tb "base_30"
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.blue })
      vim.api.nvim_set_hl(0, "DashboardButton", { fg = colors.red, bold = true })
      vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = colors.red, bold = true })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = colors.blue })
      require("dashboard").setup {
        hide = {
          tabline = false,
        },
        -- config
        config = {
          header = {
            "                                            ",
            "                                            ",
            "          💹🔫                ️ 🔫           ",
            "         🈯️🈯️🈯️🌴              💹🍀         ",
            "       💹💹💹🤢🍀              🐍🈯️🈯️🔫     ",
            "  🎣🧩🈯️🈯️🈯️💹🈯️🔫             🦎💹🥎💹🔫   ",
            "  🎽🥶💹💹🈯️🐲💹💹🌴           🦎🈯️📒🈯️💹🍀️ ",
            "  ️🚹️🛃🎽💹💹🤢🈯️💚🍀           ️ 💹🤢💹🤮🈯️🌴",
            "🛂🛅🚹️🈯️🈯️💹🐲💹🈯️🔫          ️  🈯️💹🤢🦎💹🦎",
            "🎽️️🚹️🛃🛂🎽💹💚📗🤢💹🐲          💹💹🐲🈯️💹🦎",
            "🎽️🛂🚹️♿️🛃🎽🈯️💹💚🍀🈯️💚        ️🈯️🤢💚💹💚🌴",
            "🎽️🛃🎽🛂🚹️🎽🍏🐲🈯️💹🤢💹🥦      💹🈯️🈯️🟢🈯️🦎",
            "🎽️🚹️🛅🛃🔵🛂 💚🍀🐲💚🍀📗🦎    ️ 💚🐲💹🤢💹🌴",
            "🎽🛂♿️🈳🛅🛃   🔰💹📗🤢🈯️🍏🍀   🈯️📗🍀🈯️🐲🌴",
            "🎽🚹️🎽🔵🚹️🎽     ️🍏💚💹💚🐲💹🥦 ️💹💚💹💚💹🦎",
            "🎽🎽️🔵🛂🛃🔵     🍀📗🍀🟢💚🍀🌿🐲🍀🟢🐲🍀🍀 ",
            "🎽🎽🚹️🔵🛂🚹️️       🥬💚🐲💹📗🟢💚📗💚💹🟢💚 ",
            "🎽🔵💙🎽🔵🎽          🍏🍀💚🍀🐲💹🈯️🟢🍀📗🦎",
            "🎽💙🎽🛂🎽🎽          🥬💚📗🥬🟢🈯️💹🍀💚🟢🌴",
            "🎽🔵🚹️🔵💙🔵             🍀🟢💚🍀💹🟢📗💚🥬 ",
            "🎽🎽💙🎽🚹️🔵              💚🥬🐲💚🈯️💹🍀🪀  ",
            "  🎽🎽🔵🔵💙               🦠💚🟢💹🟢💚🥬   ",
            "      ️🧿🔵💙                 🍀💚🈯️🍀🥬     ",
            "        ️🎽🧿                  🐍�💚🟢💚     ",
            "          🎽                     🥬🍀       ",
            "                                            ",
            "                                            ",
          },
          packages = {
            enable = false,
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
            offsets = {
              {
                filetype = "NvimTree",
                text = function()
                  return vim.fn.getcwd()
                end,
                highlight = "Dashboard",
                text_align = "left",
                separator = false,
              },
            },
          },
          highlights = {
            fill = { bg = colors.black2, fg = colors.white },
            background = { fg = colors.light_grey, bg = colors.black2 },
            buffer_selected = { fg = colors.blue, bg = colors.black, bold = true },
            separator = { fg = colors.black2, bg = colors.black2 },
            separator_selected = { fg = colors.black2, bg = colors.black },
            buffer_visible = { fg = colors.white, bg = colors.black },
            close_button = { fg = colors.light_grey, bg = colors.black2 },
            close_button_selected = { fg = colors.white, bg = colors.black },
            close_button_visible = { fg = colors.light_grey, bg = colors.black2 },
            modified = { fg = colors.black, bg = colors.black2 },
            modified_selected = { fg = colors.black, bg = colors.black2 },
            modified_visible = { fg = colors.blue, bg = colors.blue },
          },
        }
      end,
    },
  },
}
