-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula", -- default theme
  hl_add = {},
  integrations = {},
  changed_themes = {},
  transparency = false,
  theme_toggle = { "chadracula", "one_light" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = false,

  header = {
    "          -                  :         ",
    "        -+*=                 ++:       ",
    "      -+*++++:               ++*+:     ",
    "    -+*+++++++-              +++++=:   ",
    "  :-+++++++++++=             =++++++=: ",
    " -=--=++++++++=++:           =++++++++=",
    ":=----=++++======+-          =+++++++++",
    " -------+++=======+=         =++++++++=",
    " --------=+========+=:       =++++++++=",
    " ----------===========-      =+========",
    " ---------: ===========-     ==========",
    " ---------:  -===========:   ==========",
    " ---------:   :===========:  ==========",
    " ---------:    :===========- -=========",
    " ---------:      -=====================",
    " ---------:       :====================",
    " ---------:        :===================",
    " -:-----:-:          -=================",
    " :-::::::-:           :============-==-",
    "  :::::::::            :============-: ",
    "    :::::::              -=========:   ",
    "      :::::               :=-====:     ",
    "        :::                :-==:       ",
    "                             :         ",
    "                                       ",
    "                                       ",
    "                                       ",
    "                                       ",
  },
}

M.base46 = {
  theme = "doomchad", -- default theme
  hl_add = {},
  integrations = {},
  changed_themes = {},
  transparency = false,
  theme_toggle = { "chadracula", "one_light" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    order = nil,
    modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = false,
  },
}
M.lsp = { signature = true }
M.mason = { cmd = true, pkgs = {} }

return M
