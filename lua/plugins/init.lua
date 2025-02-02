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
            "                                             ",
            "                                             ",
            "          💹🔫                ️🔫             ",
            "         🈯️🈯️🈯️🌴              💹🍀          ",
            "       💹💹💹🤢🍀              🐍🈯️🈯️🔫      ",
            "  🎣🧩🈯️🈯️🈯️💹🈯️🔫             ⛳️💹🥎💹🔫    ",
            "  🎽🥶💹🥗🈯️🐲💹💹🌴             🈯️📒🈯️💹🍀️  ",
            "  ️🚹️🛃🎽💹💹🤢🈯️💚🍀           ️💹🤢💹🤮🈯️🌴  ",
            "🛂🛅🚹️🈯️🈯️💹🐲💹🈯️🔫          ️💚🈯️💹🤢🦎💹🦎 ",
            "🎽️️🚹️🛃🛂🎽💹💚📗🤢💹🐲          💹💹🐲🈯️💹🦎 ",
            "🎽️🛂🚹️♿️🛃🌌🈯️💹💚🍀🈯️💚         ️🈯️🤢💚💹💚🌴",
            "🎽️🛃🎽🛂🚹️🎽🍏🐲🈯️💹🤢💹🥦      💹🈯️🈯️🟢🈯️🦎 ",
            "🎽️🚹️🛅🛃🔵🛂 💚🍀🐲💚🍀📗🦎    ️💚🐲💹🤢💹💹  ",
            "🎽🛂♿️🈳🛅🛃   🔰💹📗🤢🈯️🍏🍀   🈯️📗🍀🈯️🐲🌴 ",
            "🎽🚹️🎽🔵🚹️🎽     ️🍏💚💹💚🐲💹🥦 ️💹💚💹💚💹🦎 ",
            "🎽🎽️🔵🛂🛃🔵     🍀📗🍀🟢💚🍀🌿🐲🍀🟢🐲🍀🍀  ",
            "🎽🎽🚹️🔵🛂🚹️️       🥬💚🐲💹📗🟢💚📗💚💹🟢💚  ",
            "🎽🔵💙🎽🔵🎽          🍏🍀💚🍀🐲💹🈯️🟢🍀📗🦎 ",
            "🎽💙🎽🛂🎽🎽          🥬💚📗🥬🟢🈯️💹🍀💚🟢🌴 ",
            "🎽🔵🚹️🔵💙🔵             🍀🟢💚🍀💹🟢📗💚🥬  ",
            "🎽🎽💙🎽🚹️🔵              💚🥬🐲💚🈯️💹🍀🪀   ",
            "  🎽🎽🔵🔵💙               🦠💚🟢💹🟢💚🥬    ",
            "      ️🧿🔵💙                 🍀💚🈯️🍀🥬      ",
            "        ️🎽🧿                  🐍�💚🟢💚      ",
            "          🎽                     🥬🍀        ",
            "                                             ",
            "                                             ",
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
        -- Apply Base46 colors to bufferline highlights
        vim.api.nvim_set_hl(0, "BufferLineBackground", {
          fg = colors.light_grey,
          bg = colors.black2,
        })

        vim.api.nvim_set_hl(0, "BufferlineIndicatorVisible", {
          fg = colors.black2,
          bg = colors.black2,
        })

        -- buffers
        vim.api.nvim_set_hl(0, "BufferLineBufferSelected", {
          fg = colors.white,
          bg = colors.black,
        })

        vim.api.nvim_set_hl(0, "BufferLineBufferVisible", {
          fg = colors.light_grey,
          bg = colors.black2,
        })

        -- for diagnostics = "nvim_lsp"
        vim.api.nvim_set_hl(0, "BufferLineError", {
          fg = colors.light_grey,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic", {
          fg = colors.light_grey,
          bg = colors.black2,
        })

        -- close buttons
        vim.api.nvim_set_hl(0, "BufferLineCloseButton", {
          fg = colors.light_grey,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", {
          fg = colors.light_grey,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", {
          fg = colors.red,
          bg = colors.black,
        })
        vim.api.nvim_set_hl(0, "BufferLineFill", {
          fg = colors.grey_fg,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferlineIndicatorSelected", {
          fg = colors.black,
          bg = colors.black,
        })

        -- modified
        vim.api.nvim_set_hl(0, "BufferLineModified", {
          fg = colors.red,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", {
          fg = colors.red,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", {
          fg = colors.green,
          bg = colors.black,
        })

        -- separators
        vim.api.nvim_set_hl(0, "BufferLineSeparator", {
          fg = colors.black2,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", {
          fg = colors.black2,
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", {
          fg = colors.black2,
          bg = colors.black2,
        })

        -- tabs
        vim.api.nvim_set_hl(0, "BufferLineTab", {
          fg = colors.light_grey,
          bg = colors.one_bg3,
        })
        vim.api.nvim_set_hl(0, "BufferLineTabSelected", {
          fg = colors.black2,
          bg = colors.nord_blue,
        })
        vim.api.nvim_set_hl(0, "BufferLineTabClose", {
          fg = colors.red,
          bg = colors.black,
        })

        vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultSelected", {
          bg = "none",
        })

        vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultInactive", {
          bg = "none",
        })
        vim.api.nvim_set_hl(0, "BufferLineDuplicate", {
          fg = "NONE",
          bg = colors.black2,
        })
        vim.api.nvim_set_hl(0, "BufferLineDuplicateSelected", {
          fg = colors.red,
          bg = colors.black,
        })
        vim.api.nvim_set_hl(0, "BufferLineDuplicateVisible", {
          fg = colors.blue,
          bg = colors.black2,
        })

        -- custom area
        vim.api.nvim_set_hl(0, "BufferLineRightCustomAreaText1", {
          fg = colors.white,
        })

        vim.api.nvim_set_hl(0, "BufferLineRightCustomAreaText2", {
          fg = colors.red,
        })

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
                text = "File Explorer",
                text_align = "left",
                separator = true,
              },
            },
          },
        }
      end,
    },
  },
}
