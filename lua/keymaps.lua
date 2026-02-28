local map = vim.keymap.set

-- LSP navigation
map("n", "gd",         vim.lsp.buf.definition,     { desc = "Go to Definition" })
map("n", "gr",         vim.lsp.buf.references,      { desc = "Find References" })
map("n", "gi",         vim.lsp.buf.implementation,  { desc = "Go to Implementation" })
map("n", "K",          vim.lsp.buf.hover,           { desc = "Hover Docs" })
map("n", "<leader>rn", vim.lsp.buf.rename,          { desc = "Rename Symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action,     { desc = "Code Actions" })
map("n", "[d",         vim.diagnostic.goto_prev,    { desc = "Prev Diagnostic" })
map("n", "]d",         vim.diagnostic.goto_next,    { desc = "Next Diagnostic" })
map("n", "<leader>e",  vim.diagnostic.open_float,   { desc = "Show Diagnostic" })

-- Telescope
local ok, tel = pcall(require, "telescope.builtin")
if ok then
  map("n", "<C-p>",      tel.find_files,               { desc = "Find Files" })
  map("n", "<leader>fg", tel.live_grep,                 { desc = "Live Grep" })
  map("n", "<leader>fs", tel.lsp_document_symbols,      { desc = "Document Symbols" })
  map("n", "<leader>fw", tel.lsp_workspace_symbols,     { desc = "Workspace Symbols" })
end

-- File tree
map("n", "<C-b>", ":Neotree toggle<CR>", { desc = "Toggle File Tree" })

-- TypeScript specific
map("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Organize Imports" })
map("n", "<leader>ru", "<cmd>TSToolsRemoveUnused<cr>",    { desc = "Remove Unused" })

-- Ctrl+O/I already work natively for jump back/forward
