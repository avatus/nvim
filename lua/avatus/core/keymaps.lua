vim.g.mapleader = " "

local keymaps = vim.keymap

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "tab" })
function _lazygit_toggle()
  lazygit:toggle()
end

function _swap_bufs()
  local wins = vim.api.nvim_list_wins()
  local current, next
  for index, value in ipairs(wins) do
    if index == 1 then
      current = value
    end
    if index == 2 then
      next = value
    end
  end
  if not next then
    return
  end
  local current_buf = vim.api.nvim_win_get_buf(current)
  local next_buf = vim.api.nvim_win_get_buf(next)
  if not next_buf then
    return
  end
  vim.api.nvim_win_set_buf(current, next_buf)
  vim.api.nvim_win_set_buf(next, current_buf)
end

keymaps.set("n", "<leader>hh", ":nohl<CR>")

keymaps.set("n", "x", '"_x"')

keymaps.set("n", "<leader>t", "<cmd>lua _swap_bufs()<CR>", { noremap = true, silent = true })
keymaps.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
keymaps.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

keymaps.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
keymaps.set(
  "n",
  "<leader>r",
  "<cmd>lua require('smart-splits').start_resize_mode()<CR>",
  { noremap = true, silent = true }
)

keymaps.set("n", "<leader>e", ":Neotree toggle<CR>")
keymaps.set(
  "n",
  "<leader>b",
  "<cmd>lua require('fzf-lua').buffers({previewer = false, winopts = { row = 1, width = 1, height = 0.5}})<CR>",
  { noremap = true, silent = true }
)
keymaps.set("n", "<leader>G", ":Neotree git_status toggle<CR>")
keymaps.set(
  "n",
  "<leader>f",
  "<cmd>lua require('fzf-lua').files({ winopts = {row = 1, width = 1, height = 0.5}})<CR>",
  { noremap = true, silent = true }
)
keymaps.set(
  "n",
  "<leader>st",
  "<cmd>lua require('fzf-lua').live_grep_native({winopts = {fullscreen = true}})<CR>",
  { noremap = true, silent = true }
)
keymaps.set(
  "n",
  "<leader>o",
  "<cmd>lua require('fzf-lua').lsp_document_symbols({ winopts = {col = 1} })<CR>",
  { noremap = true, silent = true }
)
keymaps.set("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>")
keymaps.set("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>")
keymaps.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>")
keymaps.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>")
keymaps.set("n", "<leader>c", "<cmd>:bdelete<cr>")
keymaps.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>")
keymaps.set(
  "n",
  "gl",
  '<cmd>lua vim.diagnostic.open_float({ border = "single" })<CR>',
  { noremap = true, silent = true }
)
keymaps.set("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>zz")
keymaps.set("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>zz")
