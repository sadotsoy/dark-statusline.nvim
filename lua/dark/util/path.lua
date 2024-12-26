local M = {}


---function that returns the first letter of a string
---@param str string
---@param sb_limit number
---@return string
function M.substring(str, sb_limit)
  return str:sub(1, sb_limit)
end

---function that filters nil values from a table
---@param t table
---@return table
function M.filter(t)
  local res = {}
  for _, v in pairs(t) do
    if v ~= nil then
      table.insert(res, v)
    end
  end
  return res
end

---function to shorten the path
---@param path string
---@return string
function M.shorten_path(path)
  local segments = {}
  for segment in path:gmatch("([^/]+)") do
    table.insert(segments, segment)
  end

  -- Get the last three segments
  local last_three_segments = {}
  for i = #segments - 2, #segments do
    if segments[i] then
      table.insert(last_three_segments, segments[i])
    end
  end

  -- Shorten the third last segment if exists
  if #last_three_segments > 2 then
    last_three_segments[1] = '../' .. M.substring(last_three_segments[1], 1)
  end

  -- Filter out nil segments and concatenate
  return table.concat(last_three_segments, "/")
end

return M
