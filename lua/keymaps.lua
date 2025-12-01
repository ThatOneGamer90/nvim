-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Simplify basic commands
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>", { desc = "[W]rite file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "[Q]uit" })

-- Autoformat
vim.keymap.set("n", "<leader>F", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Fuzzy find
vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua buffers<cr>", { desc = "[ ] Buffers" })
vim.keymap.set("n", "<leader>d", "<cmd>FzfLua lsp_definitions<cr>", { desc = "[D]efinitions" })
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "[F]iles" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "[G]rep" })
vim.keymap.set("n", "<leader>fl", "<cmd>FzfLua blines<cr>", { desc = "[l]ines Open Buf" })
vim.keymap.set("n", "<leader>fL", "<cmd>FzfLua lines<cr>", { desc = "[L]ines All Buf" })
vim.keymap.set("n", "<leader>fD", "<cmd>FzfLua lsp_declarations<cr>", { desc = "[D]eclarations" })
vim.keymap.set("n", "<leader>fe", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Document [e]rrors" })
vim.keymap.set("n", "<leader>fE", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Workspace [E]rrors" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<cr>", { desc = "[R]eferences" })
vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "[S]ymbols" })
vim.keymap.set("n", "<leader>ft", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "[T]ypedefs" })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "[w]ord" })
vim.keymap.set("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", { desc = "[W]ORD" })
vim.keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "[K]eymaps" })
vim.keymap.set("n", "<leader>f.", "<cmd>FzfLua oldfiles<cr>", { desc = "[.] Recent files" })
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua resume<cr>", { desc = "Resume" })
vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename, { desc = "Rename object" })
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "[h]over" })
vim.keymap.set("n", "<leader>fn", function()
    FzfLua.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[N]eovim files" })

-- Mini
local minifiles_toggle = function(...)
    if not MiniFiles.close() then
        MiniFiles.open(...)
    end
end
vim.keymap.set("n", "<leader>-", minifiles_toggle, { desc = "Files" })
