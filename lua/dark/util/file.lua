local M = {}
local path_utils = require('dark.util.path')

---@class Opts
---@field full? boolean

---@class FileNameOpts
---@field enabled boolean
---@field opts? Opts

-- function to return the file name
---@param fileNameOpts? FileNameOpts
---@return string
function M.filename(fileNameOpts)
  if (fileNameOpts ~= nil and fileNameOpts.enabled) then
    local opts = fileNameOpts.opts
    local full_path = vim.fn.bufname("%")
    local shorten_path = path_utils.shorten_path(full_path)

    if (opts ~= nil and opts.full) then
      return full_path
    end

    return shorten_path
  end
  return ''
end

return M
