local M = {}

---function that check if the table is empty
---@param t table
---@return boolean
function M.is_table_empty(t)
  for _ in pairs(t) do
    return false
  end
  return true
end

return M
