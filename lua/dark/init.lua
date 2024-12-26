local M = {}

local utils_file = require('dark.util.file')
local utils_table = require('dark.util.table')

---@class dark.StatuslineOpts
---@field filename? FileNameOpts

---@type dark.StatuslineOpts
local default_options = {
  filename = {
    enabled = true
  }
}

---function that builds statusline
---@param statusLineOpts? dark.StatuslineOpts
---@return string
function M.statusline(statusLineOpts)
  -- set custom opts or default_options
  local opts
  if type(statusLineOpts) == 'table' and not utils_table.is_table_empty(statusLineOpts)
  then
    opts = statusLineOpts
  else
    opts = default_options
  end

  -- build Dark status line
  local statusline = ''
  statusline = statusline .. '> '
  --- filename
  statusline = statusline .. utils_file.filename(opts.filename)

  return statusline
end

---function to setup the dark statusline and uptade in any enter buffer
---@param opts? dark.StatuslineOpts
function M.setup(opts)
  _G.update_dark_statusline = function()
    vim.go.statusline = M.statusline(opts)
  end

  -- Add an autocommand to update the statusline whenever you enter a buffer
  vim.cmd [[autocmd BufEnter * lua _G.update_dark_statusline()]]
end

return M
