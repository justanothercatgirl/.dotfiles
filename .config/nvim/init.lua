require "user.beautiful"
require "user.options"
require "user.plugins"
require "user.remaps"

-- require "user.lspinit"
-- TODO: OPTIMIZE SO THAT IT LOADS ONLY THE FIRST TIME

vim.api.nvim_exec([[
  autocmd InsertEnter * lua require 'user.lspinit'
]], false)
