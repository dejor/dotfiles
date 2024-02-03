local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  return
end

local default_config = {
  ui = {
    border = 'rounded',
    devicon = true,
    foldericon = true,
    title = true,
    expand = '⊞',
    collapse = '⊟',
    code_action = '',
    actionfix = ' ',
    lines = { '┗', '┣', '┃', '━', '┏' },
    kind = nil,
    imp_sign = '󰳛 ',
  },
  hover = {
    max_width = 0.9,
    max_height = 0.8,
    open_link = 'gx',
    open_cmd = '!floorp',
  },
  diagnostic = {
    show_code_action = true,
    show_layout = 'float',
    show_normal_height = 10,
    jump_num_shortcut = true,
    max_width = 0.8,
    max_height = 0.6,
    max_show_width = 0.9,
    max_show_height = 0.6,
    text_hl_follow = true,
    border_follow = true,
    wrap_long_lines = true,
    extend_relatedInformation = false,
    diagnostic_only_current = false,
    keys = {
      exec_action = 'o',
      quit = 'q',
      toggle_or_jump = '<CR>',
      quit_in_show = { 'q', '<ESC>' },
    },
  },
  code_action = {
    num_shortcut = true,
    show_server_name = false,
    extend_gitsigns = false,
    only_in_cursor = true,
    max_height = 0.3,
    keys = {
      quit = { 'q', '<ESC>' },
      exec = '<CR>',
    },
  },
  lightbulb = {
    enable = true,
    sign = true,
    debounce = 10,
    sign_priority = 40,
    virtual_text = true,
    enable_in_insert = true,
  },
  scroll_preview = {
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  request_timeout = 2000,
  finder = {
    max_height = 0.5,
    left_width = 0.4,
    methods = {},
    default = 'ref+imp',
    layout = 'float',
    silent = false,
    filter = {},
    fname_sub = nil,
    sp_inexist = false,
    sp_global = false,
    ly_botright = false,
    keys = {
      shuttle = '[w',
      toggle_or_open = 'o',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = 'q',
      close = '<C-c>',
    },
  },
  definition = {
    width = 0.6,
    height = 0.5,
    save_pos = false,
    keys = {
      edit = '<C-o>',
      vsplit = '<C-v>',
      split = '<C-i>',
      tabe = '<C-t>',
      tabnew = '<C-n>',
      quit = '<C-q>',
      close = '<C-c>',
    },
  },
  rename = {
    in_select = true,
    auto_save = false,
    project_max_width = 0.5,
    project_max_height = 0.5,
    keys = {
      quit = '<C-q>',
      exec = '<CR>',
      select = 'x',
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = ' › ',
    hide_keyword = false,
    ignore_patterns = nil,
    show_file = true,
    folder_level = 1,
    color_mode = true,
    dely = 300,
  },
  outline = {
    win_position = 'right',
    win_width = 30,
    auto_preview = true,
    detail = true,
    auto_close = true,
    close_after_jump = false,
    layout = 'normal',
    max_height = 0.5,
    left_width = 0.3,
    keys = {
      toggle_or_jump = 'o',
      quit = 'q',
      jump = 'e',
    },
  },
  callhierarchy = {
    layout = 'float',
    left_width = 0.2,
    keys = {
      edit = 'e',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      close = '<C-c>',
      quit = '<C-q>',
      shuttle = '[w',
      toggle_or_req = 'u',
    },
  },
  implement = {
    enable = false,
    sign = true,
    lang = {},
    virtual_text = true,
    priority = 100,
  },
  beacon = {
    enable = true,
    frequency = 7,
  },
  floaterm = {
    height = 0.7,
    width = 0.7,
  },
}

saga.setup(default_config)

M = {}

---@diagnostic disable-next-line: duplicate-set-field
M.lspsaga_keymaps = function(bufnr)
	local opts = { noremap = true, silent = true }
---@diagnostic disable-next-line: undefined-global
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap(bufnr, "n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap(bufnr, "n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
	keymap(bufnr, "n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
end

return M
