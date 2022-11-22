local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local startify = require("alpha.themes.startify")

local header = {
  type = "group",
  val = {},
}

local mru = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Recent files",
      opts = {
        hl = "String",
        shrink_margin = false,
        position = "left",
      },
    },
    { type = "padding", val = 1 },
    {
      type = "group",
      val = function()
        return { startify.mru(1, vim.fn.getcwd(), 8) }
      end,
    },
  },
}

local function button(lhs, txt, rhs, opts)
  lhs = lhs:gsub("%s", ""):gsub("SPC", "<leader>")
  local default_opts = {
    position = "left",
    shortcut = "[" .. lhs .. "] ",
    cursor = 1,
    align_shortcut = "left",
    hl_shortcut = { { "Operator", 0, 1 }, { "Number", 1, #lhs + 1 }, { "Operator", #lhs + 1, #lhs + 2 } },
    shrink_margin = false,
    keymap = { "n", lhs, rhs, { noremap = true, silent = true, nowait = true } },
  }

  opts = vim.tbl_deep_extend("force", default_opts, opts or {})

  return {
    type = "button",
    val = string.format("%-1s  %s", opts.icon or "", txt),
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(rhs .. "<Ignore>", true, false, true)
      vim.api.nvim_feedkeys(key, "t", false)
    end,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Actions",
      opts = {
        hl = "String",
        shrink_margin = false,
        position = "left",
      },
    },
    { type = "padding", val = 1 },
    button("e", "New file", ":ene <BAR> startinsert<CR>", { hl = { { "Bold", 0, 1 }, { "String", 1, 50 } } }),
    button("u", "Update plugins", ":PackerSync<CR>", { hl = { { "Bold", 0, 1 }, { "Structure", 1, 50 } } }),
    button("l", "Update LSP tools", ":MasonToolsUpdate<CR>", { hl = { { "Bold", 0, 1 }, { "Structure", 1, 50 } } }),
    button("t", "Update TS parsers", ":TSUpdate<CR>", { hl = { { "Bold", 0, 1 }, { "Structure", 1, 50 } } }),
    button("q", "Quit", ":qa<CR>", { hl = { { "Bold", 0, 1 }, { "Statement", 1, 50 } } }),
  },
  opts = {
    position = "left",
  },
}

local config = {
  layout = {
    header,
    { type = "padding", val = 1 },
    mru,
    { type = "padding", val = 1 },
    buttons,
  },
  opts = {
    setup = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        desc = "disable status, tabline and cmdline for alpha",
        callback = function()
          vim.go.laststatus = 0
          vim.opt.showtabline = 0
          vim.opt.cmdheight = 0
        end,
      })
      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = 0,
        desc = "enable status, tabline and cmdline after alpha",
        callback = function()
          vim.go.laststatus = 3
          vim.opt.showtabline = 2
          vim.opt.cmdheight = 1
        end,
      })
    end,
    margin = 5,
  },
}

alpha.setup(config)
