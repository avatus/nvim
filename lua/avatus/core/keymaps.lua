vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>hh", ":nohl<CR>")

keymap.set("n", "x", '"_x"')

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
keymap.set("n", "<leader>b", ":Neotree buffers toggle<CR>")
keymap.set("n", "<leader>G", ":Neotree git_status toggle<CR>")
keymap.set("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy{})<CR>")
