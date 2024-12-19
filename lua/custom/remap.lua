vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "O[p]en [v] explorer"})

vim.keymap.set("i", "jj", "<Esc>", {noremap=false})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- move with centering line
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest reatest remap eremap ver
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "[y]ank into buffer"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc="[Y]ank into buffer"})

vim.keymap.set({"n", "v"}, "<leader>dd", "\"_d")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "[f]ind [r]eplace"})

vim.keymap.set("i", "<C-c>", "<Esc>")

-- defined in cmp.lua
-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- leader gr vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
-- specified in cmp.lua
--leader rn vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc="Signature help"})
