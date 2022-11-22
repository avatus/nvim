local ok, noice = pcall(require, "noice")
if not ok then
  return
end

noice.setup({
  lsp = {
    hover = {
      enabled = true,
    },
    signature = {
      enabled = true,
    },
    message = {
      enabled = true,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  presets = {
    bottom_search = true,
    command_palette = false,
    inc_rename = true,
    long_message_to_split = true,
    lsp_doc_border = false,
  },
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
