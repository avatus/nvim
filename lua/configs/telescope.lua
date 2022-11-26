local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end
local action_layout = require("telescope.actions.layout")

local winopts = {
  theme = "ivy",
  border = false,
  layout_config = {
    preview_width = 0.4,
  },
  prompt_prefix = "  ",
}
telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["<C-p>"] = action_layout.toggle_preview,
      },
      i = {
        ["<C-p>"] = action_layout.toggle_preview,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
  pickers = {
    find_files = winopts,
    live_grep = winopts,
    buffers = winopts,
  },
})

telescope.load_extension("fzf")
