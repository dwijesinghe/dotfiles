-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local highlights = require "highlights"

M.ui = {
  hl_override = highlights.override,
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    order = nil,
    modules = nil,
  },

  nvdash = {
    load_on_startup = true,

    header = {
      "                                         -                  :                                       ",
      "                                       -+*=                 ++:                                     ",
      "                                     -+*++++:               ++*+:                                   ",
      "                                   -+*+++++++-              +++++=:                                 ",
      "                                 :-+++++++++++=             =++++++=:                               ",
      "                                -=--=++++++++=++:           =++++++++=                              ",
      "                               :=----=++++======+-          =+++++++++                              ",
      "                                -------+++=======+=         =++++++++=                              ",
      "                                --------=+========+=:       =++++++++=                              ",
      "                                ----------===========-      =+========                              ",
      "                                ---------: ===========-     ==========                              ",
      "                                ---------:  -===========:   ==========                              ",
      "                                ---------:   :===========:  ==========                              ",
      "                                ---------:    :===========- -=========                              ",
      "                                ---------:      -=====================                              ",
      "                                ---------:       :====================                              ",
      "                                ---------:        :===================                              ",
      "                                -:-----:-:          -=================                              ",
      "                                :-::::::-:           :============-==-                              ",
      "                                 :::::::::            :============-:                               ",
      "                                   :::::::              -=========:                                 ",
      "                                     :::::               :=-====:                                   ",
      "                                       :::                :-==:                                     ",
      "                                                            :                                       ",
      "                                                                                                    ",
      "                                                                   ::::.                            ",
      "                                                                                                    ",
      "                                                 ....         .... ::::    ...   .....     .....    ",
      ".:::::::::::.      ::::::::::      ::::::::::.   ::::.       ::::  ::::.  .:::::::::::: .:::::::::. ",
      ".:.         :.   .:.         :.   ::         .:.  ::::      .:::.  ::::.  .::::.    .:::::     :::: ",
      ".:          ::   :.          .:  ::           .:   ::::    .:::.   ::::.  .:::.      ::::      .:::.",
      ".:          .:  .:.............  :.            :.  .:::.   :::.    ::::.  .::::      ::::      .:::.",
      ".:          .:  .:               :.            :.   .:::. ::::     ::::.  .::::      ::::      .:::.",
      ".:          .:   :.              ::           .:     .:::.:::      ::::.  .::::      ::::      .:::.",
      ".:          ::    :.              ::         .:       ::::::       ::::.  .::::      ::::      .:::.",
      ".:          .:      ..........      ..........         .:::        .:::.  .:::.      ::::      .:::.",
      "                                                                                                    ",
      "                                                                                                    ",
      "                                                                                                    ",
      "                                                                                                    ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

return M
