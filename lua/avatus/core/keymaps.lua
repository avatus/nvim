vim.g.mapleader = " "

local keymaps = vim.keymap

keymaps.set("n", "<leader>hh", ":nohl<CR>")

keymaps.set("n", "x", '"_x"')

keymaps.set("n", "<leader>to", ":tabnew<CR>")
keymaps.set("n", "<leader>tx", ":tabclose<CR>")
keymaps.set("n", "<leader>tn", ":tabn<CR>")
keymaps.set("n", "<leader>tp", ":tabp<CR>")

keymaps.set("n", "<leader>e", ":Neotree toggle<CR>")
keymaps.set("n", "<leader>b", ":Neotree buffers toggle<CR>")
keymaps.set("n", "<leader>G", ":Neotree git_status right toggle<CR>")
keymaps.set("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<cr>")
keymaps.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
keymaps.set("n", "<leader>st", "<cmd>lua require('fzf-lua').live_grep_native()<CR>", { noremap = true, silent = true })
keymaps.set("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>")
keymaps.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymaps.set("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>")
keymaps.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>")
keymaps.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>")
keymaps.set("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
keymaps.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymaps.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymaps.set("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymaps.set("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
