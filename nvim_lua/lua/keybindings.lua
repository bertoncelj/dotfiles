local map = vim.api.nvim_set_keymap
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<CR>a', {})
local opts = {noremap = true }
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- Split navigation 
map('n', '<C-J>', '<C-W><C-J>',opts)
map('n', '<C-Enter>', '<C-w>=',opts)
map('n', '<C-Left>', '<C-w><',opts)
map('n', '<C-Right>', '<C-w>>',opts)
map('n', '<C-Up>', '<C-w>+',opts)
map('n', '<C-Down>', '<C-w>-',opts)

local function nkeymap(key, map1)
  map('n', key, map1, opts)
end

-- Tree 
nkeymap('<F3>', '<cmd>NvimTreeToggle<cr>')

-- Telescope keymaps
nkeymap('ff', '<cmd>Telescope find_files<cr>')
nkeymap('fg', '<cmd>Telescope live_grep<cr>')
nkeymap('fb', '<cmd>Telescope buffers<cr>')
nkeymap('fh', '<cmd>Telescope help_tags<cr>')

nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
