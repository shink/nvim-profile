-- Bookmarks（tomasky/bookmarks.nvim）：跨文件行级书签
local bm = require("bookmarks")
bm.setup({ sign_priority = 8, auto_close_list = true })

local map = vim.keymap.set

-- 所有书签按（文件路径, 行号）排序
local function collect()
  local out = {}
  for file, marks in pairs(require("bookmarks.config").config.cache.data) do
    for lnum in pairs(marks) do
      out[#out + 1] = { file = file, lnum = tonumber(lnum) }
    end
  end
  table.sort(out, function(a, b)
    if a.file ~= b.file then return a.file < b.file end
    return a.lnum < b.lnum
  end)
  return out
end

-- 跳转：dir = 1 下一个 / -1 上一个，跨文件，到边界后原地不动
local function jump(dir)
  local list = collect()
  if #list == 0 then
    return vim.notify("No bookmarks", vim.log.levels.INFO, { title = "bookmarks" })
  end

  local file = vim.fn.resolve(vim.fn.expand("%:p"))
  local line = vim.fn.line(".")

  local idx
  if dir > 0 then
    for i, e in ipairs(list) do
      if e.file > file or (e.file == file and e.lnum > line) then
        idx = i
        break
      end
    end
    if not idx then
      return vim.notify("No next bookmark", vim.log.levels.INFO, { title = "bookmarks" })
    end
  else
    for i = #list, 1, -1 do
      local e = list[i]
      if e.file < file or (e.file == file and e.lnum < line) then
        idx = i
        break
      end
    end
    if not idx then
      return vim.notify("No previous bookmark", vim.log.levels.INFO, { title = "bookmarks" })
    end
  end

  vim.cmd("edit " .. vim.fn.fnameescape(list[idx].file))
  vim.api.nvim_win_set_cursor(0, { math.min(list[idx].lnum, vim.api.nvim_buf_line_count(0)), 0 })
end

map("n", "<leader>m", bm.bookmark_toggle, { desc = "切换书签" })
map("n", "<leader>M", bm.bookmark_list, { desc = "书签列表" })
map("n", "<leader>h", function() jump(-1) end, { desc = "上一个书签" })
map("n", "<leader>l", function() jump(1) end, { desc = "下一个书签" })

