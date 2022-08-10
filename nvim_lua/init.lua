require('keybindings')
require('packages')
require('telescope')
require('lsp')
require('sitter')
require('todo')
require('eviline')
require('tree')


-- colorscheme
local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end

if(vim.loop.os_uname().sysname == "Linux") then
  require('config')
end

local configs = require'nvim-treesitter.configs'
configs.setup {
ensure_installed = "all", -- Only use parsers that are maintained
highlight = { -- enable highlighting
  enable = true,
},
  indent = {
    enable = true, -- default is disabled anyways
  }
}


vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


-- powerline 
-- source provider function
