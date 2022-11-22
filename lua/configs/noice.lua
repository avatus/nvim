local ok, noice = pcall(require, "noice")
if not ok then
  return
end

noice.setup({
  notify = {
    enabled = false,
  },
  messages = {
    enabled = true,
    view_search = false,
  },
  cmdline = {
    view = "cmdline",
    format = {
      search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
    },
  },
  lsp = {
    signature = {
      enabled = false,
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    long_message_to_split = true,
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "more line",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "fewer lines",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "line less",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "yanked",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "emsg",
        find = "Pattern not found",
      },
      opts = { skip = true },
    },
  },
})
