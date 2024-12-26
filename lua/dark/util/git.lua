local M = {}

function M.is_git_branch()
  return vim.fn.system("echo -n $(git rev-parse --is-inside-work-tree)")
end

M.is_git_branch()

return M
