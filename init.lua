-- TODO debug adapter protocol (dap)
require("options")
require("keymaps")
require("autocmds")

-- install plugins
vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main", build = ":TSUpdate" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/nvim-mini/mini.clue", version = "main" },
    { src = "https://github.com/nvim-mini/mini.files", version = "main" },
    { src = "https://github.com/nvim-mini/mini.icons", version = "main" },
    { src = "https://github.com/nvim-mini/mini.statusline", version = "main" },
    { src = "https://github.com/nvim-mini/mini.pairs", version = "main" },
    { src = "https://github.com/nvim-mini/mini.surround", version = "main" },
    { src = "https://github.com/nvim-mini/mini.ai", version = "main" },
    { src = "https://github.com/nvim-mini/mini.diff", version = "main" },
})

-- theme
require("tokyonight").setup({
    style = "night",
})
vim.cmd.colorscheme("tokyonight-night")

-- lsp
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        -- "ty", -- use ty over pyrefly after full release
        "pyrefly",
        "ruff",
        "clangd",
    },
})

vim.lsp.config("ruff", {
    on_attach = function(client, _)
        client.server_capabilities.hoverProvider = false -- Disable ruff hover, use pyrefly
    end,
})

-- blink.cmp
require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" }, -- 'Enter' accepts selected item
        ["<Tab>"] = { "select_next", "fallback_to_mappings" },
        ["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
    },
    completion = { documentation = { auto_show = true } },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust" },
})

-- conform (autoformat)
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    },
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
    },
})

-- nvim-treesitter
require("nvim-treesitter").setup({
    ensure_installed = {
        "lua",
        "python",
        "c",
        "javascript",
        "typescript",
        "sql",
        "dockerfile",
        "toml",
        "json",
        "java",
        "vim",
        "markdown",
        "markdown_inline",
        "html",
        "gitignore",
        "cmake",
        "make",
        "go",
        "yaml",
    },
    auto_install = true,
    highlight = { enable = true },
})
require("treesitter-context").setup()

-- fzf-lua
require("fzf-lua").setup()

-- mini.nvim
require("mini.icons").setup()

local miniclue = require("mini.clue")
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Surround
        { mode = "n", keys = "s" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- Square brackets
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
    },
    clues = {
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers({ show_contents = true }),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
    window = {
        config = { width = 70 },
        delay = 0,
    },
})

require("mini.files").setup({
    mappings = { close = "<Esc>" }, -- Close menu using <Esc>
})
require("mini.statusline").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.diff").setup()
